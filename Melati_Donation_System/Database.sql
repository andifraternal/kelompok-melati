-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 5.7.15-log - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for db_melati
DROP DATABASE IF EXISTS `db_melati`;
CREATE DATABASE IF NOT EXISTS `db_melati` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_melati`;


-- Dumping structure for table db_melati.m_donatur
DROP TABLE IF EXISTS `m_donatur`;
CREATE TABLE IF NOT EXISTS `m_donatur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nomor` varchar(45) DEFAULT NULL,
  `Nama` varchar(45) DEFAULT NULL,
  `Tanggal_lahir` date DEFAULT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `Kecamatan` varchar(255) DEFAULT NULL,
  `Kota` varchar(255) DEFAULT NULL,
  `Provinsi` varchar(255) DEFAULT NULL,
  `Profesi` varchar(255) DEFAULT NULL,
  `Hp` varchar(255) DEFAULT NULL,
  `Status` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_melati.m_donatur: ~0 rows (approximately)
DELETE FROM `m_donatur`;
/*!40000 ALTER TABLE `m_donatur` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_donatur` ENABLE KEYS */;


-- Dumping structure for table db_melati.m_jenis_penerima
DROP TABLE IF EXISTS `m_jenis_penerima`;
CREATE TABLE IF NOT EXISTS `m_jenis_penerima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Jenis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_melati.m_jenis_penerima: ~2 rows (approximately)
DELETE FROM `m_jenis_penerima`;
/*!40000 ALTER TABLE `m_jenis_penerima` DISABLE KEYS */;
INSERT INTO `m_jenis_penerima` (`id`, `Jenis`) VALUES
	(1, 'Beasiswa Pendidikan'),
	(2, 'Bantuan Operasional ');
/*!40000 ALTER TABLE `m_jenis_penerima` ENABLE KEYS */;


-- Dumping structure for table db_melati.m_penerima
DROP TABLE IF EXISTS `m_penerima`;
CREATE TABLE IF NOT EXISTS `m_penerima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_m_jenis_penerima` int(11) DEFAULT '0',
  `Nama` varchar(50) DEFAULT '0',
  `Info1` varchar(50) DEFAULT '0',
  `Info2` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_melati.m_penerima: ~0 rows (approximately)
DELETE FROM `m_penerima`;
/*!40000 ALTER TABLE `m_penerima` DISABLE KEYS */;
/*!40000 ALTER TABLE `m_penerima` ENABLE KEYS */;


-- Dumping structure for table db_melati.t_keluar
DROP TABLE IF EXISTS `t_keluar`;
CREATE TABLE IF NOT EXISTS `t_keluar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_m_penerima` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `nominal` double DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_melati.t_keluar: ~0 rows (approximately)
DELETE FROM `t_keluar`;
/*!40000 ALTER TABLE `t_keluar` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_keluar` ENABLE KEYS */;


-- Dumping structure for table db_melati.t_terima
DROP TABLE IF EXISTS `t_terima`;
CREATE TABLE IF NOT EXISTS `t_terima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_m_donatur` int(11) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `nominal` double DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_melati.t_terima: ~0 rows (approximately)
DELETE FROM `t_terima`;
/*!40000 ALTER TABLE `t_terima` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_terima` ENABLE KEYS */;


-- Dumping structure for view db_melati.v_keluar
DROP VIEW IF EXISTS `v_keluar`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_keluar` (
	`id` INT(11) NOT NULL,
	`id_m_jenis_penerima` INT(11) NULL,
	`Nama` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Info1` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Info2` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Jenis` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`tanggal` DATE NULL,
	`nominal` DOUBLE NULL,
	`note` TEXT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view db_melati.v_terima
DROP VIEW IF EXISTS `v_terima`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_terima` (
	`id_donatur` INT(11) NOT NULL,
	`Nomor` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`Nama` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`Tanggal_lahir` DATE NULL,
	`Alamat` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`Kecamatan` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`Kota` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`Provinsi` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`Profesi` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`Hp` VARCHAR(255) NULL COLLATE 'utf8_general_ci',
	`Status` ENUM('Y','N') NULL COLLATE 'utf8_general_ci',
	`Tanggal` DATE NULL,
	`nominal` DOUBLE NULL,
	`note` TEXT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view db_melati.v_keluar
DROP VIEW IF EXISTS `v_keluar`;
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_keluar`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_keluar` AS select `m_penerima`.`id` AS `id`,`m_penerima`.`id_m_jenis_penerima` AS `id_m_jenis_penerima`,`m_penerima`.`Nama` AS `Nama`,`m_penerima`.`Info1` AS `Info1`,`m_penerima`.`Info2` AS `Info2`,`m_jenis_penerima`.`Jenis` AS `Jenis`,`t_keluar`.`tanggal` AS `tanggal`,`t_keluar`.`nominal` AS `nominal`,`t_keluar`.`note` AS `note` from ((`m_penerima` join `m_jenis_penerima` on((`m_penerima`.`id_m_jenis_penerima` = `m_jenis_penerima`.`Jenis`))) join `t_keluar` on((`t_keluar`.`id_m_penerima` = `m_penerima`.`id`)));


-- Dumping structure for view db_melati.v_terima
DROP VIEW IF EXISTS `v_terima`;
-- Menghapus tabel sementara dan menciptakan struktur VIEW terakhir
DROP TABLE IF EXISTS `v_terima`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_terima` AS select `m_donatur`.`id` AS `id_donatur`,`m_donatur`.`Nomor` AS `Nomor`,`m_donatur`.`Nama` AS `Nama`,`m_donatur`.`Tanggal_lahir` AS `Tanggal_lahir`,`m_donatur`.`Alamat` AS `Alamat`,`m_donatur`.`Kecamatan` AS `Kecamatan`,`m_donatur`.`Kota` AS `Kota`,`m_donatur`.`Provinsi` AS `Provinsi`,`m_donatur`.`Profesi` AS `Profesi`,`m_donatur`.`Hp` AS `Hp`,`m_donatur`.`Status` AS `Status`,`t_terima`.`Tanggal` AS `Tanggal`,`t_terima`.`nominal` AS `nominal`,`t_terima`.`note` AS `note` from (`m_donatur` join `t_terima` on((`m_donatur`.`id` = `t_terima`.`id_m_donatur`)));
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
