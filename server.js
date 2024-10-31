const express = require("express");
const path = require("path");

const app = express();

// Servir les fichiers statiques depuis le répertoire public
app.use(express.static(path.join(__dirname)));

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname,  "principal.html"));
});

// Nouvelle route pour servir login.html
app.get("/Connecte", (req, res) => {
    res.sendFile(path.join(__dirname,  "Connecte.html"));
});

// Nouvelle route pour servir dashboard.html
app.get("/dashboard", (req, res) => {
    res.sendFile(path.join(__dirname,  "dashboard.html"));
});

const server = app.listen(8080, () => {
    console.log(`Server is running on port ${server.address().port}`);
});

