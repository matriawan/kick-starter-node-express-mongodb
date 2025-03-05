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
EXPOSE 3000

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
   docker run -p 3000:3000 my-node-app
   ```

Hasilnya, aplikasi Node.js akan berjalan di dalam container tanpa perlu menginstal Node.js secara manual di mesin lokal.

---

