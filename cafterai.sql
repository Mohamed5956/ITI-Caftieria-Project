-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 01:26 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafterai`
--

-- --------------------------------------------------------

--
-- Table structure for table `apiorder`
--

CREATE TABLE `apiorder` (
  `orderid` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `ordername` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `orderprice` int(44) NOT NULL,
  `orderimag` varchar(33) NOT NULL,
  `notes` text NOT NULL,
  `amount` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `productamount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Hot drink'),
(2, 'Cool drink '),
(3, 'Fresh juice'),
(5, 'frozen');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `price` int(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `pictur` varchar(250) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Processing',
  `product_id` int(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(255) NOT NULL,
  `pictur` varchar(250) NOT NULL,
  `amount` int(50) NOT NULL,
  `category_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `pictur`, `amount`, `category_id`) VALUES
(24, 'Fresh Pomegranate Juice', 55, 'juc1.jpg', 4, 2),
(25, 'Caffè Latte', 55, 'hot3.jpg', 11, 1),
(30, 'Coffee', 55, 'cof.jpg', 19, 1),
(31, 'Jasmine Tea', 30, 'tea.webp', 17, 1),
(32, 'Frozen Orange Juice', 30, 'froz.jpg', 8, 2),
(33, 'Watermelon', 40, 'juc.jpg', 11, 3),
(34, 'Strawberry Juice', 30, 'juc2.jpg', 8, 3),
(35, 'Kiwi Juice', 50, 'juce.jpg', 25, 3),
(36, 'Ice Cream', 15, 'froz2.jpg', 94, 2),
(37, 'Lemon Juice', 30, 'lem.png', 6, 3),
(38, 'Nescafe', 21, 'mix.jpg', 7, 1),
(39, 'Orange Juice', 30, 'orange.jpg', 100, 3),
(40, 'Cool Drinks', 60, 'cool.jpeg', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`) VALUES
(1, 'room one'),
(2, 'room two');

-- --------------------------------------------------------

--
-- Table structure for table `useer_category`
--

CREATE TABLE `useer_category` (
  `user_id` int(11) DEFAULT NULL,
  `catgry_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `useer_order`
--

CREATE TABLE `useer_order` (
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `useer_prodct`
--

CREATE TABLE `useer_prodct` (
  `user_id` int(11) DEFAULT NULL,
  `podct_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `room_id` int(255) NOT NULL,
  `ext` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `isadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `room_id`, `ext`, `image`, `isadmin`) VALUES
(13, 'user', 'user@gmail.com', '123', 1, '43', 'phone_avatar.jpeg', 0),
(14, 'admin', 'admin@gmail.com', '123', 2, '12', 'admin_avatar.jpeg', 1),
(15, 'dina', 'dina@gmail.com', 'dina', 1, '12', 'dina_avatar.jpeg', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apiorder`
--
ALTER TABLE `apiorder`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `useer_category`
--
ALTER TABLE `useer_category`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `catgry_id` (`catgry_id`);

--
-- Indexes for table `useer_order`
--
ALTER TABLE `useer_order`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `useer_prodct`
--
ALTER TABLE `useer_prodct`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `podct_id` (`podct_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `room_id` (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apiorder`
--
ALTER TABLE `apiorder`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `useer_category`
--
ALTER TABLE `useer_category`
  ADD CONSTRAINT `useer_category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `useer_category_ibfk_2` FOREIGN KEY (`catgry_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `useer_order`
--
ALTER TABLE `useer_order`
  ADD CONSTRAINT `useer_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `useer_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `useer_prodct`
--
ALTER TABLE `useer_prodct`
  ADD CONSTRAINT `useer_prodct_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `useer_prodct_ibfk_2` FOREIGN KEY (`podct_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
