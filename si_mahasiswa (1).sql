-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2026 at 12:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(10) UNSIGNED NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Ekonomi', 'Ekonomi', '2025-10-16 10:28:59', '2025-10-16 10:28:51'),
(2, 'Teknik Informatika', 'Teknik Informatika', '2025-10-16 10:29:37', '2025-10-16 10:31:42'),
(3, 'Sistem Informasi', 'Sistem Informasi', '2025-10-16 10:30:39', '2025-10-16 10:31:42'),
(4, 'Ilmu Kedokteran', 'Ilmu Kedokteran', '2025-10-16 10:30:39', '2025-10-16 10:31:42'),
(5, 'Ilmu Komputer', 'Ilmu Komputer', '2025-10-16 10:30:39', '2025-10-16 10:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id_krs` bigint(20) UNSIGNED NOT NULL,
  `nim` varchar(16) NOT NULL,
  `kode_mk` varchar(16) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `tahun` year(4) NOT NULL,
  `status` enum('terdaftar','ditarik','selesai') DEFAULT 'terdaftar',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id_krs`, `nim`, `kode_mk`, `semester`, `tahun`, `status`, `created_at`, `updated_at`) VALUES
(1, '2310010343', 'mk1', '1', '2025', 'terdaftar', '2025-10-16 11:22:57', '2025-10-16 11:22:35'),
(2, '2310010273', 'mk2', '1', '2025', 'terdaftar', '2025-10-16 11:36:19', '2025-10-16 11:35:40'),
(3, '2310010317', 'mk4', '1', '2025', 'terdaftar', '2025-10-16 11:36:19', '2025-10-16 11:35:40'),
(4, '2310010073', 'mk5', '1', '2025', 'terdaftar', '2025-10-16 11:36:49', '2025-10-16 11:36:26'),
(5, '2310010630', 'mk1', '1', '2025', 'terdaftar', '2025-10-16 11:37:11', '2025-10-16 11:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` varchar(16) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL COMMENT 'L = Laki-laki, P = Perempuan',
  `tgl_lahir` date DEFAULT NULL,
  `id_jurusan` int(10) UNSIGNED DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telepon` varchar(30) DEFAULT NULL,
  `angkatan` year(4) DEFAULT NULL,
  `foto_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jenis_kelamin`, `tgl_lahir`, `id_jurusan`, `alamat`, `email`, `telepon`, `angkatan`, `foto_path`, `created_at`, `updated_at`) VALUES
('2310010073', 'Ahmad Aditia Hariyadi', 'Laki-laki', '2005-01-13', 2, 'jl pelamboyan', 'adit@gmail.com', '083245', '2025', NULL, '2025-10-16 11:27:49', '2025-10-16 10:33:38'),
('2310010273', 'Muhammad Nofan Firdaus', 'Laki-laki', '2004-11-18', 2, 'Jl alalak', 'nofan@gmail.com', '0822', '2025', NULL, '2025-10-16 11:24:21', '2025-10-16 10:33:38'),
('2310010317', 'Syahranil Putra', 'Laki-laki', '2005-01-14', 2, 'Jl anjir', 'putra@gmail.com', '08123', '2025', NULL, '2025-10-16 11:25:55', '2025-10-16 11:28:05'),
('2310010343', 'Krisna Chandra Gandiva', 'Laki-laki', '2005-05-26', 2, 'Jl cendana', 'krisnagandiva@gmail.com', '0856', '2025', NULL, '2025-10-16 10:33:38', '2025-10-16 10:34:54'),
('2310010630', 'Askhiya Tsani Saputra', 'Laki-laki', '2005-03-30', 2, 'jl handil', 'askiya@gmail.com', '08543', '2025', NULL, '2025-10-16 11:33:44', '2025-10-16 11:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_mk` varchar(16) NOT NULL,
  `nama_mk` varchar(150) NOT NULL,
  `sks` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `semester` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_mk`, `nama_mk`, `sks`, `semester`, `created_at`, `updated_at`) VALUES
('mk1', 'Visual', 2, '1', '2025-10-16 11:20:56', '2025-10-16 10:50:14'),
('mk2', 'PBO', 2, '1', '2025-10-16 11:20:56', '2025-10-16 10:50:14'),
('mk3', 'Kecerdasan Buatan', 2, '1', '2025-10-16 11:20:56', '2025-10-16 11:19:42'),
('mk4', 'Statistik Dan Probabilitas', 2, '1', '2025-10-16 11:20:56', '2025-10-16 11:19:42'),
('mk5', 'Jaringan Komputer', 2, '1', '2025-10-16 11:20:56', '2025-10-16 11:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` bigint(20) UNSIGNED NOT NULL,
  `id_krs` bigint(20) UNSIGNED NOT NULL,
  `nilai_angka` decimal(5,2) DEFAULT NULL,
  `nilai_huruf` varchar(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `role` enum('admin','operator','dosen','mahasiswa') NOT NULL DEFAULT 'operator',
  `mahasiswa_nim` varchar(16) DEFAULT NULL,
  `nama_lengkap` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_mahasiswa_jurusan`
-- (See below for the actual view)
--
CREATE TABLE `vw_mahasiswa_jurusan` (
`nim` varchar(16)
,`nama` varchar(150)
,`jenis_kelamin` enum('Laki-laki','Perempuan')
,`tgl_lahir` date
,`nama_jurusan` varchar(100)
,`email` varchar(100)
,`telepon` varchar(30)
,`angkatan` year(4)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_mahasiswa_jurusan`
--
DROP TABLE IF EXISTS `vw_mahasiswa_jurusan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `vw_mahasiswa_jurusan`  AS SELECT `m`.`nim` AS `nim`, `m`.`nama` AS `nama`, `m`.`jenis_kelamin` AS `jenis_kelamin`, `m`.`tgl_lahir` AS `tgl_lahir`, `j`.`nama_jurusan` AS `nama_jurusan`, `m`.`email` AS `email`, `m`.`telepon` AS `telepon`, `m`.`angkatan` AS `angkatan` FROM (`mahasiswa` `m` left join `jurusan` `j` on(`m`.`id_jurusan` = `j`.`id_jurusan`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id_krs`),
  ADD KEY `idx_krs_nim` (`nim`),
  ADD KEY `idx_krs_kodemk` (`kode_mk`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `idx_mahasiswa_nama` (`nama`),
  ADD KEY `idx_mahasiswa_jurusan` (`id_jurusan`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `fk_nilai_krs` (`id_krs`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_users_mahasiswa` (`mahasiswa_nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id_krs` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `fk_krs_mahasiswa` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_krs_mk` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah` (`kode_mk`) ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `fk_mahasiswa_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `fk_nilai_krs` FOREIGN KEY (`id_krs`) REFERENCES `krs` (`id_krs`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_mahasiswa` FOREIGN KEY (`mahasiswa_nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
