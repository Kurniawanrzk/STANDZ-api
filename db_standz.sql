-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2024 pada 15.50
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
(1, 4, '085845820300', 'Tidar baru', '2024-01-10 10:59:39', '2024-01-10 10:59:39'),
(2, 5, '08582375812', 'Wengga', '2024-01-14 04:33:01', '2024-01-14 04:33:01'),
(3, 10, '08582375812', 'Wengga', '2024-01-15 21:10:16', '2024-01-15 21:10:16'),
(4, 12, '08582375812', 'Wengga', '2024-01-16 01:44:46', '2024-01-16 01:44:46'),
(8, 14, '085812312', 'Gajayana malang', '2024-01-16 09:54:54', '2024-01-16 09:54:54'),
(9, 15, '081234123', 'Jalan Veteran no 123', '2024-01-17 11:51:30', '2024-01-17 11:51:30');

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
  `batas_tagihan` varchar(10) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `landowner_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lands`
--

INSERT INTO `lands` (`id`, `land_name`, `location`, `provinsi`, `kota`, `kecamatan`, `kelurahan`, `surface_area`, `deskripsi`, `rental_price`, `batas_tagihan`, `slug`, `landowner_id`, `created_at`, `updated_at`) VALUES
(21, 'Tanah luas untuk jualan daerah merjosari', '-7.938163070068068, 112.58671885574479', 'JAWA TIMUR', 'MALANG', 'LOWOKWARU', 'MERJOSARI', '10 x 10', 'Tanah dijual di Merjo Sari, luas 10x10m. Lokasi strategis, akses mudah. Potensi investasi tinggi. Dekat fasilitas umum, lingkungan nyaman, dokumen lengkap. Hubungi kami segera!', '100000', 'Month', 'tanah-luas-untuk-jualan-daerah-merjosari', 8, '2024-01-18 07:18:12', '2024-01-18 07:18:12');

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
(54, 21, 'http://127.0.0.1:8000/uploads/land_image/21/Tanah_luas_untuk_jualan_daerah_merjosari_180124_1.jpg', '2024-01-18 07:19:52', '2024-01-18 07:19:52'),
(55, 21, 'http://127.0.0.1:8000/uploads/land_image/21/Tanah_luas_untuk_jualan_daerah_merjosari_180124_2.jpg', '2024-01-18 07:19:52', '2024-01-18 07:19:52'),
(56, 21, 'http://127.0.0.1:8000/uploads/land_image/21/Tanah_luas_untuk_jualan_daerah_merjosari_180124_3.jpg', '2024-01-18 07:19:52', '2024-01-18 07:19:52');

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
(11, 1, 6, '5', '2024-01-10 20:48:03', '2024-01-10 20:48:03'),
(12, 21, 12, '4', NULL, NULL),
(13, 21, 14, '5', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `sender` bigint(20) UNSIGNED NOT NULL,
  `receiver` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_1` bigint(20) UNSIGNED NOT NULL,
  `user_2` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id`, `created_at`, `updated_at`, `user_1`, `user_2`) VALUES
(19, '2024-01-16 11:01:05', '2024-01-16 11:01:05', 13, 14),
(21, '2024-01-17 12:15:22', '2024-01-17 12:15:22', 15, 14),
(22, '2024-01-17 12:24:58', '2024-01-17 12:24:58', 12, 14),
(23, '2024-01-17 13:11:30', '2024-01-17 13:11:30', 13, 13),
(24, '2024-01-17 13:11:43', '2024-01-17 13:11:43', 13, 13),
(25, '2024-01-17 13:18:48', '2024-01-17 13:18:48', 13, 13),
(26, '2024-01-17 13:35:58', '2024-01-17 13:35:58', 15, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `google_id` varchar(50) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `google_id`, `name`, `username`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(12, NULL, 'adit euy', 'Adit', 'adit@gmail.com', NULL, '$2y$12$gKkTLfEqMKpQ5oL/JdElHOh7zzi0caqVg./LFOi8Mfl53jAmNttqC', 1, NULL, '2024-01-16 01:44:14', '2024-01-16 01:44:14'),
(13, NULL, 'adit euy', 'Indah', 'indah@gmail.com', NULL, '$2y$12$RrCt/D39QowO/2CoDmRo4uw4T394VSicdKB3.qqPcg6Rx9aQ.7TSu', 1, NULL, '2024-01-16 01:44:23', '2024-01-16 01:44:23'),
(14, '111559588763822650299', 'Kurniawan Rizki', 'Kurniawan Rizki', 'krizki.work@gmail.com', NULL, '$2y$12$wkwnLWawlinL1kGE7sKcJO8YO4vI.AvNlIhlZ5QlfJKUSf/PCbYBq', 1, NULL, '2024-01-16 01:52:40', '2024-01-16 01:52:40'),
(15, '103343301980560015899', 'Kurniawan Rizky', 'Kurniawan Rizky', 'kurniawanrz205@gmail.com', NULL, '$2y$12$SGs4U2J.NQzY9LYNKUxDcuI6N2kZUFUZDBHYTqQr6W4MDjALYxf3.', 1, NULL, '2024-01-17 11:51:11', '2024-01-17 11:51:11');

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
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reciever_id` (`sender`),
  ADD KEY `room_id_2` (`room_id`),
  ADD KEY `receiver` (`receiver`);

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
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender` (`user_1`,`user_2`),
  ADD KEY `receiver` (`user_2`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `lands`
--
ALTER TABLE `lands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `land_photos`
--
ALTER TABLE `land_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `land_reviews`
--
ALTER TABLE `land_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

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
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- Ketidakleluasaan untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_4` FOREIGN KEY (`receiver`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD CONSTRAINT `personal_access_tokens_ibfk_1` FOREIGN KEY (`id`) REFERENCES `messages` (`room_id`);

--
-- Ketidakleluasaan untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`user_1`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`user_2`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
