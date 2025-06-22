-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql-staging:3306
-- Tiempo de generación: 22-06-2025 a las 19:51:22
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `remapac`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventories`
--

CREATE TABLE `inventories` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventories`
--

INSERT INTO `inventories` (`id`, `product_id`, `status`, `serial_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'blocked', 'Smn140686', '2025-06-19 21:22:48', '2025-06-20 17:15:51'),
(2, 1, 'available', 'Smn140685', '2025-06-20 17:30:35', '2025-06-20 17:30:35'),
(3, 1, 'available', 'Smn140684', '2025-06-20 17:30:41', '2025-06-20 17:30:41'),
(4, 1, 'available', 'Smn140683', '2025-06-20 17:30:45', '2025-06-20 17:30:45'),
(5, 1, 'available', 'Smn140682', '2025-06-20 17:30:49', '2025-06-20 17:30:49'),
(6, 1, 'available', 'Smn140681', '2025-06-20 17:30:55', '2025-06-20 17:30:55'),
(7, 1, 'available', '1a', '2025-06-20 18:38:28', '2025-06-20 18:38:28'),
(8, 2, 'available', 'b1', '2025-06-20 18:43:14', '2025-06-20 18:43:14'),
(9, 2, 'available', 'b2', '2025-06-20 18:43:21', '2025-06-20 18:43:21'),
(10, 2, 'available', 'b3', '2025-06-20 18:43:27', '2025-06-20 18:43:27'),
(11, 2, 'available', 'b4', '2025-06-20 18:43:33', '2025-06-20 18:43:33'),
(12, 2, 'available', 'b5', '2025-06-20 18:43:40', '2025-06-20 18:43:40'),
(13, 3, 'available', 'c1', '2025-06-20 18:43:47', '2025-06-20 18:43:47'),
(14, 3, 'available', 'c2', '2025-06-20 18:43:52', '2025-06-20 18:43:52'),
(15, 3, 'available', 'c3', '2025-06-20 18:43:57', '2025-06-20 18:43:57'),
(16, 3, 'available', 'c4', '2025-06-20 18:44:06', '2025-06-20 18:44:06'),
(17, 3, 'available', 'c5', '2025-06-20 18:44:18', '2025-06-20 18:44:18'),
(18, 4, 'available', 'd1', '2025-06-20 18:44:32', '2025-06-20 18:44:32'),
(19, 4, 'available', 'd2', '2025-06-20 18:44:40', '2025-06-20 18:44:40'),
(20, 4, 'available', 'd3', '2025-06-20 18:44:47', '2025-06-20 18:44:47'),
(21, 4, 'available', 'd4', '2025-06-20 18:44:55', '2025-06-20 18:44:55'),
(22, 4, 'available', 'd5', '2025-06-20 18:45:10', '2025-06-20 18:45:10'),
(23, 5, 'available', 'e1', '2025-06-20 18:45:18', '2025-06-20 18:45:18'),
(24, 5, 'available', 'e2', '2025-06-20 18:45:27', '2025-06-20 18:45:27'),
(25, 5, 'available', 'e3', '2025-06-20 18:45:33', '2025-06-20 18:45:33'),
(26, 5, 'available', 'e4', '2025-06-20 18:45:47', '2025-06-20 18:45:47'),
(27, 5, 'available', 'e5', '2025-06-20 18:45:57', '2025-06-20 18:45:57'),
(28, 6, 'available', 'f1', '2025-06-20 18:46:17', '2025-06-20 18:46:17'),
(29, 6, 'available', 'f2', '2025-06-20 18:46:25', '2025-06-20 18:46:25'),
(30, 6, 'available', 'f3', '2025-06-20 18:46:36', '2025-06-20 18:46:36'),
(31, 6, 'available', 'f4', '2025-06-20 18:46:43', '2025-06-20 18:46:43'),
(32, 6, 'available', 'f5', '2025-06-20 18:46:50', '2025-06-20 18:46:50'),
(33, 7, 'available', 'g1', '2025-06-20 18:47:13', '2025-06-20 18:47:13'),
(34, 7, 'available', 'g2', '2025-06-20 18:47:22', '2025-06-20 18:47:22'),
(35, 7, 'available', 'g3', '2025-06-20 18:47:29', '2025-06-20 18:47:29'),
(36, 7, 'available', 'g4', '2025-06-20 18:47:37', '2025-06-20 18:47:37'),
(37, 7, 'available', 'g5', '2025-06-20 18:47:48', '2025-06-20 18:47:48'),
(38, 8, 'available', 'h1', '2025-06-20 18:47:59', '2025-06-20 18:47:59'),
(39, 8, 'available', 'h2', '2025-06-20 18:48:07', '2025-06-20 18:48:07'),
(40, 8, 'available', 'h3', '2025-06-20 18:48:15', '2025-06-20 18:48:15'),
(41, 8, 'available', 'h4', '2025-06-20 18:48:37', '2025-06-20 18:48:37'),
(42, 8, 'available', 'h5', '2025-06-20 18:48:51', '2025-06-20 18:48:51'),
(43, 9, 'available', 'm1', '2025-06-20 18:49:02', '2025-06-20 18:49:02'),
(44, 9, 'available', 'm2', '2025-06-20 18:49:13', '2025-06-20 18:49:13'),
(45, 9, 'available', 'm3', '2025-06-20 18:49:27', '2025-06-20 18:49:27'),
(46, 9, 'available', 'm4', '2025-06-20 18:49:37', '2025-06-20 18:49:37'),
(47, 9, 'available', 'm5', '2025-06-20 18:49:52', '2025-06-20 18:49:52'),
(48, 10, 'available', 'l1', '2025-06-20 18:50:01', '2025-06-20 18:50:01'),
(49, 10, 'available', 'l2', '2025-06-20 18:50:11', '2025-06-20 18:50:11'),
(50, 10, 'available', 'l3}', '2025-06-20 18:50:24', '2025-06-20 18:50:24'),
(51, 10, 'available', 'l5', '2025-06-20 18:50:36', '2025-06-20 18:50:36'),
(52, 10, 'available', 'l4', '2025-06-20 18:50:47', '2025-06-20 18:50:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_19_061820_add_users_table_info', 1),
(5, '2025_06_19_071917_create_personal_access_tokens_table', 2),
(6, '2025_06_19_131405_create_projects_table', 2),
(7, '2025_06_19_192931_create_products_table', 3),
(8, '2025_06_19_203810_create_inventories_table', 3),
(9, '2025_06_20_012514_create_services_table', 4),
(10, '2025_06_20_012604_create_service_details_table', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'api-token', '35c30b017b9a26bf00d6f07ba1a0d0293517f4f94c41c78e051c13f8fe6a6666', '[\"*\"]', NULL, NULL, '2025-06-20 02:34:27', '2025-06-20 02:34:27'),
(2, 'App\\Models\\User', 3, 'api-token', '1c843e93b1356c1f551fc362e0c3d247fab7c4bde198f3d1182be1dd832b6e58', '[\"*\"]', NULL, NULL, '2025-06-20 02:47:56', '2025-06-20 02:47:56'),
(3, 'App\\Models\\User', 3, 'api-token', '8ba46f2e2379cfecbf09bae713cbf6924da95da9cb9ab2e5b50b09ba1067e617', '[\"*\"]', NULL, NULL, '2025-06-20 02:49:52', '2025-06-20 02:49:52'),
(4, 'App\\Models\\User', 3, 'api-token', 'cd6b76e14ff75e475d800534c42107bab8e9e952251a0b7724c08b9714d6ad80', '[\"*\"]', NULL, NULL, '2025-06-20 02:51:39', '2025-06-20 02:51:39'),
(5, 'App\\Models\\User', 3, 'api-token', 'b06c9724000e53358bf798ba12cc3f2ba3915c3468938d7dfb0b3fede6eb6fb5', '[\"*\"]', NULL, NULL, '2025-06-20 02:52:29', '2025-06-20 02:52:29'),
(6, 'App\\Models\\User', 3, 'api-token', '3a8aef56f16ff2d7d98ce247560c4804eb414212c4cbae3e7f03bc0624320a06', '[\"*\"]', NULL, NULL, '2025-06-20 06:08:52', '2025-06-20 06:08:52'),
(7, 'App\\Models\\User', 3, 'api-token', 'ac3097f8dfabcae38fb30876b3cac1161f7fb2c81fe94de4639fd367641b575b', '[\"*\"]', '2025-06-20 06:44:29', NULL, '2025-06-20 06:18:20', '2025-06-20 06:44:29'),
(8, 'App\\Models\\User', 3, 'api-token', 'd4a17a1739b5c84ac5846a27103d53fd68a36aec67c4a3db46b80f7eec34ed49', '[\"*\"]', '2025-06-20 07:34:20', NULL, '2025-06-20 06:24:10', '2025-06-20 07:34:20'),
(9, 'App\\Models\\User', 3, 'api-token', '01de0d81912ebbf1a9f32b337aee8f6b6b5724fbc8507ffd316204003f86159c', '[\"*\"]', '2025-06-20 07:34:45', NULL, '2025-06-20 07:34:39', '2025-06-20 07:34:45'),
(10, 'App\\Models\\User', 3, 'api-token', '5a6c9a8a73a1207a7edb7d07faabfc4fa5d1aa8cec48144dea660b69603ca870', '[\"*\"]', NULL, NULL, '2025-06-20 13:10:53', '2025-06-20 13:10:53'),
(11, 'App\\Models\\User', 3, 'api-token', 'f5173d4786652cb0a031999fb848eb0e1dbe6ff49135f515d77aedfc82409c61', '[\"*\"]', '2025-06-20 18:35:42', NULL, '2025-06-20 14:41:56', '2025-06-20 18:35:42'),
(12, 'App\\Models\\User', 3, 'api-token', '6b75698d0368ffdfbf8ddaff174a7c4a5ed66b720ea5b5c08978072415c1afa9', '[\"*\"]', '2025-06-20 17:31:09', NULL, '2025-06-20 17:15:28', '2025-06-20 17:31:09'),
(13, 'App\\Models\\User', 3, 'api-token', '629feaa1c6df9cc7ec6e4971acd1a750e4444d782a985e2c25cb290552924819', '[\"*\"]', '2025-06-21 20:08:04', NULL, '2025-06-21 20:07:56', '2025-06-21 20:08:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `brand`, `description`, `image`, `width`, `serial_number`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Sultanes', 'Perro', 'images/products/1750368133_IMG_8669.jpeg', '95', NULL, '1450', '2025-06-19 21:22:13', '2025-06-19 21:22:13'),
(2, 'WACKER NEUSON', 'PIZON VIBRADOR RAMMER BS50-4AS', 'images/products/1750431509_Vibroapisonador_BS50_4As_Wacker_Neuson.jpg', NULL, NULL, '280', '2025-06-20 14:58:29', '2025-06-20 14:58:29'),
(3, 'HONDA', 'VIBRADOR MOTRIZ 5.5', 'images/products/1750431563_Unidad-Motriz-5.5-Hp.jpg', NULL, NULL, '400', '2025-06-20 14:59:23', '2025-06-20 14:59:23'),
(4, 'WACKER NEUSON', 'RODILLO TAMBOR DOBLE 1000KG RD12', 'images/products/1750431633_images.jpeg', '1000', NULL, '820', '2025-06-20 15:00:33', '2025-06-20 15:00:33'),
(5, 'MIKASA', 'MTX70HD', 'images/products/1750431738_MTX70S_rdax_205x300.jpg', NULL, NULL, '280', '2025-06-20 15:02:18', '2025-06-20 15:02:18'),
(6, 'HONDA', 'MOTOBOMBA 3\"', 'images/products/1750431825_WB30__1.jpg', NULL, NULL, '300', '2025-06-20 15:03:45', '2025-06-20 15:03:45'),
(7, 'Husqvarna', 'CORTADORA DE CONCRETO FS 400', 'images/products/1750431970_cortadora-husqvarna-fs400lv-h13cf.webp', NULL, NULL, '440', '2025-06-20 15:06:10', '2025-06-20 15:06:10'),
(8, 'MAKITA', 'MARTILLO DEMOLEDOR HM1812', 'images/products/1750432726_7e1d843c-3c01-4783-b4a4-a9ad6674a83a_hm1812_p_1500px.png', NULL, NULL, '295', '2025-06-20 15:18:46', '2025-06-20 15:18:46'),
(9, 'BOMAG', 'BAILARINA COMPACTADORA BT60', 'images/products/1750432852_motor-gasolina-de-4-tiempos-bt-60-g-bomag(4).webp', NULL, NULL, '280', '2025-06-20 15:20:52', '2025-06-20 15:20:52'),
(10, 'CATERPILLAR', 'GENERADOR CATERPILLAR 65 KVA', 'images/products/1750433196_industrial-equipment-diesel-generator-Caterpillar-CAT-DE65E0-65-kVA-Generator-DPX-18010---1726220243496132913_big--24091312371606031100.jpg', NULL, NULL, '1200', '2025-06-20 15:26:36', '2025-06-20 15:26:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `id` int UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'pending', '2025-06-20 17:15:51', '2025-06-20 17:15:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service_details`
--

CREATE TABLE `service_details` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `inventory_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `service_details`
--

INSERT INTO `service_details` (`id`, `service_id`, `product_id`, `inventory_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '2025-06-20 17:15:51', '2025-06-20 17:15:51', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0DoxdApPRDw6uBHeoeDDpjVH1KXWP488hpQnwqYi', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSFBpd3BPODhNUmxocVo2dDNrSTJ0RjdVQWU3RHNkVEQ2dHNTOU9BdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1750551902),
('0VAQCaN7tZ92W8XzFRkxR4N4NbgMO9yCDNNC0Lyz', 1, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWlBZaEtxeWZaNDYwWnV1aXg2T2pFVFVra3psdzBQWWNGUW11ZVJocSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MDoiaHR0cDovL3JlbWFwYWMuYWdzb2Z0d2ViLmNvbS5teC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750461199),
('1JarbZnmCJNfSGrmts7EOUmXci5107zdiIBhQabO', NULL, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0JocWJ6RHhydFFlQUZNamROZ0VTRHkyNE4wc2NTV29BYUpvbGtJbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750446334),
('2Z1ss4sPGN4vvVqw3hlfNed2XXNGRTVYREvjCIq1', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1F6RFlrS2tOZGQ1aEs2aDRJVUZBNVNRT3hpMmdZS3hVVU9hTk5BYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750605150),
('8ZGXFHhpDw1ZfR9WcVeWI7LKxgXihTxAnrJljANG', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3JrM3VxWGFhb0p1eXdhTW4xblVHQmNveERVR01UYThjVmEzaWYwTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750533763),
('AkSHDHETsjPHn18l7As0rDvd8vpd1jzdypvL7Bw3', NULL, '172.18.0.1', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW8yMzA0TWpFaXpIT0VKcnBkNzF6cmdoMjhpSklENUdHUzNWSFo4OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750440481),
('dZF4ieJxHqt7DMhTv0geXgtNg4tGfA2bPj6UfGwS', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjM3eTlrUXJkazdOaVg2YWJxVkJDc1NDMVlVWWdnaGpJUldwTDBaWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgvcmVnaXN0ZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750604327),
('f4Ay4Tr0QzsBu9300QDLvaKm5Wo1fWHI7qXNG1xQ', 1, '172.18.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/137.0.7151.107 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiekFDeXA0VFE2UFg1VmtxRnU5eVZZa1RpbmdNM1NQdFNMM1ZlUWFGTiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MDoiaHR0cDovL3JlbWFwYWMuYWdzb2Z0d2ViLmNvbS5teC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750536896),
('FYzIJkMzKBKXM20H1lJR55x7Ye4nsA8wfoqhvVqz', 1, '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibjlUNmdjaUJwYW13TW0wOEcyUlRnanVNdGN2QXlld0JRd092b2ZMMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgvcHJvZHVjdHMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1750440655),
('I0BWv5XT9bLdmdSIkgQ6AQrPJCYoER2I8Zepwv6V', 1, '172.18.0.1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidTZRSHdMVnFWdXBibnlnYWVDaVgxbElkOXhDcWpEWnZZRUNFalJucyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1750444764),
('i5qPvawhNHAlKi8ywnZy9EDvM4mcQlXkmZI3FOpX', NULL, '172.18.0.1', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTRDcjR4Sk11TnBjQmF6cVMzOWVLd0c0OGI0QXdxNXY3eGhjZkg0UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750455677),
('Idn9RBCE1iQbEFToWwEuHjcyCU2ViMNccGSpe4u4', 1, '172.18.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/137.0.7151.107 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR2EyMVNsZmdlSDFlc3dUaDU4ZVQ5M2pzSkc5d2RrS3B6U0Z2cnZCVCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MDoiaHR0cDovL3JlbWFwYWMuYWdzb2Z0d2ViLmNvbS5teC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750444731),
('KSxUrm5VYjJsy4vtjUuo8VTapKILBLJtJDcqv0mw', 1, '172.18.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/137.0.7151.107 Mobile/15E148 Safari/604.1', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZDVCeDJWMzVjWjJoQVQybXM4eHlkWmI0S1cwUUljWWNFbW5MbVozRCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MDoiaHR0cDovL3JlbWFwYWMuYWdzb2Z0d2ViLmNvbS5teC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1750559171),
('NssXaBO3gfdp5PSBM59cY8dPpXZ307awmndKss3c', NULL, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFpSbXlzRXBzN3RDTk5UZnZUZmp3ZGxHMlNGbnFZSDRnUERQTDh0RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750447474),
('ODKBpl8HYgasPXEQqfhb7dzLDMw8lGa8LQkqmyCH', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWtLMG1ha1NDc2ZwdjJ3bHVKdnJoNFJVQkZJR3A5MktvSGEzVUFNcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750534333),
('oomJvm1swSPxqKh5wH4DUterOMmW46ftxpDYbZJe', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2tjYkRhR2dzc0hqMEhkejZHalAxbTdJaTl0N3UzZmNXVDB1MzFjMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750440502),
('opRUGraN1ahVm4dqQ9zOrIsPeM2mOlj1LNo3OsrB', NULL, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV09hSTdkcWQ5OFlrSXhneXdNUVpwRGtkaDdvaktkMGdlQ0pnNHJWYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750605724),
('R66shrvFbdqs6Etsvg5Y04ZpKcRhC1dBvn52O9yL', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3NzVTBOSDlQY3lWakdiUlZGM0huNzVDWmhwQmx3ZkxaVUtNSmxqNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750603881),
('seDqqUrM4ob2Zwgb4j0KyNEkd33FOOzMEwZwFCna', NULL, '172.18.0.1', 'Mozilla/5.0 (Linux; U; Android 4.0.3; en-us; KFTT Build/IML74K) AppleWebKit/535.19 (KHTML, like Gecko) Silk/2.1 Mobile Safari/535.19 Silk-Accelerated=true', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3htaFQwZFloeHFSS0RxVUhvR0V6VERuell0TkVhbjUyaUtOS21XeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750492527),
('t5eTAYf9TJ3dZApG3Phn2wCwhToqXa1saCgncewa', NULL, '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG0zM1RYaFRHUjd0OGNwU04xeVNXTndVR05zUWY3OFl5SGw4d0dWTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750536848),
('UFddrfmc4bwudtgZmCSHTxoNFCx5KfkSYq7fTr9Y', NULL, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHRYUjFaY2NMZ2ZXOWNlQUNkVm5teEthcml6VkZPcnYxME1kSU9RaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgvaW5kZXgucGhwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1750605726),
('Vmowss4RbdzPRfHNF842NNd9w1baqN0hU0tWnlIz', 1, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSE0xak5UTklDNlBlNXpnZWZjVHZyVXFzY0I5SUR3T2NyMDFPT2pUWCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MToiaHR0cDovL3JlbWFwYWMuYWdzb2Z0d2ViLmNvbS5teC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750445454),
('wxgvCbVfBpKsXjx5tRpyPE8YEXwm56pNj7apc3EE', NULL, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemNZaU5SRXROcjRjRHpiM3VkbGlYSTVMbWx5MWhVUmNQWFg4SEhVYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750605725),
('XeSgVBH2QL73hHfqQY9nPg59mc1fUNk2yuKBq3Rz', NULL, '172.18.0.1', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjBIMTFtaUVxRWVyVUF6ZElTbGM4TjM5emFpeTB6QjFLN3hiMGJ0NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9yZW1hcGFjLmFnc29mdHdlYi5jb20ubXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1750442371);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `is_client` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `is_client`) VALUES
(1, 'Admin Demo', 'admin@demo.com', NULL, '$2y$12$ebiAuvEFgUXF/mAhcDp3vOF5zFnRpca6YW2Tv3zhISVYQQNBN.q9u', '9QYEP8zHpnIsZgEltS6gVZG0blbxlRIDPLbirvGfEwmMKA4rw6hvoMdpFWmr', '2025-06-19 07:11:19', '2025-06-19 07:11:19', 'admin', 0),
(2, 'Rentero 1', 'rentero1@rentero1.com', NULL, '$2y$12$etmNL5K5n.jGtvFwnX7J.OjnNoQmsz.Oh8DwHxdSpxiMg8rfhrbny', NULL, '2025-06-19 19:28:59', '2025-06-19 19:28:59', 'client', 0),
(3, 'Rentero 2', 'cliente1@cliente.com', NULL, '$2y$12$jUthGNMqFs9LM5wtsRPmqewCRnyQW7yJteWZdTvWuDgJ5T/5VUkPq', NULL, '2025-06-20 02:08:10', '2025-06-20 02:08:10', 'client', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_product_id_foreign` (`product_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_client_id_foreign` (`client_id`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `service_details`
--
ALTER TABLE `service_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_details_service_id_foreign` (`service_id`),
  ADD KEY `service_details_product_id_foreign` (`product_id`),
  ADD KEY `service_details_inventory_id_foreign` (`inventory_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `service_details`
--
ALTER TABLE `service_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `service_details`
--
ALTER TABLE `service_details`
  ADD CONSTRAINT `service_details_inventory_id_foreign` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `service_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `service_details_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
