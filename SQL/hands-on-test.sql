-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2022 at 08:34 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hands-on-test`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Due, 2=Paid',
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `bill_month`, `year`, `amount`, `status`, `customer_id`, `created_at`, `updated_at`) VALUES
(5, 'March', 2222, 4654.00, 2, 4, '2022-03-15 01:16:26', '2022-03-15 01:16:26'),
(6, 'April', 5746, 53645.00, 1, 4, '2022-03-15 01:16:43', '2022-03-15 01:16:43'),
(7, 'June', 6868, 436547.00, 2, 4, '2022-03-15 01:17:00', '2022-03-15 01:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `address`, `password`, `created_at`, `updated_at`) VALUES
(4, 'Mahin', 'mahin@gmail.com', 'Dhaka', '$2y$10$8DQkqMt/XS/Oy.tLrasfHel8a2IeBLXQ2Z7SUTVjNY973W1gec/fy', '2022-03-14 06:38:50', '2022-03-14 06:38:50');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_03_09_061740_create_customers_table', 1),
(4, '2022_03_10_071359_create_bills_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(14, 'App\\Models\\Customer', 5, 'API Token', 'b2ba8c36c32a407e1d7bf9ff988b72c7dbc0633ebe8378c23cb6eb02c5e01388', '[\"*\"]', '2022-03-15 01:22:32', '2022-03-15 01:18:21', '2022-03-15 01:22:32'),
(18, 'App\\Models\\Customer', 4, 'API Token', '5c02c88a11507df02b4d5ed02f762c8fe71fbc996afe5d53bc8eb170e5382da2', '[\"*\"]', '2022-03-15 01:31:32', '2022-03-15 01:30:31', '2022-03-15 01:31:32'),
(19, 'App\\Models\\User', 1, 'API Token', '9388ed141b4cbc776377399b386e1a19808450439b3cf0b014511f3fe1bcab4d', '[\"*\"]', '2022-03-15 01:31:29', '2022-03-15 01:31:11', '2022-03-15 01:31:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Florence Ortiz', 'koepp.jasper@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(2, 'Elaina Goyette', 'assunta08@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(3, 'Annie Hand', 'kherzog@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(4, 'Bernice Daugherty', 'heaney.demario@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(5, 'Prof. Troy Powlowski', 'stacey.schumm@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(6, 'Linnie Glover', 'jacobson.arianna@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(7, 'Dr. Cielo Simonis', 'alisha.leffler@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(8, 'Lola Hansen', 'tianna00@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(9, 'Prof. Russel Schuster', 'emory53@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(10, 'Prof. Damon Green', 'keeling.kennith@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(11, 'Noble Ernser', 'hortense68@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(12, 'Adriel Thiel', 'lisette.oberbrunner@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(13, 'Nasir Glover DDS', 'kaya.nitzsche@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(14, 'Tate King', 'erin.walter@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(15, 'Dr. Harmon Hane', 'mmedhurst@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(16, 'Ally Powlowski', 'minerva01@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(17, 'Miss Patricia Graham Sr.', 'vincenza.purdy@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(18, 'Isobel Brakus', 'josefina.davis@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(19, 'Dr. Barney Yost', 'josefa39@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(20, 'Prof. Adell Carter DVM', 'fbatz@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(21, 'Mina Spinka', 'tracy15@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(22, 'Mrs. Margret Cummings', 'wbraun@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(23, 'Sheridan Lindgren', 'tremayne.osinski@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(24, 'Stacy King', 'ahermiston@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(25, 'Brooklyn Grady', 'tkuvalis@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(26, 'Salvador Hettinger III', 'alberta.wilkinson@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(27, 'Dr. Torrey Kuhic V', 'cindy.volkman@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(28, 'Westley Paucek V', 'jarret10@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(29, 'Alexandre Turcotte', 'nia75@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(30, 'Demetris Lebsack IV', 'burley.balistreri@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(31, 'Hortense Block', 'tania.skiles@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(32, 'Turner Keeling', 'reichel.alvina@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(33, 'Myrtis Farrell', 'zjacobs@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(34, 'Ms. Hailee Gutkowski', 'amiya.raynor@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(35, 'Felicity Wuckert', 'uupton@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(36, 'Verna Kirlin', 'brisa73@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(37, 'Adolphus Donnelly', 'bdeckow@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(38, 'Pascale Abbott Sr.', 'gutmann.tito@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(39, 'Vallie Doyle', 'brigitte27@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(40, 'Lew Rosenbaum', 'lauren76@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(41, 'Misael O\'Connell', 'eulalia59@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(42, 'Dr. Assunta Windler', 'okon.dan@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(43, 'Leonardo Torphy', 'skye.boyle@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(44, 'Prof. Giuseppe Halvorson', 'else55@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(45, 'Tierra Connelly', 'chuels@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(46, 'Josue Schuppe', 'rhianna22@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(47, 'Alvera Dibbert', 'mrath@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(48, 'Candice O\'Kon', 'kuvalis.kailee@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(49, 'Joshua Gutmann', 'asa22@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43'),
(50, 'Jamie Greenholt', 'ukovacek@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2022-03-09 00:50:43', '2022-03-09 00:50:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
