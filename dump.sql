-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 09, 2025 at 12:23 AM
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
(140, NULL, '2025-01-07 14:17:04'),
(141, NULL, '2025-01-07 14:17:05'),
(142, NULL, '2025-01-07 14:17:17'),
(143, NULL, '2025-01-07 14:20:25'),
(144, NULL, '2025-01-07 14:20:34'),
(145, NULL, '2025-01-07 14:42:36'),
(146, NULL, '2025-01-07 14:43:04'),
(147, NULL, '2025-01-07 14:43:11'),
(148, NULL, '2025-01-07 14:43:36'),
(149, NULL, '2025-01-07 14:43:37'),
(150, NULL, '2025-01-07 14:43:40'),
(151, NULL, '2025-01-07 14:43:53'),
(152, NULL, '2025-01-07 14:46:28'),
(153, NULL, '2025-01-07 14:51:02'),
(154, NULL, '2025-01-07 14:51:10'),
(155, NULL, '2025-01-07 14:51:28'),
(156, NULL, '2025-01-07 14:51:33'),
(157, NULL, '2025-01-07 14:52:05'),
(158, NULL, '2025-01-07 14:52:10'),
(159, NULL, '2025-01-07 14:52:52'),
(160, NULL, '2025-01-07 14:54:06'),
(161, NULL, '2025-01-07 14:54:12'),
(162, NULL, '2025-01-07 14:57:48'),
(163, NULL, '2025-01-07 15:20:50'),
(164, NULL, '2025-01-07 15:20:53'),
(165, NULL, '2025-01-07 15:20:55'),
(166, NULL, '2025-01-07 15:20:56'),
(167, NULL, '2025-01-07 15:20:58'),
(168, NULL, '2025-01-07 15:26:27'),
(169, NULL, '2025-01-07 15:26:31'),
(170, NULL, '2025-01-07 15:26:59'),
(171, NULL, '2025-01-07 15:27:01'),
(172, NULL, '2025-01-07 15:29:14'),
(173, NULL, '2025-01-07 15:29:38'),
(174, NULL, '2025-01-07 15:46:47'),
(175, NULL, '2025-01-07 15:48:33'),
(176, NULL, '2025-01-07 15:48:34'),
(177, NULL, '2025-01-07 15:48:37'),
(178, NULL, '2025-01-07 15:49:01'),
(179, NULL, '2025-01-08 15:10:17'),
(180, NULL, '2025-01-08 15:10:40'),
(181, NULL, '2025-01-08 15:10:43'),
(182, NULL, '2025-01-08 15:11:49'),
(183, NULL, '2025-01-08 15:12:15'),
(184, NULL, '2025-01-08 15:13:34'),
(185, NULL, '2025-01-08 15:16:46'),
(186, NULL, '2025-01-08 15:17:35'),
(187, NULL, '2025-01-08 15:18:19'),
(188, NULL, '2025-01-08 15:18:45'),
(189, NULL, '2025-01-08 15:19:18'),
(190, NULL, '2025-01-08 15:21:25'),
(191, NULL, '2025-01-08 15:22:05'),
(192, NULL, '2025-01-08 15:23:01'),
(193, NULL, '2025-01-08 15:23:34'),
(194, NULL, '2025-01-08 15:26:38'),
(195, NULL, '2025-01-08 15:27:08'),
(196, NULL, '2025-01-08 15:44:21'),
(197, NULL, '2025-01-08 15:45:20'),
(198, NULL, '2025-01-08 15:54:54'),
(199, NULL, '2025-01-08 15:55:04'),
(200, NULL, '2025-01-08 15:55:14'),
(201, NULL, '2025-01-08 15:55:23'),
(202, NULL, '2025-01-08 16:06:00'),
(203, NULL, '2025-01-08 16:06:05'),
(204, NULL, '2025-01-08 16:06:54'),
(205, NULL, '2025-01-08 16:16:53'),
(206, NULL, '2025-01-08 16:16:58'),
(207, NULL, '2025-01-08 16:17:50'),
(208, NULL, '2025-01-08 16:21:46'),
(209, NULL, '2025-01-08 16:22:57'),
(210, NULL, '2025-01-08 16:23:03'),
(211, NULL, '2025-01-08 16:24:18'),
(212, NULL, '2025-01-08 16:24:21'),
(213, NULL, '2025-01-08 16:24:24'),
(214, NULL, '2025-01-08 16:25:52'),
(215, NULL, '2025-01-08 16:26:32'),
(216, NULL, '2025-01-08 16:26:35'),
(217, NULL, '2025-01-08 16:26:53'),
(218, NULL, '2025-01-08 16:27:19'),
(219, NULL, '2025-01-08 16:47:03'),
(220, NULL, '2025-01-08 16:47:23'),
(221, NULL, '2025-01-08 16:47:31'),
(222, NULL, '2025-01-08 16:48:28'),
(223, NULL, '2025-01-08 16:48:55'),
(224, NULL, '2025-01-08 16:49:01'),
(225, NULL, '2025-01-08 16:49:09'),
(226, NULL, '2025-01-08 16:49:57'),
(227, NULL, '2025-01-08 16:51:42'),
(228, NULL, '2025-01-08 16:51:46'),
(229, NULL, '2025-01-08 16:51:53'),
(230, NULL, '2025-01-08 16:52:50'),
(231, NULL, '2025-01-08 17:20:06'),
(232, NULL, '2025-01-08 17:20:09'),
(233, NULL, '2025-01-08 17:22:11'),
(234, NULL, '2025-01-08 17:24:30'),
(235, NULL, '2025-01-08 17:24:36'),
(236, NULL, '2025-01-08 17:24:40'),
(237, NULL, '2025-01-08 17:24:43'),
(238, NULL, '2025-01-08 17:24:46'),
(239, NULL, '2025-01-08 17:24:49'),
(240, NULL, '2025-01-08 17:24:52'),
(241, NULL, '2025-01-08 17:25:05'),
(242, NULL, '2025-01-08 17:27:55'),
(243, NULL, '2025-01-08 17:28:05'),
(244, NULL, '2025-01-08 17:32:18'),
(245, NULL, '2025-01-08 17:55:03'),
(246, NULL, '2025-01-08 17:57:52'),
(247, NULL, '2025-01-08 17:57:56'),
(248, NULL, '2025-01-08 17:58:01'),
(249, NULL, '2025-01-08 17:58:08'),
(250, NULL, '2025-01-08 18:08:36'),
(251, NULL, '2025-01-08 18:11:43'),
(252, NULL, '2025-01-08 18:11:47'),
(253, NULL, '2025-01-08 18:14:23'),
(254, NULL, '2025-01-08 18:14:29'),
(255, NULL, '2025-01-08 18:14:31'),
(256, NULL, '2025-01-08 18:14:32'),
(257, NULL, '2025-01-08 18:14:33'),
(258, NULL, '2025-01-08 18:15:50'),
(259, NULL, '2025-01-08 18:15:59'),
(260, NULL, '2025-01-08 18:16:01'),
(261, NULL, '2025-01-08 18:17:57'),
(262, NULL, '2025-01-08 18:18:02'),
(263, NULL, '2025-01-08 18:18:04'),
(264, NULL, '2025-01-08 18:22:43'),
(265, NULL, '2025-01-08 18:23:09'),
(266, NULL, '2025-01-08 18:23:10'),
(267, NULL, '2025-01-08 18:23:11'),
(268, NULL, '2025-01-08 18:23:11'),
(269, NULL, '2025-01-08 18:23:12'),
(270, NULL, '2025-01-08 18:23:58'),
(271, NULL, '2025-01-08 18:24:07'),
(272, NULL, '2025-01-08 18:24:22'),
(273, NULL, '2025-01-08 18:26:55'),
(274, NULL, '2025-01-08 18:26:58'),
(275, NULL, '2025-01-08 18:27:47'),
(276, NULL, '2025-01-08 18:28:02'),
(277, NULL, '2025-01-08 18:28:37'),
(278, NULL, '2025-01-08 18:29:51'),
(279, NULL, '2025-01-08 18:30:45'),
(280, NULL, '2025-01-08 18:30:47'),
(281, NULL, '2025-01-08 18:30:48'),
(282, NULL, '2025-01-08 18:30:49'),
(283, NULL, '2025-01-08 18:30:49'),
(284, NULL, '2025-01-08 18:30:50'),
(285, NULL, '2025-01-08 18:30:52'),
(286, NULL, '2025-01-08 18:31:02'),
(287, NULL, '2025-01-08 18:31:05'),
(288, NULL, '2025-01-08 18:31:14'),
(289, NULL, '2025-01-08 18:33:57'),
(290, NULL, '2025-01-08 18:34:01'),
(291, NULL, '2025-01-08 18:34:25'),
(292, NULL, '2025-01-08 18:34:28'),
(293, NULL, '2025-01-08 18:34:31'),
(294, NULL, '2025-01-08 18:37:12'),
(295, NULL, '2025-01-08 18:37:16'),
(296, NULL, '2025-01-08 18:37:18'),
(297, NULL, '2025-01-08 18:38:55'),
(298, NULL, '2025-01-08 18:39:00'),
(299, NULL, '2025-01-08 18:39:02'),
(300, NULL, '2025-01-08 18:39:04'),
(301, NULL, '2025-01-08 18:39:11'),
(302, NULL, '2025-01-08 18:39:15'),
(303, NULL, '2025-01-08 18:39:39'),
(304, NULL, '2025-01-08 18:39:40'),
(305, NULL, '2025-01-08 18:39:42'),
(306, NULL, '2025-01-08 22:46:44'),
(307, NULL, '2025-01-08 22:48:32'),
(308, NULL, '2025-01-08 22:48:34'),
(309, NULL, '2025-01-08 22:48:37'),
(310, NULL, '2025-01-08 22:48:46'),
(311, NULL, '2025-01-08 22:49:33'),
(312, NULL, '2025-01-08 22:49:45'),
(313, NULL, '2025-01-08 22:50:04'),
(314, NULL, '2025-01-08 22:50:12'),
(315, NULL, '2025-01-08 22:52:37'),
(316, NULL, '2025-01-08 22:52:42'),
(317, NULL, '2025-01-08 22:52:47'),
(318, NULL, '2025-01-08 22:52:53'),
(319, NULL, '2025-01-08 22:53:40'),
(320, NULL, '2025-01-08 22:54:57'),
(321, NULL, '2025-01-08 22:55:00'),
(322, NULL, '2025-01-08 22:55:06'),
(323, NULL, '2025-01-08 22:55:10'),
(324, NULL, '2025-01-08 22:56:09'),
(325, NULL, '2025-01-08 22:56:36'),
(326, NULL, '2025-01-08 22:56:40'),
(327, NULL, '2025-01-08 22:56:48'),
(328, NULL, '2025-01-08 22:56:53'),
(329, NULL, '2025-01-08 22:56:56'),
(330, NULL, '2025-01-08 22:57:00'),
(331, NULL, '2025-01-08 22:58:49'),
(332, NULL, '2025-01-08 22:58:51'),
(333, NULL, '2025-01-08 22:58:55'),
(334, NULL, '2025-01-08 22:58:58'),
(335, NULL, '2025-01-08 22:59:00'),
(336, NULL, '2025-01-08 22:59:12'),
(337, NULL, '2025-01-08 22:59:26'),
(338, NULL, '2025-01-08 22:59:30'),
(339, NULL, '2025-01-08 22:59:38'),
(340, NULL, '2025-01-08 22:59:51'),
(341, NULL, '2025-01-08 22:59:53'),
(342, NULL, '2025-01-08 22:59:56'),
(343, NULL, '2025-01-08 23:03:51'),
(344, NULL, '2025-01-08 23:06:28'),
(345, NULL, '2025-01-08 23:06:40'),
(346, NULL, '2025-01-08 23:07:44'),
(347, NULL, '2025-01-08 23:08:12'),
(348, NULL, '2025-01-08 23:08:17'),
(349, NULL, '2025-01-08 23:08:21'),
(350, NULL, '2025-01-08 23:08:29'),
(351, NULL, '2025-01-08 23:10:14'),
(352, NULL, '2025-01-08 23:10:18'),
(353, NULL, '2025-01-08 23:11:51'),
(354, NULL, '2025-01-08 23:11:57'),
(355, NULL, '2025-01-08 23:12:26'),
(356, NULL, '2025-01-08 23:12:31'),
(357, NULL, '2025-01-08 23:13:19'),
(358, NULL, '2025-01-08 23:14:43'),
(359, NULL, '2025-01-08 23:18:03'),
(360, NULL, '2025-01-08 23:18:05'),
(361, NULL, '2025-01-08 23:18:10'),
(362, NULL, '2025-01-08 23:18:25'),
(363, NULL, '2025-01-08 23:19:07'),
(364, NULL, '2025-01-08 23:21:26'),
(365, NULL, '2025-01-08 23:21:43'),
(366, NULL, '2025-01-08 23:21:49');

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
(39, 'authenticated', 'Front:User', 'profile', 'allow'),
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
  `photo_extension` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `min_player` int(11) NOT NULL DEFAULT 1,
  `max_player` int(11) NOT NULL,
  `play_time` int(11) NOT NULL,
  `min_age` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s nabízenými produkty';

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `title`, `url`, `description`, `photo_extension`, `price`, `min_player`, `max_player`, `play_time`, `min_age`) VALUES
(7, 96, 'Risk', 'risk', 'Possibly the most popular, mass market war game. The goal is conquest of the world.\r\n\r\nEach player\'s turn consists of:\r\n- gaining reinforcements through number of territories held, control of every territory on each continent, and turning sets of bonus cards.\r\n- Attacking other players using a simple combat rule of comparing the highest dice rolled for each side. Players may attack as often as desired. If one enemy territory is successfully taken, the player is awarded with a bonus card.\r\n- Moving a group of armies to another adjacent territory.\r\n', '', '400.00', 1, 2, 6, 10),
(8, 60, 'Carcassonne ', 'carcassonne', 'Carcassonne is a tile placement game in which the players draw and place a tile with a piece of southern French landscape represented on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, et cetera. Having placed a tile, the player can then decide to place one of his/her meeples in one of the areas on it: in the city as a knight, on the road as a robber, in the cloister as a monk, or in the field as a farmer. When that area is complete that meeple scores points for its owner.\r\n\r\nDuring a game of Carcassonne, players are faced with decisions like: \"Is it really worth putting my last meeple there?\" or \"Should I use this tile to expand my city, or should I place it near my opponent instead, giving him/her a hard time to complete his/her project and score points?\" Since players place only one tile and have the option to place one meeple on it, turns proceed quickly even if it is a game full of options and possibilities.\r\n\r\nFirst game in the Carcassonne series.', '', '300.00', 2, 5, 45, 7),
(9, 40, 'Monopoly: The Portable Property Trading Game', 'monopoly', 'A very small travel version of Monopoly which often comes in the shape of a red suitcase and plays very similarly to the original game. One difference is that it contains three dice. The Community Chest and Chance cards are replaced with tables. Three dice are rolled and the tables are referenced to find the result.\r\n\r\nThe Waddington\'s UK edition has different properties than the U.S. version, and also comes in a different sort of case with a magnetic board and magnetic hotels, houses, and movers.\r\n', '', '645.00', 2, 6, 120, 8),
(10, 47, 'Clank! Legacy: Acquisitions Incorporated', 'clank', 'Clank! Legacy: Acquisitions Incorporated extends the deck-building fun of Clank! with legacy-style gameplay! Found your own franchise of the legendary adventuring company, Acquisitions Incorporated, and shepherd your fledgling treasure-hunters to immortal corporate glory over the course of multiple games. Your game board, your deck, and your world change as you play to create a unique campaign tailored to your adventuring party. Be cunning, be bold, and most importantly, be ready...', '', '546.00', 2, 4, 120, 13),
(11, 40, 'A Feast for Odin ', 'feast-for-odin', 'A Feast for Odin is a saga in the form of a board game. You are reliving the cultural achievements, mercantile expeditions, and pillages of those tribes we know as Viking today — a term that was used quite differently towards the end of the first millennium.\r\n\r\nWhen the northerners went out for a raid, they used to say they headed out for a viking. Their Scandinavian ancestors, however, were much more than just pirates. They were explorers and founders of states. Leif Eriksson is said to be the first European in America, long before Columbus.\r\nIn what is known today as Normandy, the intruders were not called Vikings but Normans. One of them is the famous William the Conqueror who invaded England in 1066. He managed to do what the king of Norway failed to do only a few years prior: conquer the Throne of England. The reason the people of these times became such strong seafarers was their unfortunate agricultural situation: crop shortfalls caused great distress.\r\n\r\nIn this game, you will raid and explore new territories. You will also engage in the day-to-day activity of collecting goods with which to achieve a financially secure position in society. In the end, the player whose possessions bear the greatest value will be declared the winner.', '', '875.00', 1, 4, 120, 12),
(12, 4, 'Frosthaven', 'frosthaven', 'Frosthaven is the story of a small outpost far to the north of the capital city of White Oak. It\'s an outpost barely surviving the harsh weather let alone invasions from forces both known and unknown. However, a group of mercenaries, at the end of their rope, will help bring this settlement back from the edge of destruction. Not only will they have to deal with the harsh elements, but with other, far more dangerous threats out in the unforgiving cold, as well. There are: Algox, the bigger, more yeti-like cousins of the Inox, attacking from the mountains; Lurkers flooding in from the northern sea; and rumors have it that there are machines that wander the frozen wastes of their own free will. The party of mercenaries must face all of these perils, and perhaps in doing so, make peace with these new races so they can work together against even more sinister forces.\r\n\r\nFrosthaven is a standalone adventure from the designer and publisher of Gloomhaven that features sixteen new characters, three new races, more than twenty new enemies, more than one hundred new items, and a new, 100-scenario campaign. Characters and items from Gloomhaven will be usable in Frosthaven, and vice versa.\r\n\r\nIn addition to using the well-known combat mechanisms of Gloomhaven, Frosthaven features other elements, such as mysteries to solve, a seasonal event system to live through, and player control over how the ramshackle village expands, with each new building offering new ways to progress.\r\n\r\nFrosthaven has a whole new set of items but there is a mechanism for bringing items over from \'Gloomhaven\'. However, as Frosthaven\'s outpost is a remote location, these products may be imported but are not present as standard items. Resources are much more valuable and you have to build items through a crafting system rather than just buying them.', '', '246.00', 1, 4, 180, 14);

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
  ADD KEY `category_id` (`category_id`);

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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;

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
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
