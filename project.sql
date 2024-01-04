-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2024 at 05:12 PM
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
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `adam_orders`
-- (See below for the actual view)
--
CREATE TABLE `adam_orders` (
`cust_name` varchar(40)
,`prod_name` varchar(20)
,`prod_qty` int(11)
,`prod_color` varchar(20)
,`cust_email` varchar(40)
,`order_date` date
,`cust_add` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_id` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `prod_price` double NOT NULL,
  `order_total_price` double NOT NULL,
  `offer_disc` double NOT NULL,
  `bill_total_price` double NOT NULL,
  `pay_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`bill_id`, `bill_date`, `cust_id`, `order_id`, `prod_id`, `prod_qty`, `prod_price`, `order_total_price`, `offer_disc`, `bill_total_price`, `pay_status`) VALUES
(3001, '2022-02-02', 1001, 5001, 9002, 2, 15.5, 31, 5, 29.45, 'PAID'),
(3002, '2022-03-11', 1002, 5002, 9003, 5, 5.99, 29.95, 0, 29.95, 'PAID'),
(3003, '2022-04-05', 1003, 5003, 9001, 9, 12, 108, 7, 100.44, 'PAID'),
(3004, '2022-06-09', 1001, 5004, 9004, 20, 20.9, 418, 0, 418, 'PAID'),
(3005, '2022-09-28', 1003, 5005, 9005, 11, 9.5, 104.5, 0, 104.5, 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(40) NOT NULL,
  `cust_email` varchar(40) NOT NULL,
  `cust_contact_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_name`, `cust_email`, `cust_contact_no`) VALUES
(1001, 'Adam ', 'Adam@mail.com', 311411211),
(1002, 'Jhon', 'Jhon@mail.com', 711811911),
(1003, 'Mike', 'Mike@mail.com', 611511811);

-- --------------------------------------------------------

--
-- Stand-in structure for view `farhan`
-- (See below for the actual view)
--
CREATE TABLE `farhan` (
`cust_id` int(11)
,`cust_name` varchar(40)
,`cust_email` varchar(40)
,`cust_contact_no` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `prod_price` double NOT NULL,
  `order_date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `cust_add` varchar(50) NOT NULL,
  `total_order_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `prod_id`, `prod_qty`, `prod_price`, `order_date`, `cust_id`, `cust_add`, `total_order_price`) VALUES
(5001, 9002, 2, 15.5, '2022-02-02', 1001, 'Rawalpindi', 31),
(5002, 9003, 5, 5.99, '2022-03-09', 1002, 'Lahore', 29.95),
(5003, 9001, 9, 12, '2022-04-05', 1003, 'Karachi', 108),
(5004, 9004, 20, 20.9, '2022-06-07', 1001, 'Rawalpindi', 418),
(5005, 9002, 10, 15.5, '2022-09-26', 1003, 'Rawalpindi', 155);

-- --------------------------------------------------------

--
-- Table structure for table `order_return`
--

CREATE TABLE `order_return` (
  `order_return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `return_date` date NOT NULL,
  `prod_id` int(11) NOT NULL,
  `return_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_return`
--

INSERT INTO `order_return` (`order_return_id`, `order_id`, `cust_id`, `return_date`, `prod_id`, `return_amount`) VALUES
(6001, 5001, 1001, '2022-03-02', 9002, 31),
(6002, 5003, 1003, '2022-05-04', 9001, 108),
(6003, 5005, 1003, '2022-10-12', 9002, 155);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pm_id` int(11) NOT NULL,
  `pay_mode` varchar(10) NOT NULL,
  `pay_date` date NOT NULL,
  `bill_id` int(11) NOT NULL,
  `pay_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pm_id`, `pay_mode`, `pay_date`, `bill_id`, `pay_amount`) VALUES
(7001, 'ONLINE', '2022-02-02', 3001, 29),
(7002, 'COD', '2022-03-13', 3002, 30),
(7003, 'ONLINE', '2022-04-05', 3003, 100),
(7004, 'COD', '2022-06-11', 3004, 418),
(7005, 'COD', '2022-09-30', 3005, 105);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(20) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `prod_price` double NOT NULL,
  `prod_color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_qty`, `prod_price`, `prod_color`) VALUES
(9001, 'Shirt', 9, 12, 'black'),
(9002, 'Pants', 7, 15.5, 'blue'),
(9003, 'Hat', 5, 5.99, 'red'),
(9004, 'Shoes', 20, 20.9, 'White'),
(9005, 'Jacket', 11, 9.5, 'Navy Blue');

-- --------------------------------------------------------

