
### **Pendahuluan: DevOps, Evolusi dari Sysadmin ke Era Otomasi**  

Dulu, seorang **SysAdmin** (System Administrator) dikenal sebagai sosok yang bertanggung jawab penuh atas server dan infrastruktur. Mereka mengelola perangkat keras, jaringan, serta memastikan aplikasi berjalan tanpa hambatan. Namun, seiring berkembangnya teknologi dan kebutuhan pengembangan perangkat lunak yang semakin cepat, peran ini mengalami pergeseran besar.  

Kini, istilah **DevOps** lebih sering digunakan. DevOps bukan sekadar peran baru, tetapi sebuah budaya yang menggabungkan **pengembangan (Development) dan operasional (Operations)** menjadi satu kesatuan yang lebih **otomatis, cepat, dan efisien**. DevOps memungkinkan tim **mengembangkan, menguji, dan menerapkan aplikasi lebih cepat**, tanpa harus bergantung pada proses manual yang memakan waktu.  

---

### **Mengapa DevOps Dibutuhkan?**  
Di masa lalu, pengembang (Developer) dan tim operasional (Ops) sering bekerja **terpisah**. Hal ini menyebabkan berbagai masalah seperti:  
❌ **Deploy lambat** → Developer menulis kode, tetapi butuh waktu lama sebelum bisa dijalankan di produksi.  
❌ **Konflik antar tim** → Developer ingin perubahan cepat, sedangkan Ops ingin sistem tetap stabil.  
❌ **Banyak kesalahan manual** → Proses deployment dilakukan secara manual, meningkatkan risiko kesalahan konfigurasi.  

DevOps hadir sebagai solusi dengan prinsip **automation, collaboration, dan continuous delivery**. Dengan DevOps, siklus pengembangan lebih cepat, otomatisasi lebih kuat, dan infrastruktur lebih fleksibel.  

---

### **Git (CVS) dan Docker: Senjata Utama DevOps**  
Dua teknologi utama dalam implementasi DevOps adalah **Git sebagai sistem kontrol versi (CVS)** dan **Docker sebagai alat containerization**.  

1️⃣ **Git: Membangun Kolaborasi dan CI/CD**  
   - Git memungkinkan banyak developer bekerja bersama tanpa khawatir kode mereka saling berbenturan.  
   - Dengan **Continuous Integration (CI)**, setiap perubahan kode dapat langsung diuji sebelum diterapkan.  
   - Contoh workflow:  
     ```sh
     git clone repo-url
     git checkout -b feature-branch
     git commit -m "Menambahkan fitur baru"
     git push origin feature-branch
     ```
   - Integrasi dengan **GitHub Actions, GitLab CI/CD, atau Jenkins** membuat deployment menjadi otomatis.  

2️⃣ **Docker: Membuat Aplikasi Lebih Fleksibel dan Portabel**  
   - Docker memungkinkan aplikasi dijalankan dalam **container** yang ringan dan portabel.  
   - Developer tidak perlu khawatir perbedaan lingkungan di local dan produksi.  
   - Workflow DevOps dengan Docker:  
     ```sh
     docker build -t my-app .
     docker run -p 3000:3000 my-app
     ```
   - Kombinasi Docker dengan Kubernetes semakin mempercepat skalabilitas aplikasi.  

---

### **Kesimpulan**  
💡 **DevOps bukan sekadar peran baru, tetapi cara kerja baru** yang menghilangkan batas antara pengembangan dan operasional.  
💡 Dengan **Git dan Docker**, proses pengembangan menjadi **lebih cepat, stabil, dan otomatis**.  
💡 **Automasi** adalah kunci utama DevOps, menghilangkan pekerjaan manual yang berulang dan meningkatkan keandalan sistem.  

🚀 **Dari seorang SysAdmin yang dulu mengelola server secara manual, kini DevOps Engineer dapat mengotomatisasi infrastruktur dengan satu perintah!**

---

### **Docker dan Git: Pilar Utama DevOps**  

