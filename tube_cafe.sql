-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2023 at 01:28 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tube_cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(2, 'admin', 'admin@gmail.com', 'admin123'),
(3, 'cashier', 'cashier@gmai.com', 'cashier123');

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(5, 'TEA'),
(6, 'COFFEE'),
(7, 'FRAPPE'),
(8, 'MOCHA'),
(9, 'CHOCOLATE');

-- --------------------------------------------------------

--
-- Table structure for table `order_pending`
--

CREATE TABLE `order_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_pending`
--

INSERT INTO `order_pending` (`order_id`, `user_id`, `invoice_number`, `product_id`, `quantity`, `order_status`) VALUES
(1, 1, 95918042, 14, 1, 'pending'),
(2, 1, 1288931684, 12, 1, 'pending'),
(3, 1, 1500620449, 11, 1, 'pending'),
(4, 1, 207188900, 3, 1, 'pending'),
(5, 1, 1120244945, 8, 2, 'pending'),
(6, 4, 1192201831, 4, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_description` varchar(100) NOT NULL,
  `product_keywords` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keywords`, `category_id`, `brand_id`, `product_image`, `product_price`, `date`, `status`) VALUES
(1, 'Thnol Coffee', 'Thnol Coffee is a Tube\'s signature coffee. It\'s inspired by so-called\"Street coffee\" the ingredients', 'Black', 6, 1, 'Tnolcafe.jpg', '2.5$', '2023-11-01 12:00:33', 'true'),
(2, 'Tnol Frappe', 'Arabica Esspresso', 'Tnol Frappe', 7, 1, 'tnalfrapp.jpg', '2.5$', '2023-11-01 11:59:53', 'true'),
(3, 'Mocha Frappe', '100% Arabica', 'mocha Frappe', 8, 4, 'mochafrapp.jpg', '5$', '2023-11-01 11:46:47', 'true'),
(4, 'Americano', '100% Arabica bean', 'americano', 6, 5, 'Black Coffee.jpg', '2.5$', '2023-11-01 11:48:40', 'true'),
(5, 'Arabica Latte', 'Experience the sublime fusion of 100% Arabica beans and creamy milk in our latte, delivering a harmo', 'ice', 6, 1, 'Tubelatte.jpg', '2.5$', '2023-11-01 12:09:59', 'true'),
(6, 'Caramel Coffee', 'The combination of delicious 100% Arabica espresso with caramel syrup and steamed milk on top', 'Caramel Coffee', 6, 1, 'caramelfrapp.jpg', '4$', '2023-11-01 12:01:08', 'true'),
(7, 'Chocolate Milk', 'Special ingredients of our Ice Mocha including a hot espresso shot, very well balanced', 'chocolate Milk', 9, 1, 'tubechoco.jpg', '2.5$', '2023-11-01 12:04:25', 'true'),
(8, '100% Arabica Mocha', '100% Arabica Mocha', '100% Arabica Mocha', 6, 1, 'Mocha.jpg', '4$', '2023-11-01 12:01:29', 'true'),
(9, 'Grean Tea', 'A perfect balance between green tea and the sweetness of milk', 'Green tea', 5, 1, 'greentea.jpg', '2.5$', '2023-11-01 11:59:13', 'true'),
(10, 'Thai Red Tea', 'With the combination of freshly brewed tea, fresh milk, condensed milk, cream, and ice', 'Thai Red Tea', 5, 2, 'Thaitea.jpg', '2.5$', '2023-11-01 12:01:43', 'true'),
(11, 'Passion', 'Sweet, fresh and yummy (For ref only)', 'Passion', 5, 1, 'passion.jpg', '2.5$', '2023-11-01 12:01:58', 'true'),
(12, 'Wildberry Rasberry Tea ', 'Special Taste, Rose Red color mixed up the quality of Tea with Rose Berry Flavor', 'Wildberry Rasberry Tea', 5, 1, 'tea.jpg', '2.5$', '2023-11-01 12:02:09', 'true'),
(13, 'Hot chocolate', 'Light brown color, creamy texture, and sweet flavor, milk chocolate is widely regarded ', 'chocolate', 9, 1, 'hotchoco.jpg', '2.5$', '2023-11-01 11:52:14', 'true'),
(14, 'Honey Lime Tea', 'Honey Soda with Japanese lemon', 'Honey Lime Tea', 5, 1, 'lemontea.jpg', '2.5$', '2023-11-01 11:52:41', 'true'),
(15, 'Green tea Frappe', 'Green Tea Frappe ', 'Green tea Frappe', 7, 1, 'greenteafrapp.jpg', '2.5$', '2023-11-01 12:00:08', 'true'),
(16, 'Honey Yuzu Fizz', 'For ref only: A bright and sweet pleasure', 'Honey Yuzu Fizz', 5, 1, 'lemonade.jpg', '2.5$', '2023-11-01 12:02:44', 'true'),
(17, 'Caramel Macchiato', '100% Arabica Caramel Macchiato', 'Caramel Macchiato', 6, 1, 'Cappu.jpg', '2.5$', '2023-11-01 11:54:57', 'true'),
(18, 'Blurberry Frappe', 'Blueberry frappe', 'Blueberry Frappe', 7, 1, 'berryfrappe.jpg', '2.5$', '2023-11-01 12:05:15', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_product` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `user_id`, `amount_due`, `invoice_number`, `total_product`, `order_date`, `order_status`) VALUES
(1, 1, 4, 95918042, 1, '2023-09-29 07:34:14', 'Complete'),
(2, 1, 5, 1288931684, 1, '2023-09-30 15:36:02', 'Complete'),
(4, 1, 0, 207188900, 1, '2023-09-30 15:36:09', 'Complete'),
(5, 1, 8, 1120244945, 1, '2023-10-02 15:36:24', 'Complete'),
(6, 4, 5, 1192201831, 1, '2023-10-27 19:39:45', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `user_payment`
--

CREATE TABLE `user_payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_payment`
--

INSERT INTO `user_payment` (`payment_id`, `order_id`, `invoice_number`, `amount`, `payment_mode`, `date`) VALUES
(2, 2, 1288931684, 5, 'ACLEDA', '2023-09-30 15:36:02'),
(3, 4, 207188900, 0, 'WING', '2023-09-30 15:36:09'),
(4, 5, 1120244945, 8, 'ACLEDA', '2023-10-02 15:36:24'),
(5, 6, 1192201831, 5, 'ABA', '2023-10-27 19:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_name`, `user_email`, `user_password`, `user_image`, `user_ip`, `user_address`, `user_mobile`) VALUES
(4, 'monika', 'monika@gmail.com', 'admin123', 'photo_2023-08-04_20-03-27.jpg', '::1', 'monika@gmail.com', '0968153198');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `order_pending`
--
ALTER TABLE `order_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payment`
--
ALTER TABLE `user_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_pending`
--
ALTER TABLE `order_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_payment`
--
ALTER TABLE `user_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
