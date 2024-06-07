/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` json NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_category_id_foreign` (`category_id`),
  CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menu_rol` (
  `menu_id` bigint unsigned NOT NULL,
  `rol_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`rol_id`),
  KEY `menu_rol_rol_id_foreign` (`rol_id`),
  CONSTRAINT `menu_rol_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_rol_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_padre` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_id_padre_foreign` (`id_padre`),
  CONSTRAINT `menus_id_padre_foreign` FOREIGN KEY (`id_padre`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_rol` (
  `user_id` bigint unsigned NOT NULL,
  `rol_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`rol_id`),
  KEY `user_rol_rol_id_foreign` (`rol_id`),
  CONSTRAINT `user_rol_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_rol_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blogs` (`id`, `title`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(1, 'post1', '{\"time\": 1717800009273, \"blocks\": [{\"id\": \"-3eZ4OsdlV\", \"data\": {\"text\": \"post 1 editado\"}, \"type\": \"paragraph\"}, {\"id\": \"nmh4VHoFvg\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Larry_Shinoda-2.1717702544.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"I_jdCDcQPz\", \"data\": {\"text\": \"hola\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', '2024-06-07 22:40:51', 1, '2024-06-06 19:16:20', '2024-06-07 22:40:51', '');
INSERT INTO `blogs` (`id`, `title`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(2, 'post 2', '{\"time\": 1717704452759, \"blocks\": [{\"id\": \"Y1uQhaUXvR\", \"data\": {\"text\": \"post 2&nbsp;\"}, \"type\": \"paragraph\"}, {\"id\": \"YqP3vnZ-qX\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/10-principales-tecnologias-frontend-para-usar-en-2022.1717704451.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 3, '2024-06-06 20:07:32', '2024-06-06 20:07:32', '1717704452/jpg');
INSERT INTO `blogs` (`id`, `title`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(3, 'post 3', '{\"time\": 1717704734902, \"blocks\": [{\"id\": \"Zvf-DueR2L\", \"data\": {\"text\": \"post 3\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 2, '2024-06-06 20:12:15', '2024-06-06 20:12:15', '1717704735/png');
INSERT INTO `blogs` (`id`, `title`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(4, 'post 4', '{\"time\": 1717704957788, \"blocks\": [{\"id\": \"I7yfSalUz_\", \"data\": {\"text\": \"post 4\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 1, '2024-06-06 20:15:57', '2024-06-06 20:15:57', '1717704957/png'),
(5, 'post 4.0', '{\"time\": 1717705717220, \"blocks\": [{\"id\": \"WOkcIKDl1Q\", \"data\": {\"text\": \"post 4\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 1, '2024-06-06 20:30:43', '2024-06-06 20:30:43', 'logoCamaro.1717705843.jpg'),
(6, 'post 5', '{\"time\": 1717705965989, \"blocks\": [{\"id\": \"jigHDuWVBf\", \"data\": {\"text\": \"post 5\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 2, '2024-06-06 20:32:46', '2024-06-06 20:32:46', 'Giotto_Bizzarini-2.1717705966.jpg'),
(7, 'post 6', '{\"time\": 1717706485172, \"blocks\": [{\"id\": \"JCIf18Quha\", \"data\": {\"text\": \"post6\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 1, '2024-06-06 20:41:25', '2024-06-06 20:41:25', 'home.1717706485.png'),
(8, 'post 7', '{\"time\": 1717706721511, \"blocks\": [{\"id\": \"KyRdbC-x2K\", \"data\": {\"text\": \"post 7 editado\"}, \"type\": \"paragraph\"}, {\"id\": \"--cOdPI-fS\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/logoCamaro.1717706714.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 1, '2024-06-06 20:44:38', '2024-06-06 20:45:33', 'Larry_Shinoda-2.1717706678.jpg');





INSERT INTO `categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Montañas', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Valles', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'Rios', NULL, NULL, NULL);







INSERT INTO `menu_rol` (`menu_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL);
INSERT INTO `menu_rol` (`menu_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(4, 2, NULL, NULL);


INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(2, 'Dashboard', 'dashboard', '2024-06-03 15:07:08', '2024-06-03 15:07:08', NULL);
INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(4, 'user', 'user', NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(5, 'Crear nuevo post', 'create', NULL, NULL, 4);
INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(6, 'Mis post', 'edit', NULL, NULL, 4),
(7, 'show', 'show', NULL, NULL, 4);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2024_06_03_143059_create_menus_table', 2),
(21, '2024_06_03_143509_create_roles_table', 3),
(22, '2024_06_02_203338_create_menu_rol_table', 4),
(23, '2024_06_02_203459_create_user_rol_table', 4),
(24, '2024_06_03_164855_add_id_padre_to_menus_table', 5),
(34, '2024_06_06_171547_create_categories_table', 6),
(35, '2024_06_05_031452_create_blogs_table', 7),
(36, '2024_06_06_194609_add_cover_image_to_blogs_table', 8);



INSERT INTO `roles` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'view', NULL, NULL);
INSERT INTO `roles` (`id`, `description`, `created_at`, `updated_at`) VALUES
(2, 'autor', NULL, NULL);


INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bKMt1JneMxWrYYJ4fsODoQMuIfDY3gzCEHdTh04n', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZzR2NDBFZEFqekJleEsyTkRKck5VZEttbUx4MnRTMW9najBiTlpyMSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovL2Jsb2dfcHJveWVjdC50ZXN0L3Bvc3QvZWRpdC8xIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9ibG9nX3Byb3llY3QudGVzdC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1717800287);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('yQqjFqEgo7SArPNyyWVaNqdNcLocKIgBqBAXwrVo', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSVByazlhYU9qaVkyWnJBaWJaS2c5VnJMY29KNnN0UVJiTzFXOHBIbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9ibG9nX3Byb3llY3QudGVzdC9wb3N0L2NyZWF0ZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1717790823);


INSERT INTO `user_rol` (`user_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);
INSERT INTO `user_rol` (`user_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL);


INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'exequiel', 'exe@gmail.com', NULL, '$2y$12$PoqYkeUMq7EwyVvFrtTT0O0gcAhhcmuh0GSKyodY532E/zk2IwJ2.', NULL, '2024-06-02 20:07:16', '2024-06-02 20:07:16');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'mario', 'mario@gmail.com', NULL, '$2y$12$ezxhcy87BFyIvLRmORZkZuU9DcJx2GESVTTwonWNtkQixT0oxm3mi', NULL, '2024-06-03 18:37:52', '2024-06-03 18:37:52');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;