-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jan 2024 pada 14.43
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_standz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `landfacilities`
--

CREATE TABLE `landfacilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `land_id` bigint(20) UNSIGNED NOT NULL,
  `facility_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `landowners`
--

CREATE TABLE `landowners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `owner_adress` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `landowners`
--

INSERT INTO `landowners` (`id`, `user_id`, `phone_number`, `owner_adress`, `created_at`, `updated_at`) VALUES
(1, 4, '085845820300', 'Tidar baru', '2024-01-10 10:59:39', '2024-01-10 10:59:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lands`
--

CREATE TABLE `lands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `land_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kelurahan` varchar(50) NOT NULL,
  `surface_area` varchar(50) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `rental_price` varchar(255) NOT NULL,
  `landowner_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lands`
--

INSERT INTO `lands` (`id`, `land_name`, `location`, `provinsi`, `kota`, `kecamatan`, `kelurahan`, `surface_area`, `deskripsi`, `rental_price`, `landowner_id`, `created_at`, `updated_at`) VALUES
(1, 'Tanah kotak daerah tidar baru jalur 3', '-2.587824892719323, 140.62850294924579', 'KALIMANTAN TENGAH', 'KOTAWARINGIN TIMUR', 'BAAMANG', 'BAAMANG BARAT', '12 123', 'Tanah kotak untuk bisnis umkm', '1.000.000 / bulan', 1, '2024-01-10 11:45:22', '2024-01-10 11:45:22'),
(2, 'Tanah Luas untuk jualan daerah gajayana', '-2.587824892719323, 140.62850294924579', 'JAWA TIMUR', 'MALANG', 'LOWOKWARU', 'DINOYO', '12 123', 'Tanah kotak untuk bisnis umkm', '1.000.000 / bulan', 1, '2024-01-11 11:24:38', '2024-01-11 11:24:38'),
(3, 'Tanah luas daerah cengkareng', '-2.587824892719323, 140.62850294924579', 'DKI JAKARTA', 'JAKARTA BARAT', 'CENGKARENG', 'CENGKARENG BARAT', '12 123', 'Tanah UMKM terpercaya', '1.000.000 / bulan', 1, '2024-01-11 23:21:02', '2024-01-11 23:21:02'),
(4, 'Tanah kecil Daerah Ciganjur Untuk jualan umkm', '-2.587824892719323, 140.62850294924579', 'DKI JAKARTA', 'JAKARTA SELATAN', 'JAGARAKSA', 'CIGANJUR', '12 123', 'Tanah UMKM terpercaya', '1.000.000 / bulan', 1, '2024-01-11 23:25:15', '2024-01-11 23:25:15'),
(5, 'Tanah kecil Daerah Cipedak Untuk jualan umkm', '-2.587824892719323, 140.62850294924579', 'DKI JAKARTA', 'JAKARTA SELATAN', 'JAGARAKSA', 'CIPEDAK', '12 123', 'Tanah UMKM terpercaya', '1.000.000 / bulan', 1, '2024-01-11 23:26:43', '2024-01-11 23:26:43'),
(6, 'Tanah sepetak daerah dinoyo', '-2.587824892719323, 140.62850294924579', 'JAWA TIMUR', 'MALANG', 'LOWOKWARU', 'DINOYO', '12 123', 'Tanah UMKM terpercaya', '1.000.000 / bulan', 1, '2024-01-11 23:29:18', '2024-01-11 23:29:18'),
(7, 'Tanah untuk jualan dinoyo', '-2.587824892719323, 140.62850294924579', 'JAWA TIMUR', 'MALANG', 'LOWOKWARU', 'DINOYO', '12 123', 'Tanah UMKM terpercaya', '1.000.000 / bulan', 1, '2024-01-11 23:29:45', '2024-01-11 23:29:45'),
(8, 'Tanah untuk jualan', '-2.587824892719323, 140.62850294924579', 'JAWA TIMUR', 'MALANG', 'LOWOKWARU', 'DINOYO', '12 123', 'Tanah UMKM terpercaya', '1.000.000 / bulan', 1, '2024-01-11 23:29:51', '2024-01-11 23:29:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `land_photos`
--

CREATE TABLE `land_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `land_id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `land_photos`
--

INSERT INTO `land_photos` (`id`, `land_id`, `file_name`, `created_at`, `updated_at`) VALUES
(44, 3, 'http://127.0.0.1:8000/uploads/land_image/3/Tanah_luas_daerah_cengkareng_120124_1.jpg', '2024-01-11 23:21:24', '2024-01-11 23:21:24'),
(45, 2, 'http://127.0.0.1:8000/uploads/land_image/2/Gajayana_120124_1.jpg', '2024-01-11 23:22:25', '2024-01-11 23:22:25'),
(46, 1, 'http://127.0.0.1:8000/uploads/land_image/1/Tanah_kotak_daerah_tidar_baru_jalur_3_120124_1.jpg', '2024-01-11 23:22:50', '2024-01-11 23:22:50'),
(47, 4, 'http://127.0.0.1:8000/uploads/land_image/4/Tanah_kecil_Daerah_Ciganjur_Untuk_jualan_umkm_120124_1.jpg', '2024-01-11 23:25:36', '2024-01-11 23:25:36'),
(48, 5, 'http://127.0.0.1:8000/uploads/land_image/5/Tanah_kecil_Daerah_Cipedak_Untuk_jualan_umkm_120124_1.jpg', '2024-01-11 23:27:00', '2024-01-11 23:27:00'),
(49, 6, 'http://127.0.0.1:8000/uploads/land_image/6/Tanah_sepetak_daerah_dinoyo_120124_1.jpg', '2024-01-11 23:30:07', '2024-01-11 23:30:07'),
(50, 7, 'http://127.0.0.1:8000/uploads/land_image/7/Tanah_untuk_jualan_dinoyo_120124_1.jpg', '2024-01-11 23:30:13', '2024-01-11 23:30:13'),
(51, 8, 'http://127.0.0.1:8000/uploads/land_image/8/Tanah_untuk_jualan_120124_1.jpg', '2024-01-11 23:30:25', '2024-01-11 23:30:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `land_reviews`
--

CREATE TABLE `land_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `land_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` varchar(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `land_reviews`
--

INSERT INTO `land_reviews` (`id`, `land_id`, `user_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '5', '2024-01-10 13:40:30', '2024-01-10 13:40:30'),
(10, 1, 5, '4', '2024-01-10 20:45:25', '2024-01-10 20:45:25'),
(11, 1, 6, '5', '2024-01-10 20:48:03', '2024-01-10 20:48:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '1. 2024_01_10_165230_create_roles_table', 1),
(32, '2. 2024_01_10_170213_create_users_table', 1),
(33, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(34, '2019_08_19_000000_create_failed_jobs_table', 1),
(35, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(36, '3. 2024_01_10_165336_create_landowners_table', 1),
(37, '4. 2024_01_10_170351_create_lands_table', 1),
(38, '5. 2024_01_10_165414_create_landfacilities_table', 1),
(39, '6. 2024_01_10_165543_create_land_photos_table', 1),
(40, '7. 2024_01_10_165611_create_land_reviews_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'User', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Kurniawan Rizki Trinanta Sembiring', 'rizki', 'rizki@gmail.com', NULL, '$2y$12$dOTciqQrDTPoutbTAxkKH./sHk/GEjF/GNaltr8CNAVhzeyQvAshe', 1, NULL, '2024-01-10 10:26:14', '2024-01-10 10:26:14'),
(5, 'Aditya Laksamana', 'adit', 'adit@gmail.com', NULL, '$2y$12$Z6Gb6mu0AIy6yTiANBC4LO9J7rWr5Tgic4uKMbi6rn65WkgQZpJgW', 1, NULL, '2024-01-10 13:44:58', '2024-01-10 13:44:58'),
(6, 'Indah euy', 'Indah', 'Indah@gmail.com', NULL, '$2y$12$JYh09Fsmls.afurXylbtyecGX4LzUwTxfzvTGM7BYRv5crPIdJjd6', 1, NULL, '2024-01-10 13:47:59', '2024-01-10 13:47:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `landfacilities`
--
ALTER TABLE `landfacilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `landfacilities_land_id_foreign` (`land_id`);

--
-- Indeks untuk tabel `landowners`
--
ALTER TABLE `landowners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `landowners_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lands_landowner_id_foreign` (`landowner_id`);

--
-- Indeks untuk tabel `land_photos`
--
ALTER TABLE `land_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `land_photos_land_id_foreign` (`land_id`);

--
-- Indeks untuk tabel `land_reviews`
--
ALTER TABLE `land_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `land_reviews_land_id_foreign` (`land_id`),
  ADD KEY `land_reviews_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `landfacilities`
--
ALTER TABLE `landfacilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `landowners`
--
ALTER TABLE `landowners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `lands`
--
ALTER TABLE `lands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `land_photos`
--
ALTER TABLE `land_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `land_reviews`
--
ALTER TABLE `land_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `landfacilities`
--
ALTER TABLE `landfacilities`
  ADD CONSTRAINT `landfacilities_land_id_foreign` FOREIGN KEY (`land_id`) REFERENCES `lands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `landowners`
--
ALTER TABLE `landowners`
  ADD CONSTRAINT `landowners_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `lands`
--
ALTER TABLE `lands`
  ADD CONSTRAINT `lands_landowner_id_foreign` FOREIGN KEY (`landowner_id`) REFERENCES `landowners` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `land_photos`
--
ALTER TABLE `land_photos`
  ADD CONSTRAINT `land_photos_land_id_foreign` FOREIGN KEY (`land_id`) REFERENCES `lands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `land_reviews`
--
ALTER TABLE `land_reviews`
  ADD CONSTRAINT `land_reviews_land_id_foreign` FOREIGN KEY (`land_id`) REFERENCES `lands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `land_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
