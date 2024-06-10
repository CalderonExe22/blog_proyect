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
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` json NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cover_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_category_id_foreign` (`category_id`),
  CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `cover_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

INSERT INTO `blogs` (`id`, `title`, `description`, `location`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(10, 'post 1', 'post 1', 'Lago puelo', '{\"time\": 1717986172148, \"blocks\": [{\"id\": \"8kG0wAmWG1\", \"data\": {\"text\": \"post 1\", \"level\": 3}, \"type\": \"header\"}, {\"id\": \"JT-38k7Ung\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/e-points.1717941343.jpg\"}, \"caption\": \"post 1\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"jNN0Y5o9Xm\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Larry_Shinoda-2.1717942790.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 2, '2024-06-08 02:11:59', '2024-06-10 14:46:45', 'home.1718030724.png');
INSERT INTO `blogs` (`id`, `title`, `description`, `location`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(11, 'post 2', 'post 2', 'Neuquen', '{\"time\": 1717853575171, \"blocks\": [{\"id\": \"hHVxEfD_Qx\", \"data\": {\"text\": \"post 2\"}, \"type\": \"paragraph\"}, {\"id\": \"s-FdxoYBb-\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/logoCamaro.1717819659.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"VHU0R-Gok2\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Malcolm-Sayer-3.1717853574.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 1, '2024-06-08 04:07:41', '2024-06-08 13:32:56', 'home.1717819661.png');
INSERT INTO `blogs` (`id`, `title`, `description`, `location`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(12, 'post 3', 'post 2 actualizado a 3', 'Villa la angostura', '{\"time\": 1717853146088, \"blocks\": [{\"id\": \"kExk8lnQRI\", \"data\": {\"text\": \"post 3\"}, \"type\": \"paragraph\"}, {\"id\": \"JUxxZRhLyL\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Giotto_Bizzarini-2.1717853143.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 2, '2024-06-08 13:25:46', '2024-06-08 13:25:46', 'logoCamaro.1717853146.jpg'),
(13, 'post 4', 'post 4', 'Cordoba', '{\"time\": 1718029756003, \"blocks\": [{\"id\": \"YNQ2GW0j18\", \"data\": {\"text\": \"post 4\", \"level\": 3}, \"type\": \"header\"}, {\"id\": \"XM9QgUwrYw\", \"data\": {\"text\": \"este es el post 4\"}, \"type\": \"paragraph\"}, {\"id\": \"L8BpFpmA1w\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Malcolm-Sayer-3.1717874606.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 2, '2024-06-08 19:23:29', '2024-06-10 14:29:25', 'Giotto_Bizzarini-2.1718029765.jpg'),
(14, 'post 5', 'post 5', 'Cordoba', '{\"time\": 1717904640707, \"blocks\": [{\"id\": \"EuhzVd9-VX\", \"data\": {\"text\": \"post 5\"}, \"type\": \"paragraph\"}, {\"id\": \"aMTJXh8tgs\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/tree-leaf-icon-and-logos-of-green-tree-leaf-ecology-and-nature-set-for-logo-design-free-vector.1717904638.png\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 3, '2024-06-09 03:44:50', '2024-06-09 03:44:50', 'wallpaperflare.com_wallpaper.1717904690.jpg'),
(15, 'post 6', 'post 6', 'Cordoba', '{\"time\": 1717943429246, \"blocks\": [{\"id\": \"EuhzVd9-VX\", \"data\": {\"text\": \"post 6\"}, \"type\": \"paragraph\"}, {\"id\": \"aMTJXh8tgs\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/tree-leaf-icon-and-logos-of-green-tree-leaf-ecology-and-nature-set-for-logo-design-free-vector.1717904638.png\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 3, '2024-06-09 03:45:09', '2024-06-09 14:32:01', 'contactenos_fondo.1717943521.jpg'),
(16, 'post 7', 'post 7', 'post 7', '{\"time\": 1717943408473, \"blocks\": [{\"id\": \"aN1nXl1P1v\", \"data\": {\"text\": \"Post 7\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"5ieKUqg1Zx\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/wallpaperflare.com_wallpaper.1717943405.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 2, '2024-06-09 14:30:08', '2024-06-09 14:30:08', 'logoCamaro.1717943408.jpg'),
(17, 'Lago puelo', 'Lago Puelo es un destino turístico ubicado en la Patagonia argentina, en la provincia de Chubut, conocido por su impresionante belleza natural.', 'Lago puelo', '{\"time\": 1717986866854, \"blocks\": [{\"id\": \"T-kWiF_8Bs\", \"data\": {\"text\": \"Que hacer en lago puelo?\", \"level\": 3}, \"type\": \"header\"}, {\"id\": \"3mtbRugiiu\", \"data\": {\"text\": \"Lago pulo es un destino turístico ubicado en la&nbsp;Protagoniza argentina, en la provincia de Chut, conocido por su impresionante belleza natural. Rodeado por bosques frondosos y majestuosas montañas, el lago ofrece una amplia gama de actividades al aire libre para los amantes de la naturaleza y los deportes.\"}, \"type\": \"paragraph\"}, {\"id\": \"GRMiKy9RfO\", \"data\": {\"text\": \"Desde caminatas y paseos en kayak hasta pesca y acampar, hay opciones para todos los gustos y edades.\"}, \"type\": \"paragraph\"}, {\"id\": \"0dMIXnIt-B\", \"data\": {\"text\": \"Es parte de la región&nbsp;Comarca Andina&nbsp;y también cuenta con una gran oferta gastronómica y de alojamiento, lo que la hace perfecta para una escapada de fin de semana o unas vacaciones más largas. Aquí listamos algunas de&nbsp;las mejores actividades para realizar en Lago Puelo&nbsp;y descubriremos todo lo que este hermoso lugar tiene para ofrecer.\"}, \"type\": \"paragraph\"}, {\"id\": \"zso-ZThPZK\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Lago-Puelo-Chubut.1717986328.webp\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"gBVJapeb0Q\", \"data\": {\"text\": \"Lago Suelo&nbsp;es un destino turístico ubicado en la&nbsp;Protagoniza argentina, en la provincia de Chut, conocido por su impresionante belleza natural. Rodeado por bosques frondosos y majestuosas montañas, el lago ofrece una amplia gama de actividades al aire libre para los amantes de la naturaleza y los deportes.\"}, \"type\": \"paragraph\"}, {\"id\": \"c4Zk1CjLHw\", \"data\": {\"text\": \"Desde caminatas y paseos en ka yak hasta pesca y acampar, hay opciones para todos los gustos y edades.\"}, \"type\": \"paragraph\"}, {\"id\": \"evYZXx3XNg\", \"data\": {\"text\": \"Es parte de la región&nbsp;Comarca Andina&nbsp;y también cuenta con una gran oferta gastronómica y de alojamiento, lo que la hace perfecta para una escapada de fin de semana o unas vacaciones más largas. Aquí listamos algunas de&nbsp;las mejores actividades para realizar en Lago Puelo&nbsp;y descubriremos todo lo que este hermoso lugar tiene para ofrecer.\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 1, '2024-06-10 02:25:32', '2024-06-10 13:50:24', 'Lago-Puelo-Chubut.1717986874.webp');





INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Montañas', 'montañas.webp', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Valles', 'valles.jpg', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'Rios', 'rios.jpg', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'Mesetas', 'mesetas.jpg', NULL, NULL, NULL);







INSERT INTO `menu_rol` (`menu_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, NULL);
INSERT INTO `menu_rol` (`menu_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL);
INSERT INTO `menu_rol` (`menu_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(8, 2, NULL, NULL);
INSERT INTO `menu_rol` (`menu_id`, `rol_id`, `created_at`, `updated_at`) VALUES
(9, 2, NULL, NULL);

INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(2, 'Categorias', 'category.index', '2024-06-03 15:07:08', '2024-06-03 15:07:08', NULL);
INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(8, 'Dashboard', 'dashboard', NULL, NULL, NULL);
INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(9, 'Crear post', 'create', NULL, NULL, 8);
INSERT INTO `menus` (`id`, `name`, `url`, `created_at`, `updated_at`, `id_padre`) VALUES
(10, 'Mis post', 'post.index', NULL, NULL, 8);

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
(36, '2024_06_06_194609_add_cover_image_to_blogs_table', 8),
(37, '2024_06_08_020411_add_description_to_blogs_table', 9),
(38, '2024_06_09_011731_add_location_to_blogs_table', 10),
(39, '2024_06_10_150636_add_cover_image_to_categories_table', 11),
(40, '2024_06_10_152248_change_column_type_in_blogs_table', 12);



INSERT INTO `roles` (`id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'view', NULL, NULL);
INSERT INTO `roles` (`id`, `description`, `created_at`, `updated_at`) VALUES
(2, 'autor', NULL, NULL);


INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('oTRSIY0wKUV0d53eU3IHFxlbNssbria3wtjKEPD3', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibjl3Z1lLZzJqOVYzOHRxTjRXUnpCUVJUdldMZFU4YXVDbG1LWDl3RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9ibG9nX3Byb3llY3QudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1718033173);


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