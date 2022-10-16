-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 06:03 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cubitdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `Item_category_id` int(11) NOT NULL,
  `Item_category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item_info`
--

CREATE TABLE `item_info` (
  `Item_id` int(11) NOT NULL,
  `Item_category_id_fk` int(11) NOT NULL,
  `Item_name` varchar(100) NOT NULL,
  `Item_picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `item_pricing`
--

CREATE TABLE `item_pricing` (
  `Item_pricing_id` int(11) NOT NULL,
  `Item_id_fk` int(11) NOT NULL,
  `Item_price` int(100) NOT NULL,
  `Price_date_applicability` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_info`
--

CREATE TABLE `purchase_info` (
  `Purchase_id` int(11) NOT NULL,
  `Item_id_fk` int(11) NOT NULL,
  `User_id_fk` int(11) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_add_info`
--

CREATE TABLE `users_add_info` (
  `User_add_info_id` int(11) NOT NULL,
  `User_id_fk` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Contact` int(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Date_applicability` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users_basic_info`
--

CREATE TABLE `users_basic_info` (
  `User_id` int(11) NOT NULL,
  `First_name` varchar(100) NOT NULL,
  `Last_name` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Sex` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`Item_category_id`);

--
-- Indexes for table `item_info`
--
ALTER TABLE `item_info`
  ADD PRIMARY KEY (`Item_id`),
  ADD KEY `Item_category_id` (`Item_category_id_fk`);

--
-- Indexes for table `item_pricing`
--
ALTER TABLE `item_pricing`
  ADD PRIMARY KEY (`Item_pricing_id`),
  ADD KEY `Item_id_fk` (`Item_id_fk`);

--
-- Indexes for table `purchase_info`
--
ALTER TABLE `purchase_info`
  ADD PRIMARY KEY (`Purchase_id`),
  ADD KEY `Item_id` (`Item_id_fk`),
  ADD KEY `User_id` (`User_id_fk`),
  ADD KEY `User_id_fk` (`User_id_fk`);

--
-- Indexes for table `users_add_info`
--
ALTER TABLE `users_add_info`
  ADD PRIMARY KEY (`User_add_info_id`),
  ADD KEY `User_id_fk` (`User_id_fk`);

--
-- Indexes for table `users_basic_info`
--
ALTER TABLE `users_basic_info`
  ADD PRIMARY KEY (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `Item_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_info`
--
ALTER TABLE `item_info`
  MODIFY `Item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_pricing`
--
ALTER TABLE `item_pricing`
  MODIFY `Item_pricing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_info`
--
ALTER TABLE `purchase_info`
  MODIFY `Purchase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_add_info`
--
ALTER TABLE `users_add_info`
  MODIFY `User_add_info_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_basic_info`
--
ALTER TABLE `users_basic_info`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_info`
--
ALTER TABLE `item_info`
  ADD CONSTRAINT `item_info_ibfk_1` FOREIGN KEY (`Item_category_id_fk`) REFERENCES `item_category` (`Item_category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_pricing`
--
ALTER TABLE `item_pricing`
  ADD CONSTRAINT `item_pricing_ibfk_1` FOREIGN KEY (`Item_id_fk`) REFERENCES `item_info` (`Item_id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_info`
--
ALTER TABLE `purchase_info`
  ADD CONSTRAINT `purchase_info_ibfk_1` FOREIGN KEY (`Item_id_fk`) REFERENCES `item_info` (`Item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_info_ibfk_2` FOREIGN KEY (`User_id_fk`) REFERENCES `users_basic_info` (`User_id`) ON UPDATE CASCADE;

--
-- Constraints for table `users_add_info`
--
ALTER TABLE `users_add_info`
  ADD CONSTRAINT `users_add_info_ibfk_1` FOREIGN KEY (`User_id_fk`) REFERENCES `users_basic_info` (`User_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