Dalam dunia **DevOps**, dua teknologi yang paling sering digunakan adalah **Docker** dan **Git**. Keduanya berperan penting dalam otomatisasi, kolaborasi, serta efisiensi pengembangan dan deployment aplikasi.  

Docker memungkinkan aplikasi berjalan dalam lingkungan yang **konsisten dan portabel**, sedangkan Git berfungsi sebagai sistem **kontrol versi** yang memastikan pengembang dapat bekerja secara kolaboratif tanpa risiko konflik kode.  

---

## **1️⃣ Git: Sistem Kontrol Versi yang Tak Tergantikan**  

**Git** adalah sistem **Version Control System (VCS)** yang memungkinkan pengembang melacak perubahan kode dan berkolaborasi dalam tim dengan lebih efisien.  

### **Mengapa Git Penting dalam DevOps?**  
✅ **Kolaborasi Tanpa Konflik** → Banyak pengembang bisa bekerja di proyek yang sama tanpa saling menimpa kode.  
✅ **Penyimpanan Histori Kode** → Semua perubahan dicatat, sehingga mudah untuk kembali ke versi sebelumnya.  
✅ **Continuous Integration (CI)** → Git digunakan dalam pipeline CI/CD untuk otomatisasi pengujian dan deployment.  

### **Workflow Dasar Git dalam DevOps**  
1. **Clone Repository**  
   ```sh
   git clone https://github.com/user/repo.git
   ```
2. **Membuat Branch Baru**  
   ```sh
   git checkout -b feature-branch
   ```
3. **Menambahkan dan Commit Perubahan**  
   ```sh
   git add .
   git commit -m "Menambahkan fitur baru"
   ```
4. **Push ke Repository Remote**  
   ```sh
   git push origin feature-branch
   ```
5. **Melakukan Merge ke Branch Utama**  
   ```sh
   git checkout main
   git merge feature-branch
   git push origin main
   ```

💡 **Integrasi Git dengan CI/CD** memungkinkan setiap perubahan yang di-push ke repository diuji dan dideploy secara otomatis menggunakan **GitHub Actions, GitLab CI/CD, atau Jenkins**.

---

## **2️⃣ Docker: Menjalankan Aplikasi di Lingkungan yang Konsisten**  

**Docker** adalah teknologi **containerization** yang memungkinkan aplikasi dan dependensinya dikemas dalam **container** yang dapat berjalan di berbagai lingkungan tanpa perubahan konfigurasi.  

### **Mengapa Docker Penting dalam DevOps?**  
✅ **Menghilangkan Masalah "It Works on My Machine"** → Aplikasi berjalan sama di semua lingkungan.  
✅ **Portabilitas** → Container dapat dijalankan di lokal, server, atau cloud tanpa perubahan.  
✅ **Otomatisasi & Skalabilitas** → Bisa digunakan dengan **Kubernetes** untuk scaling otomatis.  

### **Workflow Docker dalam DevOps**  
1. **Menulis Dockerfile untuk Membuat Image**  
   ```dockerfile
   FROM node:18
   WORKDIR /app
   COPY package.json .  
   RUN npm install  
   COPY . .  
   EXPOSE 3000  
   CMD ["node", "server.js"]
   ```
2. **Membangun Image Docker**  
   ```sh
   docker build -t my-app .
   ```
3. **Menjalankan Container**  
   ```sh
   docker run -p 3000:3000 my-app
   ```
4. **Menggunakan Docker Compose untuk Multi-Container**  
   ```yaml
   version: "3"
   services:
     app:
       build: .
       ports:
         - "3000:3000"
       depends_on:
         - database
     database:
       image: mongo
       ports:
         - "27017:27017"
   ```
   → Dengan **Docker Compose**, aplikasi dan database bisa berjalan dalam satu konfigurasi.

---

## **Docker + Git: Kombinasi Kuat dalam DevOps**  

