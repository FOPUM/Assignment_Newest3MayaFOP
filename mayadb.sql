-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mayadb
CREATE DATABASE IF NOT EXISTS `mayadb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mayadb`;

-- Dumping structure for table mayadb.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` varchar(8) NOT NULL,
  `staff_id` varchar(8) NOT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE,
  KEY `FK_coordinator_staff` (`staff_id`) USING BTREE,
  CONSTRAINT `FK_coordinator_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.admin: ~1 rows (approximately)
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`admin_id`, `staff_id`) VALUES
	('C6666', 'A1003');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table mayadb.course
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(7) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `credit_hour` int(11) NOT NULL,
  `course_category` varchar(4) NOT NULL,
  `course_year` varchar(50) NOT NULL DEFAULT '999',
  `course_sem` varchar(50) NOT NULL DEFAULT '999',
  `muet_band` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `programme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.course: ~16 rows (approximately)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`course_id`, `course_name`, `credit_hour`, `course_category`, `course_year`, `course_sem`, `muet_band`, `nationality`, `programme`) VALUES
	('GLT1018', 'PROFICIENCY IN ENGLISH I', 2, 'UC', 'ALL', 'ALL', '2', 'ALL', 'ALL'),
	('GLT1021', 'PROFICIENCY IN ENGLISH II', 2, 'UC', 'ALL', 'ALL', '3', 'ALL', 'ALL'),
	('GLT1024', 'PROFICIENCY IN ENGLISH III', 2, 'UC', 'ALL', 'ALL', '4', 'ALL', 'ALL'),
	('GLT1027', 'ADVANCED ORAL COMMUNICATION', 2, 'UC', 'ALL', 'ALL', '5&6', 'ALL', 'ALL'),
	('WIA2001', 'DATABASE', 3, 'PCC', '2', '1', 'ALL', 'ALL', 'ALL'),
	('WIC3002', 'CRYPTOGRAPHY', 3, 'SEC', 'ALL', 'ALL', 'ALL', 'ALL', 'CSN'),
	('WID3007', 'FUZZY LOGIC', 3, 'SEC', 'ALL', 'ALL', 'ALL', 'ALL', 'AI'),
	('WIE3007', 'DATA MINING AND WAREHOUSING', 3, 'SEC', 'ALL', 'ALL', 'ALL', 'ALL', 'IS&DS'),
	('WIF3005', 'SOFTWARE MAINTENANCE AND EVOLUTION', 3, 'SEC', 'ALL', 'ALL', 'ALL', 'ALL', 'SE'),
	('WIG3007', 'SPECIAL TOPICS IN MULTIMEDIA', 3, 'SEC', 'ALL', 'ALL', 'ALL', 'ALL', 'MM'),
	('WIH3003', 'BIG DATA APPLICATIONS AND ANALYTICS', 3, 'SEC', 'ALL', 'ALL', 'ALL', 'ALL', 'DS'),
	('WIX1001', 'COMPUTING MATHEMATICS I ', 3, 'FCC', '1', '1', 'ALL', 'ALL', 'ALL'),
	('WIX1002', 'FUNDAMENTALS OF PROGRAMMING', 5, 'FCC', '1', '1', 'ALL', 'ALL', 'ALL'),
	('WIX1003', 'COMPUTER SYSTEMS AND ORGANIZATION', 3, 'FCC', '1', '1', 'ALL', 'ALL', 'ALL'),
	('WIX2001', 'THINKING AND COMMUNICATION SKILLS', 3, 'FCC', '2', '1', 'ALL', 'ALL', 'ALL'),
	('WIX2002', 'PROJECT MANAGEMENT', 3, 'FCC', '2', '1', 'ALL', 'ALL', 'ALL');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- Dumping structure for table mayadb.course_occ
CREATE TABLE IF NOT EXISTS `course_occ` (
  `course_id` varchar(8) NOT NULL,
  `occ_id` varchar(20) NOT NULL,
  PRIMARY KEY (`course_id`,`occ_id`) USING BTREE,
  KEY `FK_course_occ_occ` (`occ_id`),
  KEY `FK_course_occ_course` (`course_id`),
  CONSTRAINT `FK_course_occ_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `FK_course_occ_occ` FOREIGN KEY (`occ_id`) REFERENCES `occ` (`occ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.course_occ: ~33 rows (approximately)
DELETE FROM `course_occ`;
/*!40000 ALTER TABLE `course_occ` DISABLE KEYS */;
INSERT INTO `course_occ` (`course_id`, `occ_id`) VALUES
	('GLT1018', 'GLT1018_OCC1'),
	('GLT1018', 'GLT1018_OCC2'),
	('GLT1018', 'GLT1018_OCC3'),
	('GLT1021', 'GLT1021_OCC1'),
	('GLT1021', 'GLT1021_OCC2'),
	('GLT1021', 'GLT1021_OCC3'),
	('GLT1024', 'GLT1024_OCC1'),
	('GLT1024', 'GLT1024_OCC2'),
	('GLT1024', 'GLT1024_OCC3'),
	('GLT1027', 'GLT1027_OCC1'),
	('GLT1027', 'GLT1027_OCC2'),
	('GLT1027', 'GLT1027_OCC3'),
	('WIA2001', 'WIA2001_OCC1'),
	('WIA2001', 'WIA2001_OCC2'),
	('WIC3002', 'WIC3002_OCC1'),
	('WID3007', 'WID3007_OCC1'),
	('WIE3007', 'WIE3007_OCC1'),
	('WIF3005', 'WIF3005_OCC1'),
	('WIG3007', 'WIG3007_OCC1'),
	('WIH3003', 'WIH3003_OCC1'),
	('WIX1001', 'WIX1001_OCC1'),
	('WIX1001', 'WIX1001_OCC2'),
	('WIX1001', 'WIX1001_OCC3'),
	('WIX1002', 'WIX1002_OCC1'),
	('WIX1002', 'WIX1002_OCC2'),
	('WIX1002', 'WIX1002_OCC3'),
	('WIX1003', 'WIX1003_OCC1'),
	('WIX1003', 'WIX1003_OCC2'),
	('WIX1003', 'WIX1003_OCC3'),
	('WIX2001', 'WIX2001_OCC1'),
	('WIX2001', 'WIX2001_OCC2'),
	('WIX2002', 'WIX2002_OCC1'),
	('WIX2002', 'WIX2002_OCC2');
/*!40000 ALTER TABLE `course_occ` ENABLE KEYS */;

-- Dumping structure for table mayadb.lab
CREATE TABLE IF NOT EXISTS `lab` (
  `lab_id` varchar(50) NOT NULL,
  `lab_day` varchar(20) DEFAULT NULL,
  `lab_start_time` time DEFAULT NULL,
  `lab_end_time` time DEFAULT NULL,
  `lab_name` varchar(50) NOT NULL,
  `lab_location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.lab: ~4 rows (approximately)
DELETE FROM `lab`;
/*!40000 ALTER TABLE `lab` DISABLE KEYS */;
INSERT INTO `lab` (`lab_id`, `lab_day`, `lab_start_time`, `lab_end_time`, `lab_name`, `lab_location`) VALUES
	('NONE', NULL, NULL, NULL, 'NONE', NULL),
	('WIX1002_A1', 'THURS', '10:00:00', '12:00:00', 'FUNDAMENTALS OF PROGRAMMING\r\n', 'Makmal Mikro 3 FSKTM (60)'),
	('WIX1002_A2', 'THURS', '10:00:00', '12:00:00', 'FUNDAMENTALS OF PROGRAMMING\r\n', 'Makmal Lanjutan FSKTM (33)\r\n'),
	('WIX1002_A3', 'FRI', '10:00:00', '12:00:00', 'FUNDAMENTALS OF PROGRAMMING\r\n', 'Makmal Mikro 3 FSKTM (60)');
/*!40000 ALTER TABLE `lab` ENABLE KEYS */;

-- Dumping structure for table mayadb.lecture
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecture_id` varchar(50) NOT NULL,
  `lecture_day` varchar(20) DEFAULT NULL,
  `lecture_start_time` time DEFAULT NULL,
  `lecture_end_time` time DEFAULT NULL,
  `lecture_name` varchar(50) NOT NULL,
  `lecture_location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.lecture: ~15 rows (approximately)
DELETE FROM `lecture`;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` (`lecture_id`, `lecture_day`, `lecture_start_time`, `lecture_end_time`, `lecture_name`, `lecture_location`) VALUES
	('NONE', NULL, NULL, NULL, 'NONE', NULL),
	('WIA2001_L1', 'MON', '14:00:00', '16:00:00', 'DATABASE', 'VIRTUAL'),
	('WIA2001_L2', 'MON', '14:00:00', '16:00:00', 'DATABASE\r\n', 'VIRTUAL'),
	('WIC3002_L1', 'WED', '09:00:00', '11:00:00', 'CRYPTOGRAPHY', 'VIRTUAL'),
	('WID3007_L1', 'TUES', '16:00:00', '18:00:00', 'FUZZY LOGIC', 'VIRTUAL'),
	('WIE3007_L1', 'WED', '16:00:00', '18:00:00', 'DATA MINING AND WAREHOUSING', 'VIRTUAL'),
	('WIF3005_L1', 'TUES', '16:00:00', '18:00:00', 'SOFTWARE MAINTENANCE AND EVOLUTION', 'VIRTUAL'),
	('WIG3007_L1', 'TUES', '15:00:00', '18:00:00', 'SPECIAL TOPICS IN MULTIMEDIA', 'VIRTUAL'),
	('WIH3003_L1', 'TUES', '09:00:00', '12:00:00', 'BIG DATA APPLICATIONS AND ANALYTICS', 'VIRTUAL'),
	('WIX1001_L1', 'MON', '16:00:00', '18:00:00', 'COMPUTING MATHEMATICS I \r\n', 'VIRTUAL'),
	('WIX1001_L2', 'MON', '16:00:00', '18:00:00', 'COMPUTING MATHEMATICS I \r\n', 'VIRTUAL'),
	('WIX1002_L1', 'MON', '09:00:00', '11:00:00', 'FUNDAMENTALS OF PROGRAMMING\r\n', 'VIRTUAL'),
	('WIX1003_L1', 'WED', '09:00:00', '11:00:00', 'COMPUTER SYSTEMS AND ORGANIZATION\r\n', 'VIRTUAL'),
	('WIX2002_L1', 'MON', '09:00:00', '11:00:00', 'PROJECT MANAGEMENT\r\n', 'VIRTUAL'),
	('WIX2002_L2', 'MON', '09:00:00', '11:00:00', 'PROJECT MANAGEMENT\r\n', 'VIRTUAL');
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;

-- Dumping structure for table mayadb.occ
CREATE TABLE IF NOT EXISTS `occ` (
  `occ_id` varchar(20) NOT NULL DEFAULT '',
  `occ_name` varchar(7) NOT NULL DEFAULT '',
  `lecture_id` varchar(50) DEFAULT NULL,
  `tutorial_id` varchar(50) DEFAULT NULL,
  `lab_id` varchar(50) DEFAULT NULL,
  `occ_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`occ_id`) USING BTREE,
  KEY `FK_lecture_occ_tutor` (`tutorial_id`),
  KEY `FK_lecture_occ_lect` (`lecture_id`) USING BTREE,
  KEY `FK_lecture_occ_lab` (`lab_id`),
  CONSTRAINT `FK_lecture_occ_lab` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`lab_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_lecture_occ_lect` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`lecture_id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_lecture_occ_tutor` FOREIGN KEY (`tutorial_id`) REFERENCES `tutorial` (`tutorial_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.occ: ~33 rows (approximately)
DELETE FROM `occ`;
/*!40000 ALTER TABLE `occ` DISABLE KEYS */;
INSERT INTO `occ` (`occ_id`, `occ_name`, `lecture_id`, `tutorial_id`, `lab_id`, `occ_capacity`) VALUES
	('GLT1018_OCC1', 'OCC1', 'NONE', 'GLT1018_T1', 'NONE', 18),
	('GLT1018_OCC2', 'OCC2', 'NONE', 'GLT1018_T2', 'NONE', 20),
	('GLT1018_OCC3', 'OCC3', 'NONE', 'GLT1018_T3', 'NONE', 20),
	('GLT1021_OCC1', 'OCC1', 'NONE', 'GLT1021_T1', 'NONE', 20),
	('GLT1021_OCC2', 'OCC2', 'NONE', 'GLT1021_T2', 'NONE', 22),
	('GLT1021_OCC3', 'OCC3', 'NONE', 'GLT1021_T3', 'NONE', 22),
	('GLT1024_OCC1', 'OCC1', 'NONE', 'GLT1024_T1', 'NONE', 22),
	('GLT1024_OCC2', 'OCC2', 'NONE', 'GLT1024_T2', 'NONE', 22),
	('GLT1024_OCC3', 'OCC3', 'NONE', 'GLT1024_T3', 'NONE', 22),
	('GLT1027_OCC1', 'OCC1', 'NONE', 'GLT1027_T1', 'NONE', 27),
	('GLT1027_OCC2', 'OCC2', 'NONE', 'GLT1027_T2', 'NONE', 26),
	('GLT1027_OCC3', 'OCC3', 'NONE', 'GLT1027_T3', 'NONE', 26),
	('WIA2001_OCC1', 'OCC1', 'WIA2001_L1', 'WIA2001_T1', 'NONE', 52),
	('WIA2001_OCC2', 'OCC2', 'WIA2001_L2', 'WIA2001_T2', 'NONE', 52),
	('WIC3002_OCC1', 'OCC1', 'WIC3002_L1', 'WIC3002_T1', 'NONE', 100),
	('WID3007_OCC1', 'OCC1', 'WID3007_L1', 'WID3007_T1', 'NONE', 80),
	('WIE3007_OCC1', 'OCC1', 'WIE3007_L1', 'WIE3007_T1', 'NONE', 80),
	('WIF3005_OCC1', 'OCC1', 'WIF3005_L1', 'WIF3005_T1', 'NONE', 40),
	('WIG3007_OCC1', 'OCC1', 'WIG3007_L1', 'NONE', 'NONE', 50),
	('WIH3003_OCC1', 'OCC1', 'WIH3003_L1', 'NONE', 'NONE', 35),
	('WIX1001_OCC1', 'OCC1', 'WIX1001_L1', 'WIX1001_T1', 'NONE', 45),
	('WIX1001_OCC2', 'OCC2', 'WIX1001_L2', 'WIX1001_T2', 'NONE', 45),
	('WIX1001_OCC3', 'OCC3', 'WIX1001_L1', 'WIX1001_T3', 'NONE', 45),
	('WIX1002_OCC1', 'OCC1', 'WIX1002_L1', 'WIX1002_T1', 'WIX1002_A1', 50),
	('WIX1002_OCC2', 'OCC2', 'WIX1002_L1', 'WIX1002_T2', 'WIX1002_A2', 50),
	('WIX1002_OCC3', 'OCC3', 'WIX1002_L1', 'WIX1002_T3', 'WIX1002_A3', 50),
	('WIX1003_OCC1', 'OCC1', 'WIX1003_L1', 'WIX1003_T1', 'NONE', 36),
	('WIX1003_OCC2', 'OCC2', 'WIX1003_L1', 'WIX1003_T2', 'NONE', 36),
	('WIX1003_OCC3', 'OCC3', 'WIX1003_L1', 'WIX1003_T3', 'NONE', 36),
	('WIX2001_OCC1', 'OCC1', 'NONE', 'WIX2001_T1', 'NONE', 55),
	('WIX2001_OCC2', 'OCC2', 'NONE', 'WIX2001_T2', 'NONE', 55),
	('WIX2002_OCC1', 'OCC1', 'WIX2002_L1', 'WIX2002_T1', 'NONE', 60),
	('WIX2002_OCC2', 'OCC2', 'WIX2002_L2', 'WIX2002_T2', 'NONE', 60);
/*!40000 ALTER TABLE `occ` ENABLE KEYS */;

-- Dumping structure for table mayadb.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` varchar(8) NOT NULL,
  `staff_email` varchar(50) NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `staff_password` varchar(20) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.staff: ~31 rows (approximately)
DELETE FROM `staff`;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`staff_id`, `staff_email`, `staff_name`, `staff_password`) VALUES
	('A1003', 'limck@um.edu.my', 'LIM CHEE KAU', 'daeuc'),
	('A1004', 'kamara@um.edu.my', 'KAMARAZAMAN BIN MD SAID', 'tjvjaj'),
	('A1005', 'aina@um.edu.my', 'AINA AZLIN BINTI MOHAMAT ARIF', 'jrwj'),
	('A1006', 'syakirin@um.edu.my', 'NOR SYAKIRIN BINTI MOHAMED NASRUDIN', 'bhjtrarw'),
	('A1007', 'aafina@um.edu.my', 'NOR AAFINA BINTI MOHD ZAMIL', 'jjorwj'),
	('A1008', 'wongsk@um.edu.my', 'WONG SOOK KWUN', 'fxwpbt'),
	('A1009', 'kiranjeet@um.edu.my', 'KIRANJEET KAUR A/P MUKHTIAR SINGH', 'trajwsnnc'),
	('A1010', 'nazriq@um.edu.my', 'MOHD NAZRIQ BIN NOOR AHMAD', 'wjiarz'),
	('A1011', 'tanks@um.edu.my', 'TAN KEN SIANG', 'cjwtb'),
	('A1012', 'ngghp@um.edu.my', 'NG GOON HOONG PETER', 'wppqy'),
	('A1013', 'limcw@um.edu.my', 'LIM CHOY WAN', 'urvlf'),
	('A1014', 'aznul@um.edu.my', 'AZNUL QALID BIN MD SABRI', 'jiwdu'),
	('A1015', 'erma@um.edu.my', 'ERMA RAHAYU BINTI MOHD FAIZAL ABDULLAH', 'navj'),
	('A1016', 'angtf@um.edu.my', 'ANG TAN FONG', 'jwpco'),
	('A1017', 'soraya@um.edu.my', 'SITI SORAYA BINTI ABDUL RAHMAN', 'bxajhj'),
	('A1018', 'hema@um.edu.my', 'HEMA A/P SUBRAMANIAM', 'qnvj'),
	('A1019', 'teyks@um.edu.my', 'TEY KOK SOON', 'cnhtb'),
	('A1020', 'roziana@um.edu.my', 'ROZIANA BINTI RAMLI', 'axirjwj'),
	('A1021', 'emran@um.edu.my', 'EMRAN BIN MOHD TAMIL', 'nvajw'),
	('A1022', 'hanny@um.edu.my', 'HANNYZZURA BINTI PAL @ AFFAL', 'qjwwh'),
	('A1023', 'mas@um.edu.my', 'MAS IDAYU BINTI MD SABRI', 'vjb'),
	('A1024', 'hairul@um.edu.my', 'MOHD HAIRUL NIZAM BIN MD NASIR', 'qjradu'),
	('A1025', 'zaily@um.edu.my', 'NOORZAILY BIN MOHAMED NOOR', 'ijruh'),
	('A1026', 'fariza@um.edu.my', 'FARIZA HANUM BINTI MD NASARUDDIN', 'ojarij'),
	('A1027', 'maizatul@um.edu.my', 'MAIZATUL AKMAR BINTI ISMAIL', 'vjrijcdu'),
	('A1028', 'porly@um.edu.my', 'POR LIP YEE', 'yxauh'),
	('A1029', 'tehyw@um.edu.my', 'TEH YING WAH', 'cnqhf'),
	('A1030', 'hasan@um.edu.my', 'HASAN KAHTAN KHALAF', 'qjbjw'),
	('A1031', 'amirrudin@um.edu.my', 'AMIRRUDIN BIN KAMSIN', 'jvraadmrw'),
	('A1032', 'hoowl@um.edu.my', 'HOO WAI LAM', 'qxxfu'),
	('A1033', 'chiamyk@um.edu.my', 'CHIAM YIN KIA', 'lqrjvht');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- Dumping structure for table mayadb.staff_teach_course
