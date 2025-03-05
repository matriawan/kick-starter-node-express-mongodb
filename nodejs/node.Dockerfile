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