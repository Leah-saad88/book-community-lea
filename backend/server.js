const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json()); 


const db = mysql.createConnection({
  host: "localhost",
  user: "root",     // your DB user
  password: "",     // your DB password
  database: "bookstore"
});

db.connect((err) => {
  if (err) throw err;
  console.log("Connected to MySQL database bookstore!");
});

// Signup route
app.post("/signup", (req, res) => {
  const { name, email, password, address, zip } = req.body;

  if (!name || !email || !password || !address || !zip) {
    return res.status(400).json({ message: "All fields are required!" });
  }

  const checkQuery = "SELECT * FROM users WHERE email = ?";
  db.query(checkQuery, [email], (err, result) => {
    if (err) return res.status(500).json(err);
    if (result.length > 0) return res.status(400).json({ message: "User already exists!" });

    const insertQuery = "INSERT INTO users (name, email, password, address, zip) VALUES (?, ?, ?, ?, ?)";
    db.query(insertQuery, [name, email, password, address, zip], (err2, result2) => {
      if (err2) return res.status(500).json(err2);

      res.status(200).json({ message: "Signup successful! Order placed. Shipment in 2 days." });
    });
  });
});

// Login route
app.post("/login", (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) return res.status(400).json({ message: "Email and password are required!" });

  const query = "SELECT * FROM users WHERE email = ? AND password = ?";
  db.query(query, [email, password], (err, result) => {
    if (err) return res.status(500).json(err);
    if (result.length === 0) return res.status(400).json({ message: "Invalid credentials!" });

    res.status(200).json({ message: "Login successful! Order placed. Shipment in 2 days.", user: result[0] });
  });
});

// Start server
app.listen(5000, () => {
  console.log("Server running on port 5000");
});