# Menggunakan image Node.js 22.14 berbasis Alpine 3.20
FROM node:22.14-alpine3.20 AS node_base

# Menetapkan direktori kerja dalam container
WORKDIR /var/www

# Menyalin file package.json dan package-lock.json (jika ada)
COPY package*.json ./

# Menginstal dependencies yang diperlukan (Express & Mongoose)
RUN npm install express mongoose --save

# --------------------------------------------
# Stage untuk Development
# --------------------------------------------
FROM base AS development

# Menginstal semua dependencies termasuk devDependencies
RUN npm install

# Instal nodemon untuk auto-restart saat pengembangan
RUN npm install -g nodemon

# Menyalin seluruh kode aplikasi ke dalam container
COPY . .

# Mengekspos port aplikasi (pada file app.js 3000) agar dapat diakses diluar container
EXPOSE 3000

# Menjalankan aplikasi dengan nodemon untuk auto-restart saat pengembangan
CMD ["nodemon", "app.js"]

# --------------------------------------------
# Stage untuk Production
# --------------------------------------------
FROM base AS production

# Hanya menginstal dependencies yang dibutuhkan di production
RUN npm install --only=production

# Menyalin seluruh kode aplikasi ke dalam container
COPY . .

# Mengekspos port aplikasi (pada file app.js 3000) agar dapat diakses diluar container
EXPOSE 3000

# Menjalankan aplikasi dengan Node.js langsung tanpa nodemon
CMD ["node", "app.js"]
