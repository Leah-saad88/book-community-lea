const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json()); 


const db = mysql.createConnection({
  host: "localhost",
  user: "root",      
  password: "",      
  database: "bookstore",
});


db.connect((err) => {
  if (err) {
    console.error("DB connection failed:", err);
  } else {
    console.log("Connected to bookstore database ✅");
  }
});


app.post("/signup", (req, res) => {
  const { name, email, password, address } = req.body;

  if (!name || !email || !password || !address) {
    return res.status(400).json({ message: "Missing fields" });
  }

  db.query("SELECT * FROM users WHERE email = ?", [email], (err, results) => {
    if (err) return res.status(500).json({ message: err });

    if (results.length > 0) {
      return res.status(400).json({ message: "Email already registered" });
    }

    
    db.query(
      "INSERT INTO users (name, email, password, address, favorites) VALUES (?, ?, ?, ?, ?)",
      [name, email, password, address, JSON.stringify([])],
      (err2) => {
        if (err2) return res.status(500).json({ message: err2 });
        return res.json({ message: "Signup successful! Please login." });
      }
    );
  });
});


app.post("/login", (req, res) => {
  const { email, password, name, address, favorites } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "Missing email or password" });
  }

  
  db.query("SELECT * FROM users WHERE email = ?", [email], (err, results) => {
    if (err) return res.status(500).json({ message: err });

    if (results.length === 0) {
      return res.status(400).json({ message: "User not found. Please sign up." });
    }

    const user = results[0];

    if (user.password !== password) {
      return res.status(400).json({ message: "Incorrect password" });
    }

    if (name && address && favorites) {
      db.query(
        "UPDATE users SET name = ?, address = ?, favorites = ? WHERE email = ?",
        [name, address, JSON.stringify(favorites), email],
        (err2) => {
          if (err2) return res.status(500).json({ message: err2 });

          return res.json({ message: "Login & order successful! Your order will be shipped in 2 days ✅" });
        }
      );
    } else {
      return res.json({ message: "Login successful!" });
    }
  });
});


const PORT = 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT} ✅`));