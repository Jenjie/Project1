-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2018 at 03:55 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `historytravel`
--

CREATE TABLE `historytravel` (
  `id` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `placeid` varchar(300) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `nameplace` varchar(500) DEFAULT NULL,
  `stayplace` varchar(10) DEFAULT NULL,
  `user_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620;

--
-- Dumping data for table `historytravel`
--

INSERT INTO `historytravel` (`id`, `email`, `placeid`, `duration`, `nameplace`, `stayplace`, `user_date`) VALUES
('281557', 'secreat.story@gmail.com', 'ChIJGbhemrhiHTERqcYDiyvXKes', '16 mins', 'BMA Dog Park ', '0', '2018-21-15 03:21'),
('281557', 'secreat.story@gmail.com', 'ChIJk6wXYtZ8HTERgDMqOUOMXlM', '35 mins', 'วิลล่ารามอินทรา The Exclusive Zone ', 'null', '2018-21-15 03:21'),
('281557', 'secreat.story@gmail.com', 'ChIJy2H8gH59HTER8nU3E-M7x_g', 'null', 'Health Park Air Force Tha Din Daeng ', 'null', '2018-21-15 03:21'),
('255443', 'secreat.story@gmail.com', 'ChIJDQrwcJyb4jARfS5g2epgSIc', '27 mins', '1518 พิบูลสงคราม Khwaeng Wong Sawang, Khet Bang Sue, Krung Thep Maha Nakhon 10800, Thailand ', '0', '2018-17-16 01:17'),
('255443', 'secreat.story@gmail.com', 'ChIJwdP_1eOY4jAR0JW-QLrsKQM', '37 mins', 'สมายลี่เบกเก้นไอซ์ ', '90', '2018-17-16 01:17'),
('255443', 'secreat.story@gmail.com', 'ChIJach1vyOD4jARUcTzmAwNZvo', 'null', 'S&P ศูนย์ราชการ แจ้งวัฒนะ ', '90', '2018-17-16 01:17');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
