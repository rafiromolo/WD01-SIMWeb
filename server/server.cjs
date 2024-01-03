const express = require("express");
const mysql = require("mysql");
const cors = require("cors");

const app = express();

app.use(express.json());
app.use(cors());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "db_purnamajaya",
});

app.get("/", (req, res) => {
  res.json("Hello there!");
});

// Server query untuk login admin
app.post("/login/admin", (req, res) => {
  const sql = "SELECT * FROM admin WHERE `username` = ? AND `password` = ?";
  db.query(sql, [req.body.username, req.body.password], (err, data) => {
    if (err) {
      return res.json("Error");
    }
    if (data.length > 0) {
      return res.json("Success");
    } else {
      return res.json("Failed");
    }
  });
});

// Server query untuk login user
app.post("/login/user", (req, res) => {
  const sql = "SELECT * FROM users WHERE `username` = ? AND `password` = ?";
  db.query(sql, [req.body.username, req.body.password], (err, data) => {
    if (err) {
      return res.json("Error");
    }
    if (data.length > 0) {
      return res.json("Success");
    } else {
      return res.json("Failed");
    }
  });
});

// Server query untuk tabel penjualan
app.get("/penjualan", (req, res) => {
  const sql =
    "SELECT `id`, `tanggal`, `barang`, `jumlah`, `harga`, `jumlah`*`harga` AS `total_harga` FROM penjualan ORDER BY id DESC";
  db.query(sql, (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.get("/pemasukanpenjualan", (req, res) => {
  const sql = "SELECT sum(`harga`) AS total_pendapatan FROM penjualan";
  db.query(sql, (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.post("/penjualan/tambahdata", (req, res) => {
  const sql =
    "INSERT INTO penjualan (`tanggal`, `barang`, `jumlah`, `harga`) VALUES (?)";
  const values = [
    req.body.tanggal,
    req.body.barang,
    req.body.jumlah,
    req.body.harga,
  ];
  db.query(sql, [values], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.put("/penjualan/ubah/:id", (req, res) => {
  const sql =
    "UPDATE penjualan SET `tanggal` = ?, `barang` = ?, `jumlah` = ?, `harga` = ? WHERE `id` = ?";
  const values = [
    req.body.tanggal,
    req.body.barang,
    req.body.jumlah,
    req.body.harga,
  ];
  const id = req.params.id;

  db.query(sql, [...values, id], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.delete("/penjualan/:id", (req, res) => {
  const sql = "DELETE FROM penjualan WHERE `id` = ?";
  const id = req.params.id;

  db.query(sql, [id], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

// Server query untuk tabel pembelian
app.get("/pembelian", (req, res) => {
  const sql =
    "SELECT `id`, `tanggal`, `barang`, `keperluan`, `jumlah`, `harga`, `jumlah`*`harga` AS `total_harga` FROM pembelian ORDER BY id DESC";
  db.query(sql, (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.post("/pembelian/tambahdata", (req, res) => {
  const sql =
    "INSERT INTO pembelian (`tanggal`, `barang`, `keperluan`, `jumlah`, `harga`) VALUES (?)";
  const values = [
    req.body.tanggal,
    req.body.barang,
    req.body.keperluan,
    req.body.jumlah,
    req.body.harga,
  ];
  db.query(sql, [values], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.put("/pembelian/ubah/:id", (req, res) => {
  const sql =
    "UPDATE pembelian SET `tanggal` = ?, `barang` = ?, `keperluan` = ?, `jumlah` = ?, `harga` = ? WHERE `id` = ?";
  const values = [
    req.body.tanggal,
    req.body.barang,
    req.body.keperluan,
    req.body.jumlah,
    req.body.harga,
  ];
  const id = req.params.id;

  db.query(sql, [...values, id], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.delete("/pembelian/:id", (req, res) => {
  const sql = "DELETE FROM pembelian WHERE `id` = ?";
  const id = req.params.id;

  db.query(sql, [id], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

// Server query untuk produksi
app.get("/produksi", (req, res) => {
  const sql = "SELECT * FROM produksi";
  db.query(sql, (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.get("/produksi/:id", (req, res) => {
  const sql = "SELECT * FROM produksi WHERE `id` = ?";
  const id = req.params.id;
  db.query(sql, [id], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.put("/produksi/post/:id", (req, res) => {
  const sql = "UPDATE etalase SET `stok` = `stok` + 1 WHERE `id` = ?";
  const values = [];
  const id = req.params.id;
  db.query(sql, [...values, id], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

// Server query untuk raw material
app.get("/rawmaterial", (req, res) => {
  const sql =
    "SELECT `barang`, sum(`jumlah`) AS `jumlahBarang` FROM pembelian WHERE `keperluan` = 'Re-stock raw material' GROUP BY `barang`";
  db.query(sql, (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.get("/stokbarang", (req, res) => {
  const sql = "SELECT * FROM etalase";
  db.query(sql, (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

// Server query untuk tabel etalase
app.get("/beli", (req, res) => {
  const sql = "SELECT * FROM etalase";
  db.query(sql, (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

app.put("/beli/:id", (req, res) => {
  const sql = "UPDATE etalase SET `stok` = `stok` - ? WHERE `id` = ?";
  const values = [req.body.jumlah];
  const id = req.params.id;
  db.query(sql, [...values, id], (err, data) => {
    if (err) return res.json("Error");
    return res.json(data);
  });
});

// app.put("/beli/:id", (req, res) => {
//   const sql =
//     "INSERT INTO penjualan (`tanggal`, `barang`, `jumlah`, `harga`) VALUES (?)";
//   const values = [];
//   const id = req.params.id;
//   db.query(sql, [...values, id], (err, data) => {
//     if (err) return res.json("Error");
//     return res.json(data);
//   });
// });

app.listen(8081, () => {
  console.log("Server is running!");
});
