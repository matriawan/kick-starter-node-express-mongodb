


# An Overview SQL (MySQL) Vs NoSQL (MongoDB)
### **Pendahuluan: Perbedaan MongoDB Enterprise dan Community**  

### **SQL vs NoSQL: Kesamaan dan Perbedaan**  

#### **Apa Itu SQL dan NoSQL?**  
- **SQL (Structured Query Language)** &rarr; Merupakan bahasa yang digunakan untuk mengelola database relasional (RDBMS) yang menyimpan data dalam bentuk tabel dengan struktur yang tetap.  
- **NoSQL (Not Only SQL)** &rarr; Merupakan kategori database non-relasional yang menawarkan fleksibilitas dalam penyimpanan data dengan berbagai model seperti **dokumen, key-value, graph, atau wide-column**.  

---

### **Kesamaan SQL dan NoSQL**  
Meskipun memiliki perbedaan arsitektur, SQL dan NoSQL memiliki beberapa kesamaan utama:  
1. **Menyimpan dan mengelola data** untuk berbagai keperluan aplikasi.  
2. **Mendukung indexing** guna meningkatkan kecepatan pencarian data.  
3. **Mendukung replikasi** untuk meningkatkan ketersediaan dan ketahanan data.  
4. **Dapat menangani skala besar** dengan pendekatan yang berbeda (SQL cenderung **vertikal**, NoSQL cenderung **horizontal**).  
5. **Bisa diintegrasikan dengan berbagai bahasa pemrograman** seperti Python, JavaScript, Java, dan lainnya.  

---

### **Perbedaan SQL dan NoSQL**  

| **Aspek**        | **SQL (Relational Database - RDBMS)** | **NoSQL (Non-Relational Database)** |
|------------------|------------------------------------|----------------------------------|
| **Default Port** | 3306 | 27017 |
| **Kepanjangan** | Structured Query Language | Not Only SQL |
| **Struktur Data** | **Tabel** (Rows & Columns) | **Dokumen (JSON/BSON)**, Key-Value, Wide-Column, Graph |
| **Skema** | Tetap (**Rigid Schema**) | Fleksibel (**Schema-less**) |
| **Bahasa Query** | **SQL** (Structured Query Language) | Beragam: MongoDB Query, CQL (Cassandra), Gremlin (Graph DB) |
| **Istilah Data** | **Table** &rarr; Row &rarr; Column | **Collection** &rarr; Document &rarr; Field (Dokumen-based NoSQL) |
| **Konsistensi Data** | **Strong Consistency** (**ACID**: Atomicity, Consistency, Isolation, Durability) | **Eventual Consistency** (**BASE**: Basically Available, Soft state, Eventual consistency) |
| **Skalabilitas** | **Vertikal** (upgrade spesifikasi server) | **Horizontal** (distribusi ke banyak server) |
| **Cocok Untuk** | Sistem keuangan, transaksi perbankan, aplikasi enterprise | Big data, real-time apps, media sosial, IoT |
| **Contoh Database** | MySQL, PostgreSQL, SQL Server, Oracle | MongoDB, Redis, Cassandra, Firebase |
| **Kelebihan** | Data terstruktur, aman, cocok untuk transaksi kompleks | Cepat, fleksibel, dan lebih scalable |
| **Kekurangan** | Kurang fleksibel, sulit menangani perubahan skema besar | Tidak sekuat SQL dalam hal transaksi finansial yang butuh konsistensi tinggi |

---

### **Kapan Menggunakan SQL atau NoSQL?**  

:white_check_mark: **Gunakan SQL jika:**  
- Data memiliki **struktur tetap** dan memerlukan **konsistensi tinggi**.  
- Aplikasi membutuhkan **transaksi yang aman dan kompleks**, seperti sistem perbankan, e-commerce, atau ERP.  

:white_check_mark: **Gunakan NoSQL jika:**  
- Data bersifat **besar, cepat berubah, dan tidak terstruktur**.  
- Aplikasi membutuhkan **kecepatan tinggi dan skalabilitas**, seperti media sosial, IoT, atau big data processing.  

---

### **Kesimpulan**  
:pushpin: **SQL dan NoSQL bukanlah pesaing, melainkan solusi yang disesuaikan dengan kebutuhan aplikasi.** :rocket:  
Beberapa perusahaan bahkan menggunakan **kombinasi SQL dan NoSQL** dalam sistem mereka untuk mengoptimalkan performa dan fleksibilitas penyimpanan data.

---

## Versi MongoDB

MongoDB tersedia dalam dua versi utama: **MongoDB Enterprise** dan **MongoDB Community**.  

1. **MongoDB Community**  
   - **Gratis & Open Source** &rarr; Dirilis di bawah lisensi **Server Side Public License (SSPL)**.  
   - Cocok untuk **pengembangan aplikasi skala kecil hingga menengah**.  
   - Memiliki fitur inti seperti **CRUD, indexing, aggregation, replication, dan sharding**.  
   - Didukung oleh komunitas, tanpa dukungan resmi dari MongoDB Inc.  

2. **MongoDB Enterprise**  
   - **Berbayar** dengan lisensi komersial.  
   - Dirancang untuk **bisnis dan perusahaan besar** yang membutuhkan fitur tambahan.  
   - Menyediakan **enkripsi data tingkat lanjut, auditing, monitoring enterprise, dan integrasi keamanan** (LDAP, Kerberos, TLS/SSL).  
   - Didukung secara resmi oleh MongoDB Inc. dengan layanan **SLA (Service Level Agreement)**.  

**Kesimpulan:**  
Jika Anda membutuhkan database yang **gratis dan cukup powerful**, **MongoDB Community** sudah sangat memadai. Namun, jika organisasi Anda memerlukan **keamanan tingkat lanjut, dukungan resmi, dan fitur enterprise**, maka **MongoDB Enterprise** adalah pilihan yang lebih tepat. :rocket:


---

Berikut adalah versi sistematis yang dapat Anda bagikan kepada rekan kerja Anda mengenai berbagai platform untuk mengelola **MongoDB**, termasuk **MongoDB Atlas** sebagai solusi berbasis cloud.  

---

# **Platform untuk Mengelola MongoDB**  

Jika menggunakan **MongoDB**, terdapat berbagai platform yang dapat digunakan untuk mengelola database, mirip dengan **phpMyAdmin** pada MySQL, baik versi *native* maupun GUI. Platform ini membantu dalam menghubungkan, membaca, menulis, serta mengelola database secara efisien.

Berikut adalah penjelasan sistematis mengenai **Platform untuk Mengelola MongoDB di Node.js**, termasuk cara menghubungkannya, penjelasan setiap baris kode, output yang dihasilkan, serta kelebihan dan kekurangan dari masing-masing platform.

---

### **1. MongoDB Native Driver (mongodb)**
MongoDB menyediakan **driver resmi untuk Node.js** yang memungkinkan koneksi langsung ke database tanpa perlu alat tambahan.

