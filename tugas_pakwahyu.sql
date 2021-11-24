-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Nov 2021 pada 00.51
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_pakwahyu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `buku_isbn` char(13) NOT NULL,
  `buku_judul` varchar(255) NOT NULL,
  `penerbit_id` char(4) NOT NULL,
  `buku_tglterbit` date NOT NULL,
  `buku_jmlhalaman` int(11) NOT NULL,
  `buku_deskripsi` varchar(255) NOT NULL,
  `buku_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`buku_isbn`, `buku_judul`, `penerbit_id`, `buku_tglterbit`, `buku_jmlhalaman`, `buku_deskripsi`, `buku_harga`) VALUES
('222-34222-1-0', 'Mudah Belajar Photoshop', 'PB01', '2003-07-02', 300, '', 42000),
('222-34222-1-1', 'Panduan Praktis Menggunakan Corel Draw', 'PB02', '2004-03-15', 400, '', 55000),
('666-96771-2-0', 'Panduan Membangun Jaringan TCP/IP', 'PB08', '2006-08-02', 200, '', 60000),
('666-96771-2-1', 'Implementasi TCP/IP di Linux', 'PB08', '2008-11-21', 230, '', 35000),
('777-76723-5-0', 'Cara Belajar Cepat PHP 6', 'PB07', '2010-05-02', 600, '', 95000),
('777-76723-5-1', 'Membuat Aplikasi Web dengan ASP', 'PB07', '2004-08-01', 180, '', 30000),
('777-76723-5-2', 'Belajar Sendiri Internet Marketing', 'PB07', '2007-01-24', 150, '', 38500),
('777-76723-5-3', 'Panduan Menggunakan Yahoo! dan Google', 'PB07', '2007-01-24', 243, '', 38500),
('888-96771-3-0', 'Pemrograman Pascal', 'PB08', '2004-11-01', 350, '', 50000),
('888-96771-3-1', 'Pemrograman Java', 'PB06', '2007-01-23', 450, '', 72000),
('888-96771-3-2', 'Pemrograman C untuk Hardware', 'PB05', '2006-12-25', 398, '', 47000),
('888-96771-3-3', 'Menjadi Master C++', 'PB06', '2005-07-15', 490, '', 65000),
('888-96771-3-4', 'Mudah Belajar Delphi', 'PB05', '2008-08-11', 328, '', 50000),
('888-96771-3-5', 'Visual Basic', 'PB02', '2007-10-14', 250, '', 50000),
('979-96446-9-0', 'Menguasai SQL', 'PB06', '2009-10-12', 346, '', 45000),
('979-96446-9-1', 'Panduan Basis Data', 'PB01', '2007-03-02', 257, '', 37000),
('979-96446-9-2', 'Perancangan Sistem', 'PB03', '2003-09-20', 403, '', 37000),
('979-96446-9-3', 'Membuat Database dengan Microsoft Access', 'PB06', '2005-07-13', 400, '', 48500),
('999-11555-2-0', 'Teknik Presentasi', 'PB06', '2008-11-23', 300, '', 57500),
('999-11555-2-1', 'Microsoft Word 2010', 'PB04', '2010-12-01', 270, '', 60000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Basis Data'),
(2, 'Desain Grafis'),
(3, 'Jaringan Komputer'),
(4, 'Pemrograman'),
(5, 'Web dan Internet'),
(6, 'Office Application');

-- --------------------------------------------------------

--
-- Struktur dari tabel `link_buku_kategori`
--

CREATE TABLE `link_buku_kategori` (
  `buku_isbn` char(13) NOT NULL,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `link_buku_kategori`
--

INSERT INTO `link_buku_kategori` (`buku_isbn`, `kategori_id`) VALUES
('222-34222-1-0', 2),
('222-34222-1-1', 2),
('666-96771-2-0', 3),
('666-96771-2-1', 3),
('777-76723-5-0', 4),
('777-76723-5-0', 5),
('777-76723-5-1', 4),
('777-76723-5-1', 5),
('777-76723-5-2', 5),
('777-76723-5-3', 5),
('888-96771-3-0', 4),
('888-96771-3-1', 4),
('888-96771-3-2', 4),
('888-96771-3-3', 4),
('888-96771-3-4', 4),
('888-96771-3-5', 4),
('979-96446-9-0', 1),
('979-96446-9-1', 1),
('979-96446-9-2', 1),
('979-96446-9-2', 4),
('979-96446-9-3', 1),
('999-11555-2-0', 6),
('999-11555-2-1', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `link_buku_pengarang`
--

CREATE TABLE `link_buku_pengarang` (
  `buku_isbn` char(13) NOT NULL,
  `pengarang_id` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `link_buku_pengarang`
--

INSERT INTO `link_buku_pengarang` (`buku_isbn`, `pengarang_id`) VALUES
('222-34222-1-0', 'ASW'),
('222-34222-1-1', 'DAR'),
('666-96771-2-0', 'ERD'),
('666-96771-2-0', 'ERK'),
('666-96771-2-0', 'FDY'),
('666-96771-2-1', 'ASW'),
('666-96771-2-1', 'DAR'),
('777-76723-5-0', 'BRH'),
('777-76723-5-0', 'DAR'),
('777-76723-5-1', 'BTO'),
('777-76723-5-1', 'GZL'),
('777-76723-5-1', 'IGN'),
('777-76723-5-2', 'TTK'),
('777-76723-5-3', 'HND'),
('777-76723-5-3', 'HNF'),
('888-96771-3-0', 'DAR'),
('888-96771-3-1', 'BRH'),
('888-96771-3-1', 'IHR'),
('888-96771-3-2', 'ASW'),
('888-96771-3-2', 'ERK'),
('888-96771-3-3', 'BRH'),
('888-96771-3-4', 'IGN'),
('888-96771-3-5', 'DAR'),
('979-96446-9-0', 'BRH'),
('979-96446-9-0', 'IHR'),
('979-96446-9-1', 'FDY'),
('979-96446-9-2', 'BTO'),
('979-96446-9-2', 'GZL'),
('979-96446-9-2', 'IGN'),
('979-96446-9-2', 'TTK'),
('979-96446-9-3', 'IHR'),
('999-11555-2-0', 'IHR'),
('979-96446-9-1', 'FDY'),
('979-96446-9-2', 'BTO'),
('979-96446-9-2', 'GZL'),
('979-96446-9-2', 'IGN'),
('979-96446-9-2', 'TTK'),
('979-96446-9-3', 'IHR'),
('999-11555-2-0', 'IHR'),
('999-11555-2-0', 'TTK'),
('999-11555-2-1', 'ERD'),
('999-11555-2-1', 'HND'),
('999-11555-2-1', 'HNF'),
('999-11555-2-1', 'IGN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `penerbit_id` char(4) NOT NULL,
  `penerbit_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`penerbit_id`, `penerbit_nama`) VALUES
