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

# Dokumentasi bahwa aplikasi berjalan di port 3000 (hanya dapat diakses melalui internal container lainnya)
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

# Dokumentasi bahwa aplikasi berjalan di port 3000 (hanya dapat diakses melalui internal container lainnya)
EXPOSE 3000

# Menjalankan aplikasi dengan Node.js langsung (tanpa nodemon)
CMD ["node", "app.js"]