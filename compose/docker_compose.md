# :rocket: Dockerization untuk Aplikasi Node.js dengan MongoDB (Dev & Prod Environments)
Dalam artikel ini, kita akan membangun aplikasi Node.js dengan database MongoDB menggunakan Docker. Kita juga akan mengatur dua lingkungan kerja, yaitu:

1. Development – Menggunakan nodemon agar perubahan pada kode langsung terdeteksi tanpa restart manual.
2. Production – Mengoptimalkan image Docker agar lebih ringan, aman, dan cepat.


Konfigurasi *image docker* **nodejs** disusun kedalam file `nodejs.Dockerfile`, untuk **mongodb** dituiskan kedalam file `mongodb.Dockerfile`, dan agar lebih fleksibel, kita akan menggunakan Docker Compose untuk mengatur layanan (Node.js sebagai backend dan MongoDB sebagai database) dalam satu konfigurasi ke dalam file  `docker-compose.yml`.

---

# **1️⃣ `nodejs.Dockerfile` – Konfigurasi untuk Aplikasi Node.js**  
📌 **Fungsi:**  
- Menjalankan **Node.js dalam mode development (dengan nodemon) atau production (lebih ringan)**.  
- **Multi-stage build** untuk mengurangi ukuran image.  
- **Mendukung environment berbasis file `.env`**.  

```dockerfile
# Menggunakan Node.js versi 22.14 berbasis Alpine 3.20 (image ringan & cepat)
FROM node:22.14-alpine3.20 AS base

# Menetapkan direktori kerja dalam container
WORKDIR /var/www

# Menyalin package.json dan package-lock.json untuk efisiensi caching layer
COPY package*.json ./

# --------------------------------------------
# Stage untuk Development
# --------------------------------------------
FROM base AS development

# Menginstal semua dependencies termasuk devDependencies
RUN npm install

# Instal nodemon untuk hot reload saat pengembangan
RUN npm install -g nodemon

# Menyalin seluruh kode aplikasi ke dalam container
COPY . .

# Membuka port default aplikasi (app.js) agar dapat diakses diluar container
EXPOSE 3000

# Menjalankan aplikasi dengan nodemon agar otomatis reload saat ada perubahan
CMD ["nodemon", "app.js"]

# --------------------------------------------
# Stage untuk Production
# --------------------------------------------
FROM base AS production

# Menetapkan environment sebagai production untuk menghindari devDependencies
ENV NODE_ENV=production

# Hanya menginstal dependencies yang dibutuhkan di production
RUN npm ci --omit=dev && npm cache clean --force

# Menyalin seluruh kode aplikasi ke dalam container
COPY . .

# Menetapkan user non-root untuk keamanan
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Membuka port default aplikasi (app.js) agar dapat diakses diluar container
EXPOSE 3000

# Menjalankan aplikasi dengan Node.js langsung (tanpa nodemon)
CMD ["node", "app.js"]
```

### **📌 Penjelasan Konfigurasi:**
✅ **Multi-stage build** → Memisahkan environment **development** dan **production** untuk efisiensi.  
✅ **`npm ci --omit=dev` untuk produksi** → Instalasi lebih stabil dan cepat dibanding `npm install`.  
✅ **Menjalankan aplikasi sebagai non-root user (`appuser`)** untuk meningkatkan keamanan.  

---

# **2️⃣ `mongodb.Dockerfile` – Konfigurasi untuk Database MongoDB**  
📌 **Fungsi:** Menjalankan **MongoDB dengan konfigurasi environment berbasis `.env`**.  

```dockerfile
# Menggunakan MongoDB Community Server versi 5.0.10 berbasis Ubuntu 20.04
FROM mongodb/mongodb-community-server:5.0.10-ubuntu2004

# Menetapkan environment variable untuk user root dan database
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=Secret!
ENV MONGO_INITDB_DATABASE=db_attendance_app_user

# Membuat direktori untuk menyimpan data MongoDB secara persisten
VOLUME [ "/data/db" ]

# Mengekspos default port MongoDB (27017) agar dapat diakses dari luar container
EXPOSE 27017

CMD ["mongod", "--bind_ip", "0.0.0.0"]
```