Docker dan Git sering digunakan **bersama** dalam pipeline CI/CD untuk otomatisasi deployment:  
1️⃣ **Developer** menulis kode dan melakukan commit ke Git.  
2️⃣ **Pipeline CI/CD** otomatis membangun image Docker setelah perubahan terdeteksi.  
3️⃣ **Container** dijalankan di staging atau produksi dengan **Docker atau Kubernetes**.  

🔹 **Contoh Integrasi Docker dan Git dalam GitHub Actions**  
```yaml
name: CI/CD Pipeline
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Build Docker Image
        run: docker build -t my-app .
      - name: Push to Docker Hub
        run: docker push my-app
```

---

## **Kesimpulan**  
🚀 **Git dan Docker adalah fondasi utama DevOps.**  
📌 **Git** memungkinkan pengelolaan kode secara terstruktur dan kolaboratif.  
📌 **Docker** memastikan aplikasi berjalan di mana saja tanpa masalah lingkungan.  
🔄 **Dengan kombinasi keduanya**, tim DevOps dapat mengotomatisasi deployment, meningkatkan efisiensi, dan mengurangi downtime aplikasi.  

💡 **Next Step:** Integrasikan Docker dan Git dengan Kubernetes untuk otomatisasi yang lebih lanjut! 🚀

---


### **Apa Itu Dockerfile?**  
**Dockerfile** adalah file teks yang berisi sekumpulan instruksi untuk membangun **image Docker** secara otomatis. File ini menentukan bagaimana lingkungan dalam container harus dikonfigurasi, termasuk sistem operasi, dependensi, kode aplikasi, dan pengaturan lainnya.  

---

### **Fungsi Dockerfile**  
Dockerfile digunakan untuk:  

1. **Membuat Image Docker Secara Otomatis**  
   - Dengan Dockerfile, kita bisa membangun image secara **reproducible** (bisa dibuat ulang dengan hasil yang sama).  
   - Tidak perlu menginstal secara manual setiap kali ingin menjalankan aplikasi.  

2. **Mengelola Dependensi dan Lingkungan Aplikasi**  
   - Bisa menginstal software, library, atau dependencies yang dibutuhkan aplikasi.  
   - Contoh: Menginstal Node.js dan dependensinya untuk aplikasi berbasis JavaScript.  

3. **Meningkatkan Konsistensi dan Portabilitas**  
   - Dengan Dockerfile, kita bisa memastikan aplikasi berjalan **dengan cara yang sama** di berbagai lingkungan (local, staging, production).  
   - Bisa dibagikan ke tim tanpa perlu setup ulang.  

4. **Mempermudah Deployment dan Scaling**  
   - Bisa digunakan dalam pipeline **CI/CD** untuk otomatisasi deployment.  
   - Bisa dijalankan di berbagai cloud provider atau platform container seperti **Kubernetes**.  

---

### **Contoh Dockerfile Sederhana**  
Misalnya kita ingin membuat container untuk menjalankan aplikasi Node.js, berikut contoh Dockerfile-nya:  

```dockerfile
# Menggunakan image resmi Node.js sebagai basis
FROM node:18

# Menetapkan direktori kerja dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json
COPY package*.json ./

# Menginstal dependencies
RUN npm install

# Menyalin seluruh kode aplikasi ke dalam container
COPY . .

# Menjalankan aplikasi pada port tertentu
EXPOSE 8080

# Menjalankan perintah untuk memulai aplikasi
CMD ["node", "server.js"]
```

---

### **Cara Menggunakan Dockerfile**
1. **Buat Dockerfile** → Simpan file ini dengan nama `Dockerfile`.  
2. **Bangun Image** → Jalankan perintah:  
   ```sh
   docker build -t my-node-app .
   ```
3. **Jalankan Container** → Setelah image dibuat, jalankan:  
   ```sh
   docker run -p 8080:3000 my-node-app
   ```

Hasilnya, aplikasi Node.js akan berjalan di dalam container tanpa perlu menginstal Node.js secara manual di mesin lokal yang dapat diakses melalui port 8080.

---

### **Apa Itu `docker-compose.yml`?**  

