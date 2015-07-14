-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.25a - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4168
-- Date/time:                    2015-07-07 08:14:52
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for dbsample
DROP DATABASE IF EXISTS `dbsample`;
CREATE DATABASE IF NOT EXISTS `dbsample` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbsample`;


-- Dumping structure for table dbsample.tbl_pegawai
DROP TABLE IF EXISTS `tbl_pegawai`;
CREATE TABLE IF NOT EXISTS `tbl_pegawai` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT '0',
  `jabatan` varchar(200) DEFAULT '0',
  `alamat` varchar(200) DEFAULT '0',
  `email` varchar(200) DEFAULT '0',
  `telp` varchar(200) DEFAULT '0',
  `img_url` varchar(255) DEFAULT '0',
  `lat` varchar(100) DEFAULT '0',
  `lon` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table dbsample.tbl_pegawai: ~10 rows (approximately)
/*!40000 ALTER TABLE `tbl_pegawai` DISABLE KEYS */;
INSERT INTO `tbl_pegawai` (`id`, `nama`, `jabatan`, `alamat`, `email`, `telp`, `img_url`, `lat`, `lon`) VALUES
	(18, 'Andri Kurnia ', 'Developer Java', 'Jakarta, Indonesia', 'andri@yahoo.com', '08123234345', 'http://localhost/directory/data/pictures/7.jpg', '0', '0'),
	(19, 'Rahmat Yuda', 'Developer', 'Tangerang, Indonesia', 'rahmat@gmail.com', '081324354562', 'http://localhost/directory/data/pictures/8.jpg', '0', '0'),
	(20, 'Mulyono Cahya', 'System Analis', 'Bekasi, Indonesia', 'mulyo@gmail.com', '08123434532', 'http://localhost/directory/data/pictures/9.jpg', '0', '0'),
	(21, 'Cahyani Mulia', 'Administrasi', 'Bogor, Indonesia', 'mulia@yahoo.com', '081233356345', 'http://localhost/directory/data/pictures/4.jpg', '0', '0'),
	(22, 'Tulus', 'Programmer Android', 'Jl. Sudirman No 11 A Jakarta', 'tulus@fwd.com', '089212345678', 'http://localhost/directory/data/pictures/7.jpg', '0', '0'),
	(23, 'Septian Andre', 'Supervisor', 'Denpasar, Indonesia', 'septian@gmail.com', '08132758868', 'http://localhost/directory/data/pictures/1.jpg', '0', '0'),
	(27, 'Katak', 'Business Analis', 'Kodok AMpera Raya', 'kodok@kodok.com', '87987879', 'http://localhost/directory/data/pictures/4.jpg', '0', '0'),
	(29, 'kijang loreng', 'AVP Premium', 'jalan Kijang Belang 112', 'kijang.loreng@yahoo.com', '0812222531231', 'http://localhost/directory/data/pictures/3.jpg', '0', '0'),
	(30, 'Aqessa Aninda', 'Programmer Analyst', 'Planet Bekasi', 'aqessa@gmail.com', '88554321', 'http://localhost/directory/data/pictures/3.jpg', '0', '0'),
	(31, '', '', '', '', '', 'http://10.17.21.88/directory/data/pictures/.jpg', '0', '0');
/*!40000 ALTER TABLE `tbl_pegawai` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