### **📌 Penjelasan Konfigurasi:**
✅ Menggunakan `CMD ["mongod", "--bind_ip", "0.0.0.0"]` untuk memastikan *MongoDB* dapat menerima koneksi diluar *container*.  
✅ Parameter `"--bind_ip", "0.0.0.0"` dapat diganti dengan `--bind_ip_all` agar lebih fleksibel dan mencakup semua interface secara eksplisit.  
✅ **Variabel `MONGO_INITDB_DATABASE` memastikan database dibuat saat pertama kali dijalankan**.  
✅ Menggunakan *persistent volume* agar data tetap tersimpan meskipun container dihentikan atau bahkan dihapus.

---

# **3️⃣ `docker-compose.yml` – Menghubungkan Node.js dan MongoDB**  
📌 **Fungsi:**  
- Menyederhanakan **deploy & manajemen container** untuk **Node.js dan MongoDB**.  
- **Menggunakan `.env` untuk fleksibilitas mode development & production**.  
- **Menggunakan volume untuk menjaga data database tetap ada**.  

```yaml
version: "3.8"

services:
  webserver:
    container_name: c_nodejs_attendance_app_user
    restart: unless-stopped
    build:
      context: .
      dockerfile: nodejs.Dockerfile
      args:
        NODE_ENV: ${APP_ENV}  # Mode dari .env
    image: i_node:22.14-alpine3.20
    volumes:
      - ./src:/var/www/  # Sinkronisasi kode applikasi dari host ke dalam container untuk dev
      - /var/www/node_modules  # Menjaga node_modules tetap ada di dalam container
    ports:
      - "${APP_PORT}:3000"    # Expose port dinamis (pemetaan dari internal container agar dapat diakses oleh host/diluar container) dari .env
    networks:
      - net_attendance_app_user
    depends_on:
      - database
    environment:
      NODE_ENV: ${APP_ENV}

  database:
    container_name: c_mongodb_attendance_app_user
    image: i_mongodb:5.0.10
    restart: unless-stopped
    build:
      context: .
      dockerfile: mongodb.Dockerfile
    volumes:
      - volume_attendance_app_user:/data/db  # Volume persisten untuk database
    ports:
      - "${MONGO_PORT}:8081"  # Expose port dinamis (pemetaan dari internal container agar dapat diakses oleh host/diluar container) dari .en
    networks:
      - net_attendance_app_user
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: Secret!
      MONGO_INITDB_DATABASE: UsersDB

volumes:
  volume_attendance_app_user:

networks:
  net_attendance_app_user:
```

✅ **Gunakan persistence volume untuk MongoDB** (`volume_attendance_app_user:/data/db`) agar data tetap ada meskipun container dihentikan atau bahkan dihapus.  
✅ **Gunakan `.env` untuk mengatur environment mode & port** secara fleksibel.  
✅ Saat menggunakan `restart: always`, yang berarti *container* akan terus *restart* bahkan jika dihentikan manual. Oleh karena itu, sebagai solusinya dapat menggunakan `unless-stopped`, agar lebih fleksibel.

---

# **4️⃣ `.env` – Mengatur Mode Development & Production**  
📌 **Fungsi:**  
- Mengatur **mode aplikasi (development/production)** tanpa perlu mengedit `docker-compose.yml`.  
- **Menyederhanakan konfigurasi port untuk akses layanan**.  

```env
# Pilihan: development atau production
APP_ENV=development

# Port aplikasi Node.js
APP_PORT=8080

# Port MongoDB
MONGO_PORT=8081
```

✅ **Mode dapat diubah dengan mengedit `.env`** tanpa menyentuh file konfigurasi utama.  

---

# **5️⃣ Menjalankan Mode Development & Production**  

### **📌 Menjalankan dalam Mode Development**
```sh
APP_ENV=development docker-compose --env-file .env up -d --build
```
✅ Menggunakan **nodemon** untuk hot reload.  
✅ **Port berdasarkan `.env`**.  

---

### **📌 Menjalankan dalam Mode Production**
```sh
APP_ENV=production docker-compose --env-file .env up -d --build
```
✅ **Aplikasi berjalan dengan optimasi produksi** (tanpa nodemon, lebih cepat).  

---

### **📌 Menghentikan Semua Container**
```sh
docker-compose down
```

📌 **Menghentikan semua layanan, tetapi data MongoDB tetap ada karena menggunakan volume.**  

---

# **🚀 Kesimpulan**
✅ **Docker Compose menyederhanakan pengelolaan layanan**.  
✅ **Multi-stage build mengoptimalkan aplikasi** untuk **development & production**.  
✅ **Environment berbasis `.env` membuatnya lebih fleksibel & mudah digunakan**.  

🚀 **Sekarang, menjalankan mode development & production hanya butuh satu perintah!** 🔥