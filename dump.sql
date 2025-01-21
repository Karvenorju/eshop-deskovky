-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 21, 2025 at 09:34 PM
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
-- Database: `cafp00`
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
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `url` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` enum('front','back','board','other') NOT NULL DEFAULT 'other'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`url`, `product_id`, `type`) VALUES
('carcassonne-back.png', 8, 'back'),
('carcassonne-board.png', 8, 'board'),
('carcassonne-front.jpg', 8, 'front'),
('clank-back.png', 10, 'back'),
('clank-board.png', 10, 'board'),
('clank-front.png', 10, 'front'),
('feast-for-odin-back.png', 11, 'back'),
('feast-for-odin-board.png', 11, 'board'),
('feast-for-odin-front.png', 11, 'front'),
('frosthaven-back.png', 12, 'back'),
('frosthaven-board.png', 12, 'board'),
('frosthaven-front.png', 12, 'front'),
('monopoly-card-back.png', 9, 'back'),
('monopoly-card-board.png', 9, 'board'),
('monopoly-card-front.jpg', 9, 'front'),
('risk-back.png', 7, 'back'),
('risk-board.png', 7, 'board'),
('risk-front.png', 7, 'front');

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
  `sold_quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s nabízenými produkty';

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `title`, `url`, `description`, `price`, `min_player`, `max_player`, `play_time`, `min_age`, `sold_quantity`) VALUES
(7, 96, 'Risk', 'risk', 'Possibly the most popular, mass market war game. The goal is conquest of the world.\r\n\r\nEach player\'s turn consists of:\r\n- gaining reinforcements through number of territories held, control of every territory on each continent, and turning sets of bonus cards.\r\n- Attacking other players using a simple combat rule of comparing the highest dice rolled for each side. Players may attack as often as desired. If one enemy territory is successfully taken, the player is awarded with a bonus card.\r\n- Moving a group of armies to another adjacent territory.\r\n', '400.00', 1, 2, 6, 10, 5),
(8, 60, 'Carcassonne ', 'carcassonne', 'Carcassonne is a tile placement game in which the players draw and place a tile with a piece of southern French landscape represented on it. The tile might feature a city, a road, a cloister, grassland or some combination thereof, and it must be placed adjacent to tiles that have already been played, in such a way that cities are connected to cities, roads to roads, et cetera. Having placed a tile, the player can then decide to place one of his/her meeples in one of the areas on it: in the city as a knight, on the road as a robber, in the cloister as a monk, or in the field as a farmer. When that area is complete that meeple scores points for its owner.\r\n\r\nDuring a game of Carcassonne, players are faced with decisions like: \"Is it really worth putting my last meeple there?\" or \"Should I use this tile to expand my city, or should I place it near my opponent instead, giving him/her a hard time to complete his/her project and score points?\" Since players place only one tile and have the option to place one meeple on it, turns proceed quickly even if it is a game full of options and possibilities.\r\n\r\nFirst game in the Carcassonne series.', '300.00', 2, 5, 45, 7, 3),
(9, 40, 'Monopoly: The Portable Property Trading Game', 'monopoly-card', 'A very small travel version of Monopoly which often comes in the shape of a red suitcase and plays very similarly to the original game. One difference is that it contains three dice. The Community Chest and Chance cards are replaced with tables. Three dice are rolled and the tables are referenced to find the result.\r\n\r\nThe Waddington\'s UK edition has different properties than the U.S. version, and also comes in a different sort of case with a magnetic board and magnetic hotels, houses, and movers.\r\n', '645.00', 2, 6, 120, 8, 0),
(10, 47, 'Clank! Legacy: Acquisitions Incorporated', 'clank', 'Clank! Legacy: Acquisitions Incorporated extends the deck-building fun of Clank! with legacy-style gameplay! Found your own franchise of the legendary adventuring company, Acquisitions Incorporated, and shepherd your fledgling treasure-hunters to immortal corporate glory over the course of multiple games. Your game board, your deck, and your world change as you play to create a unique campaign tailored to your adventuring party. Be cunning, be bold, and most importantly, be ready...', '546.00', 2, 4, 120, 13, 0),
(11, 40, 'A Feast for Odin ', 'feast-for-odin', 'A Feast for Odin is a saga in the form of a board game. You are reliving the cultural achievements, mercantile expeditions, and pillages of those tribes we know as Viking today — a term that was used quite differently towards the end of the first millennium.\r\n\r\nWhen the northerners went out for a raid, they used to say they headed out for a viking. Their Scandinavian ancestors, however, were much more than just pirates. They were explorers and founders of states. Leif Eriksson is said to be the first European in America, long before Columbus.\r\nIn what is known today as Normandy, the intruders were not called Vikings but Normans. One of them is the famous William the Conqueror who invaded England in 1066. He managed to do what the king of Norway failed to do only a few years prior: conquer the Throne of England. The reason the people of these times became such strong seafarers was their unfortunate agricultural situation: crop shortfalls caused great distress.\r\n\r\nIn this game, you will raid and explore new territories. You will also engage in the day-to-day activity of collecting goods with which to achieve a financially secure position in society. In the end, the player whose possessions bear the greatest value will be declared the winner.', '875.00', 1, 4, 120, 12, 0),
(12, 4, 'Frosthaven', 'frosthaven', 'Frosthaven is the story of a small outpost far to the north of the capital city of White Oak. It\'s an outpost barely surviving the harsh weather let alone invasions from forces both known and unknown. However, a group of mercenaries, at the end of their rope, will help bring this settlement back from the edge of destruction. Not only will they have to deal with the harsh elements, but with other, far more dangerous threats out in the unforgiving cold, as well. There are: Algox, the bigger, more yeti-like cousins of the Inox, attacking from the mountains; Lurkers flooding in from the northern sea; and rumors have it that there are machines that wander the frozen wastes of their own free will. The party of mercenaries must face all of these perils, and perhaps in doing so, make peace with these new races so they can work together against even more sinister forces.\r\n\r\nFrosthaven is a standalone adventure from the designer and publisher of Gloomhaven that features sixteen new characters, three new races, more than twenty new enemies, more than one hundred new items, and a new, 100-scenario campaign. Characters and items from Gloomhaven will be usable in Frosthaven, and vice versa.\r\n\r\nIn addition to using the well-known combat mechanisms of Gloomhaven, Frosthaven features other elements, such as mysteries to solve, a seasonal event system to live through, and player control over how the ramshackle village expands, with each new building offering new ways to progress.\r\n\r\nFrosthaven has a whole new set of items but there is a mechanism for bringing items over from \'Gloomhaven\'. However, as Frosthaven\'s outpost is a remote location, these products may be imported but are not present as standard items. Resources are much more valuable and you have to build items through a crafting system rather than just buying them.', '246.00', 1, 4, 180, 14, 0);

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
(6, 3, 'SO-20250121-000004', 'Petr Cafourek', 'cafourek2@gmail.com', '+420 731730756', 'something 123', '947.00', '2025-01-21 19:27:26', 'pending');

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
(9, 6, 8, 1, '300.00');

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
(3, 'Petr Cafourek', 'cafourek2@gmail.com', NULL, 'admin', '$2y$10$0f8twanVO/ep33KiMsgQGumKVqQq/o6er3aWFF29fFQrHp5sarrGu', '+420 731730756', 'something 123');

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
  ADD PRIMARY KEY (`url`),
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
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sale_order`
--
ALTER TABLE `sale_order`
  MODIFY `sale_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sale_order_line`
--
ALTER TABLE `sale_order_line`
  MODIFY `sale_order_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
