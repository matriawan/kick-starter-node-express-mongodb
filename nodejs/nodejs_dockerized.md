# :rocket: **Mempercepat Pengembangan Web dengan Dockerized Node.js**  

Dalam dunia pengembangan web, efisiensi adalah kunci. Menyiapkan lingkungan pengembangan yang konsisten sering kali menjadi tantangan, terutama ketika bekerja dalam tim atau menjalankan aplikasi di berbagai sistem. Oleh karena itu, saya ingin berbagi **Dockerfile** yang dapat membantu mempercepat proses pengembangan aplikasi **Node.js** berbasis **Express.js** dan **MongoDB** dengan pendekatan **Dockerized**.  

Dengan menggunakan **Docker**, kita dapat menciptakan lingkungan yang **portable**, **terisolasi**, dan **mudah direplikasi**, tanpa perlu khawatir tentang perbedaan konfigurasi antara mesin pengembang dan lingkungan produksi.  

Dengan pendekatan ini, kita bisa **mengembangkan aplikasi Node.js dengan Express dan MongoDB dalam lingkungan Docker yang ringan dan portabel**. :rocket:  

---

## **Struktur Folder Proyek**  
kita perlu menyiapkan struktur folder proyek agar semua file dan konfigurasi tertata dengan baik. Struktur ini memastikan bahwa aplikasi berjalan dengan benar di dalam container dan memanfaatkan fitur volume mounting dengan baik.

Misalkan kita memiliki proyek bernama **`node_web_app`**, maka struktur direktori yang perlu dibuat adalah sebagai berikut:

```plaintext
node_web_app/               # (Wajib) Root folder proyek
│── src/                    # (Wajib) Folder untuk source code aplikasi
│   ├── app.js              # (Wajib) File utama Node.js
│   ├── package.json        # (Dibuat otomatis oleh node) File konfigurasi Node.js (dependencies)
│   ├── package-lock.json   # (Dibuat otomatis oleh node) Lockfile untuk dependencies
│   ├── .env                # (Sementara tidak diperlukan) File konfigurasi environment
│── node.Dockerfile         # (Wajib) Dockerfile untuk membangun image
│── docker-compose.yml      # (Opsional) File Docker Compose untuk manajemen container
│── README.md               # (Opsional) Dokumentasi proyek
```

Namun untuk percobaan sekarang ini, cukup membuat folder **node_web_app** sebagai ***root*** folder proyek, kemudian sub-folder **src** sebagai *source code* aplikasi yang dibangun, dan file **node.Dockerfile** (tepat didalam folder "node_web_app") yang diperlukan untuk membangun image node.

---

### **Langkah-langkah Persiapan Sebelum Menjalankan Docker**  

#### **:one: Buat struktur folder proyek**  
Jalankan perintah berikut untuk membuat folder proyek dan subfoldernya:  

```sh
mkdir -p node_web_app/src
cd node_web_app
```

#### **:two: Inisialisasi proyek Node.js**  
Di dalam folder `node_web_app`, jalankan:  

```sh
npm init -y
```
Ini akan menghasilkan **`package.json`**, yang menyimpan konfigurasi proyek.

#### **:three: Instal dependensi yang dibutuhkan**  
Di dalam folder `node_web_app`, jalankan:  

```sh
npm install express mongoose
```
Ini akan membuat **`node_modules/`** (yang nanti kita kelola dengan volume Docker).

#### **:four: Buat file `app.js` dalam folder `src/`**  
Buka file `src/app.js` dan tambahkan kode berikut sebagai contoh server sederhana:

```javascript
const express = require('express');

const app = express();
const PORT = process.env.PORT || 8080;

// Routing dasar menampilkan pesan 'Hello World!'
app.get('/', (req, res) => {
    res.send('Hello World!');
});

// Menjalankan server
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
```

#### **:five: Buat `node.Dockerfile` di dalam `node_web_app/`**  
Tambahkan file **`node.Dockerfile`** dengan isi berikut:

---

## **Membuat File Image Node**  

Dockerfile yang saya bagikan ini dirancang dengan beberapa pertimbangan utama:  
1. **Menggunakan Node.js versi 22.14** untuk memastikan stabilitas dan kompatibilitas terbaru.  
2. **Berdasarkan Alpine 3.20**, sistem operasi ringan yang mempercepat proses build dan menghemat sumber daya.  
3. **Menggunakan direktori kerja `/var/www`**, yang memudahkan manajemen file dalam container.  
4. **Memasukkan dependensi penting** seperti **Express.js** untuk pengelolaan server dan **Mongoose** untuk interaksi dengan MongoDB.  

Berikut adalah **Dockerfile** yang siap digunakan:  

---

## **node.Dockerfile**  
```dockerfile
# Menggunakan image Node.js 22.14 berbasis Alpine 3.20
FROM node:22.14-alpine3.20

# Menetapkan direktori kerja dalam container
WORKDIR /var/www

# Menyalin file package.json dan package-lock.json (jika ada)
COPY package*.json ./

# Menginstal dependencies yang diperlukan (Express & Mongoose)
RUN npm install express mongoose --save

# Menyalin seluruh kode aplikasi ke dalam container
COPY . .

# Menjalankan aplikasi pada port 3000
EXPOSE 3000

# Menjalankan perintah untuk memulai aplikasi
CMD ["node", "app.js"]
```

---

## **Cara Menggunakan Dockerfile Ini**