CREATE TABLE IF NOT EXISTS `staff_teach_course` (
  `staff_id` varchar(8) NOT NULL,
  `course_id` varchar(7) NOT NULL,
  PRIMARY KEY (`staff_id`,`course_id`) USING BTREE,
  KEY `FK_teachcourse_course` (`course_id`),
  KEY `FK_teachcourse_staff` (`staff_id`),
  CONSTRAINT `FK_teachcourse_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `FK_teachcourse_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.staff_teach_course: ~34 rows (approximately)
DELETE FROM `staff_teach_course`;
/*!40000 ALTER TABLE `staff_teach_course` DISABLE KEYS */;
INSERT INTO `staff_teach_course` (`staff_id`, `course_id`) VALUES
	('A1003', 'WID3007'),
	('A1003', 'WIX1001'),
	('A1004', 'GLT1018'),
	('A1005', 'GLT1018'),
	('A1006', 'GLT1018'),
	('A1007', 'GLT1021'),
	('A1008', 'GLT1021'),
	('A1009', 'GLT1021'),
	('A1009', 'GLT1024'),
	('A1010', 'GLT1024'),
	('A1010', 'GLT1027'),
	('A1011', 'GLT1024'),
	('A1012', 'GLT1027'),
	('A1013', 'GLT1027'),
	('A1014', 'WIX1001'),
	('A1015', 'WIX1001'),
	('A1016', 'WIX1002'),
	('A1017', 'WIX1002'),
	('A1018', 'WIX1002'),
	('A1019', 'WIX1003'),
	('A1020', 'WIX1003'),
	('A1021', 'WIX1003'),
	('A1022', 'WIX2001'),
	('A1023', 'WIX2001'),
	('A1024', 'WIX2002'),
	('A1025', 'WIX2002'),
	('A1026', 'WIA2001'),
	('A1027', 'WIA2001'),
	('A1028', 'WIC3002'),
	('A1029', 'WIE3007'),
	('A1030', 'WIF3005'),
	('A1031', 'WIG3007'),
	('A1032', 'WIH3003'),
	('A1033', 'WIX2002');
/*!40000 ALTER TABLE `staff_teach_course` ENABLE KEYS */;

-- Dumping structure for table mayadb.staff_teach_lab
CREATE TABLE IF NOT EXISTS `staff_teach_lab` (
  `staff_id` varchar(8) NOT NULL,
  `lab_id` varchar(10) NOT NULL,
  PRIMARY KEY (`staff_id`,`lab_id`),
  KEY `FK_teachlab_staff` (`staff_id`) USING BTREE,
  KEY `FK_teachlab_lab` (`lab_id`) USING BTREE,
  CONSTRAINT `FK_teachlab_lab` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`lab_id`),
  CONSTRAINT `FK_teachlab_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.staff_teach_lab: ~3 rows (approximately)
DELETE FROM `staff_teach_lab`;
/*!40000 ALTER TABLE `staff_teach_lab` DISABLE KEYS */;
INSERT INTO `staff_teach_lab` (`staff_id`, `lab_id`) VALUES
	('A1016', 'WIX1002_A1'),
	('A1017', 'WIX1002_A2'),
	('A1018', 'WIX1002_A3');
/*!40000 ALTER TABLE `staff_teach_lab` ENABLE KEYS */;

-- Dumping structure for table mayadb.staff_teach_lecture
CREATE TABLE IF NOT EXISTS `staff_teach_lecture` (
  `staff_id` varchar(8) NOT NULL,
  `lecture_id` varchar(50) NOT NULL,
  PRIMARY KEY (`staff_id`,`lecture_id`) USING BTREE,
  KEY `FK_teachlecture_lecture` (`lecture_id`),
  KEY `FK_teachlecture_staff` (`staff_id`),
  CONSTRAINT `FK_teachlecture_lecture` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`lecture_id`),
  CONSTRAINT `FK_teachlecture_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.staff_teach_lecture: ~14 rows (approximately)
DELETE FROM `staff_teach_lecture`;
/*!40000 ALTER TABLE `staff_teach_lecture` DISABLE KEYS */;
INSERT INTO `staff_teach_lecture` (`staff_id`, `lecture_id`) VALUES
	('A1003', 'WID3007_L1'),
	('A1003', 'WIX1001_L1'),
	('A1015', 'WIX1001_L2'),
	('A1016', 'WIX1002_L1'),
	('A1019', 'WIX1003_L1'),
	('A1024', 'WIX2002_L1'),
	('A1026', 'WIA2001_L1'),
	('A1027', 'WIA2001_L2'),
	('A1028', 'WIC3002_L1'),
	('A1029', 'WIE3007_L1'),
	('A1030', 'WIF3005_L1'),
	('A1031', 'WIG3007_L1'),
	('A1032', 'WIH3003_L1'),
	('A1033', 'WIX2002_L2');
/*!40000 ALTER TABLE `staff_teach_lecture` ENABLE KEYS */;

-- Dumping structure for table mayadb.staff_teach_tutorial
CREATE TABLE IF NOT EXISTS `staff_teach_tutorial` (
  `staff_id` varchar(8) NOT NULL,
  `tutorial_id` varchar(50) NOT NULL,
  PRIMARY KEY (`staff_id`,`tutorial_id`) USING BTREE,
  KEY `FK_teachtutorial_tutorial` (`tutorial_id`),
  KEY `FK_teachtutorial_staff` (`staff_id`),
  CONSTRAINT `FK_teachtutorial_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `FK_teachtutorial_tutorial` FOREIGN KEY (`tutorial_id`) REFERENCES `tutorial` (`tutorial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.staff_teach_tutorial: ~31 rows (approximately)
DELETE FROM `staff_teach_tutorial`;
/*!40000 ALTER TABLE `staff_teach_tutorial` DISABLE KEYS */;
INSERT INTO `staff_teach_tutorial` (`staff_id`, `tutorial_id`) VALUES
	('A1003', 'WID3007_T1'),
	('A1003', 'WIX1001_T1'),
	('A1004', 'GLT1018_T1'),
	('A1005', 'GLT1018_T2'),
	('A1006', 'GLT1018_T3'),
	('A1007', 'GLT1021_T1'),
	('A1008', 'GLT1021_T2'),
	('A1009', 'GLT1021_T3'),
	('A1009', 'GLT1024_T1'),
	('A1010', 'GLT1024_T2'),
	('A1010', 'GLT1027_T3'),
	('A1011', 'GLT1024_T3'),
	('A1012', 'GLT1027_T1'),
	('A1013', 'GLT1027_T2'),
	('A1014', 'WIX1001_T3'),
	('A1015', 'WIX1001_T2'),
	('A1016', 'WIX1002_T1'),
	('A1017', 'WIX1002_T2'),
	('A1018', 'WIX1002_T3'),
	('A1020', 'WIX1003_T1'),
	('A1021', 'WIX1003_T2'),
	('A1021', 'WIX1003_T3'),
	('A1022', 'WIX2001_T1'),
	('A1023', 'WIX2001_T2'),
	('A1025', 'WIX2002_T1'),
	('A1026', 'WIA2001_T1'),
	('A1027', 'WIA2001_T2'),
	('A1028', 'WIC3002_T1'),
	('A1029', 'WIE3007_T1'),
	('A1030', 'WIF3005_T1'),
	('A1033', 'WIX2002_T2');
/*!40000 ALTER TABLE `staff_teach_tutorial` ENABLE KEYS */;

-- Dumping structure for table mayadb.student
CREATE TABLE IF NOT EXISTS `student` (
  `matric_num` varchar(8) NOT NULL,
  `siswamail` varchar(50) NOT NULL,
  `student_password` varchar(30) NOT NULL,
  `student_name` varchar(20) NOT NULL,
  `student_batch` varchar(9) NOT NULL DEFAULT '2021/2022',
  `student_faculty` varchar(50) NOT NULL DEFAULT 'Faculty of Computer Science and Information System',
  `student_muet_band` int(11) NOT NULL DEFAULT 0,
  `student_programme` varchar(30) NOT NULL,
  `student_gender` char(1) NOT NULL,
  `student_race` varchar(20) NOT NULL,
  `student_date_of_birth` date NOT NULL,
  `student_studyyear` int(11) NOT NULL,
  `student_studysem` int(11) NOT NULL,
  `student_nationality` varchar(20) NOT NULL,
  `student_specialisation` varchar(20) DEFAULT NULL,
  `student_ic_passport` varchar(50) NOT NULL,
  `credit_hour` int(11) NOT NULL DEFAULT 0,
  `enrolled_status` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`matric_num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.student: ~23 rows (approximately)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`matric_num`, `siswamail`, `student_password`, `student_name`, `student_batch`, `student_faculty`, `student_muet_band`, `student_programme`, `student_gender`, `student_race`, `student_date_of_birth`, `student_studyyear`, `student_studysem`, `student_nationality`, `student_specialisation`, `student_ic_passport`, `credit_hour`, `enrolled_status`) VALUES
	('17203133', '17203133@siswa.um.edu.my', 'yjbbfxam02', 'JESSIE J', '2021/2022', 'Faculty of Computer Science and Information System', 6, 'AI', 'F', 'Other', '2002-12-04', 1, 1, 'Other', NULL, '1099653423', 0, 'Y'),
	('17210287', '172102877@siswa.um.edu.my', 'yjbbfxam8', 'TOM HOLLAND', '2021/2022', 'Faculty of Computer Science and Information System', 6, 'IS', 'M', 'Other', '2002-07-20', 1, 1, 'Other', NULL, 'B2765444', 0, 'Y'),
	('17442331', '17442331@siswa.um.edu.my', 'yjbbfxam03', 'ADELE ADKINS', '2021/2022', 'Faculty of Computer Science and Information System', 5, 'SE', 'F', 'Other', '2002-06-18', 1, 1, 'Other', NULL, '1563448776', 0, 'Y'),
	('s2103441', 's2103441@siswa.um.edu.my', 'yjbbfxam00', 'HALIF PORTER', '2021/2022', 'Faculty of Computer Science and Information System', 5, 'DS', 'F', 'Other', '2002-10-10', 1, 1, 'Malaysian', NULL, '021010021088', 0, 'Y'),
	('s2106588', 's2106588@siswa.um.edu.my', 'yjbbfxam09', 'MONICA CHENG', '2021/2022', 'Faculty of Computer Science and Information System', 4, 'DS', 'F', 'Chinese', '2001-04-04', 1, 1, 'Malaysian', NULL, '010404040444', 0, 'Y'),
	('u2102111', 'u2102111@siswa.um.edu.my', 'yjbbfxam07', 'FARIHIN AZIZ', '2021/2022', 'Faculty of Computer Science and Information System', 4, 'CSN', 'M', 'Malay', '2002-12-12', 1, 1, 'Malaysian', NULL, '021212021211', 0, 'Y'),
	('u2102131', 'u2102131@siswa.um.edu.my', 'yjbbfxam01', 'MOHD ALI', '2021/2022', 'Faculty of Computer Science and Information System', 5, 'DS', 'M', 'Malay', '2002-08-31', 1, 1, 'Malaysian', NULL, '020831010831', 0, 'Y'),
	('u2102264', 'u2102264@siswa.um.edu.my', 'yjbbfxam6', 'WINNIE SEE JING PIN', '2021/2022', 'Faculty of Computer Science and Information System', 3, 'CSN', 'M', 'Chinese', '2002-06-04', 1, 1, 'Other', NULL, '1522414401', 0, 'Y'),
	('u2102534', 'u2102534@siswa.um.edu.my', 'yjbbfxam7', 'SANCHITA LEVI', '2021/2022', 'Faculty of Computer Science and Information System', 5, 'AI', 'F', 'Indian', '2001-10-18', 1, 1, 'Malaysian', NULL, '011018020122', 0, 'Y'),
	('u2102554', 'u2102554@siswa.um.edu.my', 'yjbbfxam3', 'SAMUEL OSCAR', '2021/2022', 'Faculty of Computer Science and Information System', 5, 'IS', 'M', 'Indian', '2001-09-29', 1, 1, 'Malaysian', NULL, '010929071213', 0, 'Y'),
	('u2102599', 'u2102599@siswa.um.edu.my', 'yjbbfxam06', 'CARROT HONG KAI REN', '2021/2022', 'Faculty of Computer Science and Information System', 4, 'SE', 'M', 'Chinese', '2002-06-10', 1, 1, 'Malaysian', NULL, '020610070321', 0, 'Y'),
	('u2102656', 'u2102656@siswa.um.edu.my', 'yjbbfxam5', 'SITI NORHALIZA', '2021/2022', 'Faculty of Computer Science and Information System', 4, 'MM', 'F', 'Malay', '2002-03-20', 1, 1, 'Malaysian', NULL, '020320041332', 0, 'Y'),
	('u2102665', 'u2102665@siswa.um.edu.my', 'yjbbfxam19', 'SHILA AMZAH', '2021/2022', 'Faculty of Computer Science and Information System', 3, 'MM', 'F', 'Malay', '2002-05-05', 1, 1, 'Malaysian', NULL, '020505050550', 0, 'Y'),
	('u2102666', 'u2102666@siswa.um.edu.my', 'yjbbfxam2', 'MUHAMMAD RAIHAN ', '2021/2022', 'Faculty of Computer Science and Information System', 3, 'AI', 'M', 'Malay', '2002-06-16', 1, 1, 'Malaysian', NULL, '020616010455', 0, 'Y'),
	('u2102729', 'u2102729@siswa.um.edu.my', 'yjbbfxam05', 'TAN GUO DONG', '2021/2022', 'Faculty of Computer Science and Information System', 5, 'AI', 'M', 'Chinese', '2002-01-01', 1, 1, 'Malaysian', NULL, '020101010433', 0, 'Y'),
	('u2102733', 'u2102733@siswa.um.edu.my', 'yjbbfxam4', 'LIM JIA XIN', '2021/2022', 'Faculty of Computer Science and Information System', 5, 'CSN', 'F', 'Chinese', '2001-11-11', 1, 1, 'Malaysian', NULL, '021111060212', 0, 'Y'),
	('u2102772', 'u2102772@siswa.um.edu.my', 'yjbbfxam', 'CHOONG YI YANG', '2021/2022', 'Faculty of Computer Science and Information System', 4, 'SE', 'M', 'Chinese', '2002-11-15', 1, 1, 'Malaysian', NULL, '021115070651', 0, 'Y'),
	('u2102781', 'u2102781@siswa.um.edu.my', 'yjbbfxam08', 'YAP YOONG SIEW', '2021/2022', 'Faculty of Computer Science and Information System', 6, 'AI', 'M', 'Chinese', '2001-07-18', 1, 1, 'Malaysian', NULL, '010718010781', 0, 'Y'),
	('u2102796', 'u2102796@siswa.um.edu.my', 'yjbbfxam', 'NEVILLE TEH', '2021/2022', 'Faculty of Computer Science and Information System', 4, 'IS', 'M', 'Chinese', '2002-08-17', 1, 1, 'Malaysian', NULL, '020817040217', 0, 'Y'),
	('u2102797', 'u2102797@siswa.um.edu.my', 'yjbbfxam1', 'EUGENE NG', '2021/2022', 'Faculty of Computer Science and Information System', 3, 'MM', 'M', 'Chinese', '2002-02-28', 1, 1, 'Malaysian', NULL, '020228050113', 0, 'Y'),
	('u2102856', 'u2102856@siswa.um.edu.my', 'D1091745', 'NG GIH MING', '2020/2021', 'Faculty of Computer Science and Information System', 5, 'SE', 'M', 'Chinese', '2021-12-02', 1, 1, 'Malaysian', NULL, '020518070221', 0, 'Y'),
	('u2102857', 'u2102857@siswa.um.edu.my', 'D1091746', 'KWAN YANG', '2021/2022', 'Faculty of Computer Science and Information System', 0, 'SE', 'M', 'Chinese', '2022-01-03', 1, 1, 'Malaysian', NULL, '111111111111', 0, 'Y'),
	('u2102999', 'u2102999@siswa.um.edu.my', 'yjbbfxam04', 'FELICIA PIRUNTHAM', '2021/2022', 'Faculty of Computer Science and Information System', 4, 'MM', 'F', 'Indian', '2001-09-22', 1, 1, 'Malaysian', NULL, '010922030302', 0, 'Y');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table mayadb.student_take_course
CREATE TABLE IF NOT EXISTS `student_take_course` (
  `matric_num` varchar(8) NOT NULL,
  `course_id` varchar(7) NOT NULL,
  `occ_id` varchar(20) NOT NULL DEFAULT '',
  `course_status` char(1) DEFAULT NULL,
  PRIMARY KEY (`matric_num`,`course_id`),
  KEY `FK_takencourse_course` (`course_id`),
  KEY `FK_takencourse_student` (`matric_num`),
  KEY `FK_takencourse_occ` (`occ_id`),
  CONSTRAINT `FK_takencourse_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `FK_takencourse_occ` FOREIGN KEY (`occ_id`) REFERENCES `occ` (`occ_id`),
  CONSTRAINT `FK_takencourse_student` FOREIGN KEY (`matric_num`) REFERENCES `student` (`matric_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.student_take_course: ~76 rows (approximately)
DELETE FROM `student_take_course`;
/*!40000 ALTER TABLE `student_take_course` DISABLE KEYS */;
INSERT INTO `student_take_course` (`matric_num`, `course_id`, `occ_id`, `course_status`) VALUES
	('17203133', 'WID3007', 'WID3007_OCC1', 'Y'),
	('17203133', 'WIX1001', 'WIX1001_OCC2', 'Y'),
	('17203133', 'WIX1003', 'WIX1003_OCC2', 'Y'),
	('17210287', 'WIX1001', 'WIX1001_OCC2', 'Y'),
	('17210287', 'WIX1002', 'WIX1002_OCC2', 'Y'),
	('17210287', 'WIX1003', 'WIX1003_OCC3', 'Y'),
	('17442331', 'WIF3005', 'WIF3005_OCC1', 'Y'),
	('17442331', 'WIX1001', 'WIX1001_OCC1', 'Y'),
	('17442331', 'WIX1002', 'WIX1002_OCC2', 'Y'),
	('17442331', 'WIX1003', 'WIX1003_OCC1', 'Y'),
	('s2103441', 'WIH3003', 'WIH3003_OCC1', 'Y'),
	('s2103441', 'WIX1001', 'WIX1001_OCC3', 'Y'),
	('s2103441', 'WIX1002', 'WIX1002_OCC3', 'Y'),
	('s2106588', 'GLT1024', 'GLT1024_OCC3', 'Y'),
	('s2106588', 'WIH3003', 'WIH3003_OCC1', 'Y'),
	('s2106588', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('s2106588', 'WIX1003', 'WIX1003_OCC1', 'Y'),
	('u2102111', 'WIX1001', 'WIX1001_OCC2', 'Y'),
	('u2102111', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102131', 'WIH3003', 'WIH3003_OCC1', 'Y'),
	('u2102131', 'WIX1001', 'WIX1001_OCC1', 'Y'),
	('u2102131', 'WIX1002', 'WIX1002_OCC3', 'Y'),
	('u2102131', 'WIX1003', 'WIX1003_OCC2', 'Y'),
	('u2102264', 'GLT1021', 'GLT1021_OCC1', 'Y'),
	('u2102534', 'WIX1001', 'WIX1001_OCC3', 'Y'),
	('u2102534', 'WIX1002', 'WIX1002_OCC3', 'Y'),
	('u2102534', 'WIX1003', 'WIX1003_OCC3', 'Y'),
	('u2102554', 'WIX1001', 'WIX1001_OCC1', 'Y'),
	('u2102554', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102554', 'WIX1003', 'WIX1003_OCC2', 'Y'),
	('u2102599', 'WIX1001', 'WIX1001_OCC3', 'Y'),
	('u2102599', 'WIX1002', 'WIX1002_OCC3', 'Y'),
	('u2102599', 'WIX1003', 'WIX1003_OCC1', 'Y'),
	('u2102656', 'GLT1024', 'GLT1024_OCC2', 'Y'),
	('u2102656', 'WIG3007', 'WIG3007_OCC1', 'Y'),
	('u2102656', 'WIX1001', 'WIX1001_OCC2', 'Y'),
	('u2102656', 'WIX1002', 'WIX1002_OCC3', 'Y'),
	('u2102656', 'WIX1003', 'WIX1003_OCC3', 'Y'),
	('u2102665', 'GLT1021', 'GLT1021_OCC3', 'Y'),
	('u2102665', 'WIG3007', 'WIG3007_OCC1', 'Y'),
	('u2102665', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102665', 'WIX1003', 'WIX1003_OCC1', 'Y'),
	('u2102666', 'GLT1021', 'GLT1021_OCC1', 'Y'),
	('u2102666', 'WID3007', 'WID3007_OCC1', 'Y'),
	('u2102666', 'WIX1001', 'WIX1001_OCC3', 'Y'),
	('u2102666', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102666', 'WIX1003', 'WIX1003_OCC1', 'Y'),
	('u2102729', 'WID3007', 'WID3007_OCC1', 'Y'),
	('u2102729', 'WIX1001', 'WIX1001_OCC1', 'Y'),
	('u2102729', 'WIX1002', 'WIX1002_OCC3', 'Y'),
	('u2102729', 'WIX1003', 'WIX1003_OCC2', 'Y'),
	('u2102733', 'WIC3002', 'WIC3002_OCC1', 'Y'),
	('u2102733', 'WIX1001', 'WIX1001_OCC2', 'Y'),
	('u2102733', 'WIX1002', 'WIX1002_OCC2', 'Y'),
	('u2102772', 'GLT1024', 'GLT1024_OCC2', 'Y'),
	('u2102772', 'WIF3005', 'WIF3005_OCC1', 'Y'),
	('u2102772', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102772', 'WIX1003', 'WIX1003_OCC1', 'Y'),
	('u2102781', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102796', 'GLT1024', 'GLT1024_OCC1', 'Y'),
	('u2102796', 'WIX1001', 'WIX1001_OCC1', 'Y'),
	('u2102796', 'WIX1003', 'WIX1003_OCC2', 'Y'),
	('u2102797', 'GLT1021', 'GLT1021_OCC1', 'Y'),
	('u2102797', 'WIG3007', 'WIG3007_OCC1', 'Y'),
	('u2102797', 'WIX1001', 'WIX1001_OCC1', 'Y'),
	('u2102797', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102797', 'WIX1003', 'WIX1003_OCC3', 'Y'),
	('u2102856', 'WIX1001', 'WIX1001_OCC2', 'Y'),
	('u2102856', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102857', 'WIX1001', 'WIX1001_OCC3', 'Y'),
	('u2102857', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102999', 'GLT1024', 'GLT1024_OCC1', 'Y'),
	('u2102999', 'WIG3007', 'WIG3007_OCC1', 'Y'),
	('u2102999', 'WIX1001', 'WIX1001_OCC1', 'Y'),
	('u2102999', 'WIX1002', 'WIX1002_OCC1', 'Y'),
	('u2102999', 'WIX1003', 'WIX1003_OCC2', 'Y');
/*!40000 ALTER TABLE `student_take_course` ENABLE KEYS */;

-- Dumping structure for table mayadb.tutorial
CREATE TABLE IF NOT EXISTS `tutorial` (
  `tutorial_id` varchar(50) NOT NULL,
  `tutorial_day` varchar(20) DEFAULT NULL,
  `tutorial_start_time` time DEFAULT NULL,
  `tutorial_end_time` time DEFAULT NULL,
  `tutorial_name` varchar(50) NOT NULL,
  `tutorial_location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tutorial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table mayadb.tutorial: ~32 rows (approximately)
DELETE FROM `tutorial`;
/*!40000 ALTER TABLE `tutorial` DISABLE KEYS */;
INSERT INTO `tutorial` (`tutorial_id`, `tutorial_day`, `tutorial_start_time`, `tutorial_end_time`, `tutorial_name`, `tutorial_location`) VALUES
	('GLT1018_T1', 'MON', '10:00:00', '12:00:00', 'PROFICIENCY IN ENGLISH I', 'VIRTUAL'),
	('GLT1018_T2', 'TUES', '17:00:00', '19:00:00', 'PROFICIENCY IN ENGLISH I', 'VIRTUAL'),
	('GLT1018_T3', 'WED', '10:00:00', '12:00:00', 'PROFICIENCY IN ENGLISH I', 'VIRTUAL'),
	('GLT1021_T1', 'MON', '09:00:00', '11:00:00', 'PROFICIENCY IN ENGLISH II', 'VIRTUAL'),
	('GLT1021_T2', 'MON', '16:00:00', '18:00:00', 'PROFICIENCY IN ENGLISH II', 'VIRTUAL'),
	('GLT1021_T3', 'TUES', '09:00:00', '11:00:00', 'PROFICIENCY IN ENGLISH II', 'VIRTUAL'),
	('GLT1024_T1', 'MON', '08:00:00', '10:00:00', 'PROFICIENCY IN ENGLISH III', 'VIRTUAL'),
	('GLT1024_T2', 'MON', '11:00:00', '13:00:00', 'PROFICIENCY IN ENGLISH III', 'VIRTUAL'),
	('GLT1024_T3', 'MON', '14:00:00', '16:00:00', 'PROFICIENCY IN ENGLISH III', 'VIRTUAL'),
	('GLT1027_T1', 'MON', '14:00:00', '16:00:00', 'ADVANCED ORAL COMMUNICATION', 'VIRTUAL'),
	('GLT1027_T2', 'TUES', '14:00:00', '16:00:00', 'ADVANCED ORAL COMMUNICATION', 'VIRTUAL'),
	('GLT1027_T3', 'THURS', '14:00:00', '16:00:00', 'ADVANCED ORAL COMMUNICATION', 'VIRTUAL'),
	('NONE', NULL, NULL, NULL, 'NONE', NULL),
	('WIA2001_T1', 'WED', '12:00:00', '13:00:00', 'DATABASE', 'Makmal Mikro 3 FSKTM (60)'),
	('WIA2001_T2', 'WED', '12:00:00', '13:00:00', 'DATABASE', 'Makmal Mikro 4 FSKTM (60)'),
	('WIC3002_T1', 'FRI', '14:00:00', '15:00:00', 'CRYPTOGRAPHY', 'Makmal Mikro 3 FSKTM (60)'),
	('WID3007_T1', 'THURS', '11:00:00', '12:00:00', 'FUZZY LOGIC', 'Makmal Mikro 6 FSKTM (45)'),
	('WIE3007_T1', 'THURS', '16:00:00', '17:00:00', 'DATA MINING AND WAREHOUSING', 'Makmal Mikro 6 FSKTM (45)'),
	('WIF3005_T1', 'THURS', '16:00:00', '17:00:00', 'SOFTWARE MAINTENANCE AND EVOLUTION', 'Makmal Mikro 4 FSKTM (60)\r\n'),
	('WIX1001_T1', 'WED', '12:00:00', '13:00:00', 'COMPUTING MATHEMATICS I ', 'Dewan Kuliah 2 FSKTM (280)\r\n'),
	('WIX1001_T2', 'WED', '13:00:00', '14:00:00', 'COMPUTING MATHEMATICS I ', 'Bilik Kuliah FSKTM (75)\r\n'),
	('WIX1001_T3', 'WED', '14:00:00', '15:00:00', 'COMPUTING MATHEMATICS I ', 'Dewan Kuliah 1 FSKTM (280)\r\n'),
	('WIX1002_T1', 'THURS', '09:00:00', '10:00:00', 'FUNDAMENTALS OF PROGRAMMING', 'Makmal Mikro 3 FSKTM (60)\r\n'),
	('WIX1002_T2', 'THURS', '09:00:00', '10:00:00', 'FUNDAMENTALS OF PROGRAMMING', 'Makmal Lanjutan FSKTM (33)\r\n'),
	('WIX1002_T3', 'FRI', '09:00:00', '10:00:00', 'FUNDAMENTALS OF PROGRAMMING', 'Makmal Mikro 3 FSKTM (60)\r\n'),
	('WIX1003_T1', 'THURS', '12:00:00', '13:00:00', 'COMPUTER SYSTEMS AND ORGANIZATION', 'VIRTUAL'),
	('WIX1003_T2', 'THURS', '13:00:00', '14:00:00', 'COMPUTER SYSTEMS AND ORGANIZATION', 'VIRTUAL'),
	('WIX1003_T3', 'THURS', '12:00:00', '13:00:00', 'COMPUTER SYSTEMS AND ORGANIZATION', 'VIRTUAL'),
	('WIX2001_T1', 'TUES', '10:00:00', '13:00:00', 'THINKING AND COMMUNICATION SKILLS', 'VIRTUAL'),
	('WIX2001_T2', 'TUES', '10:00:00', '13:00:00', 'THINKING AND COMMUNICATION SKILLS', 'VIRTUAL'),
	('WIX2002_T1', 'WED', '16:00:00', '17:00:00', 'PROJECT MANAGEMENT', 'Dewan Kuliah 1 FSKTM (280)\r\n'),
	('WIX2002_T2', 'WED', '16:00:00', '17:00:00', 'PROJECT MANAGEMENT', 'Bilik Kuliah FSKTM (75)\r\n');
/*!40000 ALTER TABLE `tutorial` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