#### **Cara Menghubungkan MongoDB ke Node.js dengan Native Driver**
**1️⃣ Instalasi MongoDB Driver**
Jalankan perintah berikut di terminal:
```sh
npm install mongodb
```
Ini akan menginstal paket `mongodb` yang diperlukan untuk menghubungkan Node.js ke MongoDB.

---

**2️⃣ Buat File `index.js` dan Tambahkan Kode Berikut:**
```javascript
const { MongoClient } = require('mongodb');

const uri = "mongodb://localhost:27017"; // Ganti dengan URI MongoDB Atlas jika menggunakan cloud
const client = new MongoClient(uri);

async function run() {
    try {
        await client.connect(); // Menghubungkan ke database
        console.log("✅ Terhubung ke MongoDB");

        const database = client.db("testDB"); // Pilih database
        const collection = database.collection("users"); // Pilih koleksi

        // Contoh memasukkan data
        const result = await collection.insertOne({ name: "John Doe", age: 30 });
        console.log("📝 Data Ditambahkan dengan ID:", result.insertedId);
        
        // Contoh membaca data
        const user = await collection.findOne({ name: "John Doe" });
        console.log("📌 Data Ditemukan:", user);
        
    } catch (error) {
        console.dir(error, { depth: null }); // Menampilkan error dengan detail
    } finally {
        await client.close(); // Tutup koneksi
    }
}

run();
```

---

#### **Penjelasan Kode**
1. **`const { MongoClient } = require('mongodb');`**  
   → Mengimpor `MongoClient` dari paket `mongodb`.
2. **`const uri = "mongodb://localhost:27017";`**  
   → Mengatur URI MongoDB untuk koneksi ke database lokal.
3. **`const client = new MongoClient(uri);`**  
   → Membuat instance `MongoClient` untuk koneksi ke MongoDB.
4. **`await client.connect();`**  
   → Menghubungkan aplikasi Node.js ke MongoDB.
5. **`const database = client.db("testDB");`**  
   → Memilih database dengan nama `testDB`.
6. **`const collection = database.collection("users");`**  
   → Memilih koleksi (tabel) bernama `users`.
7. **`await collection.insertOne({ name: "John Doe", age: 30 });`**  
   → Menambahkan data ke koleksi.
8. **`const user = await collection.findOne({ name: "John Doe" });`**  
   → Mengambil data dari koleksi.
9. **`console.dir(error, { depth: null });`**  
   → Menampilkan error dengan detail jika terjadi kesalahan.
10. **`await client.close();`**  
   → Menutup koneksi ke database setelah selesai.

---

#### **Output yang Dihasilkan**
Jika berhasil, akan muncul output seperti ini:
```
✅ Terhubung ke MongoDB
📝 Data Ditambahkan dengan ID: 6563b3c62d1a4e3d5b0f6a90
📌 Data Ditemukan: { _id: ObjectId('6563b3c62d1a4e3d5b0f6a90'), name: 'John Doe', age: 30 }
```

---

### **✅ Kelebihan dan ❌ Kekurangan MongoDB Native Driver**
| Kelebihan | Kekurangan |
|-----------|------------|
| 🟢 **Gratis & Open-Source** | 🔴 Perlu pemahaman kode lebih dalam |
| 🟢 **Performa tinggi** karena langsung mengakses MongoDB | 🔴 Tidak ada GUI, semua harus dilakukan via kode |
| 🟢 **Dukungan Resmi** dari MongoDB | 🔴 Membutuhkan setup manual |

---

## **2. GUI (Graphical User Interface) untuk MongoDB**  

### **a. MongoDB Compass (GUI Resmi MongoDB)**  
**Deskripsi:**  
MongoDB Compass adalah GUI resmi dari MongoDB yang memungkinkan pengguna untuk mengelola database dengan antarmuka grafis.  

**Fitur utama:**  
:white_check_mark: Menampilkan koleksi dan dokumen dalam format JSON.  
:white_check_mark: Query builder visual untuk pencarian data.  
:white_check_mark: Analisis performa query.  
:white_check_mark: Manajemen indeks dan validasi skema.  

