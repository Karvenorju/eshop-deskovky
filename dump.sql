-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2024 at 07:35 PM
-- Server version: 10.5.23-MariaDB-0+deb11u1
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bela08`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `last_modified`) VALUES
(15, NULL, '2024-12-27 13:53:39'),
(16, NULL, '2024-12-27 13:53:41'),
(17, NULL, '2024-12-27 13:54:06'),
(18, NULL, '2024-12-27 13:54:20'),
(19, NULL, '2024-12-27 13:54:22'),
(20, NULL, '2024-12-27 13:54:23'),
(21, NULL, '2024-12-27 14:20:30'),
(22, NULL, '2024-12-27 14:20:34'),
(23, NULL, '2024-12-27 14:42:59'),
(24, NULL, '2024-12-27 15:11:48'),
(25, NULL, '2024-12-27 15:11:50'),
(26, NULL, '2024-12-27 15:11:52'),
(27, NULL, '2024-12-27 15:14:52'),
(28, NULL, '2024-12-27 15:16:12'),
(29, NULL, '2024-12-27 15:19:14'),
(30, NULL, '2024-12-27 15:23:07'),
(31, NULL, '2024-12-27 15:24:26'),
(32, NULL, '2024-12-27 15:24:29'),
(33, NULL, '2024-12-27 15:26:45'),
(34, NULL, '2024-12-27 15:26:50'),
(35, NULL, '2024-12-27 15:42:51'),
(36, NULL, '2024-12-27 15:54:22'),
(37, NULL, '2024-12-27 15:57:28'),
(38, NULL, '2024-12-27 15:58:09'),
(39, NULL, '2024-12-27 15:58:59'),
(40, NULL, '2024-12-27 15:59:11'),
(41, NULL, '2024-12-27 15:59:34'),
(42, NULL, '2024-12-27 16:00:44'),
(43, NULL, '2024-12-27 16:00:48'),
(44, NULL, '2024-12-27 16:01:44'),
(45, NULL, '2024-12-27 16:01:47'),
(46, NULL, '2024-12-27 16:03:03'),
(47, NULL, '2024-12-27 16:06:43'),
(48, NULL, '2024-12-27 16:07:32'),
(49, NULL, '2024-12-27 16:07:52'),
(50, NULL, '2024-12-27 16:10:02'),
(51, NULL, '2024-12-27 16:10:24'),
(52, NULL, '2024-12-27 16:13:12'),
(53, NULL, '2024-12-27 16:15:37'),
(54, NULL, '2024-12-27 16:16:28'),
(55, NULL, '2024-12-27 18:09:54'),
(56, NULL, '2024-12-27 18:11:07'),
(57, NULL, '2024-12-27 18:11:13'),
(58, NULL, '2024-12-27 18:11:15'),
(59, NULL, '2024-12-27 18:11:22'),
(60, NULL, '2024-12-27 18:11:41'),
(61, NULL, '2024-12-27 18:13:06'),
(62, NULL, '2024-12-27 18:13:08'),
(63, NULL, '2024-12-27 18:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `cart_item_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`cart_item_id`, `product_id`, `cart_id`, `count`) VALUES
(5, 7, 22, 1),
(6, 7, 63, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Kategorie poznámek';

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `title`, `description`) VALUES
(2, 'Abstract Strategy', 'temp'),
(3, 'Action / Dexterity', 'temp'),
(4, 'Adventure', 'temp'),
(5, 'Age of Reason', 'temp'),
(6, 'American Civil War', 'temp'),
(7, 'American Indian Wars', 'temp'),
(8, 'American Revolutionary War', 'temp'),
(9, 'American West', 'temp'),
(10, 'Ancient', 'temp'),
(11, 'Animals', 'temp'),
(12, 'Arabian', 'temp'),
(13, 'Aviation / Flight', 'temp'),
(14, 'Bluffing', 'temp'),
(15, 'Book', 'temp'),
(16, 'Card Game', 'temp'),
(17, 'Abstract Strategy', 'temp'),
(18, 'Action / Dexterity', 'temp'),
(19, 'Adventure', 'temp'),
(20, 'Age of Reason', 'temp'),
(21, 'American Civil War', 'temp'),
(22, 'American Indian Wars', 'temp'),
(23, 'American Revolutionary War', 'temp'),
(24, 'American West', 'temp'),
(25, 'Ancient', 'temp'),
(26, 'Animals', 'temp'),
(27, 'Arabian', 'temp'),
(28, 'Aviation / Flight', 'temp'),
(29, 'Bluffing', 'temp'),
(30, 'Book', 'temp'),
(31, 'Card Game', 'temp'),
(32, 'Children\'s Game', 'temp'),
(33, 'City Building', 'temp'),
(34, 'Civil War', 'temp'),
(35, 'Civilization', 'temp'),
(36, 'Collectible Components', 'temp'),
(37, 'Comic Book / Strip', 'temp'),
(38, 'Deduction', 'temp'),
(39, 'Dice', 'temp'),
(40, 'Economic', 'temp'),
(41, 'Educational', 'temp'),
(42, 'Electronic', 'temp'),
(43, 'Environmental', 'temp'),
(44, 'Expansion for Base-game', 'temp'),
(45, 'Exploration', 'temp'),
(46, 'Fan Expansion', 'temp'),
(47, 'Fantasy', 'temp'),
(48, 'Farming', 'temp'),
(49, 'Fighting', 'temp'),
(50, 'Game System', 'temp'),
(51, 'Horror', 'temp'),
(52, 'Humor', 'temp'),
(53, 'Industry / Manufacturing', 'temp'),
(54, 'Korean War', 'temp'),
(55, 'Mafia', 'temp'),
(56, 'Math', 'temp'),
(57, 'Mature / Adult', 'temp'),
(58, 'Maze', 'temp'),
(59, 'Medical', 'temp'),
(60, 'Medieval', 'temp'),
(61, 'Memory', 'temp'),
(62, 'Miniatures', 'temp'),
(63, 'Modern Warfare', 'temp'),
(64, 'Movies / TV / Radio theme', 'temp'),
(65, 'Murder / Mystery', 'temp'),
(66, 'Music', 'temp'),
(67, 'Mythology', 'temp'),
(68, 'Napoleonic', 'temp'),
(69, 'Nautical', 'temp'),
(70, 'Negotiation', 'temp'),
(71, 'Novel-based', 'temp'),
(72, 'Number', 'temp'),
(73, 'Party Game', 'temp'),
(74, 'Pike and Shot', 'temp'),
(75, 'Pirates', 'temp'),
(76, 'Political', 'temp'),
(77, 'Post-Napoleonic', 'temp'),
(78, 'Prehistoric', 'temp'),
(79, 'Print & Play', 'temp'),
(80, 'Puzzle', 'temp'),
(81, 'Racing', 'temp'),
(82, 'Real-time', 'temp'),
(83, 'Religious', 'temp'),
(84, 'Renaissance', 'temp'),
(85, 'Science Fiction', 'temp'),
(86, 'Space Exploration', 'temp'),
(87, 'Spies / Secret Agents', 'temp'),
(88, 'Sports', 'temp'),
(89, 'Territory Building', 'temp'),
(90, 'Trains', 'temp'),
(91, 'Transportation', 'temp'),
(92, 'Travel', 'temp'),
(93, 'Trivia', 'temp'),
(94, 'Video Game Theme', 'temp'),
(95, 'Vietnam War', 'temp'),
(96, 'Wargame', 'temp'),
(97, 'Word Game', 'temp'),
(98, 'World War I', 'temp'),
(99, 'World War II', 'temp'),
(100, 'Zombies', 'temp');

