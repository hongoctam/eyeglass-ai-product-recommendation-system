-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 12, 2024 lúc 06:39 PM
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
(50, 'Kính thời trang Elegance', 2, 2000, 'Kính thời trang Elegance mang đến phong cách thanh lịch và hiện đại, phù hợp cho những ai yêu thích sự mới mẻ. Với thiết kế mỏng nhẹ, gọng kính được làm từ chất liệu nhựa cao cấp, bền bỉ và dễ dàng phối hợp với các trang phục khác nhau. Lòng kính được làm từ chất liệu chống xước, giúp bảo vệ mắt khỏi những tác động bên ngoài. Dòng sản phẩm này thích hợp cho cả nam và nữ, là sự lựa chọn hoàn hảo cho những buổi tiệc tùng hoặc dạo phố.', 'images/ISZ4HSZNKpPQiuI9dXYgIXRDiKPji5OZgKLWF4XN.webp', '2024-12-12 09:54:15', '2024-12-12 09:54:15'),
(51, 'Kính râm Mirage', 3, 2200000, 'Kính râm Mirage mang đến sự kết hợp giữa phong cách thời thượng và khả năng bảo vệ mắt khỏi tia UV. Gọng kính kim loại cao cấp không gỉ, được thiết kế tinh tế, cùng với lớp phủ chống tia UV, giúp bạn bảo vệ đôi mắt khỏi tác hại của ánh sáng mặt trời. Lòng kính có màu sắc đa dạng, từ đen đến xám, phù hợp cho những ngày dạo chơi ngoài trời hoặc du lịch. Kính râm này là lựa chọn lý tưởng cho những ai yêu thích sự năng động và cá tính.', 'images/utaLo3LoyMfNmdkUTiufEjKKiGXd4WIuiyTadDxX.jpg', '2024-12-12 09:58:15', '2024-12-12 10:03:16'),
(52, 'Kính chống ánh sáng xanh VisionGuard', 4, 1800000, 'Kính chống ánh sáng xanh VisionGuard giúp bảo vệ mắt khỏi ánh sáng xanh có hại từ các thiết bị điện tử như điện thoại, máy tính, và TV. Thiết kế gọn nhẹ với gọng kính siêu bền từ chất liệu titan cao cấp, giúp mang lại sự thoải mái khi sử dụng trong thời gian dài. Lớp phủ chống phản quang và chống xước giúp tăng độ bền cho sản phẩm. Dòng kính này là lựa chọn tuyệt vời cho những ai thường xuyên làm việc với máy tính hoặc sử dụng điện thoại di động trong nhiều giờ.', 'images/FQB0HxwNnVYzTurzQfEwU1IavFfSlhzyLWvygkvm.jpg', '2024-12-12 09:59:29', '2024-12-12 09:59:29'),
(53, 'Kính cận thời trang Vision Style', 2, 1900000, 'Kính cận thời trang Vision Style không chỉ giúp bạn nhìn rõ hơn mà còn mang lại vẻ ngoài đầy phong cách. Gọng kính được làm từ chất liệu nhựa tổng hợp cao cấp, chắc chắn và bền bỉ. Lòng kính có thể được điều chỉnh theo độ cận của bạn, giúp bạn có một trải nghiệm nhìn thoải mái, dễ chịu. Với thiết kế hiện đại và thanh lịch, kính cận thời trang này rất phù hợp cho những người làm việc văn phòng hoặc học sinh, sinh viên.', 'images/bMbxPVPSEBnmjTUiBAjkUYAKHl7bkRkTuqnx579p.webp', '2024-12-12 10:00:28', '2024-12-12 10:00:28'),
(54, 'Kính bảo hộ lao động SafeGuard', 6, 1200000, 'Kính bảo hộ lao động SafeGuard được thiết kế đặc biệt để bảo vệ mắt trong các môi trường làm việc có nguy cơ cao. Gọng kính chắc chắn được làm từ nhựa ABS, chống va đập mạnh mẽ, trong khi lòng kính được làm từ vật liệu polycarbonate có độ bền cao và khả năng chống xước tối ưu. Kính này giúp bảo vệ mắt khỏi bụi bẩn, tia sáng mạnh, cũng như các vật thể bay vào mắt trong quá trình làm việc. Đây là sự lựa chọn lý tưởng cho các công nhân trong ngành xây dựng, cơ khí, hay những người làm việc trong môi trường công nghiệp.', 'images/uDMLFjeQkHEZl6FmrY6lhB05EfdGKio3hBLiDpt4.jpg', '2024-12-12 10:01:40', '2024-12-12 10:01:40'),
(55, 'Kính thời trang Hàn Quốc Luxury', 2, 2500000, 'Kính thời trang Hàn Quốc Luxury là sự kết hợp hoàn hảo giữa xu hướng hiện đại và chất lượng vượt trội. Với gọng kính được thiết kế tinh xảo và màu sắc đa dạng, kính này dễ dàng phù hợp với nhiều phong cách khác nhau. Lòng kính được chế tác từ chất liệu chống xước cao cấp, giúp bảo vệ mắt khỏi các tác nhân gây hại từ môi trường. Kính này rất thích hợp cho những người yêu thích vẻ đẹp sang trọng và tinh tế trong từng chi tiết', 'images/x8vWbjyS0bwlnhhbe776f0W4QSFnDDFi6Xk0vJRC.jpg', '2024-12-12 10:18:38', '2024-12-12 10:18:38'),
(56, 'Kính chống ánh sáng xanh KidSafe', 4, 1000000, 'Kính chống ánh sáng xanh KidSafe được thiết kế đặc biệt để bảo vệ đôi mắt nhạy cảm của trẻ em khỏi tác hại của ánh sáng xanh từ các thiết bị điện tử. Gọng kính mềm mại và nhẹ nhàng, mang lại sự thoải mái cho trẻ khi sử dụng trong thời gian dài. Lòng kính trong suốt, không gây mỏi mắt khi sử dụng máy tính hay điện thoại. Đây là lựa chọn tuyệt vời cho các bậc phụ huynh muốn bảo vệ sức khỏe đôi mắt của con em trong thế giới công nghệ.', 'images/303lVcDbmRN5chXs2Z2LdkK7w7ExBgBYp7N8a8bz.jpg', '2024-12-12 10:19:33', '2024-12-12 10:19:33'),
(57, 'Kính cận siêu mỏng UltraThin', 5, 2000000, 'Kính cận siêu mỏng UltraThin được thiết kế với gọng kính mảnh mai và nhẹ nhàng, giúp bạn cảm thấy thoải mái trong suốt cả ngày dài. Với công nghệ chế tác tiên tiến, các loại kính này có độ mỏng vượt trội mà vẫn đảm bảo khả năng bảo vệ mắt tối ưu. Lòng kính được làm từ vật liệu chuyên dụng, chống xước và dễ dàng vệ sinh. Đây là sự lựa chọn lý tưởng cho những ai không muốn mang cảm giác nặng nề của kính cận thông thường.', 'images/LKtbJtgctP0MyVoRYUjyTFWzoEg4CdO7UEyocWWu.webp', '2024-12-12 10:21:07', '2024-12-12 10:21:07'),
(58, 'Kính cận chống ánh sáng xanh ClearGuard', 4, 2200000, 'Kính cận chống ánh sáng xanh ClearGuard kết hợp tính năng điều chỉnh độ cận và bảo vệ mắt khỏi ánh sáng xanh có hại từ màn hình máy tính, điện thoại. Gọng kính được làm từ chất liệu titanium cao cấp, giúp giảm trọng lượng và mang lại sự thoải mái tối đa. Lòng kính có khả năng chống xước, chống phản quang và bảo vệ mắt tốt nhất khi sử dụng trong nhiều giờ liền. Đây là lựa chọn lý tưởng cho những ai làm việc văn phòng và thường xuyên tiếp xúc với các thiết bị điện tử.', 'images/G42nFdRDn5ZSX5nHzndD6mdZVHi7ortWxq8dhyGp.jpg', '2024-12-12 10:22:33', '2024-12-12 10:22:33'),
(59, 'Kính mắt thời trang nữ Diva', 2, 1800000, 'Kính mắt thời trang nữ Diva mang đến phong cách thanh lịch và nữ tính với thiết kế gọng kính mềm mại, uốn cong theo hình dáng khuôn mặt. Chất liệu gọng kính được làm từ nhựa cao cấp, nhẹ và bền bỉ, giúp tăng độ thoải mái khi sử dụng lâu dài. Với các màu sắc trang nhã như hồng pastel, vàng nhạt, và đen cổ điển, kính Diva dễ dàng kết hợp với nhiều bộ trang phục từ công sở đến dạo phố. Lòng kính trong suốt giúp tối ưu tầm nhìn và giảm mỏi mắt khi sử dụng trong thời gian dài. Đây là lựa chọn hoàn hảo cho những ai yêu thích sự tinh tế và nhẹ nhàng.', 'images/HHBj7r9HLyNQBBwt19DFa0BCGtROwwrobub7AG0w.webp', '2024-12-12 10:25:24', '2024-12-12 10:25:24'),
(60, 'Kính mắt thời trang nam Classic', 2, 2000000, 'Kính mắt thời trang nam Classic mang đến sự mạnh mẽ và lịch lãm cho phái mạnh. Thiết kế của kính đơn giản nhưng đầy tinh tế, với gọng kính bằng kim loại cao cấp không gỉ và lòng kính chống xước, giúp bảo vệ mắt tốt hơn trong mọi hoàn cảnh. Kính Classic có nhiều kiểu dáng như tròn, vuông và hình chữ nhật, phù hợp với nhiều khuôn mặt khác nhau, mang lại sự tự tin cho người sử dụng. Đây là một lựa chọn không thể thiếu cho những ai yêu thích phong cách thanh lịch, thời thượng nhưng vẫn đơn giản và dễ sử dụng.', 'images/PJBg0cmXSNmzukuimu46EMRuSj8P0Ay19DAqnDcj.png', '2024-12-12 10:26:12', '2024-12-12 10:26:41'),
(61, 'Kính Râm Thể Thao (Sports Sunglasses)', 3, 2400000, 'Kính râm thể thao SportShield được thiết kế đặc biệt cho những người yêu thích các hoạt động thể thao ngoài trời. Với gọng kính siêu nhẹ nhưng cực kỳ bền bỉ, được làm từ nhựa chất lượng cao, kính mang đến cảm giác thoải mái khi đeo lâu dài. Lòng kính được làm từ chất liệu chống tia UV 100%, giúp bảo vệ mắt khỏi ánh sáng mặt trời và các tia cực tím có hại. Kính SportShield còn có khả năng chống va đập, giúp bảo vệ mắt khỏi những tác động mạnh trong quá trình chơi thể thao. Bên cạnh đó, kính còn có tính năng chống mờ và giảm chói, rất phù hợp cho những hoạt động ngoài trời như chạy bộ, đạp xe, leo núi hay tham gia các môn thể thao mạnh.', 'images/oYoaI2GgxSU8jl7vDwxb8waeMbJgzr0c6efVLwQ9.webp', '2024-12-12 10:27:56', '2024-12-12 10:27:56'),
(62, 'Kính cận mắt kính đa tròng VisionFlex', 5, 1500000, 'Kính cận mắt kính đa tròng VisionFlex mang đến giải pháp hoàn hảo cho những người cần điều chỉnh thị lực ở nhiều khoảng cách khác nhau. Gọng kính được làm từ chất liệu nhựa siêu nhẹ, với thiết kế hiện đại và thanh lịch. Lòng kính được chế tác từ vật liệu cao cấp, dễ dàng thay đổi độ cận ở các khu vực khác nhau của kính, từ đó giúp bạn có thể nhìn rõ ở mọi khoảng cách mà không cần phải thay đổi kính. Đây là sản phẩm lý tưởng cho những người có độ cận thị khác nhau cho các khoảng cách gần, trung bình và xa.', 'images/rPRAJdu3dS0aTcE99C85dHXFGX5DwFAS6CJipES4.jpg', '2024-12-12 10:28:54', '2024-12-12 10:28:54'),
(63, 'Kính bảo hộ chống tia UV SafeGuard UV', 6, 1000000, 'Kính bảo hộ chống tia UV SafeGuard UV được thiết kế đặc biệt cho công nhân làm việc ngoài trời hoặc trong môi trường có ánh sáng mạnh. Gọng kính được làm từ chất liệu nhựa ABS chống va đập, có thể chịu được nhiệt độ cao và môi trường khắc nghiệt. Lòng kính có lớp bảo vệ tia UV 100%, giúp ngăn chặn tác hại của tia cực tím đối với mắt. Kính này là lựa chọn hoàn hảo cho những người làm việc trong các ngành như xây dựng, nông nghiệp hay công nghiệp.', 'images/5CEmdNwnPHFq6viLisDpkyH1TuLyMDS6x16rDhTS.bin', '2024-12-12 10:29:55', '2024-12-12 10:29:55'),
(64, 'Kính bảo hộ chống bụi SafeGuard Dust', 6, 1200000, 'Kính bảo hộ chống bụi SafeGuard Dust giúp bảo vệ mắt khỏi bụi bẩn và các vật thể nhỏ trong không khí. Gọng kính được làm từ chất liệu nhựa cao cấp, có khả năng chống va đập mạnh mẽ và bền bỉ. Lòng kính được chế tạo từ vật liệu polycarbonate, có độ bền cao và khả năng chống xước. Kính này rất phù hợp cho các công nhân làm việc trong môi trường có nhiều bụi như công trường xây dựng, nhà máy chế tạo hay khu vực khai thác mỏ.', 'images/Xdf2YyKVb5oth8Q5dECDTToYRcE7FBK2jys9HRaj.jpg', '2024-12-12 10:30:37', '2024-12-12 10:31:44');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_typeproduct_id_foreign` (`typeProduct_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_typeproduct_id_foreign` FOREIGN KEY (`typeProduct_id`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
