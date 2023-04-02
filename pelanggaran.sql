-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Apr 2023 pada 09.50
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pelanggaran`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `joinpelanggar`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `joinpelanggar` (
`id` int(11)
,`tanggal` datetime
,`foto` varchar(100)
,`nis` int(9)
,`siswa` varchar(100)
,`id_jurusan` int(11)
,`jurusan` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(11) NOT NULL,
  `jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id`, `jurusan`) VALUES
(18, 'PPLG'),
(19, 'DKV'),
(20, 'TSM'),
(21, 'TBSM'),
(22, 'RPL'),
(23, 'TOI'),
(24, 'TKJ'),
(25, 'TJKT');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `p`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `p` (
`id` int(11)
,`tanggal` datetime
,`id_pelanggar` int(1)
,`id_pelanggaran` int(1)
,`kelas` varchar(3)
,`pelanggaran` varchar(100)
,`siswa` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggar`
--

CREATE TABLE `pelanggar` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `nis` int(9) NOT NULL,
  `siswa` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggar`
--

INSERT INTO `pelanggar` (`id`, `tanggal`, `nis`, `siswa`, `foto`, `id_jurusan`) VALUES
(9, '2023-03-18 00:00:00', 1232435, 'Rossa nr', 'WIN_20220720_17_45_15_Pro.jpg', 18),
(10, '2023-03-18 06:42:46', 20210223, 'Raysa sa', 'cornelis-megawati-konsisten-pertahankan-ideologi-negara-LQnjFJNM117.jpg', 22);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` int(11) NOT NULL,
  `pelanggaran` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggaran`
--

INSERT INTO `pelanggaran` (`id`, `pelanggaran`) VALUES
(1, 'Datang terlambat'),
(2, 'Memakai sendal'),
(4, 'Atribut tidak lengkap'),
(5, 'Memakai Jaket/Sweater');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran_siswa`
--

CREATE TABLE `pelanggaran_siswa` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `id_pelanggar` int(1) NOT NULL,
  `id_pelanggaran` int(1) NOT NULL,
  `kelas` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggaran_siswa`
--

INSERT INTO `pelanggaran_siswa` (`id`, `tanggal`, `id_pelanggar`, `id_pelanggaran`, `kelas`) VALUES
(4, '2023-03-18 11:28:44', 9, 1, 'X'),
(5, '2023-03-18 12:31:47', 9, 4, 'XI'),
(6, '2023-03-18 12:32:49', 9, 2, 'XI'),
(7, '2023-03-18 13:50:28', 10, 4, 'XII'),
(8, '2023-04-02 10:18:46', 10, 1, 'XI'),
(9, '2023-04-02 10:27:06', 10, 1, 'X');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'GURU', 'SMKN4BISA'),
(2, 'OSIS', 'SMKN4BISA');

-- --------------------------------------------------------

--
-- Struktur untuk view `joinpelanggar`
--
DROP TABLE IF EXISTS `joinpelanggar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `joinpelanggar`  AS SELECT `a`.`id` AS `id`, `a`.`tanggal` AS `tanggal`, `a`.`foto` AS `foto`, `a`.`nis` AS `nis`, `a`.`siswa` AS `siswa`, `a`.`id_jurusan` AS `id_jurusan`, `b`.`jurusan` AS `jurusan` FROM (`pelanggar` `a` join `jurusan` `b` on(`a`.`id_jurusan` = `b`.`id`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `p`
--
DROP TABLE IF EXISTS `p`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `p`  AS SELECT `a`.`id` AS `id`, `a`.`tanggal` AS `tanggal`, `a`.`id_pelanggar` AS `id_pelanggar`, `a`.`id_pelanggaran` AS `id_pelanggaran`, `a`.`kelas` AS `kelas`, `b`.`pelanggaran` AS `pelanggaran`, `c`.`siswa` AS `siswa` FROM ((`pelanggaran_siswa` `a` join `pelanggaran` `b` on(`a`.`id_pelanggaran` = `b`.`id`)) join `pelanggar` `c` on(`a`.`id_pelanggar` = `c`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggar`
--
ALTER TABLE `pelanggar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggaran_siswa`
--
ALTER TABLE `pelanggaran_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `pelanggar`
--
ALTER TABLE `pelanggar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pelanggaran_siswa`
--
ALTER TABLE `pelanggaran_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