-- --------------------------------------------------------

--
-- Table structure for table `forgotten_password`
--

CREATE TABLE `forgotten_password` (
  `forgotten_password_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL,
  `role_id` varchar(50) NOT NULL,
  `resource_id` varchar(50) NOT NULL,
  `action` varchar(100) NOT NULL,
  `type` set('allow','deny') NOT NULL DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permission_id`, `role_id`, `resource_id`, `action`, `type`) VALUES
(22, 'admin', 'Admin:Category', '', 'allow'),
(21, 'admin', 'Admin:Dashboard', '', 'allow'),
(24, 'admin', 'Admin:Product', '', 'allow'),
(12, 'admin', 'Category', '', 'allow'),
(23, 'admin', 'Product', '', 'allow'),
(28, 'authenticated', 'Admin:Product', '', 'allow'),
(36, 'authenticated', 'Front:Cart', '', 'allow'),
(4, 'authenticated', 'Front:Error', '', 'allow'),
(5, 'authenticated', 'Front:Error4xx', '', 'allow'),
(6, 'authenticated', 'Front:Homepage', '', 'allow'),
(34, 'authenticated', 'Front:Product', '', 'allow'),
(9, 'authenticated', 'Front:User', 'login', 'allow'),
(10, 'authenticated', 'Front:User', 'logout', 'allow'),
(27, 'authenticated', 'Product', '', 'allow'),
(26, 'guest', 'Admin:Product', '', 'allow'),
(35, 'guest', 'Front:Cart', '', 'allow'),
(1, 'guest', 'Front:Error', '', 'allow'),
(2, 'guest', 'Front:Error4xx', '', 'allow'),
(3, 'guest', 'Front:Homepage', '', 'allow'),
(33, 'guest', 'Front:Product', '', 'allow'),
(15, 'guest', 'Front:User', 'facebookLogin', 'allow'),
(13, 'guest', 'Front:User', 'forgottenPassword', 'allow'),
(7, 'guest', 'Front:User', 'login', 'allow'),
(8, 'guest', 'Front:User', 'logout', 'allow'),
(11, 'guest', 'Front:User', 'register', 'allow'),
(14, 'guest', 'Front:User', 'renewPassword', 'allow'),
(25, 'guest', 'Product', '', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` smallint(5) UNSIGNED DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s nabízenými produkty';

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `title`, `url`, `description`, `price`, `available`) VALUES
(1, NULL, 'aTestovací produkt2', 'testovaci-produkt', 'Lorem ipsum...', '100.00', 1),
(3, NULL, 'test', 'test', '+++', '11.00', 1),
(6, NULL, 'test', 'testx', 'qaa', '1.00', 1),
(7, 2, 'Strategy game', 'strat', 'Such a great game', '5.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `resource_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka obsahující seznam zdrojů';

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`resource_id`) VALUES
('Admin:Category'),
('Admin:Dashboard'),
('Admin:Error4xx'),
('Admin:Product'),
('Category'),
('Front:Cart'),
('Front:Error'),
('Front:Error4xx'),
('Front:Homepage'),
('Front:Product'),
('Front:User'),
('Product');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`) VALUES
('admin'),
('authenticated'),
('guest');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook_id` varchar(100) DEFAULT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s daty uživatelů';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`cart_id`),
  ADD KEY `cart_id` (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `forgotten_password`
--
ALTER TABLE `forgotten_password`
  ADD PRIMARY KEY (`forgotten_password_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`),
  ADD UNIQUE KEY `role_id` (`role_id`,`resource_id`,`action`,`type`),
  ADD KEY `permission_ibfk_1` (`resource_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `available` (`available`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`resource_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `facebook_id` (`facebook_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `forgotten_password`
--
ALTER TABLE `forgotten_password`
  MODIFY `forgotten_password_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forgotten_password`
--
ALTER TABLE `forgotten_password`
  ADD CONSTRAINT `forgotten_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
