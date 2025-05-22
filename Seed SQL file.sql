-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2025 at 05:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ibuy`
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Sagar', 'Sagar@gmail.com', '123', 'ADMIN', '2025-05-05 02:23:25'),
(2, 'Manoj', 'Manoj@gmail.com', '456', 'ADMIN', '2025-05-05 02:37:32'),
(4, 'Sachet', 'Sachet@gmail.com', '789', 'STAFF', '2025-05-05 02:38:59'),
(6, 'Ritesh', 'Ritesh@gmail.com', '101', 'CUSTOMER', '2025-05-05 02:39:49'),
(8, 'Manish', 'Manish@gmail.com', '102', 'CUSTOMER', '2025-05-05 02:40:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