`docker-compose.yml` adalah file berbasis **YAML (`.yml`)** yang digunakan oleh **Docker Compose** untuk mendefinisikan dan mengelola multi-container dalam satu konfigurasi. Dengan file ini, kita bisa menjalankan beberapa container sekaligus tanpa harus mengetik perintah `docker run` secara manual untuk setiap container.  

**YAML (`.yml`)** sendiri adalah format data yang simpel dan mudah dibaca manusia, sering digunakan untuk konfigurasi. Formatnya berbasis indentasi, mirip seperti Python, sehingga lebih rapi dibanding JSON atau XML.  

---

### **Fungsi `docker-compose.yml`**  
File ini berguna untuk:  
✅ **Menjalankan Multi-Container dengan Sekali Perintah** → Cocok untuk aplikasi berbasis microservices.  
✅ **Memudahkan Konfigurasi Lingkungan** → Dapat menyimpan variabel lingkungan dan pengaturan lainnya.  
✅ **Mengelola Networking Antar Container** → Secara otomatis menghubungkan container yang didefinisikan dalam satu file.  
✅ **Mempermudah Deployment** → Bisa digunakan dalam pengembangan (`development`), pengujian (`testing`), atau produksi (`production`).  

---

### **Analogi Sederhana**  
Bayangkan Anda memiliki **restoran otomatis** yang terdiri dari beberapa bagian:  

🍳 **Dapur (Backend Server)** → Memasak makanan (mengelola data).  
📦 **Gudang (Database)** → Menyimpan bahan makanan (data).  
🛎️ **Pelayan (Frontend/Client App)** → Mengantarkan makanan ke pelanggan (menampilkan data ke user).  

Alih-alih menyuruh setiap bagian bekerja secara manual satu per satu, Anda ingin **menjalankan semua bagian bersamaan**. Inilah yang dilakukan **Docker Compose** dengan `docker-compose.yml`.  

---

### **Contoh `docker-compose.yml` Sederhana**  
Misalkan kita ingin menjalankan **aplikasi Node.js dengan MongoDB**, maka file `docker-compose.yml`-nya bisa seperti ini:  

```yaml
version: "3.8"  # Versi Docker Compose yang digunakan

services:
  app:  # Service untuk aplikasi Node.js
    image: node:18  # Menggunakan image resmi Node.js
    container_name: my-node-app  # Nama container
    working_dir: /app  # Direktori kerja dalam container
    volumes:
      - .:/app  # Sinkronisasi folder lokal dengan container
    ports:
      - "3000:3000"  # Mapping port lokal ke dalam container
    depends_on:
      - mongodb  # Pastikan MongoDB berjalan lebih dulu
    command: ["node", "server.js"]  # Perintah untuk menjalankan aplikasi

  mongodb:  # Service untuk database MongoDB
    image: mongo:5.0  # Menggunakan image resmi MongoDB
    container_name: my-mongo-db
    ports:
      - "27017:27017"  # Mapping port default MongoDB
    environment:
      MONGO_INITDB_ROOT_USERNAME: root  # Username default MongoDB
      MONGO_INITDB_ROOT_PASSWORD: secret  # Password default MongoDB
      MONGO_INITDB_DATABASE: UsersDB  # Nama database default
    volumes:
      - mongo-data:/data/db  # Volume agar data tetap tersimpan

volumes:
  mongo-data:  # Volume untuk menyimpan data MongoDB
```

---

### **Penjelasan Perintah di `docker-compose.yml`**  
| Perintah | Penjelasan |
|----------|-----------|
| `version: "3.8"` | Versi Docker Compose yang digunakan. |
| `services:` | Bagian untuk mendefinisikan layanan/container yang akan dijalankan. |
| `app:` | Nama service untuk aplikasi Node.js. |
| `image: node:18` | Menggunakan image resmi Node.js versi 18. |
| `container_name: my-node-app` | Menentukan nama container untuk memudahkan pengelolaan. |
| `working_dir: /app` | Direktori kerja dalam container. |
| `volumes:` | Menghubungkan folder lokal dengan container agar perubahan langsung terlihat. |
| `ports:` | Mengekspos port agar bisa diakses dari luar container. |
| `depends_on:` | Menentukan service yang harus berjalan lebih dulu, misalnya MongoDB. |
| `command:` | Menentukan perintah yang akan dijalankan dalam container. |
| `mongodb:` | Nama service untuk database MongoDB. |
| `environment:` | Menentukan variabel lingkungan untuk konfigurasi database. |
| `volumes:` | Menggunakan **persistent volume** agar data tetap tersimpan meskipun container dihentikan. |

