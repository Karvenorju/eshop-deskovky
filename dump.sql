-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 23, 2025 at 09:51 AM
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
                                                               (288, NULL, '2025-01-22 10:25:52'),
                                                               (289, NULL, '2025-01-22 10:25:54'),
                                                               (290, NULL, '2025-01-22 10:25:55'),
                                                               (292, NULL, '2025-01-22 10:26:31'),
                                                               (293, NULL, '2025-01-22 10:26:33'),
                                                               (294, NULL, '2025-01-22 10:40:20'),
                                                               (295, NULL, '2025-01-22 10:40:22'),
                                                               (296, NULL, '2025-01-22 10:43:10'),
                                                               (297, NULL, '2025-01-22 10:47:01'),
                                                               (298, 4, '2025-01-22 10:54:12'),
                                                               (299, NULL, '2025-01-22 12:39:58'),
                                                               (300, NULL, '2025-01-22 12:40:02'),
                                                               (301, NULL, '2025-01-22 12:40:04'),
                                                               (302, NULL, '2025-01-22 12:40:05'),
                                                               (303, NULL, '2025-01-22 12:42:08'),
                                                               (304, NULL, '2025-01-22 12:42:09'),
                                                               (305, NULL, '2025-01-22 12:42:12'),
                                                               (306, NULL, '2025-01-22 12:42:13'),
                                                               (307, NULL, '2025-01-22 12:42:15'),
                                                               (308, NULL, '2025-01-22 12:51:28'),
                                                               (309, NULL, '2025-01-22 12:52:13'),
                                                               (310, NULL, '2025-01-22 12:54:34'),
                                                               (311, NULL, '2025-01-22 12:54:41'),
                                                               (312, NULL, '2025-01-22 12:54:47'),
                                                               (313, NULL, '2025-01-22 12:57:11'),
                                                               (314, NULL, '2025-01-22 13:00:45'),
                                                               (315, NULL, '2025-01-22 13:00:47'),
                                                               (316, NULL, '2025-01-22 13:02:25'),
                                                               (317, NULL, '2025-01-22 13:03:12'),
                                                               (318, NULL, '2025-01-22 13:03:14'),
                                                               (319, NULL, '2025-01-22 13:03:23'),
                                                               (320, NULL, '2025-01-22 13:03:33'),
                                                               (321, NULL, '2025-01-22 13:04:49'),
                                                               (322, NULL, '2025-01-22 13:05:42'),
                                                               (323, NULL, '2025-01-22 13:05:56'),
                                                               (324, NULL, '2025-01-22 13:06:41'),
                                                               (325, NULL, '2025-01-22 13:07:09'),
                                                               (326, NULL, '2025-01-22 13:07:29'),
                                                               (327, NULL, '2025-01-22 13:07:37'),
                                                               (328, NULL, '2025-01-22 13:07:58'),
                                                               (329, NULL, '2025-01-22 13:08:02'),
                                                               (330, NULL, '2025-01-22 13:22:41'),
                                                               (331, NULL, '2025-01-22 13:22:42'),
                                                               (332, NULL, '2025-01-22 13:22:53'),
                                                               (333, NULL, '2025-01-22 13:23:01'),
                                                               (334, NULL, '2025-01-22 13:23:02'),
                                                               (335, NULL, '2025-01-22 13:23:16'),
                                                               (336, NULL, '2025-01-22 13:23:21'),
                                                               (337, NULL, '2025-01-22 13:23:52'),
                                                               (338, NULL, '2025-01-22 13:24:00'),
                                                               (339, NULL, '2025-01-22 13:24:02'),
                                                               (340, NULL, '2025-01-22 13:25:48'),
                                                               (341, NULL, '2025-01-22 13:30:02'),
                                                               (342, NULL, '2025-01-22 13:30:04'),
                                                               (343, NULL, '2025-01-22 13:30:05'),
                                                               (344, NULL, '2025-01-22 13:32:10'),
                                                               (345, NULL, '2025-01-22 13:32:34'),
                                                               (346, NULL, '2025-01-22 13:34:40'),
                                                               (347, NULL, '2025-01-22 13:34:48'),
                                                               (348, NULL, '2025-01-22 13:35:07'),
                                                               (349, NULL, '2025-01-22 13:35:29'),
                                                               (350, NULL, '2025-01-22 13:35:52'),
                                                               (351, NULL, '2025-01-22 13:36:24'),
                                                               (352, NULL, '2025-01-22 13:42:56'),
                                                               (353, NULL, '2025-01-22 13:43:11'),
                                                               (354, NULL, '2025-01-22 13:44:12'),
                                                               (355, NULL, '2025-01-22 13:45:00'),
                                                               (356, NULL, '2025-01-22 13:48:46'),
                                                               (357, NULL, '2025-01-22 13:48:57'),
                                                               (358, NULL, '2025-01-22 13:51:26'),
                                                               (359, NULL, '2025-01-22 13:51:30'),
                                                               (360, NULL, '2025-01-22 13:51:47'),
                                                               (361, NULL, '2025-01-22 13:52:41'),
                                                               (362, NULL, '2025-01-22 13:55:09'),
                                                               (363, NULL, '2025-01-22 13:56:56'),
                                                               (364, NULL, '2025-01-22 13:57:16'),
                                                               (365, NULL, '2025-01-22 13:58:07'),
                                                               (366, NULL, '2025-01-22 13:58:27'),
                                                               (367, NULL, '2025-01-22 13:58:34'),
                                                               (368, NULL, '2025-01-22 14:00:09'),
                                                               (369, NULL, '2025-01-22 14:00:15'),
                                                               (370, NULL, '2025-01-22 15:17:41'),
                                                               (371, NULL, '2025-01-22 15:17:44'),
                                                               (372, NULL, '2025-01-22 15:17:45'),
                                                               (373, 5, '2025-01-22 19:24:09'),
                                                               (374, NULL, '2025-01-22 15:18:45'),
                                                               (375, NULL, '2025-01-22 15:18:46'),
                                                               (376, NULL, '2025-01-22 15:26:56'),
                                                               (377, NULL, '2025-01-22 15:26:57'),
                                                               (378, NULL, '2025-01-22 16:49:42'),
                                                               (379, NULL, '2025-01-22 18:40:38'),
                                                               (380, NULL, '2025-01-22 18:40:42'),
                                                               (381, NULL, '2025-01-22 18:41:46'),
                                                               (382, NULL, '2025-01-22 18:42:04'),
                                                               (383, NULL, '2025-01-22 18:42:07'),
                                                               (384, NULL, '2025-01-22 19:23:41'),
                                                               (385, NULL, '2025-01-23 08:48:17'),
                                                               (386, NULL, '2025-01-23 08:48:28'),
                                                               (387, NULL, '2025-01-23 08:51:09'),
                                                               (388, NULL, '2025-01-23 08:51:11');

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
    (36, 7, 369, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
                            `category_id` smallint(5) UNSIGNED NOT NULL,
                            `title` varchar(100) NOT NULL,
                            `description` varchar(300) NOT NULL,
                            `sold_quantity` int(11) NOT NULL DEFAULT 0,
                            `image_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Kategorie poznámek';

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `title`, `description`, `sold_quantity`, `image_url`) VALUES
                                                                                                 (2, 'Abstract Strategy', 'temp', 0, 'abstract-strategy-games-cover.jpg'),
                                                                                                 (3, 'Action / Dexterity', 'temp', 0, ''),
                                                                                                 (4, 'Adventure', 'temp', 2, 'adventure.png'),
                                                                                                 (5, 'Age of Reason', 'temp', 0, ''),
                                                                                                 (6, 'American Civil War', 'temp', 0, ''),
                                                                                                 (7, 'American Indian Wars', 'temp', 0, ''),
                                                                                                 (8, 'American Revolutionary War', 'temp', 0, ''),
                                                                                                 (9, 'American West', 'temp', 0, ''),
                                                                                                 (10, 'Ancient', 'temp', 0, ''),
                                                                                                 (11, 'Animals', 'temp', 0, ''),
                                                                                                 (12, 'Arabian', 'temp', 0, ''),
                                                                                                 (13, 'Aviation / Flight', 'temp', 0, ''),
                                                                                                 (14, 'Bluffing', 'temp', 0, ''),
                                                                                                 (15, 'Book', 'temp', 0, ''),
                                                                                                 (16, 'Card Game', 'temp', 0, ''),
                                                                                                 (32, 'Children\'s Game', 'temp', 0, ''),
(33, 'City Building', 'temp', 0, ''),
(34, 'Civil War', 'temp', 0, ''),
(35, 'Civilization', 'temp', 0, ''),
(36, 'Collectible Components', 'temp', 0, ''),
(37, 'Comic Book / Strip', 'temp', 0, ''),
(38, 'Deduction', 'temp', 0, ''),
(39, 'Dice', 'temp', 0, ''),
(40, 'Economic', 'temp', 15, 'economy-min.png'),
(41, 'Educational', 'temp', 0, ''),
(42, 'Electronic', 'temp', 0, ''),
(43, 'Environmental', 'temp', 0, ''),
(44, 'Expansion for Base-game', 'temp', 0, ''),
(45, 'Exploration', 'temp', 0, ''),
(46, 'Fan Expansion', 'temp', 0, ''),
(47, 'Fantasy', 'temp', 2, 'fantasy.png'),
(48, 'Farming', 'temp', 0, ''),
(49, 'Fighting', 'temp', 0, ''),
(50, 'Game System', 'temp', 0, ''),
(51, 'Horror', 'temp', 0, ''),
(52, 'Humor', 'temp', 0, ''),
(53, 'Industry / Manufacturing', 'temp', 0, ''),
(54, 'Korean War', 'temp', 0, ''),
(55, 'Mafia', 'temp', 0, ''),
(56, 'Math', 'temp', 0, ''),
(57, 'Mature / Adult', 'temp', 0, ''),
(58, 'Maze', 'temp', 0, ''),
(59, 'Medical', 'temp', 0, ''),
(60, 'Medieval', 'temp', 2, 'Era-Medieval-Age.jpg'),
(61, 'Memory', 'temp', 0, ''),
(62, 'Miniatures', 'temp', 0, ''),
(63, 'Modern Warfare', 'temp', 0, ''),
(64, 'Movies / TV / Radio theme', 'temp', 0, ''),
(65, 'Murder / Mystery', 'temp', 0, ''),
(66, 'Music', 'temp', 0, ''),
(67, 'Mythology', 'temp', 0, ''),
(68, 'Napoleonic', 'temp', 0, ''),
(69, 'Nautical', 'temp', 0, ''),
(70, 'Negotiation', 'temp', 0, ''),
(71, 'Novel-based', 'temp', 0, ''),
(72, 'Number', 'temp', 0, ''),
(73, 'Party Game', 'temp', 0, ''),
(74, 'Pike and Shot', 'temp', 0, ''),
(75, 'Pirates', 'temp', 0, ''),
(76, 'Political', 'temp', 0, ''),
(77, 'Post-Napoleonic', 'temp', 0, ''),
(78, 'Prehistoric', 'temp', 0, ''),
(79, 'Print & Play', 'temp', 0, ''),
(80, 'Puzzle', 'temp', 0, ''),
(81, 'Racing', 'temp', 0, ''),
(82, 'Real-time', 'temp', 0, ''),
(83, 'Religious', 'temp', 0, ''),
(84, 'Renaissance', 'temp', 0, ''),
(85, 'Science Fiction', 'temp', 0, ''),
(86, 'Space Exploration', 'temp', 0, ''),
(87, 'Spies / Secret Agents', 'temp', 0, ''),
(88, 'Sports', 'temp', 0, ''),
(89, 'Territory Building', 'temp', 0, ''),
(90, 'Trains', 'temp', 0, ''),
(91, 'Transportation', 'temp', 0, ''),
(92, 'Travel', 'temp', 0, ''),
(93, 'Trivia', 'temp', 0, ''),
(94, 'Video Game Theme', 'temp', 0, ''),
(95, 'Vietnam War', 'temp', 0, ''),
(96, 'Wargame', 'temp', 13, 'wargame.jpg'),
(97, 'Word Game', 'temp', 0, ''),
(98, 'World War I', 'temp', 0, ''),
(99, 'World War II', 'temp', 0, ''),
(100, 'Zombies', 'temp', 0, '');

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
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` enum('front','back','board','other') NOT NULL DEFAULT 'other'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `url`, `product_id`, `type`) VALUES
(2, 'carcassonne-back.png', 8, 'back'),
(3, 'carcassonne-board.png', 8, 'board'),
(4, 'carcassonne-front.jpg', 8, 'front'),
(5, 'clank-back.png', 10, 'back'),
(6, 'clank-board.png', 10, 'board'),
(7, 'clank-front.png', 10, 'front'),
(8, 'feast-for-odin-back.png', 11, 'back'),
(9, 'feast-for-odin-board.png', 11, 'board'),
(10, 'feast-for-odin-front.png', 11, 'front'),
(11, 'frosthaven-back.png', 12, 'back'),
(12, 'frosthaven-board.png', 12, 'board'),
(13, 'frosthaven-front.png', 12, 'front'),
(14, 'monopoly-card-back.png', 9, 'back'),
(15, 'monopoly-card-board.png', 9, 'board'),
(16, 'monopoly-card-front.jpg', 9, 'front'),
(17, 'risk-back.png', 7, 'back'),
(18, 'risk-board.png', 7, 'board'),
(19, 'risk-front.png', 7, 'front');

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
(45, 'admin', 'Admin:SaleOrder', '', 'allow'),
(46, 'admin', 'Admin:User', '', 'allow'),
(12, 'admin', 'Category', '', 'allow'),
(23, 'admin', 'Product', '', 'allow'),
(28, 'authenticated', 'Admin:Product', '', 'allow'),
(36, 'authenticated', 'Front:Cart', '', 'allow'),
(4, 'authenticated', 'Front:Error', '', 'allow'),
(5, 'authenticated', 'Front:Error4xx', '', 'allow'),
(6, 'authenticated', 'Front:Homepage', '', 'allow'),
(40, 'authenticated', 'Front:Checkout', '', 'allow'),
(34, 'authenticated', 'Front:Product', '', 'allow'),
(9, 'authenticated', 'Front:User', 'login', 'allow'),
(10, 'authenticated', 'Front:User', 'logout', 'allow'),
(39, 'authenticated', 'Front:User', 'profile', 'allow'),
(44, 'authenticated', 'Front:User', 'saleOrder', 'allow'),
(43, 'authenticated', 'Front:User', 'saleOrders', 'allow'),
(27, 'authenticated', 'Product', '', 'allow'),
(26, 'guest', 'Admin:Product', '', 'allow'),
(35, 'guest', 'Front:Cart', '', 'allow'),
(1, 'guest', 'Front:Error', '', 'allow'),
(2, 'guest', 'Front:Error4xx', '', 'allow'),
(3, 'guest', 'Front:Homepage', '', 'allow'),
(41, 'guest', 'Front:Checkout', '', 'allow'),
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
  `min_player` int(11) NOT NULL DEFAULT 1,
  `max_player` int(11) NOT NULL,
  `play_time` int(11) NOT NULL,
  `min_age` int(11) NOT NULL DEFAULT 0,
  `sold_quantity` int(11) NOT NULL DEFAULT 0,
  `bgg_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s nabízenými produkty';

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `title`, `url`, `description`, `price`, `min_player`, `max_player`, `play_time`, `min_age`, `sold_quantity`, `bgg_id`) VALUES
(7, 96, 'Risk', 'risk', 'Possibly the most popular,\r\n        mass market war game. The goal is conquest of the world.\n\nEach player\'s turn consists of:\n- gaining reinforcements through number of territories held, control of every territory on each continent, and turning sets of bonus cards.\n- Attacking other players using a simple combat rule of comparing the highest dice rolled for each side. Players may attack as often as desired. If one enemy territory is successfully taken, the player is awarded with a bonus card.\n- Moving a group of armies to another adjacent territory.\n', '400.00', 1, 2, 6, 10, 15, 181),
                                                                                                 (8, 60, 'Carcassonne ', 'carcassonne', 'Carcassonne is a tile placement game in which the players draw and place a tile with a piece of southern French landscape represented on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, et cetera. Having placed a tile, the player can then decide to place one of his/her meeples in one of the areas on it: in the city as a knight, on the road as a robber, in the cloister as a monk, or in the field as a farmer. When that area is complete that meeple scores points for its owner.\r\n\r\nDuring a game of Carcassonne, players are faced with decisions like: \"Is it really worth putting my last meeple there?\" or \"Should I use this tile to expand my city, or should I place it near my opponent instead, giving him/her a hard time to complete his/her project and score points?\" Since players place only one tile and have the option to place one meeple on it, turns proceed quickly even if it is a game full of options and possibilities.\r\n\r\nFirst game in the Carcassonne series.', '300.00', 2, 5, 45, 7, 3, 822),
                                                                                                 (9, 40, 'Monopoly: The Portable Property Trading Game', 'monopoly-card', 'A very small travel version of Monopoly which often comes in the shape of a red suitcase and plays very similarly to the original game. One difference is that it contains three dice. The Community Chest and Chance cards are replaced with tables. Three dice are rolled and the tables are referenced to find the result.\r\n\r\nThe Waddington\'s UK edition has different properties than the U.S. version, and\r\n        also comes in a different sort of case with a magnetic board and magnetic hotels, houses, and movers\r\n        .\r\n', '645.00', 2, 6, 120, 8, 10, 36611),
(10, 47, ' Clank ! Legacy : Acquisitions Incorporated ', ' clank ', ' Clank ! Legacy : Acquisitions Incorporated extends\r\n        the deck - building fun of Clank ! with legacy - style gameplay ! Found your own franchise of the legendary\r\n        adventuring company, Acquisitions Incorporated, and shepherd your fledgling treasure - hunters to immortal\r\n        corporate glory over the course of multiple games.Your game board, your deck, and your world change as you play\r\n        to create a unique campaign tailored to your adventuring party.Be cunning, be bold, and most importantly,\r\n        be ready...', '546.00', 2, 4, 120, 13, 0, 266507),
(11, 40, 'A Feast for Odin ', 'feast-for-odin', 'A Feast for Odin is a saga in the form of a board game. You are reliving the cultural achievements,\r\n        mercantile expeditions, and pillages of those tribes we know as Viking today — a term that was used quite\r\n        differently towards the end of the first millennium.\r\n\r\nWhen the northerners went out for a raid,\r\n        they used to say they headed out for a viking. Their Scandinavian ancestors, however,\r\n        were much more than just pirates. They were explorers and founders of states. Leif Eriksson is said to be the first European in America,\r\n        long before Columbus.\r\nIn what is known today as Normandy,\r\n        the intruders were not called Vikings but Normans. One of them is the famous William the Conqueror who invaded England in 1066. He managed to do what the king of Norway failed to do only a few years prior: conquer the Throne of England. The reason the people of these times became such strong seafarers was their unfortunate agricultural situation: crop shortfalls caused great distress.\r\n\r\nIn this game,\r\n        you will raid and explore new territories. You will also engage in the day-to-day activity of collecting goods with which to achieve a financially secure position in society. In the end,\r\n        the player whose possessions bear the greatest value will be declared the winner.', '875.00', 1, 4, 120, 12, 0, 177736),
(12, 4, 'Frosthaven', 'frosthaven', 'Frosthaven is the story of a small outpost far to the north of the capital city of White Oak. It\'s an outpost barely surviving the harsh weather let alone invasions from forces both known and unknown. However, a group of mercenaries, at the end of their rope, will help bring this settlement back from the edge of destruction. Not only will they have to deal with the harsh elements, but with other, far more dangerous threats out in the unforgiving cold, as well. There are: Algox, the bigger, more yeti-like cousins of the Inox, attacking from the mountains; Lurkers flooding in from the northern sea; and rumors have it that there are machines that wander the frozen wastes of their own free will. The party of mercenaries must face all of these perils, and perhaps in doing so, make peace with these new races so they can work together against even more sinister forces.\r\n\r\nFrosthaven is a standalone adventure from the designer and publisher of Gloomhaven that features sixteen new characters, three new races, more than twenty new enemies, more than one hundred new items, and a new, 100-scenario campaign. Characters and items from Gloomhaven will be usable in Frosthaven, and vice versa.\r\n\r\nIn addition to using the well-known combat mechanisms of Gloomhaven, Frosthaven features other elements, such as mysteries to solve, a seasonal event system to live through, and player control over how the ramshackle village expands, with each new building offering new ways to progress.\r\n\r\nFrosthaven has a whole new set of items but there is a mechanism for bringing items over from \'Gloomhaven\'. However, as Frosthaven\'s outpost is a remote location,\r\n        these products may be imported but are not present as standard items. Resources are much more valuable and you have to build items through a crafting system rather than just buying them.', '246.00', 1, 4, 180, 14, 0, 295770);

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
('Admin:SaleOrder'),
('Admin:User'),
('Category'),
('Front:Cart'),
('Front:Error'),
('Front:Error4xx'),
('Front:Homepage'),
('Front:Checkout'),
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
-- Table structure for table `sale_order`
--

CREATE TABLE `sale_order` (
  `sale_order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_name` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_address` text NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` enum('pending','shipped','done','cancelled') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_order`