🔗 **Download**: [https://www.mongodb.com/products/compass](https://www.mongodb.com/products/compass)  

#### **Cara Menggunakan Compass dengan Node.js**
1. **Unduh & Instal MongoDB Compass** → [Download di sini](https://www.mongodb.com/try/download/compass).
2. **Buka MongoDB Compass** dan masukkan **URI MongoDB** (misalnya `mongodb://localhost:27017`).
3. **Jelajahi database**, buat koleksi, jalankan query, dan ekspor data dengan tampilan grafis.

#### **✅ Kelebihan dan ❌ Kekurangan MongoDB Compass**
| Kelebihan | Kekurangan |
|-----------|------------|
| 🟢 **Gratis & Open-Source** | 🔴 Tidak dapat digunakan dalam kode (hanya GUI) |
| 🟢 **Mudah digunakan, cocok untuk pemula** | 🔴 Tidak mendukung akses remote tanpa setting tambahan |
| 🟢 **Menampilkan data secara visual (chart & statistik)** | |

---  

### **b. Robo 3T (sebelumnya Robomongo)**  
**Deskripsi:**  
Robo 3T adalah GUI ringan yang memiliki shell MongoDB bawaan untuk eksekusi perintah langsung.  

**Fitur utama:**  
:white_check_mark: Open-source dan ringan.  
:white_check_mark: Mendukung shell MongoDB di dalam GUI.  
:white_check_mark: Bisa digunakan untuk menghubungkan ke berbagai server MongoDB.  

🔗 **Download**: [https://robomongo.org/](https://robomongo.org/)  

---  

### **c. NoSQLBooster for MongoDB**  
**Deskripsi:**  
NoSQLBooster menyediakan fitur **IntelliSense** untuk mempermudah penulisan query MongoDB.  

**Fitur utama:**  
:white_check_mark: Auto-complete query dengan IntelliSense.  
:white_check_mark: Dukungan SQL-like query.  
:white_check_mark: Dukungan untuk agregasi dan pipeline query.  

🔗 **Download**: [https://nosqlbooster.com/](https://nosqlbooster.com/)  

---  

### **d. Studio 3T**  
**Deskripsi:**  
Studio 3T adalah GUI premium dengan fitur lengkap untuk pengelolaan MongoDB.  

**Fitur utama:**  
:white_check_mark: SQL query builder untuk MongoDB.  
:white_check_mark: Data migration antar database.  
:white_check_mark: Visual query builder.  

🔗 **Download**: [https://studio3t.com/](https://studio3t.com/)  

---

## **2. MongoDB Atlas: Solusi Cloud untuk MongoDB**  

### **Apa itu MongoDB Atlas?**  
MongoDB Atlas adalah layanan **Database-as-a-Service (DBaaS)** yang memungkinkan pengguna menjalankan dan mengelola **MongoDB di cloud** tanpa perlu mengatur server secara manual.  

**Perbedaan utama dengan GUI lokal seperti Compass atau Robo 3T:**  
- **GUI lokal** (Compass, Robo 3T, dll.) digunakan untuk mengelola **MongoDB yang diinstal secara lokal atau di server sendiri**.  
- **MongoDB Atlas** adalah **platform cloud** yang memungkinkan pengguna menyimpan dan mengakses database MongoDB dari mana saja tanpa perlu instalasi server MongoDB.  

### **Fitur Utama MongoDB Atlas**  
:white_check_mark: **Database MongoDB yang dikelola otomatis** → Tidak perlu instalasi manual.  
:white_check_mark: **Multi-Cloud Support** → Dapat berjalan di **AWS, Google Cloud, atau Azure**.  
:white_check_mark: **GUI Web-Based** → Dapat digunakan langsung dari browser tanpa perlu software tambahan.  
:white_check_mark: **Keamanan tingkat tinggi** → Mendukung **Authentication & Access Control, Backup otomatis, dan Enkripsi data**.  
:white_check_mark: **Cluster Scaling Otomatis** → Bisa melakukan **scaling** sesuai kebutuhan tanpa konfigurasi manual.  

🔗 **Daftar & Gunakan MongoDB Atlas:** [https://www.mongodb.com/atlas](https://www.mongodb.com/atlas)  

#### **Cara Menghubungkan Node.js ke MongoDB Atlas**
1. **Buat Akun** di [MongoDB Atlas](https://www.mongodb.com/atlas).
2. **Buat Cluster & Dapatkan URI Koneksi** dari MongoDB Atlas.
3. **Gunakan URI tersebut dalam kode Node.js**, misalnya:
   ```javascript
   const uri = "mongodb+srv://username:password@cluster.mongodb.net/?retryWrites=true&w=majority";
   const client = new MongoClient(uri);
   ```
4. **Jalankan kode seperti contoh di atas**.

#### **✅ Kelebihan dan ❌ Kekurangan MongoDB Atlas**
| Kelebihan | Kekurangan |
|-----------|------------|
| 🟢 **Cloud-based, dapat diakses dari mana saja** | 🔴 Berbayar untuk skala besar |
| 🟢 **Otomatis backup & scaling** | 🔴 Perlu internet untuk akses database |
| 🟢 **Tersedia versi gratis untuk proyek kecil** | |

---

## **3. Cara Menggunakan MongoDB Atlas**  

### **a. Daftar Akun & Buat Cluster**  
1️⃣ Kunjungi **[https://www.mongodb.com/atlas](https://www.mongodb.com/atlas)**  
2️⃣ Buat akun gratis atau login dengan akun yang sudah ada.  
3️⃣ Pilih **Cloud Provider (AWS, GCP, Azure)** dan region yang diinginkan.  
4️⃣ Pilih tier gratis **(M0 - Free Tier Cluster)** untuk belajar atau testing.  

### **b. Hubungkan ke Database MongoDB Atlas**  
Setelah cluster dibuat, Anda bisa menghubungkan database dengan berbagai cara:  

:white_check_mark: **Menggunakan MongoDB Compass:**  
- Copy **MongoDB Connection String** dari Atlas.  
- Buka Compass → Klik **Connect** → Masukkan connection string.  

:white_check_mark: **Menggunakan MongoDB Shell:**  
```sh
mongosh "mongodb+srv://<username>:<password>@cluster.mongodb.net/myFirstDatabase"
```  

:white_check_mark: **Menggunakan Node.js atau Python:**  
```javascript
const { MongoClient } = require('mongodb');
const uri = "mongodb+srv://<username>:<password>@cluster.mongodb.net/?retryWrites=true&w=majority";
const client = new MongoClient(uri);
async function run() {
    try {
        await client.connect();
        console.log("Connected to MongoDB Atlas");
    } finally {
        await client.close();
    }
}
run().catch(console.dir);
```  

---

## **Kesimpulan**  
- Jika ingin mengelola MongoDB secara lokal, gunakan GUI seperti **MongoDB Compass, Robo 3T, atau Studio 3T**.  
- Jika ingin solusi berbasis **cloud** tanpa perlu menginstal MongoDB sendiri, gunakan **MongoDB Atlas**.  
- **MongoDB Atlas** menyediakan **GUI berbasis web**, mirip dengan **phpMyAdmin untuk MySQL**.  
- Jika ingin mengakses MongoDB Atlas dari komputer lokal, bisa menggunakan **Compass, shell MongoDB, atau kode dalam aplikasi**.  

| Platform | Gratis | GUI | Cocok untuk |
|----------|--------|-----|-------------|
| **MongoDB Native Driver** | ✅ | ❌ | Pengembang yang ingin kontrol penuh lewat kode |
| **MongoDB Compass** | ✅ | ✅ | Pemula yang butuh tampilan grafis |
| **MongoDB Atlas** | ✅ (untuk skala kecil) | ✅ | Tim yang butuh solusi cloud dan akses global |

:fire: **MongoDB Atlas adalah pilihan terbaik jika ingin solusi praktis tanpa repot mengelola server sendiri!** 🚀  

Jika Anda ingin mengelola MongoDB **sepenuhnya melalui kode**, gunakan **MongoDB Native Driver**. Jika Anda ingin kemudahan **dengan GUI**, gunakan **MongoDB Compass**. Jika ingin solusi berbasis **cloud**, gunakan **MongoDB Atlas**.

🔥 **Rekomendasi:** Untuk proyek kecil gunakan **MongoDB Compass** + **Native Driver**, sedangkan untuk proyek besar gunakan **MongoDB Atlas**. 🚀


---


## **Operasi Dasar dalam SQL vs NoSQL**  

Tabel berikut menunjukkan perbedaan dalam operasi dasar **CRUD** (*Create, Read, Update, Delete*) antara SQL dan NoSQL (menggunakan MongoDB sebagai contoh database NoSQL berbasis dokumen).  

| **Operasi**  | **SQL (Relational Database - RDBMS)** | **NoSQL (MongoDB - Document Database)** |
|-------------|-------------------------------------|----------------------------------------|
| **Insert (Create)** | ```INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john@example.com');``` | ```db.users.insertOne({ _id: 1, name: "John Doe", email: "john@example.com" })``` |
| **Read (Select)** | ```SELECT * FROM users WHERE id = 1;``` | ```db.users.findOne({ _id: 1 })``` |
| **Update (Modify Data)** | ```UPDATE users SET email = 'john.doe@example.com' WHERE id = 1;``` | ```db.users.updateOne({ _id: 1 }, { $set: { email: "john.doe@example.com" } })``` |
| **Delete (Remove Data)** | ```DELETE FROM users WHERE id = 1;``` | ```db.users.deleteOne({ _id: 1 })``` |

---

### **Penjelasan Operasi CRUD**  

1. **Insert (Create)**
   - **SQL:** Menggunakan `INSERT INTO` untuk menambahkan data ke tabel dengan kolom yang telah ditentukan.  
   - **NoSQL (MongoDB):** Menggunakan `insertOne()` untuk menambahkan dokumen ke dalam koleksi tanpa harus mengikuti skema tetap.  

2. **Read (Select)**
   - **SQL:** Menggunakan `SELECT` untuk mengambil data berdasarkan kondisi tertentu.  
   - **NoSQL (MongoDB):** Menggunakan `findOne()` atau `find()` untuk mengambil satu atau lebih dokumen dari koleksi.  

3. **Update (Modify Data)**
   - **SQL:** Menggunakan `UPDATE` dengan `SET` untuk mengubah nilai tertentu dalam baris data.  
   - **NoSQL (MongoDB):** Menggunakan `updateOne()` atau `updateMany()` dengan operator `$set` untuk memperbarui data dalam dokumen.  

4. **Delete (Remove Data)**
   - **SQL:** Menggunakan `DELETE FROM` untuk menghapus data berdasarkan kondisi tertentu.  
   - **NoSQL (MongoDB):** Menggunakan `deleteOne()` atau `deleteMany()` untuk menghapus dokumen dari koleksi.  

---

### **Kesimpulan**  
:pushpin: **SQL dan NoSQL memiliki operasi dasar yang mirip, tetapi implementasinya berbeda.**  
- **SQL lebih ketat dalam skema dan menggunakan query berbasis tabel.**  
- **NoSQL lebih fleksibel dan menggunakan dokumen JSON/BSON untuk penyimpanan data.**  

Jika data membutuhkan **struktur yang tetap dan relasional**, maka **SQL lebih cocok**.  
Jika data bersifat **besar, tidak terstruktur, dan cepat berubah**, maka **NoSQL lebih fleksibel**. :rocket:

---

# Metode Penanganan Data yang Berelasi: SQL vs NoSQL

Data yang berelasi mengacu pada bagaimana suatu entitas (data) dapat dikaitkan dengan entitas lain dalam suatu database. SQL dan NoSQL menangani hubungan antar data dengan cara yang berbeda. Berikut adalah contoh sederhana dan penjelasannya untuk setiap jenis relasi dalam **SQL**.  

---

# A. Metode Relasi pada SQL

Berikut adalah contoh sederhana untuk setiap jenis relasi dalam SQL.

## **1. One-to-One (1:1) dalam SQL**  
**Penjelasan:**  
Setiap entitas di tabel A hanya memiliki satu entitas terkait di tabel B, dan sebaliknya.  
**Contoh:** Satu pengguna hanya memiliki satu profil.  

:pushpin: **Struktur Tabel:**
```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE profiles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE,  -- Setiap user hanya punya satu profil
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

:pushpin: **Contoh Insert Data:**
```sql
INSERT INTO users (name) VALUES ('Alice');
INSERT INTO profiles (user_id, bio) VALUES (1, 'Software Developer');
```

:pushpin: **Contoh Query Join:**
```sql
SELECT users.name, profiles.bio
FROM users
JOIN profiles ON users.id = profiles.user_id;
```

---

## **2. One-to-Many (1:M) dalam SQL**  
**Penjelasan:**  
Satu entitas di tabel A dapat memiliki banyak entitas di tabel B, tetapi setiap entitas di tabel B hanya terkait dengan satu entitas di tabel A.  
**Contoh:** Seorang pengguna bisa memiliki banyak pesanan (orders).  

:pushpin: **Struktur Tabel:**
```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,  -- Setiap order hanya dimiliki oleh satu user
    total DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

:pushpin: **Contoh Insert Data:**
```sql
INSERT INTO users (name) VALUES ('Bob');
INSERT INTO orders (user_id, total) VALUES (1, 50.00);
INSERT INTO orders (user_id, total) VALUES (1, 100.00);
```

:pushpin: **Contoh Query Join:**
```sql
SELECT users.name, orders.id, orders.total
FROM users
JOIN orders ON users.id = orders.user_id;
```

---

## **3. Many-to-Many (M:M) dalam SQL**  
**Penjelasan:**  
Satu entitas di tabel A bisa memiliki banyak entitas di tabel B, dan sebaliknya. Untuk mengelola hubungan ini, kita menggunakan tabel penghubung (junction table).  
**Contoh:** Seorang siswa bisa mengambil banyak mata kuliah, dan satu mata kuliah bisa diambil oleh banyak siswa.  

:pushpin: **Struktur Tabel:**
```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE student_courses (  -- Tabel penghubung
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
```

:pushpin: **Contoh Insert Data:**
```sql
INSERT INTO students (name) VALUES ('Charlie');
INSERT INTO courses (course_name) VALUES ('Mathematics');
INSERT INTO courses (course_name) VALUES ('Physics');

-- Charlie mengambil dua mata kuliah
INSERT INTO student_courses (student_id, course_id) VALUES (1, 1);
INSERT INTO student_courses (student_id, course_id) VALUES (1, 2);
```

:pushpin: **Contoh Query Join:**
```sql
SELECT students.name, courses.course_name
FROM students
JOIN student_courses ON students.id = student_courses.student_id
JOIN courses ON student_courses.course_id = courses.id;
```

---

## **Kesimpulan**  
- **One-to-One (1:1)** &rarr; Setiap entitas hanya memiliki satu pasangan di tabel lain.  
- **One-to-Many (1:M)** &rarr; Satu entitas memiliki banyak pasangan di tabel lain.  
- **Many-to-Many (M:M)** &rarr; Banyak entitas di satu tabel dapat berhubungan dengan banyak entitas di tabel lain melalui tabel penghubung.  

---

Berikut adalah penyusunan ulang topik **JOIN pada SQL** secara sistematis agar mudah dipahami dan dibagikan kepada rekan kerja Anda:  

---

# **JOIN dalam SQL: Konsep, Jenis, dan Implementasi**  

## **1. Apa itu JOIN dalam SQL?**  
`JOIN` adalah teknik dalam SQL yang digunakan untuk menggabungkan data dari dua atau lebih tabel berdasarkan suatu kolom yang memiliki hubungan (relasi).  

### **1.1. Bagaimana JOIN Bekerja?**  
JOIN menghubungkan baris di satu tabel dengan baris yang sesuai di tabel lain berdasarkan kondisi tertentu yang didefinisikan dalam klausa **ON** atau **USING**.  

Contoh dasar JOIN:  
```sql
SELECT users.name, orders.total
FROM users
JOIN orders ON users.id = orders.user_id;
```
:pushpin: **Catatan:** Jika hanya ditulis `JOIN`, maka **secara default** dianggap sebagai **INNER JOIN**.  

---

## **2. Jenis-Jenis JOIN dalam SQL**  
JOIN dalam SQL memiliki beberapa jenis utama, masing-masing memiliki cara kerja yang berbeda dalam mengambil data dari tabel. Berikut adalah perbedaan mendasar antara jenis-jenis JOIN:  

### **2.1. INNER JOIN (JOIN Default dalam SQL)**
- Mengembalikan hanya baris yang memiliki pasangan yang cocok di kedua tabel.
- Jika tidak ada kecocokan, data tidak akan ditampilkan.  

**Sintaks INNER JOIN:**  
```sql
SELECT users.name, orders.total
FROM users
INNER JOIN orders ON users.id = orders.user_id;
```
**Diagram INNER JOIN:**  
```
Tabel Users      Tabel Orders
------------     --------------
| id | name |   | id | user_id | total |
------------     --------------
| 1  | A    |   | 1  | 1       | 100   |
| 2  | B    |   | 2  | 2       | 200   |
| 3  | C    |  
------------    
```
**Hasil INNER JOIN:**  
```
name | total
---------------
A    | 100
B    | 200
```
(C hanya ada di tabel Users tetapi tidak memiliki pesanan, sehingga tidak ditampilkan.)

---

### **2.2. LEFT JOIN (LEFT OUTER JOIN)**
- Mengembalikan **semua data dari tabel kiri** dan hanya yang cocok dari tabel kanan.
- Jika tidak ada kecocokan di tabel kanan, akan menampilkan **NULL**.  

**Sintaks LEFT JOIN:**  
```sql
SELECT users.name, orders.total
FROM users
LEFT JOIN orders ON users.id = orders.user_id;
```
**Hasil LEFT JOIN:**  
```
name | total
---------------
A    | 100
B    | 200
C    | NULL
```
(Baris dari Users tetap muncul meskipun tidak memiliki pesanan.)

---

### **2.3. RIGHT JOIN (RIGHT OUTER JOIN)**
- Mengembalikan **semua data dari tabel kanan** dan hanya yang cocok dari tabel kiri.
- Jika tidak ada kecocokan di tabel kiri, akan menampilkan **NULL**.  

**Sintaks RIGHT JOIN:**  
```sql
SELECT users.name, orders.total
FROM users
RIGHT JOIN orders ON users.id = orders.user_id;
```
**Hasil RIGHT JOIN:**  
```
name | total
---------------
A    | 100
B    | 200
NULL | 300
```
(Terdapat pesanan yang tidak memiliki pengguna, sehingga `name` menjadi NULL.)

---

### **2.4. FULL JOIN (FULL OUTER JOIN)**
- Mengembalikan **semua data dari kedua tabel**, baik yang memiliki kecocokan maupun tidak.
- Jika tidak ada pasangan di salah satu tabel, akan menampilkan **NULL** di kolom yang tidak cocok.  

**Sintaks FULL JOIN:**  
```sql
SELECT users.name, orders.total
FROM users
FULL JOIN orders ON users.id = orders.user_id;
```
**Hasil FULL JOIN:**  
```
name | total
---------------
A    | 100
B    | 200
C    | NULL
NULL | 300
```
(Users yang tidak memiliki pesanan dan pesanan tanpa user tetap ditampilkan dengan nilai `NULL`.)

---

### **2.5. CROSS JOIN**
- Menghasilkan **perkalian Cartesian** dari kedua tabel (setiap baris dari tabel pertama dikombinasikan dengan setiap baris dari tabel kedua).
- Digunakan jika kita ingin semua kombinasi tanpa kondisi hubungan.  

**Sintaks CROSS JOIN:**  
```sql
SELECT users.name, orders.total
FROM users
CROSS JOIN orders;
```
**Jika Users memiliki 3 baris dan Orders memiliki 3 baris, hasilnya akan 3 × 3 = 9 baris.**

---

### **2.6. SELF JOIN**
- JOIN yang dilakukan pada **tabel yang sama**.
- Berguna untuk merepresentasikan hubungan hirarkis seperti manajer dan karyawan.  

**Sintaks SELF JOIN:**  
```sql
SELECT A.name AS Employee, B.name AS Manager
FROM employees A
JOIN employees B ON A.manager_id = B.id;
```

---

## **3. Kesimpulan dan Perbandingan JOIN SQL**
Berikut tabel perbandingan JOIN SQL secara ringkas:  

| **Jenis JOIN**   | **Data yang Ditampilkan** |
|-----------------|--------------------------|
| **INNER JOIN**  | Hanya yang cocok di kedua tabel. |
| **LEFT JOIN**   | Semua dari tabel kiri + yang cocok dari tabel kanan. |
| **RIGHT JOIN**  | Semua dari tabel kanan + yang cocok dari tabel kiri. |
| **FULL JOIN**   | Semua data dari kedua tabel. |
| **CROSS JOIN**  | Perkalian Cartesian dari kedua tabel. |
| **SELF JOIN**   | JOIN pada tabel yang sama untuk hubungan hierarki. |

---

## **4. Mengapa `JOIN` Default adalah `INNER JOIN`?**  
Jika kita menulis **hanya `JOIN` tanpa jenis JOIN tertentu**, maka SQL **secara default menggunakan `INNER JOIN`**.  

Contoh:  
```sql
SELECT users.name, orders.total
FROM users
JOIN orders ON users.id = orders.user_id;
```
Sama dengan:  
```sql
SELECT users.name, orders.total
FROM users
INNER JOIN orders ON users.id = orders.user_id;
```

:pushpin: **Alasannya:**  
1. `INNER JOIN` adalah JOIN yang paling umum digunakan.  
2. JOIN tanpa kata kunci tambahan lebih mudah dibaca dan dipahami.  
3. `INNER JOIN` hanya mengambil data yang valid dari kedua tabel.  

---

## **5. Studi Kasus: Implementasi JOIN dalam Aplikasi**  
Misalkan dalam sebuah **aplikasi e-commerce**, kita memiliki dua tabel:  
- **`customers`**: menyimpan data pelanggan.  
- **`orders`**: menyimpan pesanan pelanggan.  

**Query untuk mendapatkan daftar pelanggan beserta pesanan mereka:**  
```sql
SELECT customers.name, orders.order_date, orders.total_price
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;
```
Ini memastikan semua pelanggan ditampilkan meskipun belum pernah melakukan pesanan.

---

## **6. Kesimpulan Akhir**
- `JOIN` digunakan untuk menghubungkan tabel berdasarkan hubungan antar data.  
- **INNER JOIN** adalah JOIN default jika tidak disebutkan jenisnya.  
- Berbagai jenis JOIN memiliki kegunaan masing-masing:  
  - **INNER JOIN** untuk hanya data yang cocok.  
  - **LEFT JOIN / RIGHT JOIN** untuk memastikan semua data dari satu tabel tetap tampil.  
  - **FULL JOIN** untuk mengambil semua data dari kedua tabel.  
  - **CROSS JOIN** untuk perkalian Cartesian.  
  - **SELF JOIN** untuk hubungan dalam tabel yang sama.  

🎯 **Dengan pemahaman ini, Anda dapat dengan mudah menggunakan JOIN dalam SQL untuk mengelola dan menganalisis data dengan lebih efektif.** 💡

---

Berikut adalah tambahan pembahasan mengenai cara menghubungkan tabel **tanpa menggunakan JOIN**, yaitu dengan menggunakan **kondisi dalam WHERE**.  

---

## **7. Menghubungkan Tabel Tanpa Menuliskan JOIN**  
Pada dasarnya, SQL memungkinkan kita untuk **menggabungkan tabel tanpa menggunakan perintah `JOIN`** secara eksplisit. Hal ini bisa dilakukan dengan menyebutkan kedua tabel dalam klausa `FROM`, lalu menggunakan `WHERE` untuk menentukan hubungan antar tabel.

### **7.1. Cara Kerja Menghubungkan Tabel Tanpa JOIN**  
Kita cukup menuliskan kedua tabel dalam `FROM`, lalu menentukan relasi antar tabel dalam `WHERE`.  

**Contoh Perbandingan:**
Menggunakan **INNER JOIN** secara eksplisit:
```sql
SELECT users.name, orders.total
FROM users
INNER JOIN orders ON users.id = orders.user_id;
```
Menggunakan **WHERE tanpa JOIN**:
```sql
SELECT users.name, orders.total
FROM users, orders
WHERE users.id = orders.user_id;
```
💡 **Hasil dari kedua query ini akan sama**, karena kita tetap menetapkan hubungan antar tabel melalui kondisi `WHERE users.id = orders.user_id`.  

---

### **7.2. Contoh Penggunaan Tanpa JOIN untuk Berbagai Jenis JOIN**  

#### **1️⃣ INNER JOIN menggunakan WHERE**
Jika kita ingin mendapatkan hanya data yang cocok di kedua tabel, kita bisa menuliskannya tanpa `JOIN` seperti ini:  
```sql
SELECT customers.name, orders.order_date, orders.total_price
FROM customers, orders
WHERE customers.id = orders.customer_id;
```
Ini sama seperti:  
```sql
SELECT customers.name, orders.order_date, orders.total_price
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;
```

#### **2️⃣ LEFT JOIN dengan WHERE (Simulasi)**
LEFT JOIN sulit direplikasi hanya dengan `WHERE`, tetapi kita bisa mencobanya menggunakan **subquery atau UNION**.  
Misalnya, kita ingin mengambil semua pelanggan meskipun belum pernah melakukan pesanan:
```sql
SELECT customers.name, orders.order_date, orders.total_price
FROM customers, orders
WHERE customers.id = orders.customer_id
UNION
SELECT customers.name, NULL, NULL
FROM customers
WHERE customers.id NOT IN (SELECT customer_id FROM orders);
```
Namun, ini **tidak seefisien LEFT JOIN** secara langsung.

#### **3️⃣ CROSS JOIN menggunakan WHERE**
CROSS JOIN bisa dilakukan dengan menyebutkan dua tabel tanpa kondisi `WHERE`:
```sql
SELECT users.name, orders.total
FROM users, orders;
```
Ini setara dengan:
```sql
SELECT users.name, orders.total
FROM users
CROSS JOIN orders;
```
:pushpin: **Efeknya:** Setiap baris dari `users` akan dikombinasikan dengan setiap baris dari `orders` (perkalian Cartesian).

---

## **8. Kapan Menggunakan JOIN dan Kapan Menggunakan WHERE?**
| **Metode**       | **Keuntungan** | **Kekurangan** |
|-----------------|---------------|---------------|
| **JOIN** (INNER, LEFT, RIGHT, FULL) | Lebih terstruktur, mudah dipahami, dan performa lebih optimal. | Perlu penulisan eksplisit `JOIN`. |
| **WHERE (tanpa JOIN)** | Bisa digunakan untuk query sederhana. | Tidak efisien untuk `LEFT JOIN` dan `FULL JOIN`, serta kurang terbaca dalam query kompleks. |

:white_check_mark: **Rekomendasi:**  
- Gunakan **JOIN** untuk query yang melibatkan banyak tabel agar lebih terbaca dan efisien.  
- Gunakan **WHERE tanpa JOIN** hanya untuk kasus sederhana atau ketika ingin eksplorasi data cepat.

---

## **Kesimpulan Akhir**
- **Tanpa menuliskan JOIN**, SQL tetap bisa menghubungkan tabel dengan menggunakan `WHERE`.  
- **INNER JOIN dan CROSS JOIN** bisa ditulis tanpa `JOIN`, tetapi **LEFT JOIN dan FULL JOIN sulit direplikasi hanya dengan `WHERE`**.  
- **JOIN lebih direkomendasikan karena lebih terstruktur dan optimal untuk performa**.

🎯 **Dengan pemahaman ini, Anda bisa lebih fleksibel dalam menghubungkan tabel dalam SQL!** :rocket:  

---

# B. Metode Relasi pada NoSQL
Berikut adalah contoh sederhana dan lengkap untuk setiap jenis **relasi dalam NoSQL (MongoDB)**.  

---

## **1. One-to-One (1:1) dalam NoSQL (MongoDB)**  
**Penjelasan:**  
Dalam MongoDB, relasi **One-to-One** biasanya disimpan sebagai embedded document dalam satu koleksi (karena lebih efisien untuk data yang jarang berubah).  

:pushpin: **Contoh:** Satu pengguna memiliki satu profil.  

:pushpin: **Struktur Dokumen:**  
```json
{
    "_id": ObjectId("1234567890"),
    "name": "Alice",
    "profile": {
        "bio": "Software Developer"
    }
}
```

:pushpin: **Query Insert Data:**  
```js
db.users.insertOne({
    name: "Alice",
    profile: {
        bio: "Software Developer"
    }
});
```

:pushpin: **Query untuk Menampilkan Data:**  
```js
db.users.findOne({ name: "Alice" });
```

---

## **2. One-to-Many (1:M) dalam NoSQL (MongoDB)**  
**Penjelasan:**  
Dalam MongoDB, relasi **One-to-Many** bisa disimpan dengan **referencing** atau **embedding**.  

:pushpin: **Contoh:** Seorang pengguna bisa memiliki banyak pesanan (orders).  

### **Metode Referencing (Disarankan untuk data yang sering berubah)**  
:pushpin: **Struktur Dokumen (users):**  
```json
{
    "_id": ObjectId("user123"),
    "name": "Bob"
}
```

:pushpin: **Struktur Dokumen (orders):**  
```json
{
    "_id": ObjectId("order001"),
    "user_id": ObjectId("user123"),
    "total": 50.00
}
```

:pushpin: **Query Insert Data:**  
```js
db.users.insertOne({ _id: ObjectId("user123"), name: "Bob" });

db.orders.insertMany([
    { user_id: ObjectId("user123"), total: 50.00 },
    { user_id: ObjectId("user123"), total: 100.00 }
]);
```

:pushpin: **Query untuk Join (Aggregation Lookup):**  
```js
db.users.aggregate([
    {
        $lookup: {
            from: "orders",
            localField: "_id",
            foreignField: "user_id",
            as: "user_orders"
        }
    }
]);
```

### **Metode Embedding (Disarankan untuk data yang jarang berubah)**  
:pushpin: **Struktur Dokumen (users):**  
```json
{
    "_id": ObjectId("user123"),
    "name": "Bob",
    "orders": [
        { "total": 50.00 },
        { "total": 100.00 }
    ]
}
```

:pushpin: **Query Insert Data:**  
```js
db.users.insertOne({
    name: "Bob",
    orders: [
        { total: 50.00 },
        { total: 100.00 }
    ]
});
```

---

## **3. Many-to-Many (M:M) dalam NoSQL (MongoDB)**  
**Penjelasan:**  
Relasi **Many-to-Many** biasanya menggunakan **referencing** dengan koleksi penghubung atau menyimpan daftar referensi dalam array.  

:pushpin: **Contoh:** Seorang siswa bisa mengambil banyak mata kuliah, dan satu mata kuliah bisa diambil oleh banyak siswa.  

### **Metode Referencing (Menggunakan Koleksi Penghubung)**  
:pushpin: **Struktur Dokumen (students):**  
```json
{
    "_id": ObjectId("student123"),
    "name": "Charlie"
}
```

:pushpin: **Struktur Dokumen (courses):**  
```json
{
    "_id": ObjectId("course101"),
    "course_name": "Mathematics"
}
```

:pushpin: **Struktur Dokumen (student_courses - Koleksi Penghubung):**  
```json
{
    "student_id": ObjectId("student123"),
    "course_id": ObjectId("course101")
}
```

:pushpin: **Query Insert Data:**  
```js
db.students.insertOne({ _id: ObjectId("student123"), name: "Charlie" });

db.courses.insertMany([
    { _id: ObjectId("course101"), course_name: "Mathematics" },
    { _id: ObjectId("course102"), course_name: "Physics" }
]);

db.student_courses.insertMany([
    { student_id: ObjectId("student123"), course_id: ObjectId("course101") },
    { student_id: ObjectId("student123"), course_id: ObjectId("course102") }
]);
```

:pushpin: **Query untuk Join (Aggregation Lookup):**  
```js
db.student_courses.aggregate([
    {
        $lookup: {
            from: "students",
            localField: "student_id",
            foreignField: "_id",
            as: "student_info"
        }
    },
    {
        $lookup: {
            from: "courses",
            localField: "course_id",
            foreignField: "_id",
            as: "course_info"
        }
    }
]);
```

### **Metode Embedding (Jika Relasi Tidak Banyak)**  
:pushpin: **Struktur Dokumen (students dengan daftar mata kuliah):**  
```json
{
    "_id": ObjectId("student123"),
    "name": "Charlie",
    "courses": [
        { "course_name": "Mathematics" },
        { "course_name": "Physics" }
    ]
}
```

:pushpin: **Query Insert Data:**  
```js
db.students.insertOne({
    name: "Charlie",
    courses: [
        { course_name: "Mathematics" },
        { course_name: "Physics" }
    ]
});
```

---

## **Kesimpulan**  
- **One-to-One (1:1)** &rarr; Bisa menggunakan embedded document atau referencing.  
- **One-to-Many (1:M)** &rarr; Bisa menggunakan referencing (lookup) atau embedding.  
- **Many-to-Many (M:M)** &rarr; Biasanya menggunakan referencing dengan koleksi penghubung.  

---

# :rocket: **Mempercepat Pengembangan Web dengan Dockerized MongoDB**  

Dalam pengembangan web modern, **MongoDB** menjadi pilihan populer sebagai database NoSQL karena fleksibilitasnya dalam menyimpan data berbasis dokumen. Namun, menginstal dan mengkonfigurasi MongoDB secara manual sering kali memakan waktu dan menimbulkan masalah kompatibilitas. **Dockerized MongoDB** hadir sebagai solusi untuk mempercepat proses pengembangan dengan menyediakan lingkungan database yang **portable, konsisten, dan mudah dikelola**.  

Dengan **Docker**, pengembang dapat menjalankan MongoDB dalam **container** yang ringan tanpa perlu instalasi manual di setiap perangkat. Cukup dengan satu perintah, database dapat dijalankan, dikonfigurasi, dan dihubungkan ke aplikasi. Selain itu, penggunaan **volume persisten** memastikan bahwa data tetap aman meskipun container dihentikan atau dihapus.  

Manfaat utama dari Dockerized MongoDB meliputi:  
:white_check_mark: **Instalasi Cepat & Konsisten** – Tidak perlu konfigurasi manual yang rumit.  
:white_check_mark: **Isolasi Lingkungan** – Menghindari konflik versi dengan database lain.  
:white_check_mark: **Portabilitas & Skalabilitas** – Mudah dijalankan di berbagai sistem dan cloud.  
:white_check_mark: **Manajemen Data yang Fleksibel** – Dengan volume Docker, data tetap terjaga meskipun container diperbarui.  

Dengan menerapkan MongoDB dalam container Docker, tim pengembang dapat **fokus pada pengembangan aplikasi** tanpa harus khawatir dengan pengaturan lingkungan database. :rocket:

---

Berikut adalah **Dockerfile** untuk menjalankan **MongoDB Community Server versi 5.0.10** berbasis **Ubuntu 20.04**, yang disimpan dalam file **mongodb.Dockerfile**.  

### **Penjelasan Fitur**  
- Menggunakan **image resmi MongoDB Community Server**: `mongodb-community-server:5.0.10-ubuntu2004`.
- Mengatur **environment variables** untuk:
  - `MONGO_INITDB_ROOT_USERNAME=root`
  - `MONGO_INITDB_ROOT_PASSWORD=Secret!`
  - `MONGO_INITDB_DATABASE=UsersDB`
- Mengekspos **port 27017** sebagai **8081** agar dapat diakses dari luar.
- Menggunakan **persistent volume** agar data tetap tersimpan meskipun container dihentikan.

---

### **Dockerfile: mongodb.Dockerfile**
```dockerfile
# Menggunakan MongoDB Community Server versi 5.0.10 berbasis Ubuntu 20.04
FROM mongodb/mongodb-community-server:5.0.10-ubuntu2004

# Menetapkan environment variable untuk user root
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=Secret!
ENV MONGO_INITDB_DATABASE=UsersDB

# Membuat direktori untuk menyimpan data MongoDB secara persisten
VOLUME [ "/data/db" ]

# Mengekspos port MongoDB (27017) sebagai 8081
EXPOSE 8081

# Perintah untuk menjalankan MongoDB saat container dimulai
CMD ["mongod", "--bind_ip", "0.0.0.0"]
```

---

## **Penjelasan Setiap Perintah**
### **1. Menggunakan Base Image**
```dockerfile
FROM mongodb/mongodb-community-server:5.0.10-ubuntu2004
```
- Menggunakan **MongoDB Community Server** versi **5.0.10** berbasis **Ubuntu 20.04** sebagai **image dasar**.

---

### **2. Menetapkan Environment Variables**
```dockerfile
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=Secret!
ENV MONGO_INITDB_DATABASE=UsersDB
```
- **`MONGO_INITDB_ROOT_USERNAME`**: Username untuk **user root** (superadmin).  
- **`MONGO_INITDB_ROOT_PASSWORD`**: Password untuk user root (**Secret!**).  
- **`MONGO_INITDB_DATABASE`**: Nama **database awal** yang akan dibuat (**UsersDB**).  

> **Catatan**:  
> Variabel ini digunakan oleh **MongoDB** saat pertama kali container berjalan.  

---

### **3. Menetapkan Persistent Volume untuk Data**
```dockerfile
VOLUME [ "/data/db" ]
```
- Direktori **`/data/db`** digunakan MongoDB untuk menyimpan data.
- Dengan menggunakan **VOLUME**, data akan tetap ada meskipun container dihentikan atau dihapus.
- Baris `VOLUME[ "/data/db" ]` memungkinkan dihilangkan dan diganti/diatur saat menjalankan `docker run -v v_mongodb_data:/data/db`.

---

### **4. Mengekspos Port**
```dockerfile
EXPOSE 8081
```
- Default **MongoDB berjalan di port 27017**.
- Agar bisa diakses dari luar **container**, kita mengeksposnya sebagai **8081**.

---

### **5. Menjalankan MongoDB**
```dockerfile
CMD ["mongod", "--bind_ip", "0.0.0.0"]
```
- **`mongod`** adalah perintah untuk menjalankan MongoDB.
- **`--bind_ip 0.0.0.0`** memungkinkan akses dari luar container.

---

## **Cara Menggunakan Dockerfile ini**
1. **Bangun Image Docker**
   Pastikan masuk kedalam direktori tepat dimana file *mongodb.Dockerfile* berada.
   ```sh
   docker build -t i_mongodb:5.0.10 -f mongodb.Dockerfile .
   ```
   - `-t i_mongodb:5.0.10` &rarr; Memberi nama image `i_mongodb` dengan tag `5.0.10`.
   - `-f mongodb.Dockerfile` &rarr; Menggunakan file `mongodb.Dockerfile`.
   - `.` &rarr; Titik terakhir menunjukkan bahwa **konteks build** berasal dari rektori saat ini, sehingga semua file yang diperlukan--misal `package.json`, kode sumber dan lainnya)--harus ada didalam direktori saat ini, dagar dapat disalin ke dalam Image Docker.   

2. **Menjalankan Container MongoDB**
   ```sh
   docker run -d --rm --name c_mongodb \
     -p 8081:27017 \
     -e MONGO_INITDB_ROOT_USERNAME=root \
     -e MONGO_INITDB_ROOT_PASSWORD=Secret! \
     -e MONGO_INITDB_DATABASE=UsersDB \
     -v v_mongodb_data:/data/db \
     i_mongodb:5.0.10
   ```
   - **`-d`** &rarr; Menjalankan container di background.
   - **`--rm`** &rarr; menghapus container secara otomatis setelah container berhenti agart idak menumpk di sistem (Guest OS).
   - **`--name c_mongodb`** &rarr; Memberi nama container.
   - **`-p 8081:27017`** &rarr; Mengekspos **port 27017** sebagai **8081**.
   - **`-e`** &rarr; Menyetel environment variables.
   - **`-v v_mongodb_data:/data/db`** &rarr; Menggunakan **volume `v_mongodb_data`** agar data tetap tersimpan.

3. **Melihat Data Volume**
   ```sh
   docker volume ls
   ```

4. **Masuk ke Shell MongoDB**
   ```sh
   docker exec -it c_mongodb mongosh -u root -p Secret!
   ```

---

## **Kesimpulan**
- Dockerfile ini **menggunakan MongoDB Community Server versi 5.0.10 berbasis Ubuntu 20.04**.
- **Username root dan password diatur dengan environment variables**.
- **Database awal otomatis dibuat** dengan nama **UsersDB**.
- **Port MongoDB (27017) diekspos sebagai 8081**.
- **Menggunakan persistent volume** agar data tetap tersimpan meskipun container dihentikan.
- Cara penggunaannya cukup dengan **`docker build`**, lalu **`docker run`**.  

Dengan konfigurasi ini, **MongoDB dapat berjalan secara fleksibel di dalam container Docker tanpa kehilangan data! :rocket:**

---
## Menjalankan Container Tanpa Variable Env
---
Ya, **container MongoDB dapat dijalankan tanpa perlu memberikan parameter environment variables (`-e`) secara eksplisit**, karena **variabel tersebut sudah didefinisikan dalam `mongodb.Dockerfile`** menggunakan perintah `ENV`.

Namun, ada **beberapa hal yang perlu diperhatikan**:

### **1. Prioritas Environment Variables**
Docker akan menggunakan **environment variables dalam urutan berikut (dari tertinggi ke terendah):**
1. **`-e` pada `docker run`** &rarr; Jika variabel diatur di sini, akan **mengganti** variabel dalam `Dockerfile`.
2. **`ENV` dalam `Dockerfile`** &rarr; Digunakan sebagai **default** jika tidak ada `-e` saat `docker run`.
3. **Default bawaan aplikasi** &rarr; Jika tidak ditentukan di `Dockerfile` atau `docker run`, MongoDB akan menggunakan konfigurasi defaultnya.

---

### **2. Cara Menjalankan Tanpa `-e`**
Karena kita sudah mendefinisikan environment variables di `mongodb.Dockerfile`:
```dockerfile
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=Secret!
ENV MONGO_INITDB_DATABASE=UsersDB
```
Maka kita **bisa langsung menjalankan container MongoDB tanpa `-e`** seperti berikut:
```sh
docker run -d --name c_mongodb \
  -p 8081:27017 \
  -v v_mongodb_data:/data/db \
  my_mongodb:5.0.10
```
- **Tanpa `-e`**, MongoDB akan tetap menggunakan:
  - Username: **root**
  - Password: **Secret!**
  - Database awal: **UsersDB**

---

### **3. Konfirmasi Bahwa Environment Variables Terpakai**
Untuk memastikan bahwa variabel dari `Dockerfile` digunakan, jalankan:
```sh
docker exec -it c_mongodb env | grep MONGO
```
Outputnya akan menunjukkan bahwa variabel **MONGO_INITDB_ROOT_USERNAME**, **MONGO_INITDB_ROOT_PASSWORD**, dan **MONGO_INITDB_DATABASE** sudah terpasang di dalam container.

---

### **4. Kapan Perlu `-e` Lagi?**
Anda hanya perlu menggunakan `-e` jika:
- **Ingin mengganti nilai default** yang ada di `Dockerfile`, misalnya:
  ```sh
  docker run -d --name mongodb_custom \
    -p 8081:27017 \
    -v v_mongodb_data:/data/db \
    -e MONGO_INITDB_ROOT_USERNAME=admin \
    -e MONGO_INITDB_ROOT_PASSWORD=NewPass123 \
    -e MONGO_INITDB_DATABASE=CustomDB \
    my_mongodb:5.0.10
  ```
  &rarr; Ini akan **mengganti** username, password, dan nama database dengan yang baru.

---

### **Kesimpulan**
:white_check_mark: **Csontainer dapat dijalankan tanpa parameter `-e`**, karena environment variables sudah ditetapkan di `Dockerfile`.  
:white_check_mark: **Docker akan otomatis menggunakan nilai default** dari `ENV` jika `-e` tidak diberikan.  
:white_check_mark: **Gunakan `-e` hanya jika ingin mengganti variabel default yang ada di `Dockerfile`**.  

Jadi, Anda **bisa langsung menjalankan `docker run` tanpa `-e` dan MongoDB tetap berfungsi seperti yang diharapkan! :rocket:**