('PB01', 'Angkasa Raya'),
('PB02', 'CAHAYA ILMU PERSADA'),
('PB03', 'SINAR ILMU PERKASA'),
('PB04', 'INTAN'),
('PB05', 'SINAR RAYA'),
('PB06', 'INFORMATIKA'),
('PB07', 'TIGA SEKAWAN'),
('PB08', 'CIPTA ILMU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengarang`
--

CREATE TABLE `pengarang` (
  `pengarang_id` char(3) NOT NULL,
  `pengarang_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengarang`
--

INSERT INTO `pengarang` (`pengarang_id`, `pengarang_nama`) VALUES
('ASW', 'Andi Setiawan'),
('BRH', 'Budi Raharjo'),
('BTO', 'Beni Tito'),
('DAR', 'Dewi Aulia Raharjo'),
('ERD', 'Erik Rusdianto'),
('ERK', 'E Rosdiana K'),
('FDY', 'Fredi Hidayat'),
('GZL', 'Abdul Ghozali'),
('HND', 'Hasanudin'),
('HNF', 'Ahmad Hanafi'),
('IGN', 'Iwan Gunardi'),
('IHR', 'Imam Heryanto'),
('TTK', 'Totok Triwibowo');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`buku_isbn`),
  ADD KEY `penerbit_id` (`penerbit_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indeks untuk tabel `link_buku_kategori`
--
ALTER TABLE `link_buku_kategori`
  ADD KEY `buku_isbn` (`buku_isbn`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indeks untuk tabel `link_buku_pengarang`
--
ALTER TABLE `link_buku_pengarang`
  ADD KEY `pengarang_id` (`pengarang_id`),
  ADD KEY `buku_isbn` (`buku_isbn`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`penerbit_id`);

--
-- Indeks untuk tabel `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`pengarang_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`penerbit_id`) REFERENCES `penerbit` (`penerbit_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `link_buku_kategori`
--
ALTER TABLE `link_buku_kategori`
  ADD CONSTRAINT `link_buku_kategori_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `link_buku_kategori_ibfk_3` FOREIGN KEY (`buku_isbn`) REFERENCES `buku` (`buku_isbn`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `link_buku_pengarang`
--
ALTER TABLE `link_buku_pengarang`
  ADD CONSTRAINT `link_buku_pengarang_ibfk_2` FOREIGN KEY (`pengarang_id`) REFERENCES `pengarang` (`pengarang_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `link_buku_pengarang_ibfk_3` FOREIGN KEY (`buku_isbn`) REFERENCES `buku` (`buku_isbn`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
