-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2023 at 05:57 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mts_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors_list`
--

DROP TABLE IF EXISTS `doctors_list`;
CREATE TABLE IF NOT EXISTS `doctors_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `clinicname` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors_list`
--

INSERT INTO `doctors_list` (`id`, `name`, `clinicname`, `created_at`, `updated_at`) VALUES
(3, 'Medicine 103', 'Cras commodo euismod purus, a fermentum quam vulputate in. Duis ut dapibus est, eget efficitur dolor.', '2023-03-15 10:44:25', NULL),
(4, 'adsfds', 'dsf', '2023-05-18 21:12:16', '2023-05-18 21:40:12'),
(5, 'test doctor1', 'clinic doctor12', '2023-05-18 21:27:54', '2023-05-18 21:48:11'),
(7, 'test doctor', 'test clinic name', '2023-05-18 22:53:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicine_list`
--

DROP TABLE IF EXISTS `medicine_list`;
CREATE TABLE IF NOT EXISTS `medicine_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `med_user_id_fk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `medicine_list`
--

INSERT INTO `medicine_list` (`id`, `user_id`, `doctor_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(7, 4, 3, 'test medin', 'discripton test', '2023-05-18 22:07:21', '2023-05-18 22:53:20'),
(8, 4, 5, 'sdf', 'dsf', '2023-05-18 22:56:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

DROP TABLE IF EXISTS `schedule_list`;
CREATE TABLE IF NOT EXISTS `schedule_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `medicine_id` bigint NOT NULL,
  `day` text NOT NULL,
  `date_start` date NOT NULL,
  `until` date DEFAULT NULL,
  `time` time NOT NULL,
  `remarks` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_fk` (`user_id`),
  KEY `medicine_id_fk` (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

DROP TABLE IF EXISTS `system_info`;
CREATE TABLE IF NOT EXISTS `system_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Medicine Tracking System - PHP'),
(6, 'short_name', 'MTS - PHP'),
(11, 'logo', 'uploads/defaults/logo.png?v=1648173882'),
(14, 'cover', 'uploads/defaults/wallpaper.jpg?v=1648173974');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(250) NOT NULL,
  `middlename` text,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `last_login`, `date_added`, `date_updated`) VALUES
(2, 'Mark', 'D', 'Cooper', 'mcooper', '$2y$10$vbzwnysblhRRKERu5ZlPUu0hS06sG4r6R4gmy5hp47P.61AiNJk/C', NULL, '2023-03-15 10:15:13', '2023-03-15 10:15:13'),
(3, 'George', '', 'Wilson', 'gwilson', '$2y$10$QjC3qnuEZfajGRttQQVovOA9OByc.BL8X.oS0uereL8hxIlBS/i5m', NULL, '2023-03-15 13:48:38', '2023-03-15 13:48:38'),
(4, 'Ahsam', '', 'imtiaz', 'ahsamimtiaz', '$2y$10$HqSnUNbfoMwO3PSmouaIjeeb1rCIRjzeNazLptlOmRor4JMwGgM1W', NULL, '2023-05-18 20:44:32', '2023-05-18 20:44:32');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicine_list`
--
ALTER TABLE `medicine_list`
  ADD CONSTRAINT `med_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD CONSTRAINT `medicine_id_fk` FOREIGN KEY (`medicine_id`) REFERENCES `medicine_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