---

### **Cara Menggunakan `docker-compose.yml`**  
1️⃣ **Buat File `docker-compose.yml`** di dalam proyek Anda.  
2️⃣ **Jalankan Semua Container Sekaligus** dengan perintah:  
   ```sh
   docker-compose up -d
   ```
   🔹 `-d` berarti mode **detached** (berjalan di latar belakang).  

3️⃣ **Cek Container yang Berjalan**  
   ```sh
   docker ps
   ```
4️⃣ **Hentikan Semua Container**  
   ```sh
   docker-compose down
   ```

---

### **Kesimpulan**  
Dengan `docker-compose.yml`, kita bisa menjalankan **beberapa container sekaligus dengan satu perintah**. Ini sangat mempermudah pengembangan, terutama untuk aplikasi yang memerlukan **database dan backend secara bersamaan**.  

🚀 **Docker Compose adalah solusi praktis untuk membangun dan mengelola aplikasi berbasis container dengan lebih cepat, efisien, dan fleksibel!**

---

## **Apa Itu Kubernetes?**  

**Kubernetes (K8s)** adalah sebuah **orchestrator container** open-source yang digunakan untuk mengelola, mengotomatisasi, dan menskalakan container aplikasi secara efisien. Kubernetes dikembangkan oleh Google dan kini dikelola oleh **Cloud Native Computing Foundation (CNCF)**.  

Jika Docker memungkinkan kita membuat dan menjalankan container, Kubernetes berfungsi untuk **mengatur banyak container** dalam skala besar, baik itu di cloud maupun di server lokal.  

---

## **Fungsi Utama Kubernetes**  
✅ **Otomatisasi Deployment & Scaling** → Kubernetes bisa secara otomatis menjalankan, menghentikan, atau menggandakan container sesuai kebutuhan.  
✅ **Load Balancing & Service Discovery** → Kubernetes mendistribusikan lalu lintas ke container agar aplikasi tetap responsif.  
✅ **Self-Healing** → Jika ada container yang gagal, Kubernetes akan otomatis menggantinya dengan yang baru.  
✅ **Manajemen Konfigurasi & Rahasia (Secrets)** → Kubernetes bisa menyimpan konfigurasi dan kredensial secara aman tanpa perlu menyimpan dalam kode aplikasi.  

---

## **Analogi Sederhana Kubernetes**  
Bayangkan Anda mengelola **sebuah restoran cepat saji** dengan banyak cabang.  

🍔 **Docker** = Setiap koki di dapur memiliki alat masak (container) untuk memasak burger.  
🏬 **Kubernetes** = Manajer restoran yang memastikan setiap cabang punya cukup koki, bahan makanan, dan pelanggan dilayani dengan baik.  

Jika tiba-tiba ada banyak pesanan, Kubernetes **menambah lebih banyak koki** (scaling). Jika ada koki yang kelelahan atau sakit, Kubernetes **menggantinya dengan yang baru** (self-healing).  

---

## **Komponen Utama Kubernetes**  
| Komponen | Fungsi |
|----------|--------|
| **Pod** | Unit terkecil dalam Kubernetes yang berisi satu atau lebih container. |
| **Node** | Mesin fisik/virtual tempat Pod berjalan. Bisa berupa server lokal atau cloud. |
| **Cluster** | Kumpulan beberapa node yang dikelola oleh Kubernetes. |
| **Master Node** | Node utama yang mengatur seluruh cluster. |
| **Worker Node** | Node tempat aplikasi dan container berjalan. |
| **Deployment** | Mengatur bagaimana container dibuat, diperbarui, dan dihapus. |
| **Service** | Menyediakan cara bagi aplikasi untuk saling berkomunikasi di dalam cluster. |
| **Ingress** | Mengatur lalu lintas masuk ke dalam aplikasi dari luar cluster. |

