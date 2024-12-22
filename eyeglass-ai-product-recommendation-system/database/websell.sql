-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 11, 2024 lúc 08:10 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `websell`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auto_banks`
--

CREATE TABLE `auto_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transactionNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `auto_banks`
--

INSERT INTO `auto_banks` (`id`, `order_id`, `amount`, `created_at`, `updated_at`, `transactionNumber`) VALUES
(1, 1, 2000, '2024-12-11 12:08:33', '2024-12-11 12:08:33', '2539');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `shortName` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banks`
--

INSERT INTO `banks` (`id`, `name`, `shortName`, `number`, `password`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Ngân Hàng Á Châu', 'ACB', '22222', '222222', 'A97BD637-349A-6184-19DB-9DBAE27856A7', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_orders`
--

CREATE TABLE `detail_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `current_price` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_orders`
--

INSERT INTO `detail_orders` (`id`, `product_id`, `order_id`, `quantity`, `current_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2000, '2024-12-11 12:06:57', '2024-12-11 12:06:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2024_12_03_000000_create_failed_jobs_table', 1),
(5, '2024_12_04_101758_create_type_products_table', 1),
(6, '2024_12_04_101815_create_products_table', 1),
(7, '2024_12_05_060301_create_statuses_table', 1),
(8, '2024_12_05_061324_create_orders_table', 1),
(9, '2024_12_05_062045_create_auto_banks_table', 1),
(10, '2024_12_05_190929_create_banks_table', 1),
(11, '2024_12_06_045906_create_contacts_table', 1),
(12, '2024_12_06_104218_create_carts_table', 1),
(13, '2024_12_06_104358_create_detail_orders_table', 1),
(14, '2024_12_11_182748_create_messages_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `stt_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `stt_id`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 2000, '2024-12-11 12:06:57', '2024-12-11 12:08:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
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
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `typeProduct_id` bigint(20) UNSIGNED NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `description` longtext NOT NULL,
  `urlImage` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `typeProduct_id`, `price`, `description`, `urlImage`, `created_at`, `updated_at`) VALUES
