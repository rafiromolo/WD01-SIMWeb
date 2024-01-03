-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2023 at 09:21 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_purnamajaya`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin1', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `etalase`
--

CREATE TABLE `etalase` (
  `id` int(50) NOT NULL,
  `barang` varchar(255) NOT NULL,
  `stok` int(50) NOT NULL,
  `harga` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `etalase`
--

INSERT INTO `etalase` (`id`, `barang`, `stok`, `harga`) VALUES
(1, 'Meja Belajar Kayu Kecil', 3, 100000),
(2, 'Lemari Baju Anak Kayu', 5, 350000),
(3, 'Kursi Belajar Kayu Kecil', 8, 45000),
(4, 'Meja Belajar Kayu Lesehan', 1, 85000),
(5, 'Meja Belajar Kayu Besar', 3, 500000),
(6, 'Lemari Baju Dewasa Kayu', 13, 230000),
(7, 'Kursi Belajar Kayu Sedang', 6, 90000),
(8, 'Meja Belajar Kayu Lipat', 10, 30000),
(9, 'Rak Plastik Kecil', 15, 25000),
(10, 'Lemari Baju Plastik Anak', 15, 70000),
(11, 'Kursi Kantor Tipe A', 14, 750000),
(12, 'Meja Kantor Kayu', 7, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(50) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `barang` varchar(255) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `harga` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `tanggal`, `barang`, `keperluan`, `jumlah`, `harga`) VALUES
(1, '05-12-2023', 'Batang Kayu Jati', 'Re-stock raw material', 8, 2000000),
(3, '10-12-2023', 'Paku Kecil', 'Re-stock raw material', 60, 1000),
(5, '21-12-2023', 'Etalase', 'Inventaris', 1, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(50) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `barang` varchar(255) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `harga` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `tanggal`, `barang`, `jumlah`, `harga`) VALUES
(1, '30-11-2023', 'Meja Belajar Kayu Kecil Lesehan', 2, 200000),
(2, '30-11-2023', 'Kursi Belajar Kayu Kecil', 1, 45000),
(5, '01-12-2023', 'Lemari Baju Anak Kayu', 1, 950000),
(6, '02-12-2023', 'Kursi Belajar Kayu Kecil', 2, 45000);

-- --------------------------------------------------------

--
-- Table structure for table `produksi`
--

CREATE TABLE `produksi` (
  `id` int(50) NOT NULL,
  `produk` varchar(255) NOT NULL,
  `bahan` varchar(255) NOT NULL,
  `kayu` int(50) NOT NULL,
  `paku` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produksi`
--

INSERT INTO `produksi` (`id`, `produk`, `bahan`, `kayu`, `paku`) VALUES
(1, 'Meja Belajar Kayu Kecil', '10 Batang Kayu dan 16 Paku', 10, 16),
(2, 'Lemari Baju Anak Kayu', '21 Batang Kayu dan 35 Paku', 21, 35),
(3, 'Kursi Belajar Kayu Kecil', '', 0, 0),
(4, 'Meja Belajar Kayu Lesehan', '', 0, 0),
(5, 'Meja Belajar Kayu Besar', '', 0, 0),
(6, 'Lemari Baju Dewasa Kayu', '', 0, 0),
(7, 'Kursi Belajar Kayu Sedang', '', 0, 0),
(8, 'Meja Belajar Kayu Lipat', '', 0, 0),
(9, 'Rak Plastik Kecil', '', 0, 0),
(10, 'Lemari Baju Plastik Anak', '', 0, 0),
(11, 'Kursi Kantor Tipe A', '', 0, 0),
(12, 'Meja Kantor Kayu', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'user1', 'purnamajaya');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etalase`
--
ALTER TABLE `etalase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `etalase`
--
ALTER TABLE `etalase`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `produksi`
--
ALTER TABLE `produksi`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