---

## **Contoh Kubernetes dalam Praktik**  
Misalkan kita ingin menjalankan **aplikasi Node.js dengan MongoDB di Kubernetes**.  

1️⃣ **File Deployment untuk Aplikasi Node.js (`node-app-deployment.yaml`)**  
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-app
spec:
  replicas: 2  # Jalankan 2 instance aplikasi
  selector:
    matchLabels:
      app: node-app
  template:
    metadata:
      labels:
        app: node-app
    spec:
      containers:
        - name: node-container
          image: my-node-app:latest  # Image Docker aplikasi
          ports:
            - containerPort: 3000
```

2️⃣ **File Deployment untuk MongoDB (`mongo-deployment.yaml`)**  
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongodb
  template:
    metadata:
      labels:
        app: mongodb
    spec:
      containers:
        - name: mongo-container
          image: mongo:5.0
          ports:
            - containerPort: 27017
```

3️⃣ **File Service untuk Menghubungkan Node.js dan MongoDB (`service.yaml`)**  
```yaml
apiVersion: v1
kind: Service
metadata:
  name: node-service
spec:
  selector:
    app: node-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
  type: LoadBalancer
```

---

## **Cara Menjalankan Kubernetes**
Setelah menulis file YAML di atas, jalankan perintah berikut:  

1️⃣ **Jalankan Cluster Minikube** (jika di lokal):  
   ```sh
   minikube start
   ```
2️⃣ **Deploy Aplikasi Node.js**  
   ```sh
   kubectl apply -f node-app-deployment.yaml
   ```
3️⃣ **Deploy Database MongoDB**  
   ```sh
   kubectl apply -f mongo-deployment.yaml
   ```
4️⃣ **Jalankan Service untuk Load Balancing**  
   ```sh
   kubectl apply -f service.yaml
   ```
5️⃣ **Cek Status Pod yang Berjalan**  
   ```sh
   kubectl get pods
   ```
6️⃣ **Akses Aplikasi di Kubernetes**  
   ```sh
   minikube service node-service
   ```

---

## **Kesimpulan**  
💡 **Docker** digunakan untuk menjalankan container, sedangkan **Kubernetes** digunakan untuk mengelola container dalam skala besar.  
💡 Kubernetes memungkinkan **deployment otomatis, scaling, dan load balancing** tanpa perlu intervensi manual.  
💡 Menggunakan Kubernetes, aplikasi **menjadi lebih stabil, fleksibel, dan mudah dikelola** di berbagai lingkungan (cloud atau on-premise).  

🚀 **Jika Docker adalah mesin pengiriman, Kubernetes adalah sistem manajemen pengiriman yang memastikan semua berjalan lancar!**

---

# **Integrasi Docker dan Git dengan Kubernetes: Next Step dalam DevOps** 🚀  

Setelah memahami bagaimana **Docker** dan **Git** bekerja dalam ekosistem DevOps, langkah berikutnya adalah mengintegrasikan keduanya dengan **Kubernetes** untuk **otomatisasi deployment dan scaling** yang lebih canggih.  

---

## **🔹 Mengapa Kubernetes?**  
Docker memungkinkan kita membuat **container**, tetapi ketika jumlah container bertambah banyak, pengelolaannya menjadi kompleks. **Kubernetes (K8s)** hadir sebagai **orchestrator container** untuk mengelola **deployment, scaling, monitoring, dan failover** secara otomatis.

✅ **Auto-scaling** → Kubernetes bisa menambah atau mengurangi jumlah container berdasarkan beban.  
✅ **High Availability** → Jika satu container gagal, Kubernetes akan otomatis menggantinya.  
✅ **Load Balancing** → Kubernetes bisa mendistribusikan trafik ke beberapa container.  
✅ **Rolling Updates & Rollbacks** → Memungkinkan update aplikasi tanpa downtime.  

