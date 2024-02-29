-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Feb 2024 pada 18.53
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaandigital`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `bukuID` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahunTerbit` int(11) NOT NULL,
  `stok` int(10) NOT NULL DEFAULT 1,
  `tanggal` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`bukuID`, `judul`, `penulis`, `penerbit`, `tahunTerbit`, `stok`, `tanggal`) VALUES
(8, 'Metafora', 'prof', 'Perm', 2013, 1, '2024-02-29'),
(10, 'Biology', ' Neil A. Campbell', 'Pearson', 2022, 2, '2024-02-29'),
(11, 'Physics for Scientists and Engineers', 'Paul A. Tipler', 'W. H. Freeman', 2022, 2, '2024-02-29'),
(12, 'Economics', 'Paul A. Samuelson', 'McGraw-Hill Education', 2022, 2, '2024-02-29'),
(13, 'Political Science: An Introduction', 'Michael G. Roskin', 'Pearson', 2022, 2, '2024-02-29'),
(14, 'World History', 'McDougal Littell', 'McDougal Littell', 2022, 2, '2024-02-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `kategoriID` int(11) NOT NULL,
  `namaKategori` varchar(255) NOT NULL,
  `jumlah_buku` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategoribuku`
--

INSERT INTO `kategoribuku` (`kategoriID`, `namaKategori`, `jumlah_buku`) VALUES
(1, 'IPA', 3),
(2, 'IPS', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoribuku_relasi`
--

CREATE TABLE `kategoribuku_relasi` (
  `kategoriBukuID` int(11) NOT NULL,
  `bukuID` int(11) NOT NULL,
  `kategoriID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategoribuku_relasi`
--

INSERT INTO `kategoribuku_relasi` (`kategoriBukuID`, `bukuID`, `kategoriID`) VALUES
(10, 8, 1),
(13, 10, 1),
(14, 11, 1),
(15, 12, 2),
(16, 13, 2),
(17, 14, 2);

--
-- Trigger `kategoribuku_relasi`
--
DELIMITER $$
CREATE TRIGGER `after delete` AFTER DELETE ON `kategoribuku_relasi` FOR EACH ROW BEGIN
 UPDATE kategoribuku
    SET jumlah_buku = jumlah_buku - 1
    WHERE kategoriID = OLD.kategoriID;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after insert` AFTER INSERT ON `kategoribuku_relasi` FOR EACH ROW BEGIN
 UPDATE kategoribuku
    SET jumlah_buku = jumlah_buku + 1
    WHERE kategoriID = NEW.kategoriID;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `koleksiID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `bukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `koleksipribadi`
--

INSERT INTO `koleksipribadi` (`koleksiID`, `userID`, `bukuID`) VALUES
(9, 6, 8),
(11, 4, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `isi_log` text NOT NULL,
  `log_idUser` int(10) NOT NULL,
  `tanggal_log` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id_log`, `isi_log`, `log_idUser`, `tanggal_log`) VALUES
(1, 'user menambahkan data pengawai', 1, '2024-02-28 10:39:06'),
(2, 'user mengubah data pengawai', 1, '2024-02-28 10:48:15'),
(3, 'user menambahkan data pengawai', 1, '2024-02-28 10:51:12'),
(4, 'user menambahkan data peminjam', 1, '2024-02-28 11:00:03'),
(5, 'user mengubah data peminjam', 1, '2024-02-28 11:00:56'),
(6, 'user menambahkan data peminjam', 1, '2024-02-28 11:01:07'),
(7, 'user melakukan Log Out', 1, '2024-02-28 11:14:02'),
(8, 'user melakukan registrasi dan login', 6, '2024-02-28 11:14:28'),
(9, 'user melakukan Log Out', 6, '2024-02-28 11:14:32'),
(10, 'user melakukan Login', 6, '2024-02-28 11:14:39'),
(11, 'user melakukan Log Out', 6, '2024-02-28 11:14:41'),
(12, 'user melakukan Login', 1, '2024-02-28 11:15:03'),
(13, 'user mengubah data diri', 1, '2024-02-28 11:28:17'),
(14, 'user mengubah data diri', 1, '2024-02-28 11:28:49'),
(15, 'user mengubah data diri', 1, '2024-02-28 11:28:52'),
(16, 'user menambahkan data kategori', 1, '2024-02-28 11:55:58'),
(17, 'user menambahkan data kategori', 1, '2024-02-28 13:27:39'),
(18, 'user menambahkan data kategori', 1, '2024-02-28 13:29:43'),
(19, 'user menambahkan data kategori', 1, '2024-02-28 13:30:20'),
(20, 'user menambahkan data kategori', 1, '2024-02-28 13:37:37'),
(21, 'user mengubah data pengawai', 1, '2024-02-28 13:38:13'),
(22, 'user mengubah data kategori', 1, '2024-02-28 13:40:33'),
(23, 'user mengubah data kategori', 1, '2024-02-28 13:40:42'),
(24, 'user menambahkan data buku', 1, '2024-02-28 14:12:26'),
(25, 'user menambahkan data buku', 1, '2024-02-28 14:40:43'),
(26, 'user menambahkan data buku', 1, '2024-02-28 14:41:07'),
(27, 'user menghapus data buku', 1, '2024-02-28 14:42:29'),
(28, 'user melakukan Login', 1, '2024-02-29 00:04:47'),
(29, 'user melakukan Login', 6, '2024-02-29 01:25:41'),
(30, 'user menghapus Koleksi', 1, '2024-02-29 02:13:52'),
(31, 'user melakukan Login', 1, '2024-02-29 07:56:22'),
(32, 'user menambahkan data buku', 1, '2024-02-29 08:10:51'),
(33, 'user menambahkan data buku', 1, '2024-02-29 08:11:39'),
(34, 'user menambahkan data peminjaman', 1, '2024-02-29 08:48:30'),
(35, 'user menambahkan data peminjaman', 1, '2024-02-29 08:49:04'),
(36, 'user menambahkan data peminjaman', 1, '2024-02-29 08:49:22'),
(37, 'user menambahkan data peminjaman', 1, '2024-02-29 08:51:04'),
(38, 'user menghapus data peminjaman', 1, '2024-02-29 08:54:31'),
(39, 'user mengubah status peminjaman buku', 1, '2024-02-29 08:54:36'),
(40, 'user menambahkan data peminjaman', 1, '2024-02-29 09:02:00'),
(41, 'user menghapus data peminjaman', 1, '2024-02-29 09:02:04'),
(42, 'user menambahkan data peminjaman', 1, '2024-02-29 09:06:49'),
(43, 'user melakukan Log Out', 1, '2024-02-29 09:16:05'),
(44, 'user melakukan Login', 6, '2024-02-29 09:16:48'),
(45, 'user menambahkan Koleksi', 6, '2024-02-29 09:18:30'),
(46, 'user menambahkan Koleksi', 6, '2024-02-29 09:19:07'),
(47, 'user menambahkan Koleksi', 6, '2024-02-29 09:19:50'),
(48, 'user menghapus Koleksi', 6, '2024-02-29 09:19:55'),
(49, 'user melakukan Log Out', 6, '2024-02-29 09:43:34'),
(50, 'user melakukan Login', 1, '2024-02-29 10:01:12'),
(51, 'user menambahkan data buku', 1, '2024-02-29 10:21:05'),
(52, 'user menambahkan data buku', 1, '2024-02-29 10:21:17'),
(53, 'user menambahkan data buku', 1, '2024-02-29 10:21:33'),
(54, 'user menambahkan data buku', 1, '2024-02-29 10:21:54'),
(55, 'user menambahkan data peminjaman', 1, '2024-02-29 11:03:22'),
(56, 'user mengubah status peminjaman buku', 1, '2024-02-29 11:03:30'),
(57, 'user menambahkan data buku', 1, '2024-02-29 11:12:46'),
(58, 'user menambahkan data peminjaman', 1, '2024-02-29 11:24:02'),
(59, 'user menambahkan data peminjaman', 1, '2024-02-29 11:24:09'),
(60, 'user menambahkan data peminjaman', 1, '2024-02-29 11:24:19'),
(61, 'user melakukan Log Out', 1, '2024-02-29 11:25:34'),
(62, 'user melakukan Login', 6, '2024-02-29 11:25:41'),
(63, 'user melakukan Log Out', 6, '2024-02-29 11:25:57'),
(64, 'user melakukan Login', 1, '2024-02-29 11:26:02'),
(65, 'user menambahkan data peminjam', 1, '2024-02-29 11:26:32'),
(66, 'user melakukan Log Out', 1, '2024-02-29 11:26:37'),
(67, 'user melakukan Login', 7, '2024-02-29 11:26:46'),
(68, 'user melakukan Login', 1, '2024-02-29 20:34:06'),
(69, 'user melakukan Log Out', 1, '2024-02-29 20:36:49'),
(70, 'user melakukan Login', 1, '2024-02-29 20:39:28'),
(71, 'user melakukan Log Out', 1, '2024-02-29 20:40:26'),
(72, 'user melakukan Login', 1, '2024-02-29 20:40:30'),
(73, 'user mengubah data pengawai', 1, '2024-02-29 20:41:54'),
(74, 'user melakukan Log Out', 1, '2024-02-29 21:08:33'),
(75, 'user melakukan Login', 4, '2024-02-29 21:08:58'),
(76, 'user menambahkan Koleksi', 4, '2024-02-29 21:09:26'),
(77, 'user menghapus Koleksi', 4, '2024-02-29 21:09:40'),
(78, 'user menambahkan Koleksi', 4, '2024-02-29 21:10:13'),
(79, 'user menghapus Koleksi', 4, '2024-02-29 21:10:16'),
(80, 'user menghapus Koleksi', 4, '2024-02-29 21:10:19'),
(81, 'user menghapus Koleksi', 4, '2024-02-29 21:10:26'),
(82, 'user menambahkan Koleksi', 4, '2024-02-29 21:10:32'),
(83, 'user menghapus Koleksi', 4, '2024-02-29 21:10:50'),
(84, 'user menghapus Koleksi', 4, '2024-02-29 21:10:53'),
(85, 'user menghapus Koleksi', 4, '2024-02-29 21:13:24'),
(86, 'user menghapus Koleksi', 4, '2024-02-29 21:21:10'),
(87, 'user menghapus Koleksi', 4, '2024-02-29 22:27:36'),
(88, 'user menghapus Koleksi', 4, '2024-02-29 22:27:42'),
(89, 'user menghapus Koleksi', 4, '2024-02-29 22:27:48'),
(90, 'user menambahkan Koleksi', 4, '2024-02-29 22:33:00'),
(91, 'user menghapus Koleksi', 4, '2024-02-29 22:33:01'),
(92, 'user menghapus Koleksi', 4, '2024-02-29 22:33:03'),
(93, 'user menghapus Koleksi', 4, '2024-02-29 22:33:05'),
(94, 'user menghapus Koleksi', 4, '2024-02-29 22:33:07'),
(95, 'user menghapus Koleksi', 4, '2024-02-29 22:33:12'),
(96, 'user menghapus Koleksi', 4, '2024-02-29 22:33:16'),
(97, 'user menambahkan Koleksi', 4, '2024-02-29 22:33:30'),
(98, 'user menghapus Koleksi', 4, '2024-02-29 22:33:35'),
(99, 'user melakukan Log Out', 4, '2024-02-29 22:33:48'),
(100, 'user melakukan Login', 1, '2024-02-29 22:33:54'),
(101, 'user melakukan Log Out', 1, '2024-02-29 22:34:30'),
(102, 'user melakukan Login', 3, '2024-02-29 22:34:34'),
(103, 'user melakukan Log Out', 3, '2024-02-29 22:37:16'),
(104, 'user melakukan Login', 1, '2024-02-29 22:37:20'),
(105, 'user melakukan reset password pada pengawai', 1, '2024-02-29 22:37:57'),
(106, 'user menambahkan data buku', 1, '2024-02-29 22:39:38'),
(107, 'user menghapus data buku', 1, '2024-02-29 22:39:47'),
(108, 'user melakukan Log Out', 1, '2024-02-29 22:40:31'),
(109, 'user melakukan Login', 6, '2024-02-29 22:40:39'),
(110, 'user menambahkan Koleksi', 6, '2024-02-29 22:40:57'),
(111, 'user menghapus Koleksi', 6, '2024-02-29 22:41:20'),
(112, 'user menambahkan Koleksi', 6, '2024-02-29 22:47:22'),
(113, 'user melakukan Log Out', 6, '2024-02-29 22:47:45'),
(114, 'user melakukan Login', 4, '2024-02-29 22:47:50'),
(115, 'user menambahkan Koleksi', 4, '2024-02-29 22:48:20'),
(116, 'user menghapus Koleksi', 4, '2024-02-29 22:48:41'),
(117, 'user melakukan Log Out', 4, '2024-02-29 22:48:49'),
(118, 'user melakukan Login', 6, '2024-02-29 22:49:14'),
(119, 'user melakukan Log Out', 6, '2024-02-29 22:49:30'),
(120, 'user melakukan Login', 4, '2024-02-29 22:49:35'),
(121, 'user menambahkan Koleksi', 4, '2024-02-29 22:51:52'),
(122, 'user melakukan Log Out', 4, '2024-02-29 22:56:34'),
(123, 'user melakukan Login', 3, '2024-02-29 22:57:17'),
(124, 'user menambahkan data peminjaman', 3, '2024-02-29 22:57:35'),
(125, 'user melakukan Log Out', 3, '2024-02-29 23:00:04'),
(126, 'user melakukan Login', 1, '2024-02-29 23:00:08'),
(127, 'user menambahkan data buku', 1, '2024-02-29 23:01:08'),
(128, 'user menghapus data buku', 1, '2024-02-29 23:01:27'),
(129, 'user menghapus data buku', 1, '2024-02-29 23:01:29'),
(130, 'user menghapus data buku', 1, '2024-02-29 23:01:31'),
(131, 'user menghapus data buku', 1, '2024-02-29 23:02:37'),
(132, 'user menghapus data buku', 1, '2024-02-29 23:02:39'),
(133, 'user menghapus data buku', 1, '2024-02-29 23:02:41'),
(134, 'user menambahkan data buku', 1, '2024-02-29 23:04:26'),
(135, 'user menambahkan data buku', 1, '2024-02-29 23:05:07'),
(136, 'user menambahkan data buku', 1, '2024-02-29 23:05:50'),
(137, 'user menambahkan data buku', 1, '2024-02-29 23:06:23'),
(138, 'user menambahkan data buku', 1, '2024-02-29 23:06:50'),
(139, 'user mengubah data peminjam', 1, '2024-02-29 23:08:06'),
(140, 'user menambahkan data peminjaman', 1, '2024-02-29 23:09:38'),
(141, 'user menambahkan data peminjaman', 1, '2024-02-29 23:10:32'),
(142, 'user mengubah status peminjaman buku', 1, '2024-02-29 23:10:50'),
(143, 'user mengubah status peminjaman buku', 1, '2024-02-29 23:11:00'),
(144, 'user melakukan Log Out', 1, '2024-02-29 23:22:54'),
(145, 'user melakukan Login', 1, '2024-02-29 23:40:19'),
(146, 'user melakukan Log Out', 1, '2024-02-29 23:42:45'),
(147, 'user melakukan Login', 1, '2024-03-01 00:13:00'),
(148, 'user melakukan Log Out', 1, '2024-03-01 00:19:15'),
(149, 'user melakukan Login', 1, '2024-03-01 00:19:19'),
(150, 'user menambahkan data buku', 1, '2024-03-01 00:51:46'),
(151, 'user menambahkan data peminjaman', 1, '2024-03-01 00:52:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `peminjamanID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `bukuID_peminjaman` int(11) NOT NULL,
  `tanggalPeminjaman` date NOT NULL DEFAULT current_timestamp(),
  `tanggalPengembalian` date NOT NULL,
  `statusPeminjaman` varchar(50) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`peminjamanID`, `userID`, `bukuID_peminjaman`, `tanggalPeminjaman`, `tanggalPengembalian`, `statusPeminjaman`) VALUES
(1, 1, 1, '2024-02-29', '2024-03-02', '2'),
(4, 6, 1, '2024-02-29', '2024-03-01', '2'),
(5, 6, 9, '2024-02-29', '2024-03-01', '1'),
(6, 6, 9, '2024-02-29', '2024-03-01', '1'),
(7, 6, 9, '2024-02-29', '2024-03-01', '1'),
(8, 0, 0, '2024-02-29', '0000-00-00', '1'),
(9, 7, 14, '2024-02-29', '2024-03-03', '2'),
(10, 4, 14, '2024-02-29', '2024-03-02', '2'),
(11, 7, 8, '2024-03-01', '2024-03-03', '1');

--
-- Trigger `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `after delete peminjaman` AFTER DELETE ON `peminjaman` FOR EACH ROW BEGIN
    IF OLD.statusPeminjaman = 1 THEN
        UPDATE buku
        SET stok = stok + 1
        WHERE bukuID = OLD.bukuID_peminjaman;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after insert peminjaman` AFTER INSERT ON `peminjaman` FOR EACH ROW BEGIN
    UPDATE buku
    SET stok = stok - 1
    WHERE bukuID = NEW.bukuID_peminjaman;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after update peminjaman` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    IF NEW.statusPeminjaman = 2 THEN
        UPDATE buku
        SET stok = stok + 1
        WHERE bukuID = NEW.bukuID_peminjaman;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `ulasanID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `bukuID` int(11) NOT NULL,
  `ulasan` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ulasanbuku`
--

INSERT INTO `ulasanbuku` (`ulasanID`, `userID`, `bukuID`, `ulasan`, `rating`, `tanggal`) VALUES
(1, 1, 1, 'tes2', 3, '2024-02-29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin','petugas','peminjam') NOT NULL,
  `email` varchar(255) NOT NULL,
  `namaLengkap` text NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`, `email`, `namaLengkap`, `alamat`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'admin@gmail.com', 'Michelle', 'Jakarta'),
(3, 'oline', '99878776f5b0281a68fa8a9d0bf96a0e', 'petugas', 'oline@gmail.com', 'Oline', 'seoul'),
(4, 'jonathan', '202cb962ac59075b964b07152d234b70', 'peminjam', 'jojo@gmail.com', 'jonathan', 'kalimantan tenggara'),
(6, 'Jelvino', '202cb962ac59075b964b07152d234b70', 'peminjam', 'jel@gmail.com', 'jelvino', 'Bukit Cina'),
(7, 'mike', '202cb962ac59075b964b07152d234b70', 'peminjam', 'mike@gmail.com', 'Mike', 'kalimantan tenggara');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`bukuID`);

--
-- Indeks untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Indeks untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  ADD PRIMARY KEY (`kategoriBukuID`);

--
-- Indeks untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`koleksiID`);

--
-- Indeks untuk tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`peminjamanID`);

--
-- Indeks untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`ulasanID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `nama unik` (`namaLengkap`) USING HASH;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `bukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kategoribuku_relasi`
--
ALTER TABLE `kategoribuku_relasi`
  MODIFY `kategoriBukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `koleksiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `peminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `ulasanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
