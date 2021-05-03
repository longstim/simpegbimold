-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2021 at 04:10 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbsimpegbim`
--

-- --------------------------------------------------------

--
-- Table structure for table `md_jabatan`
--

CREATE TABLE `md_jabatan` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `jenis_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_jabatan`
--

INSERT INTO `md_jabatan` (`id`, `jabatan`, `jenis_jabatan`) VALUES
(1, 'Kepala Balai', 3),
(2, 'Kepala Sub Bagian Tata Usaha', 3),
(3, 'Peneliti', 2),
(4, 'Perekayasa', 2),
(5, 'Asesor Manajemen Mutu Industri', 2),
(6, 'Penguji Mutu Barang', 2),
(7, 'Teknisi Litkayasa', 2),
(8, 'Pengendali Dampak Lingkungan', 2),
(9, 'Penyuluh Perindustrian', 2),
(10, 'Pengelola Teknologi Informasi', 1),
(11, 'Bendahara Pengeluaran', 1),
(12, 'Pengolah Data Pelayanan', 1),
(13, 'Pengelola BMN', 1),
(14, 'Analis Data dan Informasi', 1),
(15, 'Penilai Mutu Produk', 1),
(16, 'Teknisi Laboratorium', 1),
(17, 'Pranata Keuangan APBN', 2),
(18, 'Pranata Kearsipan', 1),
(19, 'Pengelola Sarana dan Prasarana Kantor', 1),
(20, 'Pengadministrasi Keuangan', 1),
(21, 'Pengelola Gudang', 1);

-- --------------------------------------------------------

--
-- Table structure for table `md_jenis_jabatan`
--

CREATE TABLE `md_jenis_jabatan` (
  `id` int(11) NOT NULL,
  `jenis_jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_jenis_jabatan`
--

INSERT INTO `md_jenis_jabatan` (`id`, `jenis_jabatan`) VALUES
(1, 'Fungsional Umum'),
(2, 'Fungsional Tertentu'),
(3, 'Struktural');

-- --------------------------------------------------------

--
-- Table structure for table `md_jenjang_jabatan`
--

CREATE TABLE `md_jenjang_jabatan` (
  `id` int(11) NOT NULL,
  `jenjang_jabatan` varchar(255) NOT NULL,
  `jenis_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_jenjang_jabatan`
--

INSERT INTO `md_jenjang_jabatan` (`id`, `jenjang_jabatan`, `jenis_jabatan`) VALUES
(1, 'Pemula', 2),
(2, 'Terampil', 2),
(3, 'Mahir', 2),
(4, 'Penyelia', 2),
(5, 'Ahli Pertama', 2),
(6, 'Ahli Muda', 2),
(7, 'Ahli Madya', 2),
(8, 'Ahli Utama', 2),
(9, 'Eselon IV', 3),
(10, 'Eselon III', 3),
(11, 'Eselon II', 3),
(12, 'Eselon I', 3);

-- --------------------------------------------------------

--
-- Table structure for table `md_pangkat`
--

CREATE TABLE `md_pangkat` (
  `id` int(11) NOT NULL,
  `pangkat` varchar(50) NOT NULL,
  `golongan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_pangkat`
--

INSERT INTO `md_pangkat` (`id`, `pangkat`, `golongan`) VALUES
(1, 'Juru Muda', 'I/a'),
(2, 'Juru Muda Tk. I', 'I/b'),
(3, 'Juru', 'I/c'),
(4, 'Juru Tk. I', 'I/d'),
(5, 'Pengatur Muda', 'II/a'),
(6, 'Pengatur Muda Tk. I', 'II/b'),
(7, 'Pengatur', 'II/c'),
(8, 'Pengatur Tk. I', 'II/d'),
(9, 'Penata Muda', 'III/a'),
(10, 'Penata Muda Tk. I', 'III/b'),
(11, 'Penata', 'III/c'),
(12, 'Penata Tk. I', 'III/d'),
(13, 'Pembina', 'IV/a'),
(14, 'Pembina Tk. I', 'IV/b'),
(15, 'Pembina Utama Muda', 'IV/c'),
(16, 'Pembina Utama Madya', 'IV/d'),
(17, 'Pembina Utama', 'IV/e');

-- --------------------------------------------------------

--
-- Table structure for table `md_pegawai`
--

CREATE TABLE `md_pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `jenis_pegawai` varchar(15) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `md_pegawai`
--

