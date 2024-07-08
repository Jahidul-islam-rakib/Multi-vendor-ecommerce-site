-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 30, 2023 at 10:04 PM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jhuri`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('active','inactive','restricted') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$kIBkDVY2/xlYZTzxnNA5XO7bgryuYnSu5C/QuT/GkhAcuqeiaS02W', NULL, '+880 1797948994', 'active', NULL, '2023-09-23 21:09:23', '2023-09-23 21:09:23'),
(2, 'Admin2', 'admin2@gmail.com', NULL, '$2y$10$jBMQM5hFvKCO2G06vhIZa.CjvMi7PJJ.2zjCbGwUC3mB3G/muR2dG', NULL, '+880 1797948995', 'active', NULL, '2023-09-23 21:09:23', '2023-09-23 21:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `photo` varchar(255) NOT NULL,
  `creator_role` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `details`, `status`, `photo`, `creator_role`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Samsuung', 'samsuung', NULL, 1, 'upload/brands/brand_1695535317.png', 'admin', 1, '2023-09-24 10:01:57', '2023-09-24 10:01:57'),
(2, 'Hp', 'hp', NULL, 1, 'upload/brands/brand_1695535386.png', 'admin', 1, '2023-09-24 10:03:06', '2023-09-24 10:03:06'),
(3, 'Raalme', 'raalme', NULL, 1, 'upload/brands/brand_1695535514.webp', 'admin', 1, '2023-09-24 10:05:14', '2023-09-24 10:05:14'),
(4, 'Apple', 'apple', NULL, 1, 'upload/brands/brand_1695535617.webp', 'admin', 1, '2023-09-24 10:06:57', '2023-09-24 10:06:57'),
(5, 'Vivo', 'vivo', NULL, 1, 'upload/brands/brand_1695535809.jpg', 'admin', 1, '2023-09-24 10:10:09', '2023-09-24 10:10:09'),
(6, 'Oppo', 'oppo', NULL, 1, 'upload/brands/brand_1695535827.png', 'admin', 1, '2023-09-24 10:10:27', '2023-09-24 10:10:27'),
(7, 'Walton', 'walton', NULL, 1, 'upload/brands/brand_1695536012.webp', 'admin', 1, '2023-09-24 10:13:32', '2023-09-24 10:13:32'),
(8, 'Dell', 'dell', NULL, 1, 'upload/brands/brand_1695536055.png', 'admin', 1, '2023-09-24 10:14:16', '2023-09-24 10:14:16'),
(9, 'Xiaomi', 'xiaomi', 'This is xiaomi brand', 1, 'upload/brands/brand_1695615741.png', 'vendor', 1, '2023-09-25 08:22:21', '2023-09-25 08:22:21'),
(10, 'MSI', 'msi', 'This is MSI Brand', 1, 'upload/brands/brand_1695616061.png', 'vendor', 1, '2023-09-25 08:27:41', '2023-09-25 08:27:41'),
(11, 'Jabra', 'jabra', NULL, 1, 'upload/brands/brand_1695620901.png', 'admin', 1, '2023-09-25 09:48:21', '2023-09-25 09:48:21');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `photo` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `details`, `status`, `photo`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Headphone', 'headphone', 'This is headphone category', 1, 'upload/categories/category_1695530796.png', 1, '2023-09-24 08:46:36', '2023-09-24 09:48:39'),
(2, 'Mobile Phone', 'mobile_phone', 'This is mobile phone category', 1, 'upload/categories/category_1695530834.png', 1, '2023-09-24 08:47:14', '2023-09-24 09:52:15'),
(3, 'Smart Watch', 'smart_watch', 'This is smart watch', 1, 'upload/categories/category_1695530900.png', 1, '2023-09-24 08:48:20', '2023-09-24 08:48:20'),
(4, 'Laptop', 'laptop', 'this is laptop category', 1, 'upload/categories/category_1695531508.png', 1, '2023-09-24 08:50:24', '2023-09-24 08:58:28'),
(5, 'Tablets', 'tablets', NULL, 1, 'upload/categories/category_1695531340.png', 1, '2023-09-24 08:53:42', '2023-09-24 08:55:40'),
(6, 'Bluetooth', 'bluetooth', 'This is Bluetooth category', 1, 'upload/categories/category_1695534438.png', 1, '2023-09-24 09:47:18', '2023-09-24 09:47:18'),
(7, 'Monitor', 'monitor', 'This is monitor', 1, 'upload/categories/category_1695616212.webp', 1, '2023-09-25 08:30:12', '2023-09-25 08:30:12'),
(8, 'Motherboard', 'motherboard', NULL, 1, 'upload/categories/category_1695618858.jpg', 1, '2023-09-25 09:14:18', '2023-09-25 09:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_15_132319_create_orders_table', 1),
(6, '2023_07_23_145810_create_brands_table', 1),
(7, '2023_07_30_145506_create_categories_table', 1),
(8, '2023_09_03_035412_create_products_table', 1),
(9, '2023_09_03_165202_create_admins_table', 1),
(10, '2023_09_03_165221_create_vendors_table', 1),
(11, '2023_09_06_140840_create_purchases_table', 1),
(12, '2023_09_07_053824_create_returnproducts_table', 1),
(13, '2023_09_18_073113_create_order_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `address`, `phone`, `email`, `price`, `status`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Banjir', 'Mirpur 10, Dhaka, Bangladesh', '017979489994', 'banjirahammad@gmail.com', 110, 'Accept', 'A198706KC4', '2023-09-25 11:01:54', '2023-09-25 11:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `qty` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `creator_role` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `name`, `price`, `qty`, `status`, `creator_role`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Samsung galaxy A8 tablet', 100, 1, 'Accept', 'admin', '1', '2023-09-25 11:01:54', '2023-09-25 11:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('banjirahammad@gmail.com', '$2y$10$8wIFkVhV1nP0JstDsDJfweGLT2mReQbNqRD7zbeScHz4ZKo10P7tW', '2023-09-24 15:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `sell_price` varchar(255) NOT NULL,
  `offer_price` varchar(255) DEFAULT NULL,
  `short_desc` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `ad_info` text NOT NULL,
  `thumb_photo` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `available_qty` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `creator_role` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `brand_id`, `price`, `sell_price`, `offer_price`, `short_desc`, `description`, `ad_info`, `thumb_photo`, `photo`, `location`, `tags`, `qty`, `available_qty`, `status`, `creator_role`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Samsung galaxy A8 tablet', 'samsung_galaxy_a8_tablet', 5, 1, '200', '320', '236', 'A Screen Everyone Will Love: Whether your family is streaming or video chatting with friends tablet A8', '<p>&nbsp;</p><p>Galaxy A8 tablet</p><h3>Your world at a glance</h3><p>With a slim design, a vibrant entertainment system, and<br>outstanding performance, the new Galaxy Tab A7 is a stylish new<br>companion for your life.Dive head-first into the things you love,<br>and easily share your favorite moments. Learn, explore, connect<br>and be inspired.</p><figure class=\"image\"><img src=\"https://jhuri.banjir-ahammad.com/upload/ckeditor/ckeditor_1695536314.jpg\"></figure><h3>Draw inspiration with S Pen</h3><p>S Pen is a bundle of writing instruments in one. Its natural grip,<br>low latency and impressive pressure sensitivity will make it your go-to for everything from drawing to editing documents. And S Pen won\'t get misplaced thanks.</p><p>&nbsp;</p><h3>Carry with<br>Confidence and style</h3><p>Wrap your tablet in a sleek case that\'s as stylish as it is convenient. Galaxy Tab S6 Lite Book Cover folds around and clings magnetically, so you can easily gear up as you\'re headed out the door. There\'s even a compartment for S pen, so you can be sure it doesn\'t get left behind.</p><figure class=\"image\"><img src=\"https://jhuri.banjir-ahammad.com/upload/ckeditor/ckeditor_1695536345.jpg\"></figure>', '<figure class=\"table\"><table><tbody><tr><td>Standing screen display size</td><td>Screen display Size 10.4</td></tr><tr><td>Color</td><td>Gray, Dark gray, Mystic black</td></tr><tr><td>Screen Resolution</td><td>1920 x 1200 Pixels</td></tr><tr><td>Max Screen Resolution</td><td>2000 x 1200</td></tr><tr><td>Processor</td><td>2.3 GHz (128 GB)</td></tr><tr><td>Graphics Coprocessor</td><td>Exynos 9611, Octa Core (4x2.3GHz + 4x1.7GHz)</td></tr><tr><td>Wireless Type</td><td>802.11a/b/g/n/ac, Bluetooth</td></tr><tr><td>Average Battery Life (in hours)</td><td>13 Hours</td></tr><tr><td>Series</td><td>Samsung Galaxy tab S6 Lite WiFi</td></tr><tr><td>Item model number</td><td>SM-P6102ZAEXOR</td></tr><tr><td>Hardware Platform</td><td>Android</td></tr><tr><td>Operating System</td><td>Android 12</td></tr><tr><td>Batteries</td><td>1 Lithium Polymer batteries required. (included)</td></tr><tr><td>Product Dimensions</td><td>0.28 x 6.07 x 9.63 inches</td></tr></tbody></table></figure>', 'upload/products/thumb_1695536450.jpg', '[\"upload\\/products\\/product_169553645039827829.jpg\",\"upload\\/products\\/product_169553645041385313.jpg\",\"upload\\/products\\/product_169553645063464745.jpg\",\"upload\\/products\\/product_169553645046919745.jpg\"]', '[\"3\"]', NULL, 35, 35, 1, 'admin', 1, '2023-09-24 10:20:50', '2023-09-25 09:30:05'),
(2, 'Galaxy Watch6 Classic', 'galaxy_watch6_classic', 3, 1, '500', '575', '540', 'Smooth, intuitive scrolling. Any way you spin it\r\nTrack your workouts to maximize results', '<h3><strong>apphire Crystal glass.</strong><br><strong>A clear difference in durability</strong></h3><p>Designed to withstand daily wear and tear. The display of Galaxy Watch6 Classic is expertly crafted with Sapphire Crystal glass to protect its timeless beauty. And the finishing has IP68 and 5ATM ratings, so you can keep your watch on through all your adventures.</p><figure class=\"image\"><img src=\"https://jhuri.banjir-ahammad.com/upload/ckeditor/ckeditor_1695539079.webp\"></figure>', '<h2>Galaxy Watch6 Classic (Bluetooth, 47mm)</h2><p>SM-R960NZKASWA</p><ul><li>Smooth, intuitive scrolling. Any way you spin it</li><li>Track your workouts to maximize results</li><li>Understand your habits to improve your sleep</li></ul>', 'upload/products/thumb_1695539120.jpg', '[]', '[\"1\",\"2\",\"3\",\"3\"]', NULL, 10, 10, 1, 'admin', 1, '2023-09-24 11:05:20', '2023-09-25 09:33:43'),
(3, 'Apple 15 Inch MacBook Air (2023) M2 512GB (Silver)', 'apple_15_inch_macbook_air_2023_m2_512gb_silver_', 4, 4, '1800', '2250', '2150', 'Processor Type. - Apple M2\r\nGeneration - Not Applicable\r\nDisplay Size (Inch) - 15.3\r\nRAM - 8GB\r\nStorage - 512GB SSD\r\nGraphics Memory - Shared', '<p>The&nbsp;<strong>Apple 15\" MacBook Air</strong>&nbsp;provides users with additional screen real estate with deep colorization, vivid brightness, and immersive tone suitable for both work and play. The Apple M2 chip combines the CPU, GPU, Neural Engine, I/O, and more into a single system on a chip (SoC), utilizing 2nd-Gen 5nm process technology for enhanced performance. Tackle your projects with the fast 8-Core CPU and take on graphics-intensive apps and games with the 10-core GPU. Accelerate machine learning tasks with the 16-core Neural Engine. Complete with a silent, fanless design and up to 18 hours of battery life, the MacBook Air is still portable, but now a lot more powerful. It also has 8GB of unified RAM and a 512GB SSD. It now features the 15\" Liquid Retina Display, which has a 2880 x 1864 screen resolution for 219 pixels per inch (ppi). Connect to the internet via Wi-Fi 6 (802.11ax) and use compatible wireless peripherals and accessories with Bluetooth 5.3.&nbsp;The M2 is&nbsp;designed to speed up video workflows by adding a next-gen media engine and a powerful ProRes video engine for hardware-accelerated encode and decode.</p>', '<figure class=\"table\"><table><tbody><tr><td rowspan=\"4\"><p>General</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></td><td>Brand</td><td>Apple</td></tr><tr><td>Model</td><td>Apple MacBook Air (2023)</td></tr><tr><td>Laptop Series</td><td>MacBook Air</td></tr><tr><td>Part No</td><td>MQKT3LL/A</td></tr><tr><td rowspan=\"6\">Processor</td><td>Processor Brand</td><td>Apple</td></tr><tr><td>Processor Type.</td><td>Apple M2</td></tr><tr><td>Generation</td><td>Not Applicable</td></tr><tr><td>Processor Model</td><td>Apple M2 Chip</td></tr><tr><td>Processor Base Frequency</td><td>Unmentioned</td></tr><tr><td>Processor Core</td><td>8</td></tr></tbody></table></figure>', 'upload/products/thumb_1695544865.webp', '[\"upload\\/products\\/product_169554486548969148.webp\",\"upload\\/products\\/product_169554486583171017.webp\"]', '[\"1\"]', NULL, 10, 10, 1, 'admin', 1, '2023-09-24 12:41:05', '2023-09-25 09:27:45'),
(4, 'Xiaomi Pad 5 Snapdragon 860 6GB RAM 128GB ROM 11\" WQHD+ Tablet (Global Version)', 'xiaomi_pad_5_snapdragon_860_6gb_ram_128gb_rom_11_wqhd_tablet_global_version_', 5, 9, '350', '450', '410', 'Model: Pad 5\r\nDisplay: 11\" WQHD+ (1600 x 2560) 120Hz 500nits\r\nProcessor: Qualcomm Snapdragon 860\r\nRAM: 6GB, ROM: 128GB\r\nBattery: 8720 mAh', '<p>&nbsp;</p><h2><strong>Xiaomi Pad 5 Snapdragon 860 6GB RAM 128GB ROM 11\" WQHD+ Tablet (Global Version)</strong><br>&nbsp;</h2><p>Xiaomi Mi Pad 5 is officially released on Aug. 10, 2021. The dimension of the device is 254.7 x 166.3 x 6.9 mm and it weighs 511 grams. The smartphone includes Accelerometer, gyro, proximity, and compass. The tablet supports USB Type-C, and Bluetooth 5.0. It is fueled by a Non-removable Li-Po 8720 mAh battery + Fast charging 33W + Power Delivery 3.0. Xiaomi Mi Pad 5 runs on Android 11 + MIUI 12.5 operating system providing smooth operation of the device. The tablet is available in different colors like Black, White, and Green. Moreover, it is powered by the Qualcomm Snapdragon 860 processor while the GPU is Adreno 640. The size of the tablet is 11.0 inches and it comes with IPS LCD, 1B colors, 120Hz, HDR10, Dolby Vision display. The resolution of the device is 1600 x 2560 pixels with 274 PPI. It is pack with 6 GB RAM with 128 GB&nbsp; internal storage options. The device is pack with a 13 MP camera while on the front, there is an 8 MP camera available for clicking selfies.It has 01-Year warranty.</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Main Feature</strong></th></tr></thead><tbody><tr><td>Display Type</td><td>IPS LCD, 1B colors, 120Hz, HDR10, Dolby Vision</td></tr><tr><td>Size</td><td>11.0 inches, 350.9 cm2 (~82.8% screen-to-body ratio)</td></tr><tr><td>Resolution</td><td>1600 x 2560 pixels, 16:10 ratio (~274 ppi density)</td></tr><tr><td>Processor</td><td>Octa-core (1x2.96 GHz Kryo 485 Gold &amp; 3x2.42 GHz Kryo 485 Gold &amp; 4x1.78 GHz Kryo 485 Silver)</td></tr><tr><td>RAM</td><td>6GB</td></tr><tr><td>Storage</td><td>128GB</td></tr><tr><td>Connectivity</td><td>No cellular connectivity</td></tr><tr><td>Operating System</td><td>Android 11, MIUI 12.5</td></tr><tr><td>Audio</td><td>24-bit/192kHz audio</td></tr><tr><td>Others</td><td>Accelerometer, gyro, proximity, compass</td></tr><tr><td colspan=\"2\"><strong>Physical Spec</strong></td></tr><tr><td>Dimensions</td><td>254.7 x 166.3 x 6.9 mm (10.03 x 6.55 x 0.27 in)</td></tr><tr><td>Weight</td><td>511 g (1.13 lb)</td></tr><tr><td>SIM</td><td>No</td></tr><tr><td colspan=\"2\"><strong>Camera</strong></td></tr><tr><td>Rear</td><td>13 MP</td></tr><tr><td>Front</td><td>8 MP</td></tr><tr><td>Video</td><td>1080p@30fps</td></tr><tr><td colspan=\"2\"><strong>Battery</strong></td></tr><tr><td>Type</td><td>Li-Po</td></tr><tr><td>Capacity</td><td>8720 mAh, non-removable</td></tr></tbody></table></figure>', 'upload/products/thumb_1695615882.jpg', '[\"upload\\/products\\/product_169561588289454316.jpg\",\"upload\\/products\\/product_169561588288985415.jpg\",\"upload\\/products\\/product_169561588268448953.jpg\"]', '[\"2\",\"3\",\"4\"]', NULL, 20, 20, 1, 'vendor', 1, '2023-09-25 08:24:42', '2023-09-25 08:57:00'),
(5, 'MSI PRO MP223 21.45\" Full HD Business Monitor', 'msi_pro_mp223_21_45_full_hd_business_monitor', 7, 10, '80', '110', '100', 'Model: PRO MP223\r\nResolution: FHD (1920 x 1080)\r\nDisplay: VA, 100Hz, 1ms\r\nPorts: 1x HDMI, 1x VGA, 1x Audio Out\r\nFeatures: Anti-Flicker Technology', '<h2><strong>MSI PRO MP223 21.45\" Full HD Business Monitor</strong></h2><p>The MSI PRO MP223 21.45\" 100Hz Full HD Business Monitor<a href=\"https://www.startech.com.bd/monitor\">&nbsp;</a>Boost your productivity at work with the 21.5-inch Full HD Monitor. Your programs, spreadsheets, and other crucial work papers may be seen with ease on its large 21.45-inch screen. Your eyes are protected by MSI Anti-Flicker technology, which also reduces blue light, while long-term eye damage is also prevented. Despite your long hours of work, you can rely on this monitor to safeguard your eye health. The VA Wide Viewing Angle technology enhances the screen\'s colors and brightness to make sure you can enjoy every detail to the fullest, making it ideal for professionals who need precise color representation. This MSI PRO MP223 also has a high refresh rate of 100Hz, which enables it to display more images continuously while putting less strain on your eyes. Also, the MSI PRO MP22 Monitor Display Kit Support offers you the most practical instrument to guarantee accurate color and display mode while working. In order to keep your MSI Pen or smartphone close to hand and ensure that you never miss a crucial communication, the MSI PRO MP223 also has an accessory slot design that creates a clear table. In addition, this MSI PRO MP223 Business Monitor is VESA compatible, so you can mount it on the wall of your house or office to make it completely inconspicuous when placed on a desk. With the MSI PRO MP223, improve your work experience.</p><p>&nbsp;</p><h2><strong>Buy MSI PRO MP223 21.45\" Full HD Business Monitor from Star Tech</strong></h2><p>In Bangladesh, you can get original <a href=\"https://www.startech.com.bd/msi-pro-mp223-21-5-inch-fhd-monitor\">MSI PRO MP223 21.45\" Full HD Business Monitor</a>&nbsp;From Star Tech. We have a large collection of latest <a href=\"https://www.startech.com.bd/monitor/msi\">MSI Monitor</a> to purchase. Order Online Or Visit your Nearest <a href=\"https://www.startech.com.bd/\">Star Tech</a> Shop to get yours at lowest price. The MSI PRO MP223 21.45\" Monitor comes with 3 Years warranty.</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Display Features</strong></th></tr></thead><tbody><tr><td>Display Size</td><td>21.45 inch</td></tr><tr><td>Display Type</td><td>LED</td></tr><tr><td>Panel Type</td><td>VA</td></tr><tr><td>Resolution</td><td>Full HD (1920 x 1080)</td></tr><tr><td>Pixel pitch(MM)</td><td>0.2493(H) x 0.241(V)</td></tr><tr><td>Display Surface</td><td>Anti-glare</td></tr><tr><td>Aspect Ratio</td><td>16:9</td></tr><tr><td>Viewing Angle</td><td>178°(H) / 178°(V)</td></tr><tr><td>Brightness</td><td>250 nits</td></tr><tr><td>Contrast Ratio</td><td>3000:1 (TYP)</td></tr><tr><td>Refresh Rate</td><td>100Hz</td></tr><tr><td>Color Support</td><td>16.7M</td></tr><tr><td>Color Gamut</td><td>97.30% SRGB</td></tr><tr><td>Response Time</td><td>1ms</td></tr><tr><td colspan=\"2\"><strong>Mechanical Design</strong></td></tr><tr><td>Tilt</td><td>-5° ~ 20°<br>&nbsp;</td></tr><tr><td>Vesa Wall Mount</td><td>75 x 75 mm</td></tr><tr><td colspan=\"2\"><strong>Physical Specification</strong></td></tr><tr><td>Dimension</td><td>558 x 116 x 367mm</td></tr><tr><td colspan=\"2\"><strong>Power</strong></td></tr><tr><td>Type</td><td>External Adaptor 30W</td></tr><tr><td>Voltage</td><td>100~240V, 50~60Hz<br>&nbsp;</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Warranty</td><td>3 Years</td></tr></tbody></table></figure>', 'upload/products/thumb_1695616575.webp', '[\"upload\\/products\\/product_169561657580711163.webp\",\"upload\\/products\\/product_169561657566539115.webp\",\"upload\\/products\\/product_169561657525902850.webp\"]', '[\"2\",\"3\",\"4\"]', NULL, 10, 9, 1, 'vendor', 1, '2023-09-25 08:36:15', '2023-09-25 11:01:54'),
(6, 'MSI G2412V 23.8\" FHD 100Hz 1ms IPS Esports Gaming Monitor', 'msi_g2412v_23_8_fhd_100hz_1ms_ips_esports_gaming_monitor', 7, 10, '150', '180', '170', 'Model: G2412V\r\nResolution: FHD (1920 x 1080)\r\nDisplay: IPS, 100Hz, 1ms (MPRT)\r\nPorts: 1x HDMI, 1x DP, 1x Earphone out\r\nFeatures: FreeSync, Anti-glare, Night Vision', '<h2><strong>MSI G2412V 23.8\" 100Hz FHD IPS Esports Gaming Monitor</strong></h2><p>The MSI G2412V 23.8\" 100Hz FHD IPS <a href=\"https://www.startech.com.bd/monitor\">Monitor </a>has a 1ms response time,&nbsp;100Hz refresh rate, &nbsp;and FreeSync technology that provides a smooth and immersive gaming experience. It has an IPS panel with bright and true colors and broad viewing angles, as well as an FHD resolution for clear and detailed pictures. MSI G2412V 23.8\" 100Hz FHD IPS Monitor also has 85% Adobe RGB and DCI-P3 color gamut compatibility for improved color reproduction. It has a tilt-adjustable stand, a 5-way OSD navigation joystick, and a Kensington lock slot in a sleek and ergonomic design. This MSI G2412V 23.8\" Esports Gaming Monitor features various video connectors, including HDMI and DP, as well as an audio out port. The MSI G2412V is an excellent monitor for gamers that want fast-paced, high-quality gaming on a bigger screen.</p><h3><strong>100Hz Refresh Rate and 1ms Response Time</strong></h3><p>The MSI G2412V Esports Gaming Monitor with a 100Hz refresh rate and a 1ms response time. Whether you\'re playing FPS, racing, or fighting games, you\'ll experience smooth and responsive gameplay with no latency, stuttering, or ghosting. The MSI G2412V also supports FreeSync technology, which synchronizes the monitor\'s refresh rate with the GPU\'s frame rate, minimizing screen tearing and improving visual clarity. You\'ll never miss a beat in your gaming sessions with the MSI G2412V.</p><h3><strong>Multiple Ports and Audio Output for Easy Connectivity</strong></h3><p>The MSI G2412V provides a wide range of connectivity options for your gaming devices. It contains an HDMI and a DP connector that enable FHD resolution at 100Hz, making it simple to connect your PC, console, or laptop. It also contains an earphone out connector for connecting headphones or speakers for immersive music. For added security and convenience, the MSI G2412V has an external power adapter and a Kensington lock slot.</p><h3><strong>IPS Panel and FHD Resolution for Stunning Visuals</strong></h3><p>The MSI G2412V is equipped with a 23.8-inch IPS display that provides amazing graphics with FHD resolution and broad viewing angles. It also has an 85% Adobe RGB and DCI-P3 color gamut, a 110% sRGB color space, and 16.7 million display colors, delivering vibrant and accurate color reproduction in your games, movies, and images. The MSI G2412V also includes an optical WDR feature to balance exposure in high contrast settings, as well as a 9:16 corridor mode to optimize the display for vertical applications. The MSI G2412V has an anti-glare surface treatment to decrease reflections and eye strain, as well as a narrow bezel design to limit distractions and optimize screen area.</p><h2><strong>Buy MSI G2412V 23.8\" 100Hz FHD IPS Esports Gaming Monitor from Star Tech</strong></h2><p>In Bangladesh, you can get original <a href=\"https://www.startech.com.bd/msi-g2412v-23-8-inch-100hz-ips-monitor\">MSI G2412V 23.8\" 100Hz FHD IPS Esports Gaming Monitor</a> From Star Tech. We have a large collection of latest <a href=\"https://www.startech.com.bd/monitor/msi\">MSI Monitor</a> to purchase. Order Online Or Visit your Nearest <a href=\"https://www.startech.com.bd/\">Star Tech </a>Shop to get yours at lowest price. The MSI G2412V 23.8\" 100Hz FHD IPS Monitor comes with 3 Years warranty.</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Display Features</strong></th></tr></thead><tbody><tr><td>Display Size</td><td>23.8 Inch</td></tr><tr><td>Display Type</td><td>LED</td></tr><tr><td>Panel Type</td><td>IPS</td></tr><tr><td>Resolution</td><td>Full HD (1920 x 1080)</td></tr><tr><td>Pixel pitch(MM)</td><td>0.2745(H)x0.2745(V)</td></tr><tr><td>Display Surface</td><td>Anti-glare</td></tr><tr><td>Aspect Ratio</td><td>16:9</td></tr><tr><td>Viewing Angle</td><td>178° (H) / 178° (V</td></tr><tr><td>Brightness</td><td>300</td></tr><tr><td>Contrast Ratio</td><td>1000:1</td></tr><tr><td>Refresh Rate</td><td>100Hz</td></tr><tr><td>Color Support</td><td>16.7M</td></tr><tr><td>Response Time</td><td>1ms (MPRT)</td></tr><tr><td>Curvature</td><td>Flat</td></tr><tr><td>Others Features</td><td>Night Vision</td></tr><tr><td colspan=\"2\"><strong>Video Features</strong></td></tr><tr><td>Flicker Free</td><td>Yes</td></tr><tr><td>Low Blue Light</td><td>Yes</td></tr><tr><td>Free Sync Support</td><td>Yes</td></tr><tr><td colspan=\"2\"><strong>Audio Features</strong></td></tr><tr><td>Speaker (Built In)</td><td>N/A</td></tr><tr><td colspan=\"2\"><strong>Connectivity</strong></td></tr><tr><td>Display Port</td><td>1x DP</td></tr><tr><td>HDMI</td><td>1x HDMI</td></tr><tr><td>Audio Jack</td><td>1x Earphone out</td></tr><tr><td colspan=\"2\"><strong>Mechanical Design</strong></td></tr><tr><td>Tilt</td><td>-5° ~ 20°</td></tr><tr><td>Vesa Wall Mount</td><td>100 x 100 mm</td></tr><tr><td colspan=\"2\"><strong>Physical Specification</strong></td></tr><tr><td>Color</td><td>Black</td></tr><tr><td>Dimension</td><td>540.2 x 229.4 x 411.6 mm 540.2 x 44.5 x328.2 mm (Without stand)</td></tr><tr><td>Weight</td><td>3.3kg / 5.0kg without Stand: 2.5kg</td></tr><tr><td colspan=\"2\"><strong>Power</strong></td></tr><tr><td>Type</td><td>External Adaptor 20V 2.25A</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Warranty</td><td>3 Years</td></tr></tbody></table></figure>', 'upload/products/thumb_1695616770.webp', '[\"upload\\/products\\/product_169561677039444655.webp\",\"upload\\/products\\/product_169561677022898978.webp\",\"upload\\/products\\/product_169561677095707400.webp\",\"upload\\/products\\/product_16956167707055206.webp\"]', '[\"1\",\"3\"]', NULL, 15, 15, 1, 'vendor', 1, '2023-09-25 08:39:30', '2023-09-25 08:42:53'),
(7, 'MSI H510M PRO-E Intel 10th Gen and 11th Gen Micro-ATX Motherboard', 'msi_h510m_pro_e_intel_10th_gen_and_11th_gen_micro_atx_motherboard', 8, 10, '75', '100', '95', 'Model: H510M PRO-E\r\nSupports 10th Gen Core, 11th Gen Core, Pentium Gold & Celeron for LGA 1200 socket\r\nSupports DDR4 Memory, up to 3200(Max) MHz\r\nWith premium layout and digital power design\r\nLightning Fast Experience: PCIe 4.0', '<h2><strong>MSI H510M PRO-E Intel 10th Gen and 11th Gen Micro-ATX Motherboard</strong></h2><p>The MSI PRO series helps users work smarter by delivering an efficient and productive experience. Featuring stable functionality and high-quality assembly, PRO series motherboards provide not only optimized professional workflows but also less troubleshooting and longevity. MSI H510M PRO Intel 10th Gen and 11th Gen Micro-ATX Motherboard supports 10th Gen Intel Core, 11th Gen Intel Core, Pentium Gold and Celeron processors for LGA 1200 socket, DDR4 Memory, up to 3200(Max) MHz. The Motherboard featured with premium layout and digital power design to support more cores and provide better performance, DDR4 Boost: Advanced technology to deliver pure data signals for the best performance and stability, Lightning Fast Experience: PCIe 4.0. It is Protecting VGA cards against bending and EMI for better performance, stability and strength. Here, MSI lightning Gen 4 PCI-E is the latest and the fastest PCI-E data transfer solution with 64GB/s of transfer bandwidth that has doubled compared to its previous generation. PCIe 4.0 maintains both backward and forward compatibility with older and newer specifications. It is Optimized by steel armor design, your motherboards can support the weight of heavy graphics cards. The Detecting CPU &amp; GPU temperatures and automatically adjusting fan duty of system fans to a proper value by adopting MSI AI ENGINE. The latest MSI H510M PRO-E Intel 10th Gen and 11th Gen Micro-ATX Motherboard has 03 years warranty.</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Expansion Slots</strong></th></tr></thead><tbody><tr><td>Supported CPU</td><td>Supports 10th Gen Intel Core Processors, 11th Gen Intel Core Processors, Pentium Gold and Celeron Processors1<br><br>&nbsp;</td></tr><tr><td>Chipset</td><td>Intel H510 Chipset</td></tr><tr><td>Form Factor</td><td>mATX Form Factor<br>9.3 x 7.5 in. (23.6 cm x 19.0 cm)</td></tr><tr><td>Audio</td><td>Realtek ALC897 Codec<br>7.1-Channel High Definition Audio</td></tr><tr><td>PCI</td><td>1x PCIe x16 slot (From CPU)<br>Support up to PCIe 4.0 for 11th Gen Intel CPU<br>Support up to PCIe 3.0 for 10th Gen Intel CPU<br>2x PCIe 3.0 x1 slots (From PCH)</td></tr><tr><td colspan=\"2\"><strong>Memory</strong></td></tr><tr><td>Type</td><td>DDR4</td></tr><tr><td>Slots</td><td>2x DDR4 memory slots</td></tr><tr><td>Supported Memory</td><td>Supports 1R 2133/ 2666/ 2933 MHz for 10th Gen Intel CPU (by JEDEC &amp; POR)<br>Supports 1R 2133/ 2666/ 2933/ 3200 MHz for 11th Gen Intel CPU (by JEDEC &amp; POR)<br>Supports Dual-Channel mode<br>Supports non-ECC, un-buffered memory<br>Supports Intel Extreme Memory Profile (XMP)</td></tr><tr><td>Maximum Memory</td><td>up to 64GB</td></tr><tr><td colspan=\"2\"><strong>Graphics</strong></td></tr><tr><td>Graphics</td><td>1x VGA port, supports a maximum resolution of 2048x1536 60Hz, 1920x1200 60Hz<br>1x HDMI 1.4 port, supports a maximum resolution of 4K 30Hz</td></tr><tr><td colspan=\"2\"><strong>Connector &amp; Ports</strong></td></tr><tr><td>HDMI</td><td>1x HDMI 1.4 port</td></tr><tr><td>VGA (s)</td><td>1x VGA port</td></tr><tr><td>USB (s)</td><td>Intel H510 Chipset<br>4x USB 3.2 Gen 1 5Gbps ports (2 Type-A ports on the back panel, 2 ports available through the internal USB connector)<br>6x USB 2.0 ports (4 Type-A ports on the back panel, 2 ports available through the internal USB 2.0 connector)</td></tr><tr><td>LAN Port (s)</td><td>1x Realtek RTL8111 Gigabit LAN controller</td></tr><tr><td>Supported Storage</td><td>4x SATA 6Gb/s ports (From H510 Chipset)</td></tr><tr><td>Audio</td><td>1x Front panel audio connector</td></tr><tr><td>Internal I/O Ports</td><td>1x 24-pin ATX main power connector<br>1x 8-pin ATX 12V power connector<br>4x SATA 6Gb/s connectors<br>1x USB 3.2 Gen 1 5Gbps connector (support additional 2 USB ports)<br>1x USB 2.0 connector (support additional 2 USB ports)<br>1x 4-pin CPU fan connector<br>1x 4-pin system fan connector<br>1x Front panel audio connector<br>2x System panel connectors<br>1x Serial port connector<br>1x Chassis Intrusion connector<br>1x Clear CMOS jumper<br>1x TPM module connector</td></tr><tr><td>TPM (Trusted Platform Module )</td><td>1x TPM module connector</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Manufacturing Warranty</td><td>03 years warranty</td></tr></tbody></table></figure>', 'upload/products/thumb_1695619018.jpg', '[\"upload\\/products\\/product_169561901852820912.jpg\",\"upload\\/products\\/product_169561901810295527.jpg\",\"upload\\/products\\/product_169561901885990741.jpg\",\"upload\\/products\\/product_169561901857527108.jpg\"]', '[\"2\"]', NULL, 10, 10, 1, 'vendor', 1, '2023-09-25 09:16:58', '2023-09-25 09:25:32'),
(8, 'MSI PRO H410M-B 10th Gen Micro-ATX Motherboard', 'msi_pro_h410m_b_10th_gen_micro_atx_motherboard', 8, 10, '70', '110', '100', 'Model: PRO H410M-B\r\nSupports 10th Gen Intel Core, Pentium Gold & Celeron processors for LGA 1200 socket\r\nSupports DDR4 Memory, up to 2933(Max) MHz\r\nCore Boost, DDR4 Boost, Turbo M.2\r\n4x SATA 6Gb/s ports, 1x M.2 slot', '<h2><strong>MSI PRO H410M-B 10th Gen Micro-ATX Motherboard</strong><br>&nbsp;</h2><p>The MSI PRO H410M-B Motherboard supports 10th Gen Intel Core, Pentium Gold &amp; Celeron processors for LGA 1200 socket. It supports DDR4 Memory, up to 2933(Max) MHz. This motherboard helps users work smarter by delivering an efficient and productive experience. It features tons of convenient and smart designs for DIY users, countless system tuning and troubleshooting tools are at your disposal to push your system to new heights and satisfy even the most demanding tweaker. Makes it so easy to install your own motherboard without any issue. It has a VGA port, supports a maximum resolution of 2048x1536 60Hz, 1920x1200 60Hz. It also has an HDMI 1.4 port, supports a maximum resolution of 4K 30Hz. The MSI PRO H410M-B lets you manage speeds and temperatures for all your system and CPU fans. Total Fan Control allows you to check your primary system characteristics in a simplified graphical interface. You can also set up to 4 temperature targets for the CPU and motherboard, which will adjust the fan speeds. The most important thing about DIY is expandability. MSI PRO H410M-B features such as stable LAN,&nbsp; faster storage and USB transfer speed, and other expandable connectors are ready to enlarge your flexibility. The MSI PRO H410M-B comes with a 1-year warranty.</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Expansion Slots</strong></th></tr></thead><tbody><tr><td>Supported CPU</td><td>Supports 10th Gen Intel Core Processors, Pentium Gold and Celeron Processors<br>Processor socket LGA1200</td></tr><tr><td>Chipset</td><td>Intel H510 Chipset</td></tr><tr><td>Form Factor</td><td>m-ATX Form Factor<br>9.3 in. x 7.95 in. (23.6 cm x 20.2 cm)</td></tr><tr><td>Audio</td><td>Realtek ALC897/ ALC892 Codec<br>7.1-Channel High Definition Audio</td></tr><tr><td>PCI</td><td>1x PCIe 3.0 x16 slot (From CPU)<br>1x PCIe 3.0 x1 slot (From PCH)</td></tr><tr><td>M.2 Socket</td><td>1x M.2 slot (Key M, from H510 chipset)</td></tr><tr><td colspan=\"2\"><strong>Memory</strong></td></tr><tr><td>Type</td><td>DDR4</td></tr><tr><td>Slots</td><td>2x DDR4 memory slots</td></tr><tr><td>Supported Memory</td><td>Supports 1R 2133/ 2666/ 2933 MHz for 10th Gen Intel CPU (by JEDEC &amp; POR)<br>Supports Dual-Channel mode<br>Supports non-ECC, un-buffered memory<br>Supports Intel Extreme Memory Profile (XMP)</td></tr><tr><td>Maximum Memory</td><td>Up to 64GB</td></tr><tr><td colspan=\"2\"><strong>Graphics</strong></td></tr><tr><td>Graphics</td><td>1x VGA port, supports a maximum resolution of 2048x1536 60Hz, 1920x1200 60Hz<br>1x HDMI 1.4 port, supports a maximum resolution of 4K 30Hz</td></tr><tr><td colspan=\"2\"><strong>Connector &amp; Ports</strong></td></tr><tr><td>HDMI</td><td>1x HDMI 1.4 port</td></tr><tr><td>VGA (s)</td><td>1x VGA port</td></tr><tr><td>USB (s)</td><td>Intel H510 Chipset<br>4x USB 3.2 Gen 1 5Gbps ports (2 Type-A ports on the back panel, 2 ports available through the internal USB connector)<br>6x USB 2.0 ports (4 Type-A ports on the back panel, 2 ports available through the internal USB 2.0 connector)</td></tr><tr><td>LAN Port (s)</td><td>1x Realtek RTL8111 Gigabit LAN controller</td></tr><tr><td>Supported Storage</td><td>4x SATA 6Gb/s ports (From H510 Chipset)<br>1x M.2 slot (Key M, from H510 chipset)<br>Supports up to PCIe 3.0 x4<br>Supports SATA 6Gb/s<br>Supports 2242/ 2260/ 2280 storage devices</td></tr><tr><td>Audio</td><td>1x Front panel audio connector</td></tr><tr><td>Internal I/O Ports</td><td>1x 24-pin ATX main power connector<br>1x 8-pin ATX 12V power connector<br>4x SATA 6Gb/s connectors<br>1x USB 2.0 connector (support additional 2 USB ports)<br>1x USB 3.2 Gen 1 5Gbps connector (support additional 2 USB ports)<br>1x 4-pin CPU fan connector<br>1x 4-pin system fan connector<br>1x Front panel audio connector<br>2x System panel connectors<br>1x Serial port connector<br>1x TPM module connector<br>1x Chassis Intrusion connector<br>1x Clear CMOS jumper</td></tr><tr><td>TPM (Trusted Platform Module )</td><td>1 x TPM module connector<br>&nbsp;</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Manufacturing Warranty</td><td>03 Years</td></tr></tbody></table></figure>', 'upload/products/thumb_1695619400.jpg', '[\"upload\\/products\\/product_169561940040680696.jpg\",\"upload\\/products\\/product_169561940016457465.jpg\",\"upload\\/products\\/product_169561940018241991.jpg\",\"upload\\/products\\/product_169561940011963594.jpg\"]', '[\"4\"]', NULL, 12, 12, 1, 'vendor', 1, '2023-09-25 09:23:20', '2023-09-25 09:26:11'),
(9, 'Apple iPhone 14 Pro Max 256GB Deep Purple (Singapore)', 'apple_iphone_14_pro_max_256gb_deep_purple_singapore_', 2, 4, '1500', '1850', '1700', 'Model: iPhone 14 Pro Max\r\nDisplay: 6.7\" Super Retina XDR Always-On display\r\nProcessor: A16 Bionic chip, Storage: 256GB\r\nCamera: 48MP + 12MP + 12MP Rear, 12MP Front\r\nFeatures: Dynamic Island, Face ID, eSIM Support', '<h2><strong>Apple iPhone 14 Pro Max 256GB Deep Purple (Singapore)</strong></h2><p>The Apple iPhone 14 Pro Max is the latest model of the iPhone series, featuring the latest technology and advanced features that are designed to provide users with a seamless and unparalleled mobile experience. The device is powered by the latest A16 Bionic chip, providing exceptional performance and power efficiency. The 6.7-inch Super Retina XDR display, with ProMotion technology, delivers an immersive visual experience with incredibly vibrant colors and deep blacks. The device comes equipped with a triple-camera system, including a 48MP main, 12MP ultra-wide, and 12MP telephoto lens, allowing users to capture stunning photos and videos.&nbsp;This iPhone 14 Pro Max has a 256GB internal storage capacity, offering ample space for all your photos, videos, and apps. It has been designed for durability with Ceramic Shield. It also offers water resistance and a surgical-grade stainless steel body. The&nbsp;Deep Purple color option adds a luxurious and elegant touch to the device\'s overall design.</p><h3><strong>Introducing Dynamic Island</strong></h3><p>Dynamic Island on the iPhone 14 Pro Max is a convenient feature that allows users to easily access and manage important notifications and activities on their devices. It appears on the home screen or in any app when the phone is unlocked and provides a quick overview of things like current music playing, timers, AirDrop connections, and directions from Maps. Users can expand the activity to see more detail by touching and holding it or swiping from the center to the right or left side. They can also collapse the activity to make the Dynamic Island smaller by swiping from the right or left side towards the center. Additionally, users can switch between two activities by swiping from one side or the other. This makes it easy to stay on top of important notifications and activities without having to navigate away from the current app or screen.</p><h3><strong>Always-On display</strong></h3><p>The iPhone 14 Pro Max display can operate with a refresh rate as low as 1 Hz with a new low-power mode and uses improved technology that allows the display to dim the entire Lock Screen. The display dims when you lock your device or leave it idle. Always-On display also uses multiple coprocessors in the A16 Bionic to refresh the display using minimal power.&nbsp;You can customize your Always-On display by personalizing your Lock Screen with photos, wallpapers with stylized fonts and colors, and widgets.&nbsp;When iPhone is turned face down or in your pocket, it goes dark to save battery life.</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Display</strong></th></tr></thead><tbody><tr><td>Size</td><td>6.7‑inch</td></tr><tr><td>Type</td><td>Super Retina XDR display<br>All‑screen OLED display</td></tr><tr><td>Resolution</td><td>2796x1290-pixel resolution at 460 ppi</td></tr><tr><td>Refresh Rate</td><td>ProMotion technology with adaptive refresh rates up to 120Hz</td></tr><tr><td>Brightness</td><td>1,000 nits max brightness (typical); 1,600 nits peak brightness (HDR); 2,000 nits peak brightness (outdoor)<br>&nbsp;</td></tr><tr><td>Features</td><td>Dynamic Island<br>Always-On display<br>HDR display<br>True Tone<br>Wide colour (P3)<br>Haptic Touch<br>2,000,000:1 contrast ratio (typical)<br>Fingerprint-resistant oleophobic coating<br>Support for display of multiple languages and characters simultaneously</td></tr><tr><td colspan=\"2\"><strong>Processor</strong></td></tr><tr><td>Chipset</td><td>A16 Bionic chip</td></tr><tr><td>CPU Type</td><td>6‑core CPU with 2 performance and 4 efficiency cores<br>16‑core Neural Engine</td></tr><tr><td>GPU</td><td>5‑core GPU</td></tr><tr><td colspan=\"2\"><strong>Memory</strong></td></tr><tr><td>RAM</td><td>6GB</td></tr><tr><td>Internal Storage</td><td>256GB</td></tr><tr><td>Card Slot</td><td>N/A</td></tr><tr><td colspan=\"2\"><strong>Rear Camera</strong></td></tr><tr><td>Resolution</td><td>Pro camera system (48MP Main, 12MP Ultra Wide, and 12MP Telephoto)</td></tr><tr><td>Features</td><td>Main: ƒ/1.78 aperture<br>Ultra Wide: ƒ/2.2 aperture<br>Telephoto: ƒ/2.8 aperture<br>Second-generation sensor-shift optical image stabilization<br>.5x, 1x, 2x, 3x optical zoom options<br>Sapphire crystal lens cover<br>Adaptive True Tone flash<br>Photonic Engine<br>Deep Fusion<br>Smart HDR 4<br>Portrait mode with advanced bokeh and Depth Control<br>Portrait Lighting with six effects (Natural, Studio, Contour, Stage, Stage Mono, High-Key Mono)<br>Night mode<br>Night mode portraits enabled by LiDAR Scanner<br>Panorama (up to 63MP)<br>Photographic Styles<br>Macro photography<br>Apple ProRAW<br>Wide colour capture for photos and Live Photos<br>Lens correction (Ultra Wide)<br>Advanced red-eye correction<br>Auto image stabilisation<br>Burst mode<br>Photo geotagging<br>Image formats captured: HEIF, JPEG and DNG</td></tr><tr><td>Video Recording</td><td>4K video recording at 24 fps, 25 fps, 30 fps or 60 fps<br>1080p HD video recording at 25 fps, 30 fps or 60 fps<br>720p HD video recording at 30 fps<br>Cinematic mode up to 4K HDR at 30 fps<br>Action mode up to 2.8K at 60 fps<br>HDR video recording with Dolby Vision up to 4K at 60 fps<br>ProRes video recording up to 1080p at 30 fps<br>Macro video recording, including slow motion and time-lapse<br>Slow-motion video support for 1080p at 120 fps or 240 fps<br>Time-lapse video with stabilisation<br>Night mode Time-lapse<br>QuickTake video<br>Second‑generation sensor‑shift optical image stabilisation for video (Main)<br>Dual optical image stabilisation for video (Main and Telephoto)<br>3x optical zoom in, 2x optical zoom out; 6x optical zoom range<br>Digital zoom up to 9x<br>Audio zoom<br>True Tone flash<br>Cinematic video stabilisation (4K, 1080p and 720p)<br>Continuous autofocus video<br>Take 8MP still photos while recording 4K video<br>Playback zoom<br>Video formats recorded: HEVC, H.264 and ProRes<br>Stereo recording</td></tr><tr><td colspan=\"2\"><strong>Front Camera</strong></td></tr><tr><td>Resolution</td><td>TrueDepth front camera (12MP camera)</td></tr><tr><td>Features</td><td>ƒ/1.9 aperture<br>Autofocus with Focus Pixels<br>Six-element lens<br>Retina Flash<br>Photonic Engine<br>Deep Fusion<br>Smart HDR 4<br>Portrait mode with advanced bokeh and Depth Control<br>Portrait Lighting with six effects (Natural, Studio, Contour, Stage, Stage Mono, High‑Key Mono)<br>Animoji and Memoji<br>Night mode<br>Photographic Styles<br>Apple ProRAW<br>Wide colour capture for photos and Live Photos<br>Lens correction<br>Auto image stabilisation<br>Burst mode</td></tr><tr><td>Video Recording</td><td>4K video recording at 24 fps, 25 fps, 30 fps or 60 fps<br>1080p HD video recording at 25 fps, 30 fps or 60 fps<br>Cinematic mode up to 4K HDR at 30 fps<br>HDR video recording with Dolby Vision up to 4K at 60 fps<br>ProRes video recording up to 1080p at 30 fps<br>Slow-motion video support for 1080p at 240 fps<br>Time-lapse video with stabilisation<br>Night mode Time-lapse<br>QuickTake video<br>Cinematic video stabilisation (4K, 1080p and 720p)</td></tr><tr><td colspan=\"2\"><strong>Audio</strong></td></tr><tr><td>Speaker</td><td>Built‑in stereo speaker</td></tr><tr><td>Audio Features</td><td>Supported formats include AAC, MP3, Apple Lossless, FLAC, Dolby Digital, Dolby Digital Plus and Dolby Atmos<br>Spatial Audio playback<br>User-configurable maximum volume limit</td></tr><tr><td colspan=\"2\"><strong>Network &amp; Connectivity</strong></td></tr><tr><td>SIM</td><td>1 SIM and 1 eSIM</td></tr><tr><td>Wi-Fi</td><td>5G (sub‑6 GHz) with 4x4 MIMO<br>Gigabit LTE with 4x4 MIMO and LAA<br>Wi‑Fi 6 (802.11ax) with 2x2 MIMO</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.3</td></tr><tr><td>GPS</td><td>Precision dual-frequency GPS (GPS, GLONASS, Galileo, QZSS and BeiDou)<br>Digital compass<br>Wi-Fi<br>Mobile data<br>iBeacon micro-location</td></tr><tr><td>NFC</td><td>NFC with reader mode</td></tr><tr><td>Audio Jack</td><td>N/A</td></tr><tr><td colspan=\"2\"><strong>OS</strong></td></tr><tr><td>Operating System</td><td>iOS 16</td></tr><tr><td colspan=\"2\"><strong>Features</strong></td></tr><tr><td>Sensors</td><td>Face ID<br>LiDAR Scanner<br>Barometer<br>High dynamic range gyro<br>High-g accelerometer<br>Proximity sensor<br>Dual ambient light sensors</td></tr><tr><td>IP Rating</td><td>Rated IP68 (maximum depth of 6 metres for up to 30 minutes) under IEC standard 60529</td></tr><tr><td>Other Features</td><td>Face ID (Enabled by TrueDepth camera for facial recognition)<br>Apple Pay (Pay with your iPhone using Face ID in stores, within apps and on the web)<br>Safety: Emergency SOS, Crash Detection</td></tr><tr><td colspan=\"2\"><strong>Battery</strong></td></tr><tr><td>Type</td><td>Built‑in rechargeable lithium‑ion battery</td></tr><tr><td>Fast Charging</td><td>MagSafe wireless charging up to 15W<br>Qi wireless charging up to 7.5W<br>Charging via USB to computer system or power adapter<br>Fast-charge capable<br>Up to 50% charge in around 30 minutes11 with 20W adapter or higher (available separately)</td></tr><tr><td colspan=\"2\"><strong>Physical specification</strong></td></tr><tr><td>Dimension</td><td>Height: 160.7mm<br>Width: 77.6mm<br>Depth: 7.85mm</td></tr><tr><td>Weight</td><td>240g</td></tr><tr><td>Body Material</td><td>Ceramic Shield front<br>Textured matt glass back and<br>stainless steel design</td></tr><tr><td>Colors</td><td>Deep Purple</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Warranty</td><td>BTRC Approved (One year Apple warranty all over the world including Bangladesh)</td></tr></tbody></table></figure>', 'upload/products/thumb_1695620248.webp', '[\"upload\\/products\\/product_169562024875579055.webp\",\"upload\\/products\\/product_169562024847726239.webp\"]', '[\"4\"]', NULL, 5, 5, 1, 'admin', 1, '2023-09-25 09:37:28', '2023-09-25 09:52:39'),
(10, 'Apple iPhone 13 128GB Midnight (Singapore)', 'apple_iphone_13_128gb_midnight_singapore_', 2, 4, '850', '1050', '1000', 'MPN: MLPF3ZP/A\r\nModel: iPhone 13 (A2633)\r\nDisplay: 6.1\" Super Retina XDR displayfootnote\r\nProcessor: A15 Bionic chip, Storage: 128GB\r\nCamera: 12MP + 12MP Rear, 12MP Front\r\nFeatures: Face ID, eSIM Support', '<h2><strong>Apple iPhone 13 128GB Midnight (Singapore)</strong></h2><p>The Apple iPhone 13 features the latest technology and advanced features that are designed to provide users with a seamless and unparalleled mobile experience. The device is powered by the latest A15 Bionic chip, providing exceptional performance and power efficiency. The 6.1-inch Super Retina XDR display, with ProMotion technology, delivers an immersive visual experience with incredibly vibrant colors and deep blacks. The device comes equipped with a dual-camera system, including a 12MP main and a 12MP ultra-wide, allowing users to capture stunning photos and videos. This iPhone 13 has a 128GB internal storage capacity, offering ample space for all your photos, videos, and apps. It has been designed for durability with Ceramic Shield. It also offers water resistance and a surgical-grade stainless steel body. The midnight color option adds a luxurious and elegant touch to the device\'s overall design. iPhone 13 comes with a dual camera system. The main camera is 12MP for up to 4x the resolution, and 12MP Telephoto for up to 2x better low-light photos. The quad-pixel sensor on the Main camera makes the most of 48 megapixels by adapting to what you’re shooting. You can also snap your sharpest, most colorful close-ups and group shots, thanks to a new TrueDepth front camera with autofocus and a larger aperture. The TrueDepth camera and A15 Bionic also power Face ID, the most secure facial authentication in a smartphone.<br>&nbsp;</p><h2><strong>Buy Apple iPhone 13 128GB Midnight from the best Mobile Phone Shop in Bangladesh: Star Tech</strong></h2><p>In Bangladesh, you can get the original <a href=\"https://www.startech.com.bd/apple-iphone-13\">Apple iPhone 13 128GB Midnight</a>&nbsp;From Star Tech. We have a large collection of the latest <a href=\"https://www.startech.com.bd/apple-iphone\">Apple iPhones</a>&nbsp;to purchase. Order Online Or Visit your Nearest <a href=\"https://www.startech.com.bd/\">Star Tech </a>Shop to get yours at the lowest price.&nbsp;The Apple iPhone 13 is BTRC Approved (One year Apple warranty all over the world including Bangladesh)</p>', '<h2><strong>Specification</strong></h2><figure class=\"table\"><table><thead><tr><th colspan=\"3\"><strong>Display</strong></th></tr></thead><tbody><tr><td>Size</td><td>6.1‑inch</td><td>&nbsp;</td></tr><tr><td>Type</td><td>Super Retina XDR display<br>All‑screen OLED display</td><td>&nbsp;</td></tr><tr><td>Resolution</td><td>2556x1179-pixel resolution at 460 ppi</td><td>&nbsp;</td></tr><tr><td>Brightness</td><td>800 nits max brightness (typical); 1,200 nits peak brightness (HDR)</td><td>&nbsp;</td></tr><tr><td>Features</td><td>HDR display<br>True Tone display<br>Wide color display (P3)<br>Haptic Touch<br>2,000,000:1 contrast ratio (typical)<br>Fingerprint-resistant oleophobic coating<br>Support for display of multiple languages and characters simultaneously</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Processor</strong></td></tr><tr><td>Chipset</td><td>A15 Bionic chip</td><td>&nbsp;</td></tr><tr><td>CPU Type</td><td>6‑core CPU with 2 performance and 4 efficiency cores<br>16‑core Neural Engine</td><td>&nbsp;</td></tr><tr><td>GPU</td><td>4‑core GPU</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Memory</strong></td></tr><tr><td>RAM</td><td>4GB</td><td>&nbsp;</td></tr><tr><td>Internal Storage</td><td>128GB</td><td>&nbsp;</td></tr><tr><td>Card Slot</td><td>N/A</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Rear Camera</strong></td></tr><tr><td>Resolution</td><td>Dual 12MP camera system (Main and Ultra Wide)</td><td>&nbsp;</td></tr><tr><td>Features</td><td>Dual 12MP camera system (Main and Ultra Wide)<br>Sensor-shift optical image stabilization<br>.5x, 1x optical zoom options<br>True Tone flash with Slow Sync<br>Deep Fusion<br>Smart HDR 4 for photos<br>Portrait mode with advanced bokeh and Depth Control<br>Portrait Lighting with six effects (Natural, Studio, Contour, Stage, Stage Mono, High‑Key Mono)<br>Night mode<br>Photographic Styles</td><td>&nbsp;</td></tr><tr><td>Video Recording</td><td>4K video recording at 24 fps, 25 fps, 30 fps or 60 fps<br>1080p HD video recording at 25 fps, 30 fps or 60 fps<br>Cinematic mode for recording videos with shallow depth of field (1080p at 30 fps)<br>HDR video recording with Dolby Vision up to 4K at 60 fps<br>Slow-motion video support for 1080p at 120 fps or 240 fps<br>Time-lapse video with stabilisation<br>Night mode Time-lapse<br>QuickTake video<br>Sensor-shift optical image stabilisation for video (Main)<br>2x optical zoom out<br>Digital zoom up to 3x<br>Audio zoom<br>Stereo recording</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Front Camera</strong></td></tr><tr><td>Resolution</td><td>TrueDepth front camera (12MP camera)</td><td>&nbsp;</td></tr><tr><td>Features</td><td>ƒ/2.2 aperture<br>Retina Flash<br>Deep Fusion<br>Smart HDR 4 for photos<br>Portrait mode with advanced bokeh and Depth Control<br>Portrait Lighting with six effects (Natural, Studio, Contour, Stage, Stage Mono, High‑Key Mono)<br>Animoji and Memoji<br>Night mode<br>Photographic Styles<br>&nbsp;</td><td>&nbsp;</td></tr><tr><td>Video Recording</td><td>4K video recording at 24 fps, 25 fps, 30 fps, or 60 fps<br>1080p HD video recording at 25 fps, 30 fps, or 60 fps<br>Cinematic mode (1080p at 30 fps)<br>HDR video recording with Dolby Vision up to 4K at 60 fps<br>Slo-mo video support for 1080p at 120 fps<br>QuickTake video<br>Cinematic video stabilization (4K, 1080p, and 720p)</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Audio</strong></td></tr><tr><td>Speaker</td><td>Built‑in stereo speaker</td><td>&nbsp;</td></tr><tr><td>Audio Features</td><td>Supported formats include AAC, MP3, Apple Lossless, FLAC, Dolby Digital, Dolby Digital Plus and Dolby Atmos<br>Spatial Audio playback<br>User‑configurable maximum volume limit</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Network &amp; Connectivity</strong></td></tr><tr><td>SIM</td><td>Dual SIM (1x nano-SIM and 1x eSIM)</td><td>&nbsp;</td></tr><tr><td>Wi-Fi</td><td>5G (sub-6 GHz and mmWave) with 4x4 MIMO<br>Gigabit LTE with 4x4 MIMO and LAA<br>Wi‑Fi 6 (802.11ax) with 2x2 MIMO</td><td>&nbsp;</td></tr><tr><td>Bluetooth</td><td>Bluetooth 5.0</td><td>&nbsp;</td></tr><tr><td>GPS</td><td>Precision dual-frequency GPS (GPS, GLONASS, Galileo, QZSS and BeiDou)<br>Digital compass<br>Wi-Fi<br>Mobile data<br>iBeacon micro-location</td><td>&nbsp;</td></tr><tr><td>NFC</td><td>NFC with reader mode</td><td>&nbsp;</td></tr><tr><td>Audio Jack</td><td>N/A</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>OS</strong></td></tr><tr><td>Operating System</td><td>iOS 16</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Features</strong></td></tr><tr><td>Sensors</td><td>Face ID<br>LiDAR Scanner<br>Barometer<br>High dynamic range gyro<br>High-g accelerometer<br>Proximity sensor<br>Dual ambient light sensors</td><td>&nbsp;</td></tr><tr><td>IP Rating</td><td>Rated IP68 (maximum depth of 6 metres for up to 30 minutes) under IEC standard 60529</td><td>&nbsp;</td></tr><tr><td>Other Features</td><td>Face ID (Enabled by TrueDepth camera for facial recognition)<br>Apple Pay (Pay with your iPhone using Face ID in stores, within apps and on the web)<br>Safety: Emergency SOS, Crash Detection</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Battery</strong></td></tr><tr><td>Type</td><td>Built‑in rechargeable lithium‑ion battery</td><td>&nbsp;</td></tr><tr><td>Fast Charging</td><td>MagSafe wireless charging up to 15W<br>Qi wireless charging up to 7.5W<br>Charging via USB to computer system or power adapter<br>Fast-charge capable<br>Up to 50% charge in around 30 minutes with 20W adapter or higher (available separately)</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Physical specification</strong></td></tr><tr><td>Dimension</td><td>Height: 5.78 inches (146.7 mm)<br>Width: 2.82 inches (71.5 mm)<br>Depth: 0.30 inch (7.65 mm)</td><td>&nbsp;</td></tr><tr><td>Weight</td><td>6.14 ounces (174 grams)</td><td>&nbsp;</td></tr><tr><td>Body Material</td><td>Ceramic Shield front<br>Glass back and aluminium design</td><td>&nbsp;</td></tr><tr><td>Colors</td><td>Midnight</td><td>&nbsp;</td></tr><tr><td colspan=\"3\"><strong>Warranty Information</strong></td></tr><tr><td>Warranty</td><td>BTRC Approved (One year Apple warranty all over the world including Bangladesh)</td><td>&nbsp;</td></tr></tbody></table></figure>', 'upload/products/thumb_1695620365.webp', '[\"upload\\/products\\/product_169562036536861967.webp\",\"upload\\/products\\/product_16956203657521479.webp\"]', '[\"3\",\"4\"]', NULL, 5, 5, 1, 'admin', 1, '2023-09-25 09:39:25', '2023-09-25 09:53:25');
INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `brand_id`, `price`, `sell_price`, `offer_price`, `short_desc`, `description`, `ad_info`, `thumb_photo`, `photo`, `location`, `tags`, `qty`, `available_qty`, `status`, `creator_role`, `created_by`, `created_at`, `updated_at`) VALUES
(11, 'OPPO A17 Smartphone (4/64GB)', 'oppo_a17_smartphone_4_64gb_', 2, 6, '140', '180', '170', 'MPN: CPH2477\r\nModel: A17\r\nDisplay: 6.56\" HD+ Eye-care Display\r\nProcessor: Mediatek MT6765 Helio G35 (12 nm)\r\nCamera: Dual 50+2MP on Rear, 5MP Front\r\nFeatures: Side-mounted Fingerprint, IPX4', '<h2><strong>OPPO A17 Smartphone (4/64GB)</strong></h2><p>The Oppo A17 has a 6.56-inch HD+ display. Its waterdrop notch has a Full-View design. The back camera has two 50+2 Megapixel sensors, an LED flash, PDAF, a depth sensor, HDR, and other features. It also records Full HD video. A 5 Megapixel front camera is available. The 5000 mAh battery on the Oppo A17 supports 10W quick charging. It has a PowerVR GE8320 GPU, an octa-core CPU that runs up to 2.3 GHz, and 4 GB of RAM. A Mediatek Helio G35 (12nm) chipset powers it. The gadget has a MicroSD slot and 64 GB of internal storage. This phone has a side-mounted fingerprint sensor.</p><h3><strong>Premium Leather-Feel Design</strong></h3><p>OPPO A17 offers a unique geometric style and tactile reassurance, thanks to a freshly designed one-piece faux leather handset wrap. The material is kinder to the skin and more resistant to dirt.<br>&nbsp;</p><h3><strong>Colour-Rich Eye-Care Display</strong></h3><p>OPPO A17 has been designed with a 6.56\" HD+ display. It has a 100% DCI-P3 high-colour gamut and intelligent dimming combine to ensure the true, smooth color and delicate definition that\'s easy on the eye.</p><h3><strong>50MP AI Camera</strong></h3><p>OPPO A17 comes with an ultra-clear 50MP rear camera that achieves incredible image resolution, ensuring perfect detail and definition for close-ups and scenic vistas. Portrait Mode features \'perfect blur\', so you can create professional-grade pics comparable in quality to SLR.</p><h3><strong>5000mAh Long-lasting Battery</strong></h3><p>The&nbsp;OPPO A17 is powered by a 5000mAh battery. It can let you stream YouTube for 21.02 hours. With Super Power Saving Mode you can get 1.84 hours of&nbsp;call time when the charge drops to 5%. Super Nighttime Standby Mode will reduce evening power consumption by 1.21%.</p><h2><strong>Buy OPPO A17 Smartphone (4/64GB)&nbsp;from the best Mobile Shop in Bangladesh: Star Tech</strong><br>&nbsp;</h2><p>In Bangladesh, you can get the original <a href=\"https://www.startech.com.bd/oppo-a17\">OPPO A17 (4/64GB)</a> From Star Tech. We have a large collection of the latest <a href=\"https://www.startech.com.bd/oppo-mobile-phone\">OPPO Mobile Phones</a> to purchase. Order Online Or Visit your Nearest <a href=\"https://www.startech.com.bd/\">Star Tech</a> Shop to get yours at the lowest price. The OPPO A17 comes with a 01-year Official warranty&nbsp;&nbsp;(To claim please visit the nearest OPPO Service Center).</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Display</strong></th></tr></thead><tbody><tr><td>Size</td><td>6.56 inches</td></tr><tr><td>Type</td><td>IPS LCD</td></tr><tr><td>Resolution</td><td>720 x 1600 (HD+)</td></tr><tr><td>Refresh Rate</td><td>60Hz</td></tr><tr><td>Brightness</td><td>Standard maximum brightness: 480nits<br>Maximum brightness under sunlight: 600nits</td></tr><tr><td>Protection</td><td>N/A</td></tr><tr><td>Features</td><td>103.4 cm2 (~83.3% screen-to-body ratio)<br>20:9 ratio (~269 ppi density)</td></tr><tr><td colspan=\"2\"><strong>Processor</strong></td></tr><tr><td>Chipset</td><td>Mediatek MT6765 Helio G35 (12 nm)</td></tr><tr><td>CPU Type</td><td>Octa-core</td></tr><tr><td>CPU Speed</td><td>4x2.3 GHz Cortex-A53 &amp; 4x1.8 GHz Cortex-A53</td></tr><tr><td>GPU</td><td>PowerVR GE8320 @ 680MHz</td></tr><tr><td colspan=\"2\"><strong>Memory</strong></td></tr><tr><td>RAM</td><td>4GB LPDDR4X @ 1600MHz, dual 16-bit channels</td></tr><tr><td>Internal Storage</td><td>64GB eMMC 5.1</td></tr><tr><td>Card Slot</td><td>microSDXC</td></tr><tr><td colspan=\"2\"><strong>Rear Camera</strong></td></tr><tr><td>Resolution</td><td>50 MP, f/1.8, (wide), PDAF<br>2 MP, f/2.4, (depth)</td></tr><tr><td>Features</td><td>LED flash, HDR, panorama</td></tr><tr><td>Video Recording</td><td>1080P@30fps or 720P@30fps (default)</td></tr><tr><td colspan=\"2\"><strong>Front Camera</strong></td></tr><tr><td>Resolution</td><td>5 MP, f/2.2, (wide)</td></tr><tr><td>Features</td><td>HDR</td></tr><tr><td>Video Recording</td><td>1080P@30fps or 720P@30fps (default)</td></tr><tr><td colspan=\"2\"><strong>Audio</strong></td></tr><tr><td>Speaker</td><td>Yes</td></tr><tr><td colspan=\"2\"><strong>Network &amp; Connectivity</strong></td></tr><tr><td>SIM</td><td>Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td>Network</td><td>2G, 3G, 4G</td></tr><tr><td>Wi-Fi</td><td>Supports Wi-Fi 5 (802.11ac), 802.11a/b/g/n;<br>WLAN 2.4G/WLAN 5.1G/WLAN 5.8G;<br>Supports WLAN Display; WLAN network sharing</td></tr><tr><td>Bluetooth</td><td>Bluetooth v5.3, Bluetooth Low Energy (BLE)<br>Bluetooth Audio Codec: SBC, AAC, aptX, aptX HD, and LDAC</td></tr><tr><td>GPS</td><td>Built-in GPS, A-GPS, BeiDou, GLONASS, and Galileo positioning systems</td></tr><tr><td>USB</td><td>MicroUSB 2.0</td></tr><tr><td>OTG</td><td>Yes</td></tr><tr><td>Audio Jack</td><td>3.5mm</td></tr><tr><td colspan=\"2\"><strong>OS</strong></td></tr><tr><td>Operating System</td><td>Android 12</td></tr><tr><td>Custom UI</td><td>ColorOS 12.1</td></tr><tr><td colspan=\"2\"><strong>Features</strong></td></tr><tr><td>Fingerprint</td><td>Side-mounted</td></tr><tr><td>Sensors</td><td>Geomagnetic sensor<br>Light sensor<br>Proximity sensor<br>Accelerometer<br>Gravity sensor</td></tr><tr><td>IP Rating</td><td>IPX4 water resistance</td></tr><tr><td colspan=\"2\"><strong>Battery</strong></td></tr><tr><td>Type</td><td>Lithium-polymer 5000 mAh (non-removable)</td></tr><tr><td>Fast Charging</td><td>10W Fast Charging</td></tr><tr><td colspan=\"2\"><strong>Physical specification</strong></td></tr><tr><td>Dimension</td><td>164.2 x 75.6 x 8.3 mm (6.46 x 2.98 x 0.33 in)</td></tr><tr><td>Weight</td><td>189 g (6.67 oz)</td></tr><tr><td>Colors</td><td>Midnight Black<br>Lake Blue</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Warranty</td><td>01-year Official warranty (To claim please visit the nearest OPPO Service Center)</td></tr></tbody></table></figure>', 'upload/products/thumb_1695620476.webp', '[]', '[\"1\",\"2\",\"4\"]', NULL, 10, 10, 1, 'admin', 1, '2023-09-25 09:41:16', '2023-09-25 10:28:57'),
(12, 'Realme GT Master Edition Smartphone (8/128GB)', 'realme_gt_master_edition_smartphone_8_128gb_', 2, 3, '280', '350', '310', 'Model: GT Master Edition\r\nDisplay: 6.43\" FHD+ 120Hz Super AMOLED Display\r\nProcessor: Qualcomm SM7325 Snapdragon 778G 5G (6 nm)\r\nCamera: Triple 64+8+2 MP on Rear, 32MP Front\r\nFeatures: In-display Fingerprint, 65W SuperDart Charge', '<h2><strong>Realme GT Master Edition Smartphone (8/128GB)</strong></h2><p>The Realme GT Master Edition has a 6.43-inch Full HD+ Super AMOLED screen. It has a Full-View left punch-hole design. The rear camera has a triple 64+8+2 MP resolution, PDAF, LED flash, dedicated macro camera, ultrawide lens, and 4K video recording. The front camera has a resolution of 32 MP. Realme GT Master has a 4300 mAh battery with 65W Fast Charging. It has 8 GB of RAM, an octa-core CPU with a clock speed of up to 2.4 GHz, and an Adreno 642L GPU. It is powered by a Qualcomm Snapdragon 778G 5G (6 nm) chipset. The device has 128 GB of internal storage and no MicroSD slot. This phone includes an in-display fingerprint sensor.<br>&nbsp;</p><h3><strong>Suitcase Design</strong></h3><p>Realme GT Master Edition is made of exquisite vegan leather, which is the first concave vegan leather in the industry, so as to replicate the horizontal grid of the suitcase. The Voyager Grey color also gives you a comfortable feel due to its desaturated and neutral characteristics.<br>&nbsp;</p><h3><strong>120Hz Samsung Super AMOLED Display</strong></h3><p>The Realme GT Master packs a 6.43\" FHD+ 120Hz Super AMOLED Display. It can present rich colors just the way you see them in the real world and provide ultra-smooth scrolling in every frame. It has a Contrast Ratio of 5,000,000:1 and a 360Hz Touch Sampling Rate. It can offer 1000nits Peak Brightness and 100% P3 Wide Color Gamut with a 91.7% Screen-to-Body Ratio.<br>&nbsp;</p><h3><strong>Snapdragon 778G 5G 6nm Processor</strong></h3><p>Realme GT Master Edition is powered by a Qualcomm SM7325 Snapdragon 778G 5G (6 nm). Snapdragon 778G 5G\'s CPU contains a Cortex-A78 prime core with 2.4 GHz clock speed, increasing performance by 40%. The Adreno 642L GPU allows for 40% faster graphics rendering. Combined with the 6th-Gen AI engine with 12TOPS, its performance is beyond imagination.<br>&nbsp;</p><h3><strong>Vapor Chamber Cooling System</strong></h3><p>The Realme GT Master Edition is equipped with a large vapor chamber having an area of 1729.8mm², combined with a super large heatsink of an area of 13217mm², covering 100% of core heat sources. This significantly reduces the temperature and keeps the phone in a high-performance state.<br>&nbsp;</p><h3><strong>32MP Sony Selfie Camera</strong></h3><p>The Realme GT Master is equipped with a 32MP Sony sensor for the selfie camera. It captures amazing quality images even in low light. It also offers AI beauty. It enhances your selfies to look best.<br>&nbsp;</p><h3><strong>65W SuperDart Charge</strong></h3><p>Realme GT Master Edition is equipped with 65W SuperDart Charge can charge your phone to 100% in 33 minutes. It also supports flash charging while playing games your phone can charge up to 38% in the one-hour play.<br>&nbsp;</p><h2><strong>Buy Realme GT Master Edition Smartphone (8/128GB)&nbsp;from the best Mobile Shop in Bangladesh: Star Tech</strong><br>&nbsp;</h2><p>In Bangladesh, you can get the original <a href=\"https://www.startech.com.bd/realme-gt-master-edition\">Realme GT Master Edition (8/128GB)</a> From Star Tech. We have a large collection of the latest <a href=\"https://www.startech.com.bd/realme-mobile-phone\">Realme Mobile Phones</a> to purchase. Order Online Or Visit your Nearest <a href=\"https://www.startech.com.bd/\">Star Tech</a> Shop to get yours at the lowest price. The Realme GT Master Edition comes with a 01-year Official warranty (To claim please visit the nearest Realme Service Center).</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Display</strong></th></tr></thead><tbody><tr><td>Size</td><td>6.43 inches</td></tr><tr><td>Type</td><td>Super AMOLED</td></tr><tr><td>Resolution</td><td>FHD+ (1080 x 2400)</td></tr><tr><td>Refresh Rate</td><td>120Hz</td></tr><tr><td>Brightness</td><td>1000 nits (peak)</td></tr><tr><td>Features</td><td>99.8 cm2 (~85.3% screen-to-body ratio)<br>20:9 ratio (~409 ppi density)</td></tr><tr><td colspan=\"2\"><strong>Processor</strong></td></tr><tr><td>Chipset</td><td>Qualcomm SM7325 Snapdragon 778G 5G (6 nm)</td></tr><tr><td>CPU Type</td><td>Octa-core</td></tr><tr><td>CPU Speed</td><td>1x2.4 GHz Cortex-A78 &amp; 3x2.2 GHz Cortex-A78 &amp; 4x1.9 GHz Cortex-A55</td></tr><tr><td>GPU</td><td>Adreno 642L</td></tr><tr><td colspan=\"2\"><strong>Memory</strong></td></tr><tr><td>RAM</td><td>8GB</td></tr><tr><td>Internal Storage</td><td>128GB</td></tr><tr><td>Card Slot</td><td>microSDXC</td></tr><tr><td colspan=\"2\"><strong>Rear Camera</strong></td></tr><tr><td>Resolution</td><td>64 MP, f/1.8, 25mm (wide), 1/2\", 0.7µm, PDAF<br>8 MP, f/2.2, 16mm, 119˚ (ultrawide), 1/4.0\", 1.12µm<br>2 MP, f/2.4, (macro)</td></tr><tr><td>Features</td><td>LED flash, HDR, panorama</td></tr><tr><td>Video Recording</td><td>4K@30fps, 1080p@30/60fps, gyro-EIS</td></tr><tr><td colspan=\"2\"><strong>Front Camera</strong></td></tr><tr><td>Resolution</td><td>32 MP, f/2.5, 26mm (wide), 1/2.74\", 0.8µm</td></tr><tr><td>Features</td><td>HDR, panorama</td></tr><tr><td>Video Recording</td><td>1080p@30fps</td></tr><tr><td colspan=\"2\"><strong>Audio</strong></td></tr><tr><td>Speaker</td><td>Yes</td></tr><tr><td>Audio Features</td><td>24-bit/192kHz audio</td></tr><tr><td colspan=\"2\"><strong>Network &amp; Connectivity</strong></td></tr><tr><td>SIM</td><td>Dual SIM (Nano-SIM, dual stand-by)</td></tr><tr><td>Network</td><td>2G, 3G, 4G, 5G</td></tr><tr><td>Wi-Fi</td><td>Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct</td></tr><tr><td>Bluetooth</td><td>5.2, A2DP, LE</td></tr><tr><td>GPS</td><td>GPS, GLONASS, GALILEO, BDS, QZSS</td></tr><tr><td>NFC</td><td>Yes</td></tr><tr><td>USB</td><td>USB Type-C 2.0</td></tr><tr><td>OTG</td><td>Yes</td></tr><tr><td>Audio Jack</td><td>3.5mm</td></tr><tr><td colspan=\"2\"><strong>OS</strong></td></tr><tr><td>Operating System</td><td>Android 11</td></tr><tr><td>Upgradable</td><td>Upgradable to Android 13</td></tr><tr><td>Custom UI</td><td>realme UI 2.0</td></tr><tr><td colspan=\"2\"><strong>Features</strong></td></tr><tr><td>Fingerprint</td><td>In-display (optical)</td></tr><tr><td>Sensors</td><td>Magnetic induction sensor<br>Light sensor<br>Proximity Sensor<br>Gyro-meter<br>Acceleration sensor</td></tr><tr><td>IP Rating</td><td>N/A</td></tr><tr><td colspan=\"2\"><strong>Battery</strong></td></tr><tr><td>Type</td><td>Lithium-polymer 4300 mAh (non-removable)</td></tr><tr><td>Fast Charging</td><td>65W Fast Charging (100% in 33 minutes)</td></tr><tr><td colspan=\"2\"><strong>Physical specification</strong></td></tr><tr><td>Dimension</td><td>159.2 mm x 73.5 mm x 8.0/8.7 mm (depending on color)</td></tr><tr><td>Weight</td><td>174/180 g (6.14 oz)</td></tr><tr><td>Body Material</td><td>Glass front, plastic frame, plastic back</td></tr><tr><td>Colors</td><td>Voyager Grey<br>White</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Warranty</td><td>01-year Official warranty (To claim please visit the nearest Realme Service Center)</td></tr></tbody></table></figure>', 'upload/products/thumb_1695620645.webp', '[\"upload\\/products\\/product_16956206452345691.webp\"]', '[\"1\"]', NULL, 5, 5, 1, 'admin', 1, '2023-09-25 09:44:05', '2023-09-25 10:33:22'),
(13, 'Jabra Evolve2 75 (UC) USB Type A Stereo Headset with Stand Black', 'jabra_evolve2_75_uc_usb_type_a_stereo_headset_with_stand_black', 1, 11, '310', '340', '330', 'MPN: 27599-989-899\r\nModel: EVOLVE2 75\r\nBusylight, Calls controls, Voice guidance\r\nBest-in-class. Boom., HearThrough\r\nWireless range (ft): Up to 100 feet\r\nCertified for UC', '<h2><strong>Jabra Evolve2 75 (UC) USB Type A Stereo Headset with Stand Black</strong></h2><p>The Jabra Evolve2 75 USB-A MS Teams Stereo Headset has replaced previous hybrid working standards. Industry-leading call quality thanks to top-notch audio engineering. With this intelligent headset, you can stay connected and productive from the first call of the day to the last train home. With an ergonomic earcup design, this headset invented brand-new dual-foam technology. You will be comfortable from the first call to the last thanks to the re-engineered leatherette ear cushion design that allows for better airflow. We can provide exceptional noise isolation and the best all-day comfort by mixing firm foam for the outer with soft foam for the interior of the ear cushions. So that you may receive Active Noise-Cancellation (ANC) performance that is even greater in a headset that you can wear for whatever length you wish. The headset also offers MS Teams Certifications and other features like Busylight, Calls controls, Voice guiding, and Wireless range (ft): Up to 100 feet.</p><h3><strong>Best-in-class. Boom</strong></h3><p>The most recent Jabra Evolve2 75 USB-A MS Teams Stereo Headset offers professional-grade call performance that leads the industry, yet Evolve2 75 wins best-in-class. Additionally, this includes a redesigned microphone boom arm that is 33 percent shorter than the Evolve 75 and offers the industry-leading call performance for which Jabra headsets are known. It complies with Microsoft\'s Open Office criteria and is specially tuned for outstanding conversations in open-plan workplaces and other loud environments when the microphone boom arm is lowered in Performance Mode.</p><h3><strong>Concentration mode: activated</strong></h3><p>The headset has advanced active noise-cancellation technology (ANC). To safeguard your attention, it allowed the sophisticated feedforward and feedback dual hybrid ANC to work. From the train to the street, the cafe, the airport, and then back to the workplace. Anywhere you are, it makes it easier to focus.</p><h3><strong>Three advanced chipsets. Three times the power</strong></h3><p>This Jabra Evolve2 75\'s impressive capabilities are all supported by a sophisticated ecosystem comprised of three potent digital chipsets. These combine to make the headset quicker, more powerful, and smarter than before.</p><h3><strong>Stay flexible. Stay connected</strong></h3><p>If you are on a call, you may still use this headset because it has excellent call performance within a 30-meter wireless range. You may connect to both your smartphone and laptop. so that you may travel away from your workstation without losing connection.</p><p>The headset is also featured with Busylight, Calls controls, Voice guidance, Wireless range (ft): Up to 100 feet, and also it has MS Teams Certifications. This Latest Jabra Evolve2 75 USB-A MS Teams Stereo Headset has 02 years warranty.</p>', '<figure class=\"table\"><table><thead><tr><th colspan=\"2\"><strong>Technical Specification</strong></th></tr></thead><tbody><tr><td>Frequency Range</td><td>Speaker frequency range: 20Hz - 20000Hz<br>Speaker bandwidth (music mode): 20Hz - 20000Hz<br>Speaker bandwidth (speak mode): 100Hz - 8000Hz</td></tr><tr><td>Connectivity</td><td>Connectivity: USB-A/USB-C Bluetooth adapter, Bluetooth®<br>Bluetooth profiles: A2DP v1.3, AVRCP v1.6, HFP v1.8, HSP v1.2, PBAP v1.1, SPP v1.2<br>Bluetooth version: 5.2<br>Operating range: Up to 30m / 100ft<br>Paired devices: Up to 8 devices<br>On-head detection: Yes</td></tr><tr><td>Others</td><td>Operating temperature: -10°C to 45°C / 14°F to 113°F<br>Storage temperature: -10°C to 45°C / 14°F to 113°F<br>User hearing protection: PeakStop, EU noise at work, G616, Jabra SafeToneTM<br>Certifications and compliance: Microsoft Teams, MFi, Zoom, Amazon Alexa Built-in<br>Microphone type: 4 Analog MEMS / 4 Digital MEMS<br>Audio codecs supported: AAC, SBC<br>Speaker max input power: 30 mW</td></tr><tr><td colspan=\"2\"><strong>Physical Specification</strong></td></tr><tr><td>Dimensions</td><td>145mm x 67mm x 190mm / 5.71in x 2.64in x 7.48in</td></tr><tr><td>Weight</td><td>197g / 6.9oz (stereo variant)</td></tr><tr><td>Color</td><td>Black</td></tr><tr><td>Cable Length</td><td>1.2m / 3.9ft</td></tr><tr><td colspan=\"2\"><strong>Microphone</strong></td></tr><tr><td>Frequency</td><td>Microphone frequency range: Analog 5Hz - 20000Hz / Digital 100Hz - 8000Hz</td></tr><tr><td>Sensitivity</td><td>-35 dBv/Pa (analog microphone)/-26 dBFS/Pa (digital microphone)</td></tr><tr><td>Pick-up Pattern</td><td>cushion pattern</td></tr><tr><td colspan=\"2\"><strong>Warranty Information</strong></td></tr><tr><td>Manufacturing Warranty</td><td>2 years</td></tr></tbody></table></figure>', 'upload/products/thumb_1695621010.jpg', '[\"upload\\/products\\/product_169562101084746488.jpg\"]', '[]', NULL, 15, 15, 1, 'admin', 1, '2023-09-25 09:50:10', '2023-09-25 09:55:56');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `purchase_date` datetime NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `creator_role` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `product_id`, `invoice_no`, `purchase_date`, `supplier`, `qty`, `price`, `payment_type`, `note`, `creator_role`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '#in202301', '2023-09-20 00:00:00', 'compnay', 20, 4000, 'cash', NULL, 'admin', 1, '2023-09-24 10:48:08', '2023-09-24 10:48:08'),
(2, 6, '25092301', '2023-09-25 00:00:00', 'compnay', 15, 2250, 'cash', NULL, 'vendor', 1, '2023-09-25 08:42:53', '2023-09-25 08:42:53'),
(3, 5, '25092302', '2023-09-25 00:00:00', 'MSI company', 10, 800, 'cash', NULL, 'vendor', 1, '2023-09-25 08:44:11', '2023-09-25 08:44:11'),
(4, 4, '25092303', '2023-09-25 00:00:00', 'Xiaomi company', 20, 7000, 'cash', NULL, 'vendor', 1, '2023-09-25 08:45:22', '2023-09-25 08:45:22'),
(5, 7, '25092302', '2023-09-25 00:00:00', 'MSI company', 10, 750, 'cash', NULL, 'vendor', 1, '2023-09-25 09:25:32', '2023-09-25 09:25:32'),
(6, 8, '25092303', '2023-09-25 00:00:00', 'MSI company', 12, 760, 'cash', NULL, 'vendor', 1, '2023-09-25 09:26:11', '2023-09-25 09:26:11'),
(7, 3, 'IN202302', '2023-09-25 00:00:00', 'Apple Gadgets', 10, 48000, 'cash', NULL, 'admin', 1, '2023-09-25 09:27:45', '2023-09-25 09:27:45'),
(8, 1, 'IN202303', '2023-09-25 00:00:00', 'Samsung Company', 15, 3000, 'cash', NULL, 'admin', 1, '2023-09-25 09:30:05', '2023-09-25 09:30:05'),
(9, 2, 'IN202303', '2023-09-25 00:00:00', 'Samsung Company', 10, 5000, 'cash', NULL, 'admin', 1, '2023-09-25 09:33:43', '2023-09-25 09:33:43'),
(10, 9, 'IN202302', '2023-09-25 00:00:00', 'Apple Gadgets', 5, 7500, 'cash', NULL, 'admin', 1, '2023-09-25 09:52:39', '2023-09-25 09:52:39'),
(11, 10, 'IN202302', '2023-09-25 00:00:00', 'Apple Gadgets', 5, 4250, 'cash', NULL, 'admin', 1, '2023-09-25 09:53:25', '2023-09-25 09:53:25'),
(12, 11, 'IN202304', '2023-09-25 00:00:00', 'Oppo company', 10, 1400, 'cash', NULL, 'admin', 1, '2023-09-25 09:54:11', '2023-09-25 09:54:11'),
(13, 13, 'IN202305', '2023-09-25 00:00:00', 'Realme Company', 10, 2800, 'cash', NULL, 'admin', 1, '2023-09-25 09:55:14', '2023-09-25 09:55:14'),
(14, 13, 'IN202306', '2023-09-25 00:00:00', 'Jabra Gadgets', 5, 1400, 'cash', NULL, 'admin', 1, '2023-09-25 09:55:56', '2023-09-25 10:34:00'),
(15, 12, 'IN202305', '2023-09-18 00:00:00', 'Realme Company', 5, 1560, 'cash', NULL, 'admin', 1, '2023-09-25 10:33:22', '2023-09-25 10:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `returnproducts`
--

CREATE TABLE `returnproducts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `creator_role` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `info` text DEFAULT NULL,
  `creator_role` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` enum('active','restricted') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `gender`, `address`, `info`, `creator_role`, `created_by`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Banjir', 'banjirahammad@gmail.com', NULL, '$2y$10$RYPblNZW0nONrb9Oo2dr3eHgSThcJnuMtQ411/bZStcRy/NGy5SPm', NULL, '017979489994', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2023-09-24 10:38:14', '2023-09-24 10:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `info` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` enum('active','inactive','restricted') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `store_name`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `info`, `created_by`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Rahim', 'Xiaomi Store', 'rahim@gmail.com', NULL, '$2y$10$owgSTV7qslA36JkVdYg5huBXfQwoZisHDEcj2Awg3Z.FC/PXc2lNS', 'upload/vendor/vendor_36498241695615640.png', '017979489995', 'Mirpur 10, Dhaka 1216', 'This is a Xiaomi Store in mirpur', 1, 'active', NULL, '2023-09-25 08:20:40', '2023-09-27 06:38:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_transaction_id_unique` (`transaction_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returnproducts`
--
ALTER TABLE `returnproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_store_name_unique` (`store_name`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `returnproducts`
--
ALTER TABLE `returnproducts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