--

INSERT INTO `sale_order` (`sale_order_id`, `user_id`, `order_name`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `total_price`, `created_at`, `status`) VALUES
(2, 3, 'SO-20250119-000001', 'Petr Cafourek', 'cafourek2@gmail.com', '+420 731730756', 'something 123', '300.00', '2025-01-19 21:15:47', 'pending'),
(3, 3, 'SO-20250121-000001', 'Petr Cafourek', 'cafourek2@gmail.com', '+420 731730756', 'something 123', '947.00', '2025-01-21 19:18:52', 'pending'),
(4, 3, 'SO-20250121-000002', 'Petr Cafourek', 'cafourek2@gmail.com', '+420 731730756', 'something 123', '584.00', '2025-01-21 19:23:09', 'pending'),
(5, 3, 'SO-20250121-000003', 'Petr Cafourek', 'cafourek2@gmail.com', '+420 731730756', 'something 123', '947.00', '2025-01-21 19:23:37', 'pending'),
(6, 3, 'SO-20250121-000004', 'Petr Cafourek', 'cafourek2@gmail.com', '+420 731730756', 'something 123', '947.00', '2025-01-21 19:27:26', 'pending'),
(9, 4, 'SO-20250122-000001', 'kovj19@vse.cz', 'kovj19@vse.cz', '12', '12', '12744.50', '2025-01-22 11:54:12', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `sale_order_line`
--

CREATE TABLE `sale_order_line` (
  `sale_order_line_id` int(11) NOT NULL,
  `sale_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1 CHECK (`quantity` > 0),
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 CHECK (`price` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_order_line`
--

INSERT INTO `sale_order_line` (`sale_order_line_id`, `sale_order_id`, `product_id`, `quantity`, `price`) VALUES
(2, 2, 8, 1, '300.00'),
(3, 3, 7, 1, '400.00'),
(4, 3, 8, 1, '300.00'),
(5, 4, 7, 1, '400.00'),
(6, 5, 7, 1, '400.00'),
(7, 5, 8, 1, '300.00'),
(8, 6, 7, 1, '400.00'),
(9, 6, 8, 1, '300.00'),
(10, 9, 7, 10, '400.00'),
(11, 9, 9, 10, '645.00');

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
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s daty uživatelů';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `facebook_id`, `role_id`, `password`, `phone`, `address`) VALUES
(3, 'Petr Cafourek', 'cafourek2@gmail.com', NULL, 'admin', '$2y$10$0f8twanVO/ep33KiMsgQGumKVqQq/o6er3aWFF29fFQrHp5sarrGu', '+420 731730756', 'something 123'),
(4, 'kovj19@vse.cz', 'kovj19@vse.cz', NULL, 'admin', '$2y$10$sHfEUGxZTuRpReLI62Qsmu5vRdyKD58YeRUtxnRa2KR.hZ7p5ylzu', NULL, NULL),
(5, 'a@a.a', 'a@a.a', NULL, 'admin', '$2y$10$iJglqtaUzHIbcBOs7Jwv9eX.hCNrV.Z.rNfioXce74Ju2/Eiv5upW', NULL, NULL);

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
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `product_id` (`product_id`);

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
-- Indexes for table `sale_order`
--
ALTER TABLE `sale_order`
  ADD PRIMARY KEY (`sale_order_id`),
  ADD KEY `fk_sale_order_user` (`user_id`);

--
-- Indexes for table `sale_order_line`
--
ALTER TABLE `sale_order_line`
  ADD PRIMARY KEY (`sale_order_line_id`),
  ADD KEY `fk_sale_order_line_order` (`sale_order_id`),
  ADD KEY `fk_sale_order_line_product` (`product_id`);

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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sale_order`
--
ALTER TABLE `sale_order`
  MODIFY `sale_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sale_order_line`
--
ALTER TABLE `sale_order_line`
  MODIFY `sale_order_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `sale_order`
--
ALTER TABLE `sale_order`
  ADD CONSTRAINT `sale_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `sale_order_line`
--
ALTER TABLE `sale_order_line`
  ADD CONSTRAINT `sale_order_line_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `sale_order_line_ibfk_2` FOREIGN KEY (`sale_order_id`) REFERENCES `sale_order` (`sale_order_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;