INSERT INTO `md_pegawai` (`id`, `nama`, `nip`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `agama`, `jenis_pegawai`, `foto`) VALUES
(1, 'M. Nilzam', '197204251993031003', 'Kutacane', '1972-04-25', 'Laki-laki', 'Islam', 'PNS', ''),
(2, 'Hardiana Sriyati', '196804061993032002', 'Padang Sidempuan', '1968-04-06', 'Perempuan', 'Islam', 'PNS', 'Hardiana.jpg'),
(3, 'Lois Handoko Sinuhaji', '197910092006041002', 'Brastagi', '1979-10-09', 'Laki-laki', 'Kristen', 'PNS', 'Lois.jpg'),
(4, 'Muhammad Al Amin Nasution', '197310171993031001', 'Panyabungan', '1973-10-17', 'Laki-laki', 'Islam', 'PNS', ''),
(5, 'Benito Totok Wardhana Simangunsong', '197609102005021001', 'Sidikalang', '1976-09-10', 'Laki-laki', 'Kristen', 'PNS', 'Benito.jpg'),
(6, 'Rosmaida Panjaitan', '196108051990032001', 'Medan', '1961-08-05', 'Perempuan', 'Kristen', 'PNS', 'Rosmaida.jpg'),
(7, 'Bonaria Heppiyati Pane', '196701121991032002', 'Pekanbaru', '1967-01-12', 'Perempuan', 'Kristen', 'PNS', ''),
(8, 'Tiur Simarangkir', '196510201986022001', 'Tapanuli Utara', '1965-10-20', 'Perempuan', 'Kristen', 'PNS', ''),
(9, 'Tioria Simorangkir', '196311051985042001', 'Tarutung', '1963-11-05', 'Perempuan', 'Kristen', 'PNS', ''),
(10, 'Benny Parlindungan Manik', '197709152006041005', 'Sei Alim Ulu', '1977-09-15', 'Laki-laki', 'Katolik', 'PNS', ''),
(11, 'Nurmawati', '196408171986022002', 'Medan', '1964-08-17', 'Perempuan', 'Islam', 'PNS', ''),
(12, 'Loista Sevnin Kacaribu', '199007092018011002', 'Medan', '1990-07-09', 'Laki-laki', 'Kristen', 'PNS', 'Loista.jpg'),
(13, 'Endang Sri Ulina', '196511221992032007', 'Kaban Jahe', '1965-11-22', 'Perempuan', 'Kristen', 'PNS', 'Endang.jpg'),
(14, 'Toga Marhusa Simanjuntak', '196510141990031002', 'Medan', '1965-10-14', 'Laki-laki', 'Kristen', 'PNS', 'Toga.jpg'),
(15, 'Liman Siahaan', '197005152003121002', 'Pematangsiantar', '1970-05-15', 'Laki-laki', 'Katolik', 'PNS', ''),
(16, 'Siti Khairunizar', '198008202005022001', 'Perkebunan Tanjung Kasau', '1980-08-20', 'Perempuan', 'Islam', 'PNS', ''),
(17, 'Rossi Evana', '198207112005022001', 'Medan', '1982-07-11', 'Perempuan', 'Islam', 'PNS', ''),
(18, 'Fadhil Maulizandy Amri', '198301102005021001', 'Lhokseumawe', '1983-01-10', 'Laki-laki', 'Islam', 'PNS', ''),
(19, 'Hari Mulyadi Falah', '198610092010121001', 'Sukabumi', '1986-10-09', 'Laki-laki', 'Islam', 'PNS', ''),
(20, 'Sri Chasnawati', '197012311993032008', 'Banda Aceh', '1970-12-31', 'Perempuan', 'Islam', 'PNS', ''),
(21, 'Pebrian Aditama', '199202182014021001', 'Palembang', '1992-02-18', 'Laki-laki', 'Islam', 'PNS', ''),
(22, 'Dicky Hariadi Pratama', '199003032015021001', 'Padang', '1990-03-03', 'Laki-laki', 'Islam', 'PNS', ''),
(23, 'Nauba Pardede', '196407241988012001', 'Percut', '1964-07-24', 'Perempuan', 'Kristen', 'PNS', ''),
(24, 'Sumarni', '196404121986032002', 'T. Morawa', '1964-04-12', 'Perempuan', 'Islam', 'PNS', ''),
(25, 'Yanri Vernando Silalahi', '197801202008031001', 'Jakarta', '1978-01-20', 'Laki-laki', 'Kristen', 'PNS', ''),
(26, 'Yufriza Wannur Azah', '198204262009011006', 'Meulaboh', '1982-04-26', 'Laki-laki', 'Islam', 'PNS', ''),
(27, 'Tahoma Simanjorang', '196402211985021002', 'Medan', '1964-02-21', 'Laki-laki', 'Kristen', 'PNS', ''),
(28, 'Remson Saragih', '196412091986021002', 'Bah Rambung', '1964-12-09', 'Laki-laki', 'Kristen', 'PNS', ''),
(29, 'Surya Ritonga', '198607032009111001', 'Padang Sidempuan', '1986-07-03', 'Laki-laki', 'Islam', 'PNS', ''),
(30, 'Rahmadsyah', '198312252008031001', 'Belawan', '1983-12-25', 'Laki-laki', 'Islam', 'PNS', ''),
(31, 'Lia Murti Tirtayasa', '198902052018012001', 'Mandailing Natal', '1989-02-05', 'Perempuan', 'Islam', 'PNS', ''),
(32, 'Dimas Ade Putra', '199208262018011001', 'Deli Serdang', '1992-08-26', 'Laki-laki', 'Islam', 'PNS', ''),
(33, 'Rahmyuti', '198912122015022001', 'Bukittinggi', '1989-12-12', 'Perempuan', 'Islam', 'PNS', ''),
(34, 'Muhammad Ali', '196406141990031004', 'Siparepare', '1964-06-14', 'Laki-laki', 'Islam', 'PNS', ''),
(35, 'Rofii Nasution', '197005172007101001', 'Medan', '1970-05-17', 'Laki-laki', 'Islam', 'PNS', ''),
(36, 'Monalisa Aulya', '199007052019012001', 'Padang Sidempuan', '1990-07-05', 'Perempuan', 'Islam', 'PNS', ''),
(37, 'Sari Farah Dina', '196209201990032001', 'Dolok Ilir', '1962-09-20', 'Perempuan', 'Islam', 'PNS', ''),
(38, 'Justaman Arifin Karo Karo', '196401111991031004', 'Guru Kinayan', '1964-01-11', 'Laki-laki', 'Islam', 'PNS', ''),
(39, 'Siti Masriani Rambe', '197805162003122005', 'Binanga Tolang', '1978-05-16', 'Perempuan', 'Islam', 'PNS', ''),
(40, 'Harry Parulian Limbong', '196906202002121003', 'Medan', '1969-06-20', 'Laki-laki', 'Kristen', 'PNS', ''),
(41, 'Marisa Naufa', '198107252002122001', 'Pangkalan Berandan', '1981-07-25', 'Perempuan', 'Islam', 'PNS', ''),
(42, 'Edwin Harianto Sipahutar', '196903252002121003', 'Medan', '1969-03-25', 'Laki-laki', 'Kristen', 'PNS', ''),
(43, 'Pander Sitindaon', '195808041980031004', 'Sukadame', '1958-08-04', 'Laki-laki', 'Kristen', 'PNS', ''),
(44, 'Hitman Pardosi', '196010031991031002', 'Sidikalang', '1960-10-03', 'Laki-laki', 'Kristen', 'PNS', ''),
(45, 'Jimmy Gifson Simanjuntak', '197507082002121008', 'Tanjung Balai', '1975-07-08', 'Laki-laki', 'Kristen', 'PNS', ''),
(46, 'Dewi Kusumawaty', '198612112010122002', 'Pangkalan Berandan', '1986-12-11', 'Perempuan', 'Islam', 'PNS', ''),
(47, 'Poltak Tua Dorens Ambarita', '198202242008031002', 'Sidamanik', '1982-02-24', 'Perempuan', 'Katolik', 'PNS', ''),
(48, 'Cut Helviriyanti', '198803222010122002', 'Lhokseumawe', '1988-03-22', 'Perempuan', 'Kristen', 'PNS', ''),
(49, 'Romasi Sagala', '196807172006042016', 'Dairi', '1968-07-17', 'Perempuan', 'Kristen', 'PNS', 'Romasi.jpg'),
(50, 'Rolida Simanjuntak', '196510011988012001', 'Tanah Jawa', '1965-10-01', 'Perempuan', 'Kristen', 'PNS', ''),
(51, 'Fauzi', '198006072007011002', 'Medan', '1980-06-07', 'Laki-laki', 'Islam', 'PNS', ''),
(52, 'Kartua Sagala', '196606261988011001', 'Sibolangit', '1966-06-26', 'Laki-laki', 'Kristen', 'PNS', ''),
(53, 'Holong M. Situmorang', '199311272019011001', 'Tele', '1993-11-27', 'Laki-laki', 'Kristen', 'PNS', 'Holong.jpg'),
(54, 'Shania Gracesia Br. Ginting', '200004262019122001', 'Medan', '2000-04-26', 'Perempuan', 'Kristen', 'PNS', ''),
(55, 'Ayu Puspita Retno', '199611282020122004', 'Medan', '1996-11-28', 'Perempuan', 'Islam', 'CPNS', ''),
(56, 'Albert Alzendro M', '198711242020121001', 'Medan', '1987-11-24', 'Laki-laki', 'Kristen', 'CPNS', ''),
(57, 'Arinda Ahlakul Karima', '199608152020122001', 'Palembang', '1996-08-15', 'Perempuan', 'Islam', 'CPNS', ''),
(58, 'Lamposma Lumban Gaol', '199111132020121002', 'Tarutung', '1991-11-13', 'Laki-laki', 'Kristen', 'CPNS', ''),
(59, 'Sahatma Tua Silalahi', '199105192020121001', 'Curup', '1991-05-19', 'Laki-laki', 'Kristen', 'CPNS', ''),
(60, 'Ropita Elisabeth Simanjuntak', '90951218020949', 'Medan', '1995-12-11', 'Perempuan', 'Kristen', 'PPNPN', 'Ropita.jpg'),
(61, 'Jenny Sovanny Elisabeth', '90910118020945', 'Medan', '1991-01-28', 'Perempuan', 'Kristen', 'PPNPN', 'Jenny.jpg'),
(62, 'Iren Sunhaganta Sitepu', '90920618010950', 'Kabanjahe', '1992-06-13', 'Laki-laki', 'Kristen', 'PPNPN', 'Iren.jpg'),
(63, 'Sari Mustika Rizky', '90920919020951', 'Medan', '1992-09-30', 'Perempuan', 'Islam', 'PPNPN', 'Sari.jpg'),
(64, 'Hairunissa ', '90930418100569', 'Tanjung Morawa', '1993-04-20', 'Perempuan', 'Islam', 'PPNPN', 'Hairunissa.jpg'),
(65, 'Ridzki Chandra Mukti ', '90940818100954', 'Medan', '1994-08-13', 'Laki-laki', 'Islam', 'PPNPN', 'Ridzki.jpg'),
(66, 'Septriany Wahyu Sitohang ', '90930918100952', 'Medan', '1993-09-21', 'Perempuan', 'Kristen', 'PPNPN', 'Septriany.jpg'),
(67, 'Yolanda Febrina Samosir', '90930418100500', 'Medan', '1993-04-06', 'Perempuan', 'Kristen', 'PPNPN', 'Yolanda.jpg'),
(68, 'Cita Sitohang ', '90940318100706', 'Baneara', '1994-03-11', 'Perempuan', 'Kristen', 'PPNPN', 'Cita.jpg'),
(69, 'Novita Syahriani Pane', '90921118100953', 'Medan', '1992-11-19', 'Perempuan', 'Islam', 'PPNPN', 'Novita.jpg'),
(70, 'Ferdinan H. Banjarnahor ', '90951118100572', 'Sialabane', '1995-11-17', 'Laki-laki', 'Kristen', 'PPNPN', 'Ferdinan.jpg'),
(71, 'Yilga Cindya Dewi Munthe', '90930918100561', 'Sigambal', '1993-09-25', 'Perempuan', 'Islam', 'PPNPN', 'Yilga.jpg'),
(72, 'Dwi Ganar Prabowo ', '50201701100355', 'Patumbak', '1994-04-15', 'Laki-laki', 'Islam', 'PPNPN', 'Dwi.jpg'),
(73, 'Hamdani Sihite', '50201701100356', 'Medan', '1977-06-28', 'Laki-laki', 'Islam', 'PPNPN', 'Hamdani.jpg'),
(74, 'T. M. Iqbal Nugraha ', '90900619010958', 'Kutacane', '1990-06-29', 'Laki-laki', 'Islam', 'PPNPN', 'Iqbal.jpg'),
(75, 'Indra Syahputra ', '50201006100012', 'Medan', '1986-10-17', 'Laki-laki', 'Islam', 'PPNPN', 'Indra.jpg'),
(76, 'Andi Yuswotomo', '50201701100353', 'Medan', '1966-03-25', 'Laki-laki', 'Islam', 'PPNPN', 'Andi.jpg'),
(77, 'Khuwailid Nasution', '50201201100042', 'Medan', '1971-03-30', 'Laki-laki', 'Islam', 'PPNPN', 'Khuwailid.jpg'),
(78, 'Santun Lumban Gaol', '50201701200354', 'Dolok Sanggul', '1975-05-11', 'Laki-laki', 'Katolik', 'PPNPN', 'Santun.jpg'),
(79, 'Fadli ', '90981119010956', 'Medan', '1998-11-15', 'Laki-laki', 'Islam', 'PPNPN', 'Fadli.jpg'),
(80, 'Mhd. Muchlis Situmorang ', '90770219012018', 'Medan', '1977-02-13', 'Laki-laki', 'Islam', 'PPNPN', 'Muchlis.jpg'),
(81, 'Muhammad Saputra', '90770619010957', 'Medan', '1977-06-07', 'Laki-laki', 'Islam', 'PPNPN', 'Saputra.jpg'),
(82, 'Muhammad Arifin', '90790619040970', 'Muhammad Arifin', '1979-06-22', 'Laki-laki', 'Islam', 'PPNPN', 'Arifin.jpg'),
(83, 'Ahmadi', '50201701100042', 'Medan', '1988-11-01', 'Laki-laki', 'Islam', 'PPNPN', 'Ahmadi.jpg'),
(84, 'Cindy Aurellia Turnip', '90990719011815', 'Pematangsiantar', '1999-07-31', 'Perempuan', 'Kristen', 'PPNPN', 'Cindy.jpg'),
(85, 'Fahri Yunanda', '90890719010960', 'Medan', '1989-07-17', 'Laki-laki', 'Islam', 'PPNPN', 'Fahri.jpg'),
(86, 'Fahrurrozi Hidayah', '90960819010961', 'Tanjung Morawa', '1996-08-09', 'Laki-laki', 'Islam', 'PPNPN', 'Fahrurrozi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `td_jabatan_pegawai`
--

CREATE TABLE `td_jabatan_pegawai` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_jenjang_jabatan` int(11) DEFAULT NULL,
  `no_sk` varchar(25) DEFAULT NULL,
  `tanggal_sk` date DEFAULT NULL,
  `tmt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_jabatan_pegawai`
--

INSERT INTO `td_jabatan_pegawai` (`id`, `id_pegawai`, `id_jabatan`, `id_jenjang_jabatan`, `no_sk`, `tanggal_sk`, `tmt`) VALUES
(1, 1, 1, 10, '', NULL, '0000-00-00'),
(2, 2, 2, 9, '', NULL, '0000-00-00'),
(3, 3, 4, 6, '', NULL, '0000-00-00'),
(4, 4, 4, 6, '', NULL, '0000-00-00'),
(5, 5, 5, 6, '', NULL, '0000-00-00'),
(6, 6, 9, 7, '', NULL, '0000-00-00'),
(7, 7, 9, 7, '', NULL, '0000-00-00'),
(8, 8, 9, 4, '', NULL, '0000-00-00'),
(9, 9, 9, 4, '', NULL, '0000-00-00'),
(10, 10, 5, 6, '', NULL, '0000-00-00'),
(11, 11, 12, NULL, '', NULL, '0000-00-00'),
(12, 12, 10, NULL, '', NULL, '0000-00-00'),
(13, 13, 5, 7, '', NULL, '0000-00-00'),
(14, 14, 5, 7, '', NULL, '0000-00-00'),
(15, 15, 5, 6, '', NULL, '0000-00-00'),
(16, 16, 6, 5, '', NULL, '0000-00-00'),
(17, 17, 6, 5, '', NULL, '0000-00-00'),
(18, 18, 6, 5, '', NULL, '0000-00-00'),
(19, 19, 6, 5, '', NULL, '0000-00-00'),
(20, 20, 6, 3, '', NULL, '0000-00-00'),
(21, 21, 6, 2, '', NULL, '0000-00-00'),
(22, 22, 6, 2, '', NULL, '0000-00-00'),
(23, 23, 7, 4, '', NULL, '0000-00-00'),
(24, 24, 8, 4, '', NULL, '0000-00-00'),
(25, 25, 14, NULL, '', NULL, '0000-00-00'),
(26, 26, 21, NULL, '', NULL, '0000-00-00'),
(27, 27, 15, NULL, '', NULL, '0000-00-00'),
(28, 28, 15, NULL, '', NULL, '0000-00-00'),
(29, 29, 6, 3, '', NULL, '0000-00-00'),
(30, 30, 6, 3, '', NULL, '0000-00-00'),
(31, 31, 6, 5, '', NULL, '0000-00-00'),
(32, 32, 6, 5, '', NULL, '0000-00-00'),
(33, 33, 6, 2, '', NULL, '0000-00-00'),
(34, 34, 15, NULL, '', NULL, '0000-00-00'),
(35, 35, 15, NULL, '', NULL, '0000-00-00'),
(36, 36, 16, NULL, '', NULL, '0000-00-00'),
(37, 37, 3, 7, '', NULL, '0000-00-00'),
(38, 38, 3, 7, '', NULL, '0000-00-00'),
(39, 39, 3, 6, '', NULL, '0000-00-00'),
(40, 40, 3, 6, '', NULL, '0000-00-00'),
(41, 41, 3, 5, '', NULL, '0000-00-00'),
(42, 42, 3, 5, '', NULL, '0000-00-00'),
(43, 43, 4, 8, '', NULL, '0000-00-00'),
(44, 44, 4, 7, '', NULL, '0000-00-00'),
(45, 45, 4, 7, '', NULL, '0000-00-00'),
(46, 46, 4, 6, '', NULL, '0000-00-00'),
(47, 47, 14, NULL, '', NULL, '0000-00-00'),
(48, 48, 14, NULL, '', NULL, '0000-00-00'),
(49, 49, 17, 2, '', NULL, '0000-00-00'),
(50, 50, 18, NULL, '', NULL, '0000-00-00'),
(51, 51, 13, NULL, '', NULL, '0000-00-00'),
(52, 52, 19, NULL, '', NULL, '0000-00-00'),
(53, 53, 10, NULL, '1777 Tahun 2018', '2018-12-31', '2019-01-01'),
(54, 54, 20, NULL, '', NULL, '0000-00-00'),
(55, 55, 10, NULL, '', NULL, '0000-00-00'),
(56, 56, 6, 2, '', NULL, '0000-00-00'),
(57, 57, 6, 2, '', NULL, '0000-00-00'),
(58, 58, 7, 2, '', NULL, '0000-00-00'),
(59, 59, 7, 2, '', NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `td_lembur_detail`
--

CREATE TABLE `td_lembur_detail` (
  `id` int(11) NOT NULL,
  `id_header` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tanggal_lembur_awal` date NOT NULL,
  `tanggal_lembur_akhir` date NOT NULL,
  `bidang_pekerjaan` varchar(255) NOT NULL,
  `uraian_pekerjaan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_lembur_detail`
--

INSERT INTO `td_lembur_detail` (`id`, `id_header`, `id_pegawai`, `tanggal_lembur_awal`, `tanggal_lembur_akhir`, `bidang_pekerjaan`, `uraian_pekerjaan`) VALUES
(1, 1, 3, '2021-01-11', '2021-01-12', 'Koordinator Seksi PPK', 'Penyusunan Laporan PP39 dan LAKIP'),
(2, 1, 12, '2021-01-11', '2021-01-12', 'Staf PPK', 'Penyusunan Laporan PP39 dan LAKIP'),
(3, 2, 1, '2021-04-24', '2021-04-25', 'Kepala Baristand Industri Medan / Penanggung Jawab Tim ZI', 'Pengisian LKE ZI Tahun 2021'),
(4, 2, 4, '2021-04-24', '2021-04-25', 'Ketua Tim ZI', 'Pengisian LKE ZI Tahun 2021'),
(5, 2, 5, '2021-04-24', '2021-04-25', 'Koordinator Penguatan Pengawasan', 'Pengisian LKE ZI Tahun 2021'),
(6, 2, 7, '2021-04-24', '2021-04-25', 'Koordinator Peningkatan Kualitas Pelayanan Publik', 'Pengisian LKE ZI Tahun 2021'),
(7, 2, 6, '2021-04-24', '2021-04-25', 'Anggota Penataan Tata Laksana', 'Pengisian LKE ZI Tahun 2021'),
(8, 2, 10, '2021-04-24', '2021-04-25', 'Anggota Manajemen Perubahan', 'Pengisian LKE ZI Tahun 2021'),
(9, 2, 12, '2021-04-24', '2021-04-25', 'Anggota Penguatan Akuntabilitas', 'Pengisian LKE ZI Tahun 2021'),
(10, 2, 53, '2021-04-24', '2021-04-25', 'Anggota Penataan Sistem Manajemen SDM', 'Pengisian LKE ZI Tahun 2021'),
(11, 2, 62, '2021-04-24', '2021-04-25', 'Pengelola Teknologi Informasi', 'Pengisian LKE ZI Tahun 2021'),
(12, 3, 2, '2021-01-16', '2021-01-16', 'Koordinator Sub Bag Tata Usaha', 'Monitoring pelaksanaan kegiatan merapikan arsip dan gudang'),
(13, 3, 51, '2021-01-16', '2021-01-16', 'Pengelola BMN', 'Merapikan gudang'),
(14, 3, 21, '2021-01-16', '2021-01-16', 'PBJ', 'Menginput data SIRUP dan merapikan dokumen PBJ'),
(15, 3, 53, '2021-01-16', '2021-01-16', 'Pengelola Teknologi Informasi', 'Merapikan arsip kepegawaian'),
(16, 3, 55, '2021-01-16', '2021-01-16', 'Pengelola Teknologi Informasi', 'Merapikan gudang'),
(17, 3, 61, '2021-01-16', '2021-01-16', 'Pengadministrasi Umum', 'Merapikan arsip keuangan'),
(18, 3, 85, '2021-01-16', '2021-01-16', 'Pramu Kebersihan', 'Merapikan arsip dan gudang'),
(19, 3, 86, '2021-01-16', '2021-01-16', 'Pramu Kebersihan', 'Merapikan arsip dan gudang'),
(20, 5, 3, '2021-01-18', '2021-01-18', 'Koordinator Seksi PPK', 'Penyusunan LAKIP'),
(21, 5, 12, '2021-01-18', '2021-01-18', 'Staf PPK', 'Penyusunan LAKIP'),
(22, 4, 10, '2021-01-18', '2021-01-18', 'Analis Sistem Informasi / Anggota Tim PIPK', 'Penyusunan Kertas Kerja PIPK'),
(23, 4, 53, '2021-01-18', '2021-01-18', 'Pengelola Teknologi Informasi / Anggota Tim PIPK', 'Penyusunan Kertas Kerja PIPK'),
(24, 4, 54, '2021-01-18', '2021-01-18', 'Pengadministrasi Keuangan', 'Memproses SPM Gaji dan Tagihan Listrik pada Aplikasi GPP dan SAS'),
(25, 4, 60, '2021-01-18', '2021-01-18', 'Pengadministrasi Umum', 'Merapikan Dokumen'),
(26, 4, 74, '2021-01-18', '2021-01-18', 'Pengemudi', 'Merapikan Dokumen'),
(28, 6, 1, '2021-04-27', '2021-04-27', 'Kepala Baristand Industri Medan', 'Mengkoordinir pengisian LKE ZI Tahun 2021'),
(29, 6, 5, '2021-04-27', '2021-04-27', 'Plh. Kepala Sub Bag Tata Usaha / Koordinator Penguatan Pengawasan', 'Melengkapi Data Dukung Pengisian LKE ZI Tahun 2021'),
(30, 6, 12, '2021-04-27', '2021-04-27', 'Anggota Penguatan Akuntabilitas', 'Melengkapi Data Dukung Pengisian LKE ZI Tahun 2021'),
(31, 6, 53, '2021-04-27', '2021-04-27', 'Anggota Penataan Sistem Manajemen SDM', 'Melengkapi Data Dukung Pengisian LKE ZI Tahun 2021'),
(32, 7, 62, '2021-04-28', '2021-04-28', 'Anggota Penguatan Kualitas Pelayanan Publik', 'Melengkapi data dukung pengisian LKE ZI Tahun 2021'),
(33, 8, 15, '2021-04-24', '2021-04-25', 'Fungsional AMMI', 'Menyusun rencana penyiapan bahan pelaporan PMPZI secara online'),
(34, 9, 60, '2021-04-29', '2021-04-29', 'Anggota Manajemen Perubahan', 'Melengkapi data dukung pengisian LKE ZI Tahun 2021'),
(35, 9, 76, '2021-04-30', '2021-04-30', 'Petugas Keamanan', 'Menjaga keamanan kantor Baristand Industri Medan Jl. Sisingamangaraja No. 24'),
(36, 9, 78, '2021-04-30', '2021-04-30', 'Petugas Keamanan', 'Menjaga keamanan kantor Baristand Industri Medan Jl. Sisingamangaraja No. 24'),
(37, 10, 78, '2021-01-21', '2021-01-22', 'Petugas Keamanan', 'Menjaga Keamanan Kantor Baristand Industri Medan, Jl. Sisingamangaraja No. 24'),
(38, 11, 15, '2021-01-23', '2021-01-23', 'Penyusun Laporan Keuangan', 'Menyelesaikan Laporan Keuangan'),
(39, 11, 52, '2021-01-23', '2021-01-23', 'Pengelola Sarana dan Prasarana Kantor', 'Memeriksa instalasi listrik Kantor Baristand Industri Medan'),
(40, 11, 30, '2021-01-23', '2021-01-23', 'PBJ', 'Memeriksa instalasi listrik Kantor Baristand Industri Medan'),
(41, 11, 51, '2021-01-23', '2021-01-23', 'Pengelola BMN', 'Menyelesaikan Laporan Keuangan'),
(42, 11, 85, '2021-01-24', '2021-01-24', 'Pramu Kebersihan', 'Melakukan penyemprotan disinfektan'),
(43, 11, 73, '2021-01-24', '2021-01-24', 'Pengemudi', 'Melakukan penyemprotan disinfektan'),
(44, 12, 12, '2021-01-28', '2021-01-28', 'Staf PPK / Operator SPM', 'Membuat SPBy RM dan PNBP sesuai pertanggungjawaban untuk pembuatan SPM GU'),
(45, 12, 53, '2021-01-28', '2021-01-28', 'Pengelola Teknologi Informasi / Anggota Tim PIPK', 'Penyusunan Laporan Hasil Penilaian PIPK'),
(46, 12, 54, '2021-01-28', '2021-01-28', 'Pengadministrasi Keuangan', 'Membuat SPBy RM dan PNBP sesuai pertanggungjawaban untuk pembuatan SPM GU'),
(47, 12, 62, '2021-01-28', '2021-01-28', 'Pengelola Teknologi Informasi', 'Melakukan setting jaringan Internet'),
(48, 13, 2, '2021-01-30', '2021-01-30', 'Koordinator Sub Bag Tata Usaha', 'Menyiapkan Laporan Keuangan'),
(49, 13, 15, '2021-01-30', '2021-01-30', 'Penyusun Laporan Keuangan', 'Menyiapkan Laporan Keuangan'),
(50, 13, 30, '2021-01-31', '2021-01-31', 'PBJ', 'Mengawasi Pekerjaan Pemeliharaan Gedung');

-- --------------------------------------------------------

--
-- Table structure for table `td_lembur_header`
--

CREATE TABLE `td_lembur_header` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `diusulkan` int(11) NOT NULL,
  `jabatan_pengusul` varchar(255) NOT NULL,
  `disetujui` int(11) NOT NULL,
  `jabatan_penyetuju` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_lembur_header`
--

INSERT INTO `td_lembur_header` (`id`, `no_surat`, `tanggal_surat`, `diusulkan`, `jabatan_pengusul`, `disetujui`, `jabatan_penyetuju`) VALUES
(1, '083/BPPI/Baristand-Medan/I/2021', '2021-01-11', 3, 'Koordinator Seksi PPK', 1, 'Kepala Baristand Industri Medan'),
(2, '669/BPPI/Baristand-Medan/IV/2021', '2021-04-23', 1, 'Kepala Baristand Industri Medan', 1, 'Kepala Baristand Industri Medan'),
(3, '-/BPPI/Baristand-Medan/I/2021', '2021-01-15', 2, 'Koordinator Sub Bag Tata Usaha', 1, 'Kepala Baristand Industri Medan'),
(4, '-/BPPI/Baristand-Medan/I/2021', '2021-01-18', 2, 'Koordinator Sub Bag Tata Usaha', 1, 'Kepala Baristand Industri Medan'),
(5, '-/BPPI/Baristand-Medan/I/2021', '2021-01-18', 3, 'Koordinator Seksi PPK', 1, 'Kepala Baristand Industri Medan'),
(6, '723/BPPI/Baristand-Medan/IV/2021', '2021-04-27', 1, 'Kepala Baristand Industri Medan', 1, 'Kepala Baristand Industri Medan'),
(7, '728/BPPI/Baristand-Medan/IV/2021', '2021-04-28', 4, 'Koordinator Seksi PJT', 1, 'Kepala Baristand Industri Medan'),
(8, '671/BPPI/Baristand-Medan/IV/2021', '2021-04-23', 5, 'Koordinator Seksi SS', 1, 'Kepala Baristand Industri Medan'),
(9, '741/BPPI/Baristand-Medan/IV/2021', '2021-04-29', 5, 'Plh. Kepala Sub Bag Tata Usaha', 1, 'Kepala Baristand Industri Medan'),
(10, '164/BPPI/Baristand-Medan/I/2021', '2021-01-20', 2, 'Koordinator Sub Bag Tata Usaha', 1, 'Kepala Baristand Industri Medan'),
(11, '-/BPPI/Baristand-Medan/I/2021', '2021-01-22', 2, 'Koordinator Sub Bag Tata Usaha', 1, 'Kepala Baristand Industri Medan'),
(12, '209/BPPI/Baristand-Medan/I/2021', '2021-01-28', 2, 'Koordinator Sub Bag Tata Usaha', 4, 'Plh. Kepala Baristand Industri Medan'),
(13, '220/BPPI/Baristand-Medan/I/2021', '2021-01-29', 2, 'Koordinator Sub Bag Tata Usaha', 4, 'Plh. Kepala Baristand Industri Medan');

-- --------------------------------------------------------

--
-- Table structure for table `td_login_history`
--

CREATE TABLE `td_login_history` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `waktu_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `td_pangkat_pegawai`
--

CREATE TABLE `td_pangkat_pegawai` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `no_sk` varchar(25) DEFAULT NULL,
  `tanggal_sk` date DEFAULT NULL,
  `tmt_pangkat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_pangkat_pegawai`
--

INSERT INTO `td_pangkat_pegawai` (`id`, `id_pegawai`, `id_pangkat`, `no_sk`, `tanggal_sk`, `tmt_pangkat`) VALUES
(1, 1, 13, '547 Tahun 2019', '2019-03-04', '2019-04-01'),
(2, 2, 13, '400/M-IND/Kep/8/2011', '2011-08-01', '2011-10-01'),
(3, 3, 12, '582/IIA-12/SK/II/2018', '2018-03-26', '2018-04-01'),
(4, 4, 12, '1180/IIA-12/SK/II/2014', '2014-09-29', '2014-10-01'),
(5, 5, 11, '168 Tahun 2020', '2020-09-18', '2020-10-01'),
(6, 6, 15, '00067/KEP/AA/15001/17', '2017-09-15', '2017-10-01'),
(7, 7, 13, '771/M-IND/Kep/3/2018', '2018-03-27', '2018-04-01'),
(8, 8, 12, '390/IIA-12/SK/II/2018', '2018-03-26', '2018-04-01'),
(9, 9, 12, '784 Tahun 2018', '2018-09-10', '2018-10-01'),
(10, 10, 11, '1224 Tahun 2019', '2019-09-03', '2019-10-01'),
(11, 11, 10, '210/IIA-10/SK/II/2006', '2006-03-27', '2006-04-01'),
(12, 12, 7, '1234 Tahun 2018', '2017-12-29', '2018-01-01'),
(13, 13, 14, NULL, NULL, NULL),
(14, 14, 12, NULL, NULL, NULL),
(15, 15, 12, NULL, NULL, NULL),
(16, 16, 11, NULL, NULL, NULL),
(17, 17, 10, NULL, NULL, NULL),
(18, 18, 10, NULL, NULL, NULL),
(19, 19, 9, NULL, NULL, NULL),
(20, 20, 10, NULL, NULL, NULL),
(21, 21, 8, NULL, NULL, NULL),
(22, 22, 7, NULL, NULL, NULL),
(23, 23, 12, NULL, NULL, NULL),
(24, 24, 12, NULL, NULL, NULL),
(25, 25, 11, NULL, NULL, NULL),
(26, 26, 11, NULL, NULL, NULL),
(27, 27, 10, NULL, NULL, NULL),
(28, 28, 10, NULL, NULL, NULL),
(29, 29, 9, NULL, NULL, NULL),
(30, 30, 10, NULL, NULL, NULL),
(31, 31, 9, NULL, NULL, NULL),
(32, 32, 9, NULL, NULL, NULL),
(33, 33, 8, NULL, NULL, NULL),
(34, 34, 9, NULL, NULL, NULL),
(35, 35, 8, NULL, NULL, NULL),
(36, 36, 7, NULL, NULL, NULL),
(37, 37, 14, NULL, NULL, NULL),
(38, 38, 14, NULL, NULL, NULL),
(39, 39, 12, NULL, NULL, NULL),
(40, 40, 11, NULL, NULL, NULL),
(41, 41, 11, NULL, NULL, NULL),
(42, 42, 11, NULL, NULL, NULL),
(43, 43, 16, NULL, NULL, NULL),
(44, 44, 14, NULL, NULL, NULL),
(45, 45, 12, NULL, NULL, NULL),
(46, 46, 10, NULL, NULL, NULL),
(47, 47, 12, NULL, NULL, NULL),
(48, 48, 10, NULL, NULL, NULL),
(49, 49, 8, NULL, NULL, NULL),
(50, 50, 10, NULL, NULL, NULL),
(51, 51, 8, NULL, NULL, NULL),
(52, 52, 10, NULL, NULL, NULL),
(53, 53, 7, NULL, NULL, NULL),
(54, 54, 5, NULL, NULL, NULL),
(55, 55, 7, NULL, NULL, NULL),
(56, 56, 7, NULL, NULL, NULL),
(57, 57, 7, NULL, NULL, NULL),
(58, 58, 7, NULL, NULL, NULL),
(59, 59, 7, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `td_surattugas_header`
--

CREATE TABLE `td_surattugas_header` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `nama_tugas` varchar(255) NOT NULL,
  `jenis_tugas` int(11) NOT NULL,
  `tanggal_tugas_awal` date NOT NULL,
  `tanggal_tugas_akhir` date NOT NULL,
  `penandatangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', 'admin@example.com', 'admin', '$2y$10$H4cpetB4HC5001Wqc68sU.M7e17qqex0zuqpm21DZGPvsGxanFEUm', 'Rjk6YfztkhLOZFHxCCj9GzB7kZlkLA6YxCvtGXxy56n7llgT6lZP4uCneC34', '2020-08-19 01:25:18', '2020-08-19 01:25:18'),
(2, 'Ropita Elisabeth Simanjuntak', 'pegawai', NULL, '90951218020949', '$2y$10$lrfwYz0ec2r1JDYwP4zOqORRdEULXI2DaD0N7v83YlkEw4IszmIk.', 'BO62fFLDj7Gu0XkZQjqJQDNWScYNXXUCUEvdQvcMp7nhldQ8BFoGR7DJiCWO', '2021-04-30 17:55:51', '2021-04-30 17:55:51'),
(3, 'Jenny Sovanny Elisabeth', NULL, NULL, '90910118020945', '$2y$10$EDYe3Au1xD8IJC2t6UXuSOsZbeEphPp6yKRrJ.p1jbPmduCpH.6w.', 'OIWexgb1DXiMvnrMRZUCaMA9MzbQ7JInlrHtCUZvxZG1kqbcRWazgW5zrqms', '2021-05-01 16:17:14', '2021-05-01 16:17:14'),
(4, 'Iren Sunhaganta Sitepu', NULL, NULL, '90920618010950', '$2y$10$GwTmzqmY1WXbFLgfzdreAOuWdu5oCkJNeH25kz3jWW6HUO/9353am', 'eUZZbQRsVkkNyQ05RnuZp1v75luOa8Pwe1utuNeudeQHz87NULjU3zPOWBkv', '2021-05-02 08:22:14', '2021-05-02 08:22:14'),
(5, 'Ridzki Chandra Mukti', NULL, NULL, '90940818100954', '$2y$10$bJRbmmibxXb8hc2PeR.yTO2rD5SyKc6IA6RZ8vfdAd8YHQr9HBb4i', 'Bf0QO5XVKfyad7ZqkXLgw1ROI62QiiT33GN6YCPp21u1iKiZBVdJJdGPg063', '2021-05-02 08:25:07', '2021-05-02 08:25:07'),
(6, 'Hairunissa', NULL, NULL, '90930418100569', '$2y$10$IzPLAx7m3OPb7Kq8uVJ0iu3BTahgyH1FY.67yhNs8UFnW3KbpF8Xy', 'uizdRhNIj4aBFGRl1IGzkpdXMRqkx7QOeo306edbXZXebwckcpImCtz1jIyt', '2021-05-02 08:36:30', '2021-05-02 08:36:30'),
(7, 'Sari Mustika Rizky', NULL, NULL, '90920919020951', '$2y$10$hVfhlk6d1t2Po.icJtdLWOAAUB41zBqUEMf7XUvYa.fgjdVQ6pYBS', 'L8TuXhG54zey952tME1qXr5eJDas5NMS0wdiyoIKcDC2sent18pAtt4YDQu5', '2021-05-02 08:39:27', '2021-05-02 08:39:27'),
(8, 'Septriany Wahyu Sitohang', NULL, NULL, '90930918100952', '$2y$10$bJ9iVjBOSQxjgNVw.aajhOeefAJx7r00VTUPVWhVGsyBfoESHmdyO', 'K3yekWSe7X6y5keZ4q1A6OnEO7r0aRlYtLj953JHUWZkMy1jMXxX8HxCYZtH', '2021-05-02 08:42:49', '2021-05-02 08:42:49'),
(9, 'Yolanda Febrina Samosir', NULL, NULL, '90930418100500', '$2y$10$AJlBK6lev1UzMbvE7V32Je43gOQG6qt83k94yS4hxkahigE7LtcxS', 'Ce5bZ7j19J5uHLKYFxrYvjEsTKKtEqmhEnFtjt9MjbVylwxHxau0PkYqJr69', '2021-05-02 08:44:50', '2021-05-02 08:44:50'),
(10, 'Cita Sitohang', NULL, NULL, '90940318100706', '$2y$10$OQjvlCA5zLvICZTwdW7uQ.XlLrCyHJBVNMJpv5ZbGvSvaep7SRWJu', 'qB0izRVOmrsBk4rdxqK61C0YqpRmp2pOfxZUD4O4kynMBI7khqrQYk00UEME', '2021-05-02 08:46:38', '2021-05-02 08:46:38'),
(11, 'Novita Syahriani Pane', NULL, NULL, '90921118100953', '$2y$10$X0gvTiYOyv930VyVdbDDAeOebocumCDEdVW9Dg13Fo/FFSRA8dqHm', '58l1dmyVDOUNp10059FM0SPuWlMT08ykmdafeWu0dknkm2vCi6RxXX2CcqCQ', '2021-05-02 08:50:13', '2021-05-02 08:50:13'),
(12, 'Ferdinan H. Banjarnahor', NULL, NULL, '90951118100572', '$2y$10$xbOHaPylIxbAuVkS3hZzPOY66vl70ChIJHaskezr2ptXZg3p2zImW', '0RHJsUwibN0bxX0HcjEzaaxNaqkgaNavwMHsxOLfY56o033kUUgt3mN1wF4W', '2021-05-02 08:51:38', '2021-05-02 08:51:38'),
(13, 'Yilga Cindya Dewi Munthe', NULL, NULL, '90930918100561', '$2y$10$AopDTv.R8twCX98HN9yJReWvVHgoqhC0iDGv/WRfCCqzicvAHW5HC', '3F1VUPPYy9ziFP4TunPnvshOtAfLvvouXbyPzmbMPpoAWW4StlLArzHrvGy8', '2021-05-02 08:53:15', '2021-05-02 08:53:15'),
(14, 'Dwi Ganar Prabowo', NULL, NULL, '50201701100355', '$2y$10$kOLsHuG4OjheyxCSEAA0k.UKO5FUZSU7thxOgHgigymLXEq1vJLE.', 'DhqiUbS0V3SicE9MPW1UNm6NqiMb5QRAtNRg4ueHMTVfLbDuc2rXV6sfQO1L', '2021-05-02 09:02:14', '2021-05-02 09:02:14'),
(15, 'Hamdani Sihite', NULL, NULL, '50201701100356', '$2y$10$0j4xC9NVAg2zSvKNp0ERyOhHSPqgzPLsUqbUkQKVWJTQ1RXhXenve', 'j1gFyZnOfFpPIdRakJaz3wdOYhsjPb6xMMS9xIZbrrL0kEC3pi2GovKaUHji', '2021-05-02 09:10:36', '2021-05-02 09:10:36'),
(16, 'T. M. Iqbal Nugraha', NULL, NULL, '90900619010958', '$2y$10$22VCmwQSvw8KwWqZUo2VBuL/NcoRei4m2/T..iRKEnrAFsHbVathS', '8i6sEnStjlURGKdd4fMAYeO1qubfXwM51NsDruxfzZXxJY2QeXPSZBC0gSQP', '2021-05-02 09:12:08', '2021-05-02 09:12:08'),
(17, 'Indra Syahputra', NULL, NULL, '50201006100012', '$2y$10$5OfOxTx7.w0uBOG2TsmhuOlyezxQHRiLywVv7XVsX7qRAw4j6NnHS', 'soTTzlajhjhkB51s08BlmKepwncTvQjXmGi3ofgLD6yTDXm24gvhiBfgI2Pz', '2021-05-02 09:25:52', '2021-05-02 09:25:52'),
(18, 'Indra Syahputra', NULL, NULL, '50201006100012', '$2y$10$JDhxU0.DjZNU4C3CL228le9wWUSc3UcPCkrzhyO9KsIFRgkLvzimW', 'zw5JFNWk1Wpp6IR2jeDyoq1084RDRKa9fn5jJ0R2iFvh2BFwSB7n8ldvlJuM', '2021-05-02 09:25:52', '2021-05-02 09:25:52'),
(19, 'Andi Yuswotomo', NULL, NULL, '50201701100353', '$2y$10$kZwv8hLZGCIwJbyK7ROsROISPc6E5bpVMfOr8JTDu6l01BZG7OWPK', 'VPq9hPtqVhJA6AkksT3z9houXgcsdV0VTmHX3ynNqmORTa0W5OAGlBiQECFe', '2021-05-02 09:27:25', '2021-05-02 09:27:25'),
(20, 'Khuwailid Nasution', NULL, NULL, '50201201100042', '$2y$10$vRUY9dcQVK9M9d/Y/fpUl.igagBcFeg7I9tQjeMY3mw7VG8gH/CbK', 'EhMffDnZW1KZVy2IQ6bGtTd5MWPnTAcdWYBkddsdcYH8uWNaRmsYhaAirjDx', '2021-05-02 09:29:35', '2021-05-02 09:29:35'),
(21, 'Santun Lumban Gaol', NULL, NULL, '50201701200354', '$2y$10$qTLVqmJhGwPs7zofuMUTJe6IGSacqgKFRraxgK8/EmYrWLVbLGXvK', 'QlSaKI1kp4Tg3eSbdBwA1knwYn76y7m95NvIGZtrfo7ynngkB1D2fZwBfLl3', '2021-05-02 11:52:11', '2021-05-02 11:52:11'),
(22, 'Muhammad Arifin', NULL, NULL, '90790619040970', '$2y$10$HvfRkW7y5fyhitawK1s3r.3BTxc20M/.t0ckpGVmNdXhYPP.nndBG', '2Mnfukh4E8r886jn5BTqUfXlsp55ntPYTJDgyEHsZBoXiykAehNjIwhRlj9Q', '2021-05-02 11:56:54', '2021-05-02 11:56:54'),
(23, 'Fadli', NULL, NULL, '90981119010956', '$2y$10$4Q94KJh9okuVRjH2qnk9OeFNw5r4SpVSKafoJ0qvBVPQXNH12bVmm', 'xS9Mtzg5Gif7WADSQPdYEmkyU3qxpQyySxF1RJs5P7RmTrZA3S9T0jDh6WN0', '2021-05-02 11:59:18', '2021-05-02 11:59:18'),
(24, 'Mhd. Muchlis Situmorang', NULL, NULL, '90770219012018', '$2y$10$iryp6To3/5sXFduesRLLpecUOlx.vTr1oeVVFjdWyNHRdI2AUyLo2', 'bCnBtOF5Ycy9TH7cJPJASWVaQB2tdOTc710wD2Wdfy7ACBb05wJs2wPJxIuo', '2021-05-02 12:00:34', '2021-05-02 12:00:34'),
(25, 'Muhammad Saputra', NULL, NULL, '90770619010957', '$2y$10$GjiWJb.Hc5lJAP5iH20dU.gL3CpxsdzPz/GKiNIxuo9YuLI7hUmuS', 'vZz49oMFdX039LBPimKfzmc4WCkaPKy8OnccbMvzQC9CgxT8yoMZRFxmyORF', '2021-05-02 12:02:01', '2021-05-02 12:02:01'),
(26, 'Ahmadi', NULL, NULL, '50201701100042', '$2y$10$g6VNdmFhgfRZQUZhA2ffIe/yfHeSaVoCZHgWwPya0MeCGn1ozJnHO', 'HvOQo2pvlI8lYh5Mg2TiiCPvj4PD2ISXCICp2kmEbvdBofrGxIPuL4fxIJ5I', '2021-05-02 12:03:44', '2021-05-02 12:03:44'),
(27, 'Cindy Aurellia Turnip', NULL, NULL, '90990719011815', '$2y$10$GkvUaFfzCyDU9T5TIBHyouQsGPlXv4/7zpy7Rru83OwSJRrwbWgBG', 'acVmKJBzCawinVnHFabhBZKLwo5TvBhpvKiqShK9og9vJ9fdXp9AHvW4j4P6', '2021-05-02 12:06:09', '2021-05-02 12:06:09'),
(28, 'Fahri Yunanda', NULL, NULL, '90890719010960', '$2y$10$KDYQiF7A2IlsirHMRiSsweMfKTsZp9Sq.BrHRGY/2mQpqLVmOneFm', 'lj5bfD6FGutmS6E0mzmUN9CN8fTGCyKwFG3Rfhh0VcjPQRrYwc0EjafHSzZJ', '2021-05-02 12:06:55', '2021-05-02 12:06:55'),
(29, 'Fahrurrozi Hidayah', NULL, NULL, '90960819010961', '$2y$10$/9PgRs0Yb/YuRFzNeip0Fuqc3WHIzjUlsoeuYNUL2Ud9C9ahO.172', '6sPRlJI9gKjkR2DR7oihFe0NKfWTS1riAYObaWcrDfMuGSApB0AlS5xbzasz', '2021-05-02 12:09:10', '2021-05-02 12:09:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `md_jabatan`
--
ALTER TABLE `md_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_jenis_jabatan`
--
ALTER TABLE `md_jenis_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_jenjang_jabatan`
--
ALTER TABLE `md_jenjang_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_pangkat`
--
ALTER TABLE `md_pangkat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `md_pegawai`
--
ALTER TABLE `md_pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `td_jabatan_pegawai`
--
ALTER TABLE `td_jabatan_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_lembur_detail`
--
ALTER TABLE `td_lembur_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_lembur_header`
--
ALTER TABLE `td_lembur_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_login_history`
--
ALTER TABLE `td_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_pangkat_pegawai`
--
ALTER TABLE `td_pangkat_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `td_surattugas_header`
--
ALTER TABLE `td_surattugas_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `md_jabatan`
--
ALTER TABLE `md_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `md_jenis_jabatan`
--
ALTER TABLE `md_jenis_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `md_jenjang_jabatan`
--
ALTER TABLE `md_jenjang_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `md_pangkat`
--
ALTER TABLE `md_pangkat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `md_pegawai`
--
ALTER TABLE `md_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `td_jabatan_pegawai`
--
ALTER TABLE `td_jabatan_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `td_lembur_detail`
--
ALTER TABLE `td_lembur_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `td_lembur_header`
--
ALTER TABLE `td_lembur_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `td_login_history`
--
ALTER TABLE `td_login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `td_pangkat_pegawai`
--
ALTER TABLE `td_pangkat_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `td_surattugas_header`
--
ALTER TABLE `td_surattugas_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
