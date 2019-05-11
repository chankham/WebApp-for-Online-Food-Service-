-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2017 at 09:52 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mc_online_foods`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_no` int(11) NOT NULL,
  `user_name` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `CreatedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_no`, `user_name`, `password`, `CreatedDate`) VALUES
(10, 'chantha', '12345', '0000-00-00 00:00:00'),
(12, 'database boi', '14689', '0000-00-00 00:00:00'),
(28, 'meelan', '12345wewrt', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` int(11) NOT NULL,
  `customer_ID` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `staff_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `receipt_no` varchar(50) NOT NULL,
  `conformation_no` int(11) NOT NULL,
  `payment_type_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `receipt_num` varchar(50) NOT NULL,
  `payment_type_ID` varchar(50) NOT NULL,
  `payment_type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `phone_no` varchar(12) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(256) NOT NULL,
  `serial_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`fname`, `lname`, `phone_no`, `email`, `address`, `serial_no`) VALUES
('chan', 'ko', '8171234567', 'chan@gmail.com', '5555 claire dr', 10),
('ali', 'sharifa', '911', 'TA@gmail.com', 'uta', 12),
('meelan', 'ki', '8171234567', 'meelan@gmail.com', '5555 claire dr', 28);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_ID` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `product_price` decimal(6,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `instock` int(100) NOT NULL DEFAULT '0',
  `category_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_ID`, `product_name`, `description`, `product_price`, `image`, `instock`, `category_no`) VALUES
('1', 'Orange', 'Sour ', '1.00', '1.jpg', 6, '1'),
('12', 'Fruits combo', 'Mixture of various fruits', '9.99', '12.jpg', 12, '1'),
('14', 'Apple chips', 'Chips made for local apple', '2.99', '14.jpg', 14, '1'),
('2', 'Sausage Ball', 'Uniquely designed beef sausage', '9.99', '2.jpg', 20, '1'),
('3', 'Fried Chicken', 'spicy', '7.99', '3.jpg', 5, '1'),
('4', 'Curry rice', 'Nice and Fluffy', '20.00', '4.jpg', 20, '3'),
('5', 'Rice Noodle', 'Noodle soup with chicken broth', '4.99', '5.jpg', 5, '1'),
('6', 'Nepalese Thali Set', 'Traditional Nepali food from the Himalyas', '10.99', '6.jpg', 6, '3'),
('7', 'Volcanic Ice Cream', 'Volcanic ice cream with mind blowing taste', '4.99', '7.jpg', 7, '5');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_cat_ID` varchar(50) NOT NULL,
  `product_cat_name` varchar(50) NOT NULL,
  `product_cat_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_cat_ID`, `product_cat_name`, `product_cat_description`) VALUES
('1', 'appitizer', 'let start'),
('2', 'salad', 'lets have something fresh and healthy'),
('3', 'main dish', 'time to fill up your tummy'),
('4', 'dessert', 'sweet party time'),
('5', 'beverage', 'wanna have a drink?');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `order_list_no` int(11) NOT NULL,
  `unit_product_no` varchar(50) NOT NULL,
  `unit_price` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_no` int(11) NOT NULL,
  `ssn` varchar(12) NOT NULL,
  `salary` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_no`, `ssn`, `salary`) VALUES
(10, '1234567', '9999.99');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_no`),
  ADD UNIQUE KEY `customer_no` (`customer_no`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`),
  ADD UNIQUE KEY `order_ID` (`order_ID`),
  ADD KEY `orders_ibfk_2` (`staff_ID`),
  ADD KEY `orders_ibfk_1` (`customer_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`receipt_no`),
  ADD UNIQUE KEY `receipt_no` (`receipt_no`),
  ADD KEY `conformation_no` (`conformation_no`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`receipt_num`,`payment_type_ID`),
  ADD UNIQUE KEY `payment_type_ID` (`payment_type_ID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`serial_no`),
  ADD UNIQUE KEY `serial_no` (`serial_no`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `product_ibfk_1` (`category_no`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_cat_ID`),
  ADD UNIQUE KEY `product_cat_ID` (`product_cat_ID`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`unit_product_no`,`order_list_no`),
  ADD KEY `order_list_no` (`order_list_no`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_no`),
  ADD UNIQUE KEY `staff_no` (`staff_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `serial_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_no`) REFERENCES `person` (`serial_no`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_no`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_no`) ON DELETE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`conformation_no`) REFERENCES `orders` (`order_ID`);

--
-- Constraints for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD CONSTRAINT `payment_type_ibfk_1` FOREIGN KEY (`receipt_num`) REFERENCES `payment` (`receipt_no`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_no`) REFERENCES `product_category` (`product_cat_ID`) ON UPDATE NO ACTION;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`unit_product_no`) REFERENCES `product` (`product_ID`),
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`order_list_no`) REFERENCES `orders` (`order_ID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`staff_no`) REFERENCES `person` (`serial_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
