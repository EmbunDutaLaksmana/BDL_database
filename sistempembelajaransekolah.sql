-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Bulan Mei 2021 pada 14.44
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
-- Database: `sistempembelajaransekolah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `NIP` tinyint(20) NOT NULL,
  `Nama` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `daerah_asal` varchar(255) DEFAULT NULL,
  `kode_wali_fk` tinyint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru_siswa`
--

CREATE TABLE `guru_siswa` (
  `NIP_fk` tinyint(20) DEFAULT NULL,
  `NIS_fk` tinyint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` tinyint(20) DEFAULT NULL,
  `nama_kelas` varchar(255) DEFAULT NULL,
  `jumlah_siswa` tinyint(50) DEFAULT NULL,
  `status_kelas` enum('sementara','asli') DEFAULT NULL,
  `wali_kelas_pemegang` varchar(255) DEFAULT NULL,
  `kode_wali_fk` tinyint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `NIS` tinyint(20) NOT NULL,
  `nama_siswa` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `daerah_asal` varchar(255) DEFAULT NULL,
  `kode_kelas_fk` tinyint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `kode_wali` tinyint(20) NOT NULL,
  `nama_wali_kelas` varchar(255) DEFAULT NULL,
  `status_wali_kelas` enum('sementara','asli') DEFAULT NULL,
  `kelas_yang_dipegang` varchar(255) DEFAULT NULL,
  `kode_kelas_fk` tinyint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`NIP`),
  ADD UNIQUE KEY `kode_wali_fk` (`kode_wali_fk`);

--
-- Indeks untuk tabel `guru_siswa`
--
ALTER TABLE `guru_siswa`
  ADD KEY `NIP_fk` (`NIP_fk`),
  ADD KEY `NIS_fk` (`NIS_fk`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD UNIQUE KEY `kode_wali_fk` (`kode_wali_fk`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`),
  ADD UNIQUE KEY `kode_kelas_fk` (`kode_kelas_fk`);

--
-- Indeks untuk tabel `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`kode_wali`),
  ADD UNIQUE KEY `kode_kelas_fk` (`kode_kelas_fk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `kode_wali_fk` FOREIGN KEY (`kode_wali_fk`) REFERENCES `wali_kelas` (`kode_wali`);

--
-- Ketidakleluasaan untuk tabel `guru_siswa`
--
ALTER TABLE `guru_siswa`
  ADD CONSTRAINT `NIP_fk` FOREIGN KEY (`NIP_fk`) REFERENCES `guru` (`NIP`),
  ADD CONSTRAINT `NIS_fk` FOREIGN KEY (`NIS_fk`) REFERENCES `siswa` (`NIS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
