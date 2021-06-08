-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Bulan Mei 2021 pada 14.45
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databasekoperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `chartjeniskelamin2018`
--

CREATE TABLE `chartjeniskelamin2018` (
  `Kecamatan` varchar(11) NOT NULL,
  `Pria` int(11) NOT NULL,
  `Wanita` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `chartjeniskelamin2018`
--

INSERT INTO `chartjeniskelamin2018` (`Kecamatan`, `Pria`, `Wanita`, `Jumlah`) VALUES
('Wonogiri', 19, 11, 30),
('singedes', 11, 12, 23),
('ribon', 13, 11, 14),
('siak', 19, 10, 29);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
