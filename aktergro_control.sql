-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2021 at 02:41 AM
-- Server version: 10.3.21-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aktergro_control`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` int(11) NOT NULL,
  `doc_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL DEFAULT 0,
  `parent_category` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `code`, `name`, `department_id`, `parent_category`, `description`, `created_at`, `updated_at`) VALUES
(1, '011', 'FRESH FOOD', 1, 0, 'FRESH FOOD ITEMS', '2020-08-18 22:23:45', '2020-08-18 22:23:45');

-- --------------------------------------------------------

--
-- Table structure for table `combos`
--

CREATE TABLE `combos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evalucation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `alert_quantity` int(11) NOT NULL,
  `items_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `combo_price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `code`, `email`, `name`, `city`, `phone`, `country`, `address`, `type`, `created_at`, `updated_at`) VALUES
(1, 'cus001', 'vong@chong.com', 'Walk In Customer', 'Dubai', '99015646', 'UAE', 'Suite:34, Alipur road', 'Premium', NULL, NULL),
(2, 'cus002', 'abc@cde.def', 'Run In Customer', 'Dohar', '99086846', 'UAE', 'Suite:4, Dohar paradise', 'General', NULL, NULL),
(3, 'cus003', 'van@gnn.ccc', 'Aninda', 'Mosco', '0181719786', 'Russia', 'suit:07', 'Regular', '2020-09-06 01:27:32', '2020-09-06 01:27:32'),
(4, 'cus001', 'demo@cus.com', 'Shakawat', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-09 03:08:44', '2020-09-09 03:08:44'),
(5, 'cus005', 'mahbub@gmail.com', 'Mahbub Alam', 'dhaka', '01804171564', 'Bangladesh', '722/1haji k. Ali road,east jurain', 'Regular customer', '2020-09-09 03:09:30', '2020-09-09 03:09:30'),
(6, 'cus001', 'demo@cus.com', 'Holla', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-09 04:41:14', '2020-09-09 04:41:14'),
(7, 'cus001', 'demo@cus.com', 'Farhad', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-09 04:47:44', '2020-09-09 04:47:44'),
(8, 'cus001', 'demo@cus.com', 'Olla', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-09 04:50:16', '2020-09-09 04:50:16'),
(9, 'cus001', 'demo@cus.com', 'polop', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-09 04:55:56', '2020-09-09 04:55:56'),
(10, 'cus007', 'a@b.c', 'Shakawat Hossain', 'borisal', '0987654', 'Bangladesh', '722/1haji k. Ali road,east jurain', 'Regular customer', '2020-09-09 05:29:15', '2020-09-09 05:29:15'),
(11, 'cus001', 'demo@cus.com', 'ulala', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-10 05:01:35', '2020-09-10 05:01:35'),
(12, 'cus001', 'demo@cus.com', 'Amir Khan', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-10 05:12:46', '2020-09-10 05:12:46'),
(13, 'cus001', 'demo@cus.com', 'Saharukh Khan', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-10 05:14:11', '2020-09-10 05:14:11'),
(14, 'cus001', 'demo@cus.com', 'Soual', 'walkincustomer', '000000', 'walkincustomer', 'walkincustomer', 'WalkInCustomer', '2020-09-10 05:16:50', '2020-09-10 05:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` int(11) NOT NULL,
  `doc_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `unit_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'FOOD', '01', 'GROCERY FOOD ITEMS', '2020-08-18 22:22:23', '2020-08-18 22:22:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `f_o_c_items`
--

CREATE TABLE `f_o_c_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lpo_receives`
--

CREATE TABLE `lpo_receives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2020_04_21_160445_create_departments_table', 1),
(5, '2020_04_21_160505_create_units_table', 1),
(6, '2020_04_21_160617_create_stores_table', 1),
(7, '2020_04_21_160656_create_categories_table', 1),
(8, '2020_04_21_160713_create_vendors_table', 1),
(9, '2020_04_26_184059_create_products_table', 1),
(10, '2020_04_26_185320_create_product_pricings_table', 1),
(11, '2020_04_28_182339_create_combos_table', 1),
(12, '2020_04_28_183237_create_repackings_table', 1),
(13, '2020_05_04_114931_create_price_update_histories_table', 1),
(14, '2020_05_04_174307_create_promotional_products_table', 1),
(15, '2020_05_05_170843_create_offers_table', 1),
(16, '2020_05_05_213843_create_product_wise_vendors_table', 1),
(17, '2020_05_07_200732_create_adjustments_table', 1),
(18, '2020_05_07_201010_create_damages_table', 1),
(19, '2020_05_10_185018_create_stock_calculations_table', 1),
(20, '2020_05_19_180932_create_taxes_table', 1),
(160, '2014_10_12_000000_create_users_table', 2),
(161, '2014_10_12_100000_create_password_resets_table', 2),
(162, '2019_08_19_000000_create_failed_jobs_table', 2),
(163, '2020_06_08_185955_create_permission_tables', 2),
(164, '2020_06_14_144257_create_requisitions_table', 2),
(165, '2020_06_15_201040_create_purchases_table', 2),
(166, '2020_06_15_202603_create_transfers_table', 2),
(167, '2020_06_16_210446_create_purchase_returns_table', 2),
(168, '2020_06_16_211352_create_transfer_returns_table', 2),
(169, '2020_06_16_211718_create_trn_receives_table', 2),
(170, '2020_06_16_212342_create_lpo_receives_table', 2),
(171, '2020_06_18_171505_create_requisition_wise_items_table', 2),
(172, '2020_06_20_185212_create_purchase_order_wise_items_table', 2),
(173, '2020_06_24_070530_create_f_o_c_items_table', 2),
(174, '2020_06_24_180306_create_transfer_items_table', 2),
(175, '2020_06_26_210102_create_transfer_return_items_table', 2),
(176, '2020_06_26_210346_create_purchase_return_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `buy_product_id` int(11) NOT NULL,
  `buy_quantity` int(11) NOT NULL,
  `get_product_id` int(11) NOT NULL,
  `get_quantity` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_details` text DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_details`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:2;s:7:\"editing\";b:0;}}', 29.07, 1, '2020-09-01 00:48:08', '2020-09-01 00:48:08'),
(2, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 00:48:32', '2020-09-01 00:48:32'),
(3, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:01:08', '2020-09-01 01:01:08'),
(4, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:02:03', '2020-09-01 01:02:03'),
(5, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:02:48', '2020-09-01 01:02:48'),
(6, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:02:56', '2020-09-01 01:02:56'),
(7, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:03:24', '2020-09-01 01:03:24'),
(8, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:04:26', '2020-09-01 01:04:26'),
(9, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:04:55', '2020-09-01 01:04:55'),
(10, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:05:39', '2020-09-01 01:05:39'),
(11, 2, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:06:50', '2020-09-01 01:06:50'),
(12, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:07:42', '2020-09-01 01:07:42'),
(13, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:07:54', '2020-09-01 01:07:54'),
(14, 2, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:08:50', '2020-09-01 01:08:50'),
(15, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:09:16', '2020-09-01 01:09:16'),
(16, 2, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:09:37', '2020-09-01 01:09:37'),
(17, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:10:10', '2020-09-01 01:10:10'),
(18, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:10:30', '2020-09-01 01:10:30'),
(19, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-01 01:10:57', '2020-09-01 01:10:57'),
(20, 2, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:2;s:7:\"editing\";b:0;}}', 29.07, 1, '2020-09-01 07:25:09', '2020-09-01 07:25:09'),
(21, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-02 03:29:31', '2020-09-02 03:29:31'),
(22, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-05 22:42:12', '2020-09-05 22:42:12'),
(23, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:3;s:7:\"editing\";b:0;}}', 43.61, 2, '2020-09-05 23:16:57', '2020-09-05 23:16:57'),
(24, 2, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-05 23:22:41', '2020-09-10 05:06:03'),
(25, 3, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:3;s:7:\"editing\";b:0;}}', 43.61, 2, '2020-09-06 01:29:01', '2020-09-06 01:29:01'),
(26, 9, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:4;s:7:\"editing\";b:0;}}', 58.15, 1, '2020-09-09 04:56:05', '2020-09-09 04:56:05'),
(27, 6, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:3;s:7:\"editing\";b:0;}}', 43.61, 1, '2020-09-09 05:27:56', '2020-09-09 05:27:56'),
(28, 10, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:4;s:7:\"editing\";b:0;}}', 58.15, 1, '2020-09-09 05:29:40', '2020-09-09 05:29:40'),
(29, 2, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 1, '2020-09-10 05:00:26', '2020-09-10 05:00:26'),
(30, 11, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:2;s:7:\"editing\";b:0;}}', 29.07, 1, '2020-09-10 05:01:53', '2020-09-10 05:01:53'),
(31, 2, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 2, '2020-09-10 05:02:18', '2020-09-10 05:02:18'),
(32, 14, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:7;s:7:\"editing\";b:0;}}', 101.76, 1, '2020-09-10 05:17:03', '2020-09-10 05:17:16'),
(33, 3, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 3, '2020-09-26 07:28:45', '2020-09-26 07:28:45'),
(34, 1, 'a:1:{i:0;a:3:{s:4:\"item\";a:3:{s:4:\"code\";s:6:\"101252\";s:4:\"name\";s:25:\"AL DHAFRA DATES 1KG DABBA\";s:5:\"price\";d:13.65;}s:13:\"numberOfItems\";i:1;s:7:\"editing\";b:0;}}', 14.54, 3, '2020-09-26 07:28:56', '2020-09-26 07:28:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin-list', 'web', NULL, '2020-08-23 18:36:29', '2020-08-23 18:36:29'),
(2, 'admin-create', 'web', NULL, '2020-08-23 18:36:29', '2020-08-23 18:36:29'),
(3, 'admin-edit', 'web', NULL, '2020-08-23 18:36:29', '2020-08-23 18:36:29'),
(4, 'admin-delete', 'web', NULL, '2020-08-23 18:36:29', '2020-08-23 18:36:29'),
(5, 'manager-list', 'web', NULL, '2020-08-23 18:36:29', '2020-08-23 18:36:29'),
(6, 'manager-create', 'web', NULL, '2020-08-23 18:36:29', '2020-08-23 18:36:29'),
(7, 'manager-edit', 'web', NULL, '2020-08-23 18:36:29', '2020-08-23 18:36:29'),
(8, 'manager-delete', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(9, 'customer-list', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(10, 'customer-create', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(11, 'customer-edit', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(12, 'customer-delete', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(13, 'user-list', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(14, 'user-create', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(15, 'user-edit', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(16, 'user-delete', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(17, 'vendor-list', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(18, 'vendor-create', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(19, 'vendor-edit', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(20, 'vendor-delete', 'web', NULL, '2020-08-23 18:36:30', '2020-08-23 18:36:30'),
(21, 'staff-list', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(22, 'staff-create', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(23, 'staff-edit', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(24, 'staff-delete', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(25, 'role-list', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(26, 'role-create', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(27, 'role-edit', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(28, 'role-delete', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(29, 'permission-list', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(30, 'permission-create', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(31, 'permission-edit', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(32, 'permission-delete', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(33, 'dashboard-list', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(34, 'dashboard-create', 'web', NULL, '2020-08-23 18:36:31', '2020-08-23 18:36:31'),
(35, 'dashboard-edit', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(36, 'dashboard-delete', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(37, 'product-list', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(38, 'product-create', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(39, 'product-edit', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(40, 'product-delete', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(41, 'order-list', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(42, 'order-create', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(43, 'order-edit', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(44, 'order-delete', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(45, 'blog-list', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(46, 'blog-create', 'web', NULL, '2020-08-23 18:36:32', '2020-08-23 18:36:32'),
(47, 'blog-edit', 'web', NULL, '2020-08-23 18:36:33', '2020-08-23 18:36:33'),
(48, 'blog-delete', 'web', NULL, '2020-08-23 18:36:33', '2020-08-23 18:36:33'),
(49, 'pos-list', 'web', NULL, '2020-09-25 12:23:18', '2020-09-25 12:23:18'),
(50, 'pos-create', 'web', NULL, '2020-09-25 12:23:19', '2020-09-25 12:23:19'),
(51, 'pos-edit', 'web', NULL, '2020-09-25 12:23:19', '2020-09-25 12:23:19'),
(52, 'pos-delete', 'web', NULL, '2020-09-25 12:23:19', '2020-09-25 12:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `price_update_histories`
--

CREATE TABLE `price_update_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `prev_cost` double(8,2) NOT NULL,
  `prev_price` double(8,2) NOT NULL,
  `prev_markup` double(8,2) NOT NULL,
  `updated_price` double(8,2) NOT NULL,
  `updated_markup` double(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deptlpo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `alert_quantity` int(11) DEFAULT 0,
  `quantity` int(11) DEFAULT 1,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `barcode`, `evaluation`, `deptlpo`, `generic_description`, `short_description`, `long_description`, `delivery_mode`, `department_id`, `category_id`, `unit_id`, `alert_quantity`, `quantity`, `note`, `created_at`, `updated_at`) VALUES
(1, 'AL DHAFRA DATES 1KG DABBA', '101252', '8945612375000', 'something', 'Food', 'LPDS_0112', 'DFRA DTS', 'AL DHAFRA DATES 1KG DABBA', 'DC', 1, 1, 1, 20, 20, NULL, '2020-08-18 22:55:13', '2020-08-20 03:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_pricings`
--

CREATE TABLE `product_pricings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `final_cost` double(8,2) DEFAULT 0.00,
  `avg_cost` double(8,2) DEFAULT 0.00,
  `last_grn_cost` double(8,2) DEFAULT 0.00,
  `markup` double(8,2) DEFAULT 0.00,
  `final_price` double(8,2) DEFAULT 0.00,
  `price_without_tax` double(8,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_pricings`
--

INSERT INTO `product_pricings` (`id`, `product_id`, `final_cost`, `avg_cost`, `last_grn_cost`, `markup`, `final_price`, `price_without_tax`, `created_at`, `updated_at`) VALUES
(1, 1, 10.00, 9.00, 11.00, 30.00, 13.65, 13.00, '2020-08-18 22:55:13', '2020-08-20 03:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `product_wise_vendors`
--

CREATE TABLE `product_wise_vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_wise_vendors`
--

INSERT INTO `product_wise_vendors` (`id`, `product_id`, `vendor_id`, `vendor_price`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 10, '2020-08-20 03:29:09', '2020-08-20 03:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `promotional_products`
--

CREATE TABLE `promotional_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `promotion_start` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion_end` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promotion_price` double(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotional_products`
--

INSERT INTO `promotional_products` (`id`, `date`, `reference`, `store_ids`, `item_id`, `promotion_start`, `promotion_end`, `promotion_price`, `note`, `created_at`, `updated_at`) VALUES
(1, '2020/7/20 15:34', 'pr_1597923298497', '1', 1, '08/20/2020 ', ' 08/29/2020', 12.00, NULL, '2020-08-20 03:35:30', '2020-08-20 03:35:30');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requisition_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_confirm_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = draft, 1= final',
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_foc` tinyint(1) NOT NULL DEFAULT 0,
  `vendor_id` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `tax` double(8,2) DEFAULT 0.00,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `date`, `requisition_date`, `vendor_confirm_date`, `shipping_date`, `reference`, `location_id`, `status`, `document_file`, `is_foc`, `vendor_id`, `discount`, `tax`, `note`, `created_at`, `updated_at`) VALUES
(1, '2020/08/25 05:08:53', '2020/08/25 05:08:53', '2020/08/25 05:08:53', '2020/08/25 05:08:53', 'PO1598333093103', 1, 1, '', 0, 1, 0.00, 0.00, NULL, '2020-08-24 21:25:36', '2020-08-24 21:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_wise_items`
--

CREATE TABLE `purchase_order_wise_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_wise_items`
--

INSERT INTO `purchase_order_wise_items` (`id`, `item_id`, `purchase_id`, `quantity`, `discount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0.00, '2020-08-24 21:25:36', '2020-08-24 21:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '1 = draft, 2= sent',
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_returns`
--

INSERT INTO `purchase_returns` (`id`, `date`, `reference`, `location_id`, `status`, `document_file`, `vendor_id`, `note`, `created_at`, `updated_at`) VALUES
(1, '2020/08/26 05:08:56', 'PO1598418056656', 1, 1, '', 1, NULL, '2020-08-25 21:04:16', '2020-08-25 21:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_return_items`
--

INSERT INTO `purchase_return_items` (`id`, `item_id`, `purchase_return_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2020-08-25 21:04:16', '2020-08-25 21:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `repackings`
--

CREATE TABLE `repackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evalucation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `generic_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `alert_quantity` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `additional_cost` double(8,2) DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requisitions`
--

CREATE TABLE `requisitions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1= sent',
  `requisition_from` int(11) NOT NULL,
  `requisition_to` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 = vegetable, 2= DC, 3 = DSD',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requisitions`
--

INSERT INTO `requisitions` (`id`, `date`, `reference`, `status`, `requisition_from`, `requisition_to`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, '2020/08/26 05:08:18', 'req_1598418678579', 0, 1, 1, 1, NULL, '2020-08-25 21:13:44', '2020-08-25 21:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `requisition_wise_items`
--

CREATE TABLE `requisition_wise_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requisition_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requisition_wise_items`
--

INSERT INTO `requisition_wise_items` (`id`, `requisition_id`, `item_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, '2020-08-25 21:13:44', '2020-08-25 21:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2020-08-23 18:36:40', '2020-09-15 11:06:41'),
(2, 'Pos Manager', 'web', '2020-09-15 10:49:13', '2020-09-26 06:56:20'),
(3, 'Cluster Admin', 'web', '2020-09-15 11:08:13', '2020-09-15 11:08:13'),
(4, 'Executive Admin', 'web', '2020-09-15 11:11:57', '2020-09-15 11:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(7, 4),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(37, 4),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(41, 2),
(41, 3),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(45, 3),
(45, 4),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_calculations`
--

CREATE TABLE `stock_calculations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `counted_stock` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_calculations`
--

INSERT INTO `stock_calculations` (`id`, `zone`, `item_id`, `store_id`, `stock`, `counted_stock`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '101', 1, 1, NULL, 10, 1, 0, '2020-08-20 03:39:38', '2020-08-20 03:39:38'),
(2, '1', 1, 1, NULL, 50, 1, 0, '2020-08-20 04:33:02', '2020-08-20 04:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `code`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Electra', '2101', '123456789', 'sm2101.masm@aktergroup.ae', 'Electra, Abu Dhabi, UAE', '2020-08-18 22:16:11', '2020-08-18 22:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 5.00, '2020-08-18 22:43:54', '2020-08-18 22:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '1 = sent, 2= received',
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `date`, `reference`, `transfer_from`, `transfer_to`, `status`, `document_file`, `note`, `created_at`, `updated_at`) VALUES
(1, '2020/06/27 10:06:57', 'TRN1593298618519', 1, 3, 1, 'uploads/transfer_document/1593300631.pdf', 'sdsfsf', '2020-06-27 16:57:37', '2020-06-27 17:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_items`
--

CREATE TABLE `transfer_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transfer_items`
--

INSERT INTO `transfer_items` (`id`, `transfer_id`, `item_id`, `quantity`, `created_at`, `updated_at`) VALUES
(4, 1, 5, 12, '2020-06-27 17:30:31', '2020-06-27 17:30:31'),
(5, 1, 35, 122, '2020-06-27 17:30:31', '2020-06-27 17:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `transfer_returns`
--

CREATE TABLE `transfer_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_from` int(11) NOT NULL,
  `transfer_to` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '1 = Draft, 2= Sent',
  `document_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer_return_items`
--

CREATE TABLE `transfer_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trn_receives`
--

CREATE TABLE `trn_receives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `note`, `created_at`, `updated_at`) VALUES
(1, 'PCS', 'PCS', '2020-08-18 22:22:36', '2020-08-18 22:22:36'),
(2, 'KG', 'KG', '2020-08-18 22:22:43', '2020-08-18 22:22:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `phone`, `email`, `role_id`, `user_type`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'sadmin', '01917919032', 'admin@gmail.com', 1, 'Super Admin', NULL, '$2y$10$voQgo4nTVfFWPLct7f1cN.QExjS5q8mNkx/H224W6InXvOFWZXnL.', NULL, '2020-08-23 18:36:40', '2020-09-26 07:05:00'),
(2, 'Motaleb Hossain', 'motaleb', '0134544444', 'pos1@gmail.com', 2, 'Pos Manager', NULL, '$2y$10$EMl5u41fdqyP5vRIRPLzTuwIfa7bsFDd57a9//tSwXSu7p8zZ0Uq.', NULL, '2020-08-23 18:46:05', '2020-09-27 10:19:28'),
(5, 'Neoyaz Hossain', 'neoyaz', '0199239292', 'pos2@gmail.com', 2, 'Pos Manager', NULL, '$2y$10$iJ/yVtuSIYS7/8TMz13.HOEJBqdkoqljJ37tby3kmLbevzdU7yyyC', NULL, '2020-08-25 23:35:57', '2020-09-26 06:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_term` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `code`, `company`, `vat_no`, `email`, `name`, `city`, `phone`, `country`, `payment_term`, `discount`, `address`, `type`, `created_at`, `updated_at`) VALUES
(1, 'M123456', 'FRESH FOOD COMPANY', '123456789', 'ffc@gmail.com', 'FRESH FOOD COMPANY', 'ABU DHABI', '99999999999', 'UAE', 30, 5.00, 'MUSAFFAH 44', 'Principle vendor', '2020-08-18 22:26:57', '2020-08-18 22:26:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_o_c_items`
--
ALTER TABLE `f_o_c_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lpo_receives`
--
ALTER TABLE `lpo_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offers_code_unique` (`code`),
  ADD UNIQUE KEY `offers_barcode_unique` (`barcode`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_update_histories`
--
ALTER TABLE `price_update_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_pricings`
--
ALTER TABLE `product_pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_wise_vendors`
--
ALTER TABLE `product_wise_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotional_products`
--
ALTER TABLE `promotional_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_wise_items`
--
ALTER TABLE `purchase_order_wise_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repackings`
--
ALTER TABLE `repackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requisitions`
--
ALTER TABLE `requisitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requisition_wise_items`
--
ALTER TABLE `requisition_wise_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `stock_calculations`
--
ALTER TABLE `stock_calculations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_code_unique` (`code`),
  ADD UNIQUE KEY `stores_phone_unique` (`phone`),
  ADD UNIQUE KEY `stores_email_unique` (`email`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_items`
--
ALTER TABLE `transfer_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_returns`
--
ALTER TABLE `transfer_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer_return_items`
--
ALTER TABLE `transfer_return_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trn_receives`
--
ALTER TABLE `trn_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `combos`
--
ALTER TABLE `combos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_o_c_items`
--
ALTER TABLE `f_o_c_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lpo_receives`
--
ALTER TABLE `lpo_receives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `price_update_histories`
--
ALTER TABLE `price_update_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_pricings`
--
ALTER TABLE `product_pricings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_wise_vendors`
--
ALTER TABLE `product_wise_vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promotional_products`
--
ALTER TABLE `promotional_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_order_wise_items`
--
ALTER TABLE `purchase_order_wise_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `repackings`
--
ALTER TABLE `repackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requisitions`
--
ALTER TABLE `requisitions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requisition_wise_items`
--
ALTER TABLE `requisition_wise_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock_calculations`
--
ALTER TABLE `stock_calculations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transfer_items`
--
ALTER TABLE `transfer_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transfer_returns`
--
ALTER TABLE `transfer_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer_return_items`
--
ALTER TABLE `transfer_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trn_receives`
--
ALTER TABLE `trn_receives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