### :one: **Bangun Docker Image**  
Setelah semua file `node.Dockerfile` selesai dibentuk, jalankan perintah berikut untuk membangun image node:  
   ```sh
   docker build -t i_node:22.14-alpine3.20 -f node.Dockerfile .
   ```

#### **Penjelasan Perintah** :one:  

1. **`docker build`**  
   &rarr; Perintah ini digunakan untuk membangun sebuah **Docker image** dari **Dockerfile** yang ditentukan.  

2. **`-t i_node:22.14-alpine3.20`**  
   &rarr; **`-t` (tag)** digunakan untuk memberi nama (tag) pada image yang dibuat.  
   &rarr; `i_node` adalah nama image yang dibuat.  
   &rarr; `22.14-alpine3.20` adalah tag versi image yang menunjukkan bahwa ini berbasis **Node.js 22.14** dan **Alpine 3.20**.  

3. **`-f node.Dockerfile`**  
   &rarr; **`-f` (file)** digunakan untuk menentukan file **Dockerfile** yang digunakan.  
   &rarr; `node.Dockerfile` adalah nama file Dockerfile yang digunakan untuk membangun image ini.  

4. **`.` (Titik di akhir perintah)**  
   &rarr; Menunjukkan bahwa **konteks build** berasal dari direktori saat ini. Artinya, semua file yang diperlukan (misalnya `package.json`, kode sumber, dll.) harus ada dalam direktori ini agar bisa disalin ke dalam image Docker.  


### :two: **Jalankan Container**  
Setelah image dibuat, jalankan container menggunakan perintah berikut:

> Pastikan masuk kedalam *root* direktori proyek **node_web_app** (bukan di sub-folder)  

```sh
docker run -it --rm --name c_node_app -p 3000:8080 -v "$(pwd)/src:/var/www" -v /var/www/node_modules i_node:22.14-alpine3.20
```
Sekarang **Node.js 22.14** berjalan di atas **Alpine 3.20**, dengan direktori kerja didalam **container** (`/var/www`).  

perintah ke :two: tersebut bertujuan untuk **menjalankan container** dari image `i_node:22.14-alpine3.20` yang telah dibuat sebelumnya. Berikut adalah penjelasan dari setiap bagiannya:

#### **Penjelasan Perintah** :two:  

1. **`docker run`**  
   → Perintah ini digunakan untuk menjalankan sebuah container dari image yang telah dibuat sebelumnya.  

2. **`-it`**  
   → **`-i` (interactive)**: Memungkinkan interaksi dengan terminal dalam container.  
   → **`-t` (tty)**: Memberikan terminal virtual untuk interaksi yang lebih nyaman.  

3. **`--rm`**  
   → Menghapus container secara otomatis setelah berhenti, sehingga container tidak menumpuk di sistem.  

4. **`--name c_node_app`**  
   → Memberikan nama `c_node_app` untuk container yang dijalankan agar lebih mudah dikenali dan dikelola.  

5. **`-p 3000:8080`**  
   → Memetakan **port 3000 di host** ke **port 8080 di dalam container**.  
   → Artinya, aplikasi dalam container yang berjalan di port **8080** akan dapat diakses dari luar melalui port **3000**.  

6. **`-v "$(pwd)/src:/var/www"`**  
   → **Volume binding (mounting)**:  
   → Menghubungkan folder `src` di direktori kerja saat ini (`$(pwd)`) ke `/var/www` dalam container.  
   → Artinya, perubahan pada file dalam `src` akan langsung terlihat di container tanpa perlu membangun ulang image.  

7. **`-v /var/www/node_modules`**  
   → Menggunakan **anonymous volume** untuk direktori `node_modules` dalam container.  
   → Ini mencegah `node_modules` dalam container ditimpa oleh direktori `node_modules` di host (karena host mungkin memiliki konfigurasi berbeda).  

8. **`i_node:22.14-alpine3.20`**  
   → Menentukan **image** yang akan digunakan untuk menjalankan container.  

Perintah :two: tersebut menjalankan container **Node.js 22.14 dengan Alpine 3.20**, dengan konfigurasi sebagai berikut:  
+ **Interaktif** (bisa menggunakan terminal)  
+ **Container otomatis terhapus setelah dihentikan**  
+ **Menggunakan nama `c_node_app`**  
+ **Port 8080 dalam container dipetakan ke port 3000 di host**  
+ **Kode dalam `src` langsung terhubung ke dalam container di `/var/www`**  
+ **`node_modules` dalam container tetap terisolasi agar kompatibel dengan sistem dalam container**  

### **Cara Menghentikan Container**  
Karena container ini berjalan secara interaktif, Anda dapat menghentikannya dengan menekan:  
```sh
CTRL + C
```

Atau, jika container berjalan di background (mode detached `-d`), Anda bisa menghentikannya dengan:  
```sh
docker ps
docker stop c_node_app
```

---

### **Kesimpulan**  
Dengan Dockerfile ini, pengembang dapat dengan mudah **menjalankan aplikasi Node.js dalam lingkungan yang stabil, ringan, dan terisolasi**, tanpa perlu melakukan konfigurasi manual yang rumit. Hal ini tidak hanya menghemat waktu, tetapi juga memastikan bahwa aplikasi dapat berjalan secara **konsisten** di berbagai lingkungan.  
Semoga ini bermanfaat bagi Anda yang ingin mempercepat workflow pengembangan web dengan pendekatan **Dockerized**! 🚀