---

## **🔹 Workflow CI/CD dengan Git, Docker, dan Kubernetes**  
1️⃣ **Developer** melakukan commit kode ke repository Git.  
2️⃣ **Pipeline CI/CD (GitHub Actions, GitLab CI/CD, Jenkins)** otomatis membangun **Docker Image**.  
3️⃣ **Docker Image** di-push ke **Docker Hub** atau **Container Registry** lainnya.  
4️⃣ **Kubernetes** mengambil image terbaru dan melakukan **deployment**.  
5️⃣ **Load Balancer** mengarahkan trafik ke container yang berjalan.  

📌 **Contoh Diagram Workflow:**  
```
Developer → Git Commit → CI/CD (Build & Push Docker Image) → Kubernetes (Deploy & Scale)
```

---

## **🔹 Contoh Implementasi CI/CD dengan Git, Docker, dan Kubernetes**  

### **1️⃣ Buat Dockerfile untuk Aplikasi**  
Pastikan aplikasi bisa dijalankan dalam container dengan **Dockerfile** berikut:  

```dockerfile
FROM node:18  
WORKDIR /app  
COPY package.json .  
RUN npm install  
COPY . .  
EXPOSE 3000  
CMD ["node", "server.js"]
```

Bangun dan push image ke Docker Hub:  
```sh
docker build -t my-app .
docker tag my-app my-dockerhub-username/my-app:latest
docker push my-dockerhub-username/my-app:latest
```

---

### **2️⃣ Konfigurasi Kubernetes untuk Deployment**  
Buat file **deployment.yaml** untuk mendefinisikan **Pod** dan **ReplicaSet**:  

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app
        image: my-dockerhub-username/my-app:latest
        ports:
        - containerPort: 3000
```

Deploy ke Kubernetes:  
```sh
kubectl apply -f deployment.yaml
```

---

### **3️⃣ Menambahkan Load Balancer dengan Kubernetes Service**  
Buat file **service.yaml** untuk mengekspos aplikasi ke publik:  

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
  type: LoadBalancer
```

Deploy service:  
```sh
kubectl apply -f service.yaml
```

---

### **4️⃣ Automasi CI/CD dengan GitHub Actions**  
Buat file **.github/workflows/deploy.yml** agar setiap push ke branch `main`, **Docker Image** dibangun dan Kubernetes diperbarui.  

```yaml
name: Deploy to Kubernetes
on:
  push:
    branches:
      - main
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Build Docker Image
        run: |
          docker build -t my-dockerhub-username/my-app:latest .
          docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}
          docker push my-dockerhub-username/my-app:latest

      - name: Deploy to Kubernetes
        run: |
          kubectl apply -f deployment.yaml
          kubectl apply -f service.yaml
```

---

## **🔹 Hasil Akhir: Apa yang Terjadi?**  
✅ Setiap **push ke branch `main`**, image **otomatis** dibangun dan di-push ke Docker Hub.  
✅ Kubernetes akan **meng-update container** dengan versi terbaru tanpa downtime.  
✅ **Scaling otomatis** dilakukan jika trafik meningkat.  
✅ Jika container mati, Kubernetes akan **membuat ulang** secara otomatis.  

---

## **Kesimpulan**  
🔹 **Docker & Git** adalah dasar dari DevOps untuk **containerization & version control**.  
🔹 **Kubernetes** memberikan **orchestrasi otomatis** untuk scaling, load balancing, dan high availability.  
🔹 Dengan **CI/CD**, **developer cukup push kode ke Git**, dan **deployment terjadi otomatis** tanpa campur tangan manual.  

🚀 **Hasilnya?** Proses **deployment lebih cepat, lebih stabil, dan lebih scalable**! 💡  

---

Selanjutnya, apakah ingin mendalami **helm charts untuk Kubernetes**, atau ada topik lain yang perlu dibahas? 😊

