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