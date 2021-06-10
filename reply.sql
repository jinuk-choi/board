-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- test2 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test2`;

-- 테이블 test2.tb_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_reply` (
  `seq` int(100) NOT NULL AUTO_INCREMENT,
  `idx` int(100) NOT NULL,
  `reply` varchar(50) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `indate` date DEFAULT current_timestamp(),
  `b_depth` int(11) DEFAULT NULL,
  `b_order` int(11) DEFAULT NULL,
  `b_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`seq`) USING BTREE,
  KEY `idx` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test2.tb_reply:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_reply` DISABLE KEYS */;
INSERT INTO `tb_reply` (`seq`, `idx`, `reply`, `writer`, `indate`, `b_depth`, `b_order`, `b_group`) VALUES
	(1, 3, 'ㅎㅎㅎㅎㅎ', '관리자', '2021-06-10', NULL, NULL, NULL),
	(2, 3, 'd', NULL, '2021-06-10', NULL, NULL, NULL),
	(12, 2, 'ㅇㅇㄴㅇㄹㄴㅇㄹㄴㅇ', '관리자', '2021-06-10', 1, 2, 12),
	(13, 2, '답글', '사용자2', '2021-06-10', 2, 1, 12),
	(14, 2, '답글2', '사용자2', '2021-06-10', 3, 0, 12),
	(15, 2, 'ㅎㅇㄹ', '사용자2', '2021-06-10', 1, 0, 15),
	(16, 2, 'ㅇㅇ', '사용자2', '2021-06-10', 1, 0, 16),
	(17, 2, 'ㄴㅇㄹㄴㅇㄹ', '사용자2', '2021-06-10', 1, 0, 17),
	(18, 2, 'ㅎㅎㅎ', '사용자2', '2021-06-10', 1, 0, 18),
	(19, 2, 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹ', '사용자2', '2021-06-10', 1, 0, 19),
	(20, 2, 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹ', '사용자2', '2021-06-10', 1, 0, 20),
	(21, 2, 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹ', '사용자2', '2021-06-10', 1, 0, 21),
	(22, 2, 'ㄴㅇㄹㄴㅇㄹ', '사용자2', '2021-06-10', 1, 0, 22),
	(23, 2, 'ㄹㅇㄹㄹ', '사용자2', '2021-06-10', 1, 0, 23),
	(24, 2, 'ㅇㅇㅇ', '사용자2', '2021-06-10', 1, 1, 24),
	(25, 2, 'ㄹㄹ', '관리자', '2021-06-10', 1, 0, 25),
	(26, 2, 'ㅇㄴㄹㄴㅇㄹ', '관리자', '2021-06-10', 2, 0, 24);
/*!40000 ALTER TABLE `tb_reply` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
