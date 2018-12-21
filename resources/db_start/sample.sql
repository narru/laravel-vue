-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2018 at 03:53 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sample`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('066fe6a6fc9d8cd787bb055e79a7c069aba16a4eacc9d16129c5c329a5c7498ff6974dc56b10a357', 1, 1, 'test', '[]', 0, '2018-12-16 23:22:58', '2018-12-16 23:22:58', '2019-12-17 05:07:58'),
('211aff291c9a1bfb0e2796f8324cd2db02fc7f23b874052c549d7642857ed2a85ad3415b384ece13', 1, 1, 'Testing', '[]', 0, '2018-12-14 03:19:09', '2018-12-14 03:19:09', '2019-12-14 09:04:09'),
('502fd470eabf44891c79755d064de75554e2584e87cbd8e7678ebb61866aae00a19bde0198ba480d', 1, 1, 'Testing', '[]', 0, '2018-12-14 03:19:06', '2018-12-14 03:19:06', '2019-12-14 09:04:06'),
('959219f9c2589c1aae142f156e235ff4173751c60736cd4df1c5eb8380a4402eac5edbeaaac357e8', 1, 1, 'Testing', '[]', 1, '2018-12-12 04:44:31', '2018-12-12 04:44:31', '2019-12-12 10:29:31'),
('9ca656d84f6a922c1fa67edb0e7e5bceac69f6367df074d68a3e1e1d53401573bcae7143f72831b5', 1, 1, 'Testing', '[]', 1, '2018-12-12 02:54:00', '2018-12-12 02:54:00', '2019-12-12 08:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Rpr4Drj5sTX13OTStRyk1su86UNFCgoCjy4m8zn2', 'http://localhost', 1, 0, 0, '2018-12-12 02:29:34', '2018-12-12 02:29:34'),
(2, NULL, 'Laravel Password Grant Client', 'dOC1tzI237gd8FUlrZLkOSFCDizsWlCiowFQQZNs', 'http://localhost', 0, 1, 0, '2018-12-12 02:29:35', '2018-12-12 02:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-12-12 02:29:35', '2018-12-12 02:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `role` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `type`, `role`, `bio`, `photo`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Naresh chaudhary', 'naresh@klientscape.com', NULL, 'user', '1', 'Hello this is for making the biograph if the user.', 'profile.png', '$2y$10$80dMAzN61Afo.5k9wrtzT.j/2Xd.1nqybiYAHCoCmwKBsmAqQPqQ2', '4t3JhSZHUctyoKk8Cmoo2OtrkUrncuCuLFzCvAtZ2CimXdIxaoQha1LbnpIW', '2018-12-03 10:39:45', '2018-12-12 03:46:36'),
(2, 'Mangit maharjan', 'mangit@KS.com', NULL, 'admin', NULL, 'He has completed Bachelor degree.', NULL, '$2y$10$lzj6MPBlbLW3AE5s/vt6EuEKAAmW4q.3wEWKzBLf01Tejwb9h9jj.', NULL, '2018-12-03 10:45:01', '2018-12-03 10:45:01'),
(8, 'asdfsa', 'asdfs@sadfsd.com', NULL, 'admin', NULL, 'sadfsdf', NULL, '$2y$10$bSwjGbzilwRRGxMjgRCTbemkjxyX6BeVlqsEN2Lg0QTIc5VjTjh5e', NULL, '2018-12-10 11:55:10', '2018-12-10 11:55:10'),
(9, 'asdfsdf', 'asdfasd@lkfdjlk.com', NULL, 'admin', NULL, 'sdajflkdf', NULL, '$2y$10$NfZBXoCq3KSZ5JyiW4PjUuLk2dHK7FvzTClGbGDJ6E4nq.Cj/jC1y', NULL, '2018-12-10 11:58:25', '2018-12-10 11:58:25'),
(10, 'Hello bro', 'asdfasd@sdfasd.com', NULL, 'admin', NULL, 'sadfsdf', NULL, '$2y$10$p96Vu0yDG/xR9M0tbcKIMuSHWaql/F9vxrGfqmX/zbRdFHxyYU5WC', NULL, '2018-12-11 10:44:07', '2018-12-12 03:53:53'),
(11, 'asdfsdaf', 'dsafsd@sadf.com', NULL, 'admin', NULL, 'asdfsdfsd', NULL, '$2y$10$ZRevv6ikl92nGlZgqD60fehFmzC8caoHVjpp8h.YIHE3OnEDOkW7e', NULL, '2018-12-11 10:45:10', '2018-12-11 10:45:10'),
(12, 'asdfsdf', 'sdafsdf@asdf.com', NULL, 'admin', NULL, 'asdfsafasdf', NULL, '$2y$10$L38Y966t82iTa4OmRvqkNexn6FOQIt5MMtEhzE8SbtxJQcDKZrd/u', NULL, '2018-12-11 10:55:50', '2018-12-11 10:55:50'),
(13, 'dsfsd', 'sdffdfs@sadf.com', NULL, 'admin', NULL, 'sdfsadfsd', NULL, '$2y$10$k2rxmVxZMj0XNDgVZbn93e2B5hO7Od4bPrI4F07Svl8kDhAoehG9u', NULL, '2018-12-11 10:58:39', '2018-12-11 10:58:39'),
(14, 'manju', 'manju@app.com', NULL, 'user', NULL, NULL, NULL, '$2y$10$lUomsVjwePOX.gcYfuu7TONnr0idiJlTN0CaIDWAWLlE8IHVX9CJ6', 'HdodXaVjaqGmSsUTxjqzpO5Couepdgsb4XGy64oYmbO9A3SFK39Gx30Qe5Nx', '2018-12-13 02:36:55', '2018-12-13 02:36:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
