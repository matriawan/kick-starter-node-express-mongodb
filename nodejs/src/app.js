const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

// Routing dasar menampilkan pesan 'Hello World!'
app.get('/', (req, res) => {
   res.send('Hello Worldss!');
});

// Menjalankan server
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});