(1, 'Kính thời trang nam chất liệu nhựa', 2, 2000, 'Kính thời trang nam chất liệu nhựa được thiết kế với phong cách hiện đại, phù hợp cho những người yêu thích sự trẻ trung và năng động. Chất liệu nhựa cao cấp mang lại trọng lượng nhẹ, tạo cảm giác thoải mái khi sử dụng trong thời gian dài. Với khả năng chống tia UV hiệu quả, kính không chỉ bảo vệ mắt trước ánh nắng mặt trời mà còn mang đến sự an toàn cho các hoạt động ngoài trời. Đa dạng màu sắc và kiểu dáng, sản phẩm dễ dàng kết hợp với nhiều phong cách trang phục, từ lịch lãm đến cá tính, tạo điểm nhấn cho diện mạo phái mạnh.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, '2024-12-11 12:01:40'),
(2, 'Kính thời trang nam chất liệu nhựa', 2, 120000, 'Kính thời trang nam chất liệu nhựa với thiết kế nhẹ nhàng, ôm sát khuôn mặt, chống tia UV, phù hợp với phong cách trẻ trung.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(3, 'Kính râm nữ gọng nhựa cao cấp', 3, 150000, 'Kính râm nữ gọng nhựa sang trọng, chống chói lóa hiệu quả, thích hợp cho các hoạt động ngoài trời.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(4, 'Kính cận thời trang cho nam', 4, 200000, 'Kính cận thời trang thiết kế hiện đại, gọng nhẹ, phù hợp cho nam giới yêu thích phong cách thanh lịch.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(5, 'Kính chống ánh sáng xanh gọng kim loại', 5, 250000, 'Kính chống ánh sáng xanh bảo vệ mắt, giảm mỏi khi dùng máy tính, thiết kế gọng kim loại sang trọng.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(6, 'Kính bảo hộ lao động chống bụi', 6, 80000, 'Kính bảo hộ lao động chất lượng cao, chống bụi, chống va đập, phù hợp cho các môi trường làm việc khắc nghiệt.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(7, 'Kính thời trang nữ kiểu dáng mắt mèo', 2, 180000, 'Kính thời trang nữ kiểu dáng mắt mèo, phù hợp với nhiều khuôn mặt, mang lại phong cách cá tính.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(8, 'Kính râm thể thao chống tia UV', 3, 170000, 'Kính râm thể thao gọng ôm sát, chống tia UV và chống chói, lý tưởng cho các hoạt động ngoài trời.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(9, 'Kính cận tròn phong cách cổ điển', 4, 220000, 'Kính cận thiết kế tròn cổ điển, phù hợp cho người yêu thích phong cách đơn giản nhưng tinh tế.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(10, 'Kính chống ánh sáng xanh trẻ em', 5, 130000, 'Kính chống ánh sáng xanh bảo vệ mắt trẻ em khi sử dụng máy tính hoặc điện thoại.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(11, 'Kính bảo hộ trong suốt gọng nhựa', 6, 60000, 'Kính bảo hộ trong suốt, gọng nhựa bền, phù hợp cho cả công việc và sử dụng hàng ngày.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(12, 'Kính thời trang nam gọng vuông', 2, 190000, 'Kính thời trang nam gọng vuông, phong cách hiện đại, phù hợp với khuôn mặt góc cạnh.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(13, 'Kính râm nữ mắt tròn', 3, 200000, 'Kính râm nữ mắt tròn gọng nhựa, chống chói và chống tia UV, phù hợp cho phong cách nữ tính.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(14, 'Kính cận nhẹ nhàng cho nữ', 4, 210000, 'Kính cận thiết kế thanh lịch, trọng lượng nhẹ, gọng nhựa bền bỉ, phù hợp cho nữ.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(15, 'Kính chống ánh sáng xanh gaming', 5, 280000, 'Kính chống ánh sáng xanh chuyên dụng cho game thủ, giảm mỏi mắt hiệu quả.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(16, 'Kính bảo hộ chống hóa chất', 6, 90000, 'Kính bảo hộ chống hóa chất, chịu được môi trường hóa học, bảo vệ mắt an toàn.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(17, 'Kính thời trang nam màu đen cổ điển', 2, 140000, 'Kính thời trang nam màu đen cổ điển, phù hợp với phong cách thanh lịch và chuyên nghiệp.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(18, 'Kính râm unisex gọng nhôm', 3, 230000, 'Kính râm unisex gọng nhôm, chống tia UV cao, phù hợp cho cả nam và nữ.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(19, 'Kính cận học sinh kiểu dáng nhỏ gọn', 4, 160000, 'Kính cận cho học sinh, kiểu dáng nhỏ gọn, thoải mái khi đeo lâu.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(20, 'Kính chống ánh sáng xanh cho dân văn phòng', 5, 300000, 'Kính chống ánh sáng xanh, thiết kế hiện đại, giúp bảo vệ mắt khi làm việc với máy tính lâu.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(21, 'Kính bảo hộ kiểu dáng thể thao', 6, 95000, 'Kính bảo hộ thiết kế thể thao, nhẹ nhàng và bảo vệ mắt hiệu quả.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(22, 'Kính thời trang gọng mảnh', 2, 150000, 'Kính thời trang gọng mảnh, nhẹ nhàng, phong cách tinh tế, phù hợp cho cả nam và nữ.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(23, 'Kính râm phân cực chống chói', 3, 250000, 'Kính râm phân cực, giảm chói từ ánh sáng mạnh, bảo vệ mắt và tăng tầm nhìn rõ ràng.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(24, 'Kính cận đổi màu', 4, 270000, 'Kính cận đổi màu tự động khi ra nắng, tiện lợi và bảo vệ mắt toàn diện.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(25, 'Kính chống ánh sáng xanh giá rẻ', 5, 110000, 'Kính chống ánh sáng xanh giá rẻ, phù hợp cho người dùng cơ bản.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(26, 'Kính bảo hộ chống lóa', 6, 70000, 'Kính bảo hộ chống lóa, thiết kế đơn giản, phù hợp cho công việc ngoài trời.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(27, 'Kính thời trang nữ gọng tròn', 2, 170000, 'Kính thời trang nữ gọng tròn, phong cách dễ thương và phù hợp nhiều khuôn mặt.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(28, 'Kính râm thời trang phi công', 3, 260000, 'Kính râm phi công, kiểu dáng thời thượng, phù hợp cho cả nam và nữ.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(29, 'Kính cận học sinh gọng nhựa', 4, 190000, 'Kính cận dành cho học sinh, thiết kế trẻ trung, gọng nhựa bền chắc.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(30, 'Kính chống ánh sáng xanh phong cách Hàn Quốc', 5, 320000, 'Kính chống ánh sáng xanh thiết kế Hàn Quốc, phù hợp cho người trẻ hiện đại.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL),
(31, 'Kính bảo hộ chống mảnh vỡ', 6, 100000, 'Kính bảo hộ chống mảnh vỡ, đảm bảo an toàn cho các công việc nguy hiểm.', 'images/xm2SGwhPATPZV3NiipFJxrinZBfm2DTwi28gSvu8.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Đang chờ thành toán', 'warning', NULL, NULL),
(2, 'Đã thanh toán', 'success', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Kính thời trang', NULL, NULL),
(3, 'Kính râm', NULL, NULL),
(4, 'Kính chống ánh sáng xanh', NULL, NULL),
(5, 'Kính cận thời trang', NULL, NULL),
(6, 'Kính bảo hộ lao động', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `birthDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phoneNumber` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `streetName` varchar(255) NOT NULL,
  `streetNumber` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `urlAvata` varchar(255) NOT NULL,
  `status` bigint(20) UNSIGNED NOT NULL,
  `role` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `birthDate`, `phoneNumber`, `email`, `password`, `streetName`, `streetNumber`, `district`, `city`, `urlAvata`, `status`, `role`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2024-12-11 18:52:59', 'admin', 'duchai2712@gmail.com', '$2y$10$/GvDTCxCiy96Z5.QI.DApucx5q67L/CkzOtmJfzGkoMQ4Dzl.d.GO', '1', '1', '1', 'Da Nang', 'images/SFqSNR7izTh21TqhCHWIAGGAKEdETpRPM9CbQJzS.png', 1, 1, '2024-12-11 11:52:18', '2024-12-11 11:52:18');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auto_banks`
--
ALTER TABLE `auto_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auto_banks_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_orders_product_id_foreign` (`product_id`),
  ADD KEY `detail_orders_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_stt_id_foreign` (`stt_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_typeproduct_id_foreign` (`typeProduct_id`);

--
-- Chỉ mục cho bảng `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phonenumber_unique` (`phoneNumber`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auto_banks`
--
ALTER TABLE `auto_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `detail_orders`
--
ALTER TABLE `detail_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auto_banks`
--
ALTER TABLE `auto_banks`
  ADD CONSTRAINT `auto_banks_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `detail_orders`
--
ALTER TABLE `detail_orders`
  ADD CONSTRAINT `detail_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `detail_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_stt_id_foreign` FOREIGN KEY (`stt_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_typeproduct_id_foreign` FOREIGN KEY (`typeProduct_id`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