--
-- Stand-in structure for view `rawalpindi_customers`
-- (See below for the actual view)
--
CREATE TABLE `rawalpindi_customers` (
`cust_name` varchar(40)
,`prod_name` varchar(20)
,`prod_qty` int(11)
,`prod_color` varchar(20)
,`cust_email` varchar(40)
,`order_date` date
,`cust_add` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rawalpindi_orders`
-- (See below for the actual view)
--
CREATE TABLE `rawalpindi_orders` (
`cust_name` varchar(40)
,`prod_name` varchar(20)
,`prod_qty` int(11)
,`prod_color` varchar(20)
,`cust_email` varchar(40)
,`order_date` date
,`cust_add` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `shoping_cart`
--

CREATE TABLE `shoping_cart` (
  `prod_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoping_cart`
--

INSERT INTO `shoping_cart` (`prod_id`, `cust_id`, `cart_id`) VALUES
(9005, 1002, 1),
(9002, 1001, 2),
(9001, 1003, 3);

-- --------------------------------------------------------

--
-- Structure for view `adam_orders`
--
DROP TABLE IF EXISTS `adam_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adam_orders`  AS SELECT `c`.`cust_name` AS `cust_name`, `p`.`prod_name` AS `prod_name`, `d`.`prod_qty` AS `prod_qty`, `p`.`prod_color` AS `prod_color`, `c`.`cust_email` AS `cust_email`, `d`.`order_date` AS `order_date`, `d`.`cust_add` AS `cust_add` FROM ((`customer` `c` join `order_detail` `d`) join `product` `p`) WHERE `c`.`cust_id` = `d`.`cust_id` AND `p`.`prod_id` = `d`.`prod_id` AND `d`.`cust_id` = 10011001  ;

-- --------------------------------------------------------

--
-- Structure for view `farhan`
--
DROP TABLE IF EXISTS `farhan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `farhan`  AS SELECT `customer`.`cust_id` AS `cust_id`, `customer`.`cust_name` AS `cust_name`, `customer`.`cust_email` AS `cust_email`, `customer`.`cust_contact_no` AS `cust_contact_no` FROM `customer``customer`  ;

-- --------------------------------------------------------

--
-- Structure for view `rawalpindi_customers`
--
DROP TABLE IF EXISTS `rawalpindi_customers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rawalpindi_customers`  AS SELECT `c`.`cust_name` AS `cust_name`, `p`.`prod_name` AS `prod_name`, `d`.`prod_qty` AS `prod_qty`, `p`.`prod_color` AS `prod_color`, `c`.`cust_email` AS `cust_email`, `d`.`order_date` AS `order_date`, `d`.`cust_add` AS `cust_add` FROM ((`customer` `c` join `order_detail` `d`) join `product` `p`) WHERE `c`.`cust_id` = `d`.`cust_id` AND `p`.`prod_id` = `d`.`prod_id` AND `d`.`cust_add` = 'Rawalpindi''Rawalpindi'  ;

-- --------------------------------------------------------

--
-- Structure for view `rawalpindi_orders`
--
DROP TABLE IF EXISTS `rawalpindi_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rawalpindi_orders`  AS SELECT `c`.`cust_name` AS `cust_name`, `p`.`prod_name` AS `prod_name`, `d`.`prod_qty` AS `prod_qty`, `p`.`prod_color` AS `prod_color`, `c`.`cust_email` AS `cust_email`, `d`.`order_date` AS `order_date`, `d`.`cust_add` AS `cust_add` FROM ((`customer` `c` join `order_detail` `d`) join `product` `p`) WHERE `c`.`cust_id` = `d`.`cust_id` AND `p`.`prod_id` = `d`.`prod_id` AND `d`.`cust_add` = 'Rawalpindi''Rawalpindi'  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `fk_customer_bill` (`cust_id`),
  ADD KEY `fk_order_bill` (`order_id`),
  ADD KEY `fk_product_bill` (`prod_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_product_order` (`prod_id`),
  ADD KEY `fk_customer_order` (`cust_id`);

--
-- Indexes for table `order_return`
--
ALTER TABLE `order_return`
  ADD PRIMARY KEY (`order_return_id`),
  ADD KEY `fk_order_return` (`order_id`),
  ADD KEY `fk_order_customer` (`cust_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pm_id`),
  ADD KEY `fk_bill_pay` (`bill_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `shoping_cart`
--
ALTER TABLE `shoping_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_product` (`prod_id`),
  ADD KEY `fk_customer` (`cust_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `fk_customer_bill` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `fk_order_bill` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`order_id`),
  ADD CONSTRAINT `fk_product_bill` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `fk_customer_order` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `fk_product_order` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);

--
-- Constraints for table `order_return`
--
ALTER TABLE `order_return`
  ADD CONSTRAINT `fk_order_customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `fk_order_return` FOREIGN KEY (`order_id`) REFERENCES `order_detail` (`order_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_bill_pay` FOREIGN KEY (`bill_id`) REFERENCES `bill_detail` (`bill_id`);

--
-- Constraints for table `shoping_cart`
--
ALTER TABLE `shoping_cart`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`prod_id`) REFERENCES `product` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
