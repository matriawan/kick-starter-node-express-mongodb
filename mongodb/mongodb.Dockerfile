# Menggunakan MongoDB Community Server versi 5.0.10 berbasis Ubuntu 20.04
FROM mongodb/mongodb-community-server:5.0.10-ubuntu2004

# Menetapkan environment variable untuk user root
ENV MONGO_INITDB_ROOT_USERNAME=root
ENV MONGO_INITDB_ROOT_PASSWORD=Secret!
ENV MONGO_INITDB_DATABASE=UsersDB

# Dokumentasi bahwa aplikasi berjalan di port 27017
EXPOSE 27017

# Perintah untuk menjalankan MongoDB saat container dimulai
CMD ["mongod", "--bind_ip", "0.0.0.0"]