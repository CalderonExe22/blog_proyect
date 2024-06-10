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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(10, 'post 1', 'post 1', 'Lago puelo', '{\"time\": 1717986172148, \"blocks\": [{\"id\": \"8kG0wAmWG1\", \"data\": {\"text\": \"post 1\", \"level\": 3}, \"type\": \"header\"}, {\"id\": \"JT-38k7Ung\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/e-points.1717941343.jpg\"}, \"caption\": \"post 1\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"jNN0Y5o9Xm\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Larry_Shinoda-2.1717942790.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', '2024-06-10 18:21:10', 2, '2024-06-08 02:11:59', '2024-06-10 18:21:10', 'home.1718030724.png');
INSERT INTO `blogs` (`id`, `title`, `description`, `location`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(11, 'post 2', 'post 2', 'Neuquen', '{\"time\": 1717853575171, \"blocks\": [{\"id\": \"hHVxEfD_Qx\", \"data\": {\"text\": \"post 2\"}, \"type\": \"paragraph\"}, {\"id\": \"s-FdxoYBb-\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/logoCamaro.1717819659.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"VHU0R-Gok2\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Malcolm-Sayer-3.1717853574.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', '2024-06-10 15:58:07', 1, '2024-06-08 04:07:41', '2024-06-10 15:58:07', 'home.1717819661.png');
INSERT INTO `blogs` (`id`, `title`, `description`, `location`, `content`, `deleted_at`, `category_id`, `created_at`, `updated_at`, `cover_image`) VALUES
(12, 'post 3', 'post 2 actualizado a 3', 'Villa la angostura', '{\"time\": 1717853146088, \"blocks\": [{\"id\": \"kExk8lnQRI\", \"data\": {\"text\": \"post 3\"}, \"type\": \"paragraph\"}, {\"id\": \"JUxxZRhLyL\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Giotto_Bizzarini-2.1717853143.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', '2024-06-10 15:58:10', 2, '2024-06-08 13:25:46', '2024-06-10 15:58:10', 'logoCamaro.1717853146.jpg'),
(13, 'post 4', 'post 4', 'Cordoba', '{\"time\": 1718029756003, \"blocks\": [{\"id\": \"YNQ2GW0j18\", \"data\": {\"text\": \"post 4\", \"level\": 3}, \"type\": \"header\"}, {\"id\": \"XM9QgUwrYw\", \"data\": {\"text\": \"este es el post 4\"}, \"type\": \"paragraph\"}, {\"id\": \"L8BpFpmA1w\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Malcolm-Sayer-3.1717874606.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', '2024-06-10 15:58:13', 2, '2024-06-08 19:23:29', '2024-06-10 15:58:13', 'Giotto_Bizzarini-2.1718029765.jpg'),
(14, 'post 5', 'post 5', 'Cordoba', '{\"time\": 1717904640707, \"blocks\": [{\"id\": \"EuhzVd9-VX\", \"data\": {\"text\": \"post 5\"}, \"type\": \"paragraph\"}, {\"id\": \"aMTJXh8tgs\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/tree-leaf-icon-and-logos-of-green-tree-leaf-ecology-and-nature-set-for-logo-design-free-vector.1717904638.png\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', '2024-06-10 15:58:21', 3, '2024-06-09 03:44:50', '2024-06-10 15:58:21', 'wallpaperflare.com_wallpaper.1717904690.jpg'),
(15, 'post 6', 'post 6', 'Cordoba', '{\"time\": 1717943429246, \"blocks\": [{\"id\": \"EuhzVd9-VX\", \"data\": {\"text\": \"post 6\"}, \"type\": \"paragraph\"}, {\"id\": \"aMTJXh8tgs\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/tree-leaf-icon-and-logos-of-green-tree-leaf-ecology-and-nature-set-for-logo-design-free-vector.1717904638.png\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', '2024-06-10 15:58:25', 3, '2024-06-09 03:45:09', '2024-06-10 15:58:25', 'contactenos_fondo.1717943521.jpg'),
(16, 'post 7', 'post 7', 'post 7', '{\"time\": 1717943408473, \"blocks\": [{\"id\": \"aN1nXl1P1v\", \"data\": {\"text\": \"Post 7\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"5ieKUqg1Zx\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/wallpaperflare.com_wallpaper.1717943405.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', '2024-06-10 15:58:30', 2, '2024-06-09 14:30:08', '2024-06-10 15:58:30', 'logoCamaro.1717943408.jpg'),
(17, 'Lago puelo', 'Lago Puelo es un destino turístico ubicado en la Patagonia argentina, en la provincia de Chubut, conocido por su impresionante belleza natural. Rodeado por bosques frondosos y majestuosas montañas, el lago ofrece una amplia gama de actividades al aire libre para los amantes de la naturaleza y los deportes.', 'Lago puelo', '{\"time\": 1718035314576, \"blocks\": [{\"id\": \"T-kWiF_8Bs\", \"data\": {\"text\": \"Que hacer en lago puelo?\", \"level\": 3}, \"type\": \"header\"}, {\"id\": \"3mtbRugiiu\", \"data\": {\"text\": \"Lago pulo es un destino turístico ubicado en la&nbsp;Protagoniza argentina, en la provincia de Chut, conocido por su impresionante belleza natural. Rodeado por bosques frondosos y majestuosas montañas, el lago ofrece una amplia gama de actividades al aire libre para los amantes de la naturaleza y los deportes.\"}, \"type\": \"paragraph\"}, {\"id\": \"GRMiKy9RfO\", \"data\": {\"text\": \"Desde caminatas y paseos en kayak hasta pesca y acampar, hay opciones para todos los gustos y edades.\"}, \"type\": \"paragraph\"}, {\"id\": \"0dMIXnIt-B\", \"data\": {\"text\": \"Es parte de la región&nbsp;Comarca Andina&nbsp;y también cuenta con una gran oferta gastronómica y de alojamiento, lo que la hace perfecta para una escapada de fin de semana o unas vacaciones más largas. Aquí listamos algunas de&nbsp;las mejores actividades para realizar en Lago Puelo&nbsp;y descubriremos todo lo que este hermoso lugar tiene para ofrecer.\"}, \"type\": \"paragraph\"}, {\"id\": \"zso-ZThPZK\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/Lago-Puelo-Chubut.1717986328.webp\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"gBVJapeb0Q\", \"data\": {\"text\": \"Lago Suelo&nbsp;es un destino turístico ubicado en la&nbsp;Protagoniza argentina, en la provincia de Chut, conocido por su impresionante belleza natural. Rodeado por bosques frondosos y majestuosas montañas, el lago ofrece una amplia gama de actividades al aire libre para los amantes de la naturaleza y los deportes.\"}, \"type\": \"paragraph\"}, {\"id\": \"c4Zk1CjLHw\", \"data\": {\"text\": \"Desde caminatas y paseos en ka yak hasta pesca y acampar, hay opciones para todos los gustos y edades.\"}, \"type\": \"paragraph\"}, {\"id\": \"evYZXx3XNg\", \"data\": {\"text\": \"Es parte de la región&nbsp;Comarca Andina&nbsp;y también cuenta con una gran oferta gastronómica y de alojamiento, lo que la hace perfecta para una escapada de fin de semana o unas vacaciones más largas. Aquí listamos algunas de&nbsp;las mejores actividades para realizar en Lago Puelo&nbsp;y descubriremos todo lo que este hermoso lugar tiene para ofrecer.\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 6, '2024-06-10 02:25:32', '2024-06-10 17:47:35', 'Lago-Puelo-Chubut.1718041655.webp'),
(18, 'El Valle de la Luna', 'El Parque Natural Provincial Ischigualasto se encuentra al nordeste de San Juan. Popularmente es conocido como “Valle de la Luna”, por las características terrestres de sus 62 mil hectáreas de superficie. De Córdoba son unos 480 kilómetros por ruta.', 'San juan', '{\"time\": 1718035663574, \"blocks\": [{\"id\": \"NwNt5lT5KO\", \"data\": {\"text\": \"El Valle de la Luna: una mirada al pasado del planeta\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"kI4HmyJYqC\", \"data\": {\"text\": \"Variedad de tonalidades, formas de minerales y sedimentos, formaciones arcillosas de color rojizo, rocas extrañas que asemejan bochas y esfinges, revelan la evolución de la Tierra en el período Triásico e invitan a descubrir cada paisaje del Parque Provincial Ischigualasto, conocido como el “Valle de la Luna”, situado a 300 kilómetros de la capital sanjuanina.\"}, \"type\": \"paragraph\"}, {\"id\": \"mcmu2zjbAL\", \"data\": {\"text\": \"El recorrido por el valle es como un viaje en el tiempo, donde se pueden descubrir las huellas que trazaron las erosiones del agua y del viento, tallando siluetas de barro y piedra. A cada paso se pueden ver figuras que parecen de otro planeta, a esos paisajes excepcionales se debe el significado de Ischigualasto, que proviene del quechua y significa “sitio donde se posa la luna”.\"}, \"type\": \"paragraph\"}, {\"id\": \"TeFo4F6kbP\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/valleDeLaLuna2.1718035639.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"6Txdz9CK4t\", \"data\": {\"text\": \"nte el recorrido se pueden encontrar formaciones como “El gusano”, “Valle Pintado”, “La Esfinge”, “La cancha de bochas”, “El Submarino”, “El Hongo” y las “Barrancas coloradas”, que deben sus nombres a las extrañas figuras que surgen en el camino y dejan atónitos a los visitantes.\"}, \"type\": \"paragraph\"}, {\"id\": \"MKofxpHBRA\", \"data\": {\"text\": \"El valle guarda los recuerdos del período Triásico, el primero de la Era Mesozoica, que va desde los 250 a los 200 millones de años. En esa época, todos los continentes estaban unidos en un solo megacontinente llamado Pangea, donde se desarrollaron valles en los que se acumularon sedimentos mezclados con los restos de animales y plantas que allí vivieron.\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 2, '2024-06-10 16:07:43', '2024-06-10 18:16:10', 'valleDeLaLuna.1718043370.jpg'),
(19, 'Cascadas del iguazu', 'El salto de mayor altura de las cascadas del río Iguazú se llama «la Garganta del diablo». Se trata de un conjunto de cascadas de 80 m de caída que en conjunto forman las cataratas de mayor caudal del mundo.', 'Misiones', '{\"time\": 1718036918966, \"blocks\": [{\"id\": \"vWXaqTZCV7\", \"data\": {\"text\": \"Las cataratas del Iguazú: un increíble espectáculo\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"tZ11_eUs3c\", \"data\": {\"text\": \"El salto de mayor altura de las&nbsp;cascadas del río Iguazú&nbsp;se llama «la Garganta del diablo». Se trata de un conjunto de cascadas de 80 m de caída que en conjunto forman las cataratas de mayor caudal del mundo.\"}, \"type\": \"paragraph\"}, {\"id\": \"_AJmQ0FN54\", \"data\": {\"text\": \"Este paraje natural está protegido en ambos países por sendos parques nacionales, la figura de máxima protección ambiental: el&nbsp;Parque Nacional Iguazú en Argentina&nbsp;y el Parque Nacional do Iguaçu, en Brasil. El territorio protegido asciende a 250.000 hectáreas de bosque subtropical.\"}, \"type\": \"paragraph\"}, {\"id\": \"gxDsdZ82z9\", \"data\": {\"text\": \"Es Patrimonio de la Humanidad de la Unesco desde 1984 en su parte argentina y desde 1986, también su parte brasileña. Además en 2011 fueron elegidas como una de las «Siete maravillas naturales del mundo». Esta fue una iniciativa del suizo Bernard Weber a través de su empresa New Open World Corporation.\"}, \"type\": \"paragraph\"}, {\"id\": \"Ia3iJoEDU4\", \"data\": {\"text\": \"Las cataratas del&nbsp;río Iguazú&nbsp;constituyen uno de los principales destinos turísticos de Argentina y el segundo lugar más visitado por extranjeros en Brasil.\"}, \"type\": \"paragraph\"}, {\"id\": \"N2owKynv_O\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/WikiCatarataIguazu.1718036882.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"Yis0YxAwpP\", \"data\": {\"text\": \"Geología y geografía\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"FZtCecnX9z\", \"data\": {\"text\": \"El carácter de escalera de las cataratas del río Iguazú consiste en una cascada de dos escalones formada por tres capas de basalto. Los escalones son de 35 y 40 metros de altura. Las secuencias de roca basáltica columnar son parte de la Formación Serra Geral de 1,000 metros de espesor dentro de la Cuenca Paleozoico-Mesozoica del Paraná. Las cimas de estas secuencias se caracterizan por 8-10 m de basalto vesicular altamente resistente. El contacto entre estas capas controla la forma de las cataratas.\"}, \"type\": \"paragraph\"}, {\"id\": \"gogVnnSkYc\", \"data\": {\"text\": \"Las tasas de erosión de las cabeceras se estiman en 1,4–2,1 cm / año. Numerosas islas a lo largo del borde de 2,7 kilómetros de largo dividen las cataratas en muchas cascadas y cataratas separadas, que varían entre 60 y 82 m de altura. El número de estas cascadas más pequeñas fluctúa de 150 a 300, dependiendo del nivel del&nbsp;<a href=\\\"https://www.fundacionaquae.org/que-es-el-agua/\\\">agua</a>. Aproximadamente la mitad del caudal del río cae en un abismo largo y estrecho llamado Garganta del Diablo.\"}, \"type\": \"paragraph\"}, {\"id\": \"sfv_h7tJFQ\", \"data\": {\"text\": \"El cañón Garganta del Diablo tiene 80 a 90 m de ancho y 70 a 80 m de profundidad. A la izquierda de este cañón, otra parte del río forma 160-200 caídas individuales. Estas se fusionan en un solo frente durante la etapa de inundación. Las cataratas más grandes se llaman San Martín, Adam y Eva, Penoni y Bergano.\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 5, '2024-06-10 16:28:39', '2024-06-10 16:28:39', 'iguazu.1718036919.webp'),
(20, 'Quebrada de Humahuaca', 'La Quebrada de Humahuaca es un lugar estratégico a la hora de recorrer el norte argentino. Su gran atributo son las montañas con diferentes formas coloridas, que conforman una obra de arte natural.', 'Jujuy', '{\"time\": 1718040926425, \"blocks\": [{\"id\": \"pm0m3X5Ieb\", \"data\": {\"text\": \"Conocé La Quebrada de Humahuaca, un imperdible del norte argentino\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"m0MBfMHLMb\", \"data\": {\"text\": \"Un finde XXL es perfecto para visitar Jujuy, por eso en Multitravel te compartimos los lugares imprescindibles que debes visitar durante tu estadía y te ofrecemos&nbsp;alojamientos al precio más bajo&nbsp;para que lo disfrutes de la mejor manera.\"}, \"type\": \"paragraph\"}, {\"id\": \"gi7jE9hHyw\", \"data\": {\"text\": \"Empezá conociendo un destino poco conocido pero impresionante, el Parque provincial Potrero de Yala. Se encuentra a 15 kilómetros de la capital de Jujuy, y acá se conserva parte de las yungas, un sitio especial para hacer senderismo. Además, podés visitar las Lagunas de Yala.\"}, \"type\": \"paragraph\"}, {\"id\": \"IH7tLEHeJh\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/humahuaca.1718040782.jfif\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"Atsz8RNuks\", \"data\": {\"text\": \"Purmamarca\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"2MGQptMeZd\", \"data\": {\"text\": \"Siguiendo por el camino,&nbsp;<b>Purmamarca</b>&nbsp;es el pueblo más pintoresco de la quebrada, conocido por el famoso Cerro de Siete Colores y el Paseo de los Colorados. No hay nada más lindo que recorrer el pueblito de Purmamarca y comprar las artesanías locales y buzos norteños.\"}, \"type\": \"paragraph\"}, {\"id\": \"My80z60Mxn\", \"data\": {\"text\": \"Otra visita obligatoria cerca de Purmamarca son las Salinas Grandes, un desierto de sal de aproximadamente 200 km2. Una excursión ideal para jugar con la perspectiva, sacar muchas fotos y conocer los “espejos de agua”.\"}, \"type\": \"paragraph\"}, {\"id\": \"zduFVaEZ3n\", \"data\": {\"text\": \"Tilcara\", \"level\": 3}, \"type\": \"header\"}, {\"id\": \"gr4WcOlb6X\", \"data\": {\"text\": \"Próximo, se encuentra&nbsp;<b>Tilcara&nbsp;</b>donde te aconsejamos atravesar su puente, recorrer Pucará de Tilcara, una fortaleza Inca con vistas impresionantes y una increíble arquitectura de piedras,&nbsp; y La Garganta del Diablo, una hendidura natural en la montaña producida por la fuerza del río.\"}, \"type\": \"paragraph\"}, {\"id\": \"28gHG0mg97\", \"data\": {\"text\": \"Te recomendamos&nbsp;<b>volar a Jujuy</b>&nbsp;a fines del mes de febrero de este año para poder vivir el increíble festival de Tilcara, un evento que recibe miles de turistas de todo el mundo. El festejo comienza al mismo tiempo también en Purmamarca y Humahuaca con el desentierro del Diablo, también llamado Coludo o Pujllay, representado con por un muñeco de trapo enterrado al final del carnaval anterior. Este se encuentra enterrado bajo una apacheta de piedras.\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 1, '2024-06-10 17:33:05', '2024-06-10 17:35:33', 'humahuaca.1718040933.jpg'),
(21, 'Nahuel huapi', 'El Parque Nacional Nahuel Huapi se ubica al sur de la República Argentina y al noroeste de la Patagonia. Las 710.000 hectáreas que componen su territorio se emplazan en dos provincias: Neuquén y Río Negro, su vecindad con ciudades como San Carlos de Bariloche, Dina Huapi y Villa La Angostura;', 'Bariloche', '{\"time\": 1718041597793, \"blocks\": [{\"id\": \"MDDHMmxLqP\", \"data\": {\"text\": \"Nahuel huapi, origen\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"zIk7EsZQLw\", \"data\": {\"text\": \"&nbsp; El origen de este Parque Nacional se remonta al año 1903, fecha en que el Perito Francisco Pascasio Moreno donó a la Nación una extensión de tres leguas cuadradas, ubicadas en el límite de los territorios de Neuquén y Río Negro, en el extremo oeste del brazo Blest del lago Nahuel Huapi. El área se convirtió en el núcleo del primer Parque Nacional de Argentina, declarado en 1922 como \\\"Parque Nacional del Sud\\\". En el año 1934 el Congreso de la Nación sancionó por ley la creación del Parque Nacional Nahuel Huapi, incorporándole un territorio mayor. De esta manera, la Argentina se convirtió en el tercer país de América en contar con un Parque Nacional.En este marco, bajo la presidencia del general Justo en 1934, se formó la Comisión de Parques Nacionales que presidió el Dr. Ángel Gallardo y el 9 de octubre de aquel año el Congreso sancionó la Ley 12.103 que dio origen a la primer Dirección de Parques Nacionales.Los Parques Nacionales, surgían como afirmación territorial y poblacional, combinando la preservación de la naturaleza con la consolidación de la soberanía. Además de estas razones Parques y Reservas Nacionales se crean con un fin eminentemente turístico. Así lo ha entendido la Dirección de Parques Nacionales y por ello ha creído que el plan de su labor debía obedecer a dos etapas: la preparación de los Parques Nacionales como zonas receptoras de importantes corrientes viajeras y el encauzamiento de estas corrientes hacia ellas.\"}, \"type\": \"paragraph\"}, {\"id\": \"-1bJ1Ppren\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/1200px-Lago_Nahuel_Huapi_2007.1718041569.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}, {\"id\": \"fyfR-mgJnf\", \"data\": {\"text\": \"¿Qué protege el Parque Nacional Nahuel Huapi?\", \"level\": 4}, \"type\": \"header\"}, {\"id\": \"Zt81xG2zJ3\", \"data\": {\"text\": \"El Parque Nacional Nahuel Huapi es refugio de naturaleza y cultura, su principal objetivo es la conservación de una porción de los bosques andinos norpatagónicos y de la estepa, promoviendo un mayor conocimiento de estos ambientes y generando otras formas de integración armoniosa con la vida en la naturaleza y el desarrollo humano, compatible con la preservación de estos ambientes.\"}, \"type\": \"paragraph\"}], \"version\": \"2.29.1\"}', NULL, 6, '2024-06-10 17:46:37', '2024-06-10 17:46:37', '1200px-Lago_Nahuel_Huapi_2007.1718041597.jpg'),
(22, 'Rio de la plata', 'El Paraná es un largo río del centro-este de Sudamérica que fluye en direcciones sur, este, sudoeste a través de Brasil, Paraguay y Argentina. Tiene una longitud de 2546 kilómetros que lo sitúan como el segundo río más largo de América del Sur —tras el Amazonas—.', 'Neuquen, Mendoza, Rio neq', '{\"time\": 1718042462215, \"blocks\": [{\"id\": \"s-GnqLfU8G\", \"data\": {\"text\": \"Río Colorado (Argentina)\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"0p_xd_bOxh\", \"data\": {\"text\": \"A sus orillas, con el agua que nos corresponde, La Pampa puede desarrollar hasta 85 mil hectáreas bajo riego. Igual cifra que la provincia de Río Negro. El día que esté totalmente puesto en producción, se convertirá en una zona pampeana de enorme riqueza y asentamiento de una gran población. El País debería estar interesadísimo en este desarrollo, ya que excede a las provincias citadas. Un área bajo riego de esa magnitud, contribuiría a unir económicamente la región patagónica con el resto del País. El Valle del Colorado es uno de los pocos valles de regiones templadas en el orden mundial que aún permanece sin explotar, permitiendo generar una gran producción de alimentos, en un mundo crecientemente demandante.\"}, \"type\": \"paragraph\"}, {\"id\": \"tlkKjtyGzL\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/río-Colorado.1718042369.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 3, '2024-06-10 17:59:31', '2024-06-10 18:14:24', 'río-Colorado.1718043264.jpg'),
(23, 'Reserva La Payunia', 'La reserva La Payunia es un área natural protegida ubicada en el sur de la provincia de Mendoza, en Argentina. La zona también se conoce como Payún o Payén. Se accede a la reserva a través de la ruta nacional 40 y luego por ruta provincial 186, a 160 km de Malargüe, ciudad cabecera del departamento homónimo.', 'Mendoza', '{\"time\": 1718043180489, \"blocks\": [{\"id\": \"jJZzpVtMYp\", \"data\": {\"text\": \"Reserva Natural La Payunia\", \"level\": 2}, \"type\": \"header\"}, {\"id\": \"TvkKViaf1A\", \"data\": {\"text\": \"La Reserva Natural La Payunia es para quienes gustan de explorar lugares que parecen de otro planeta. Con más de 800 volcanes, es uno de los campos volcánicos de mayor densidad de la Tierra. Su gran belleza paisajística deslumbra con desiertos negros, dorados y cobrizos.\"}, \"type\": \"paragraph\"}, {\"id\": \"b8egwG0KRy\", \"data\": {\"file\": {\"url\": \"http://blog_proyect.test/storage/image/payunia.1718042822.jpg\"}, \"caption\": \"\", \"stretched\": false, \"withBorder\": false, \"withBackground\": false}, \"type\": \"image\"}], \"version\": \"2.29.1\"}', NULL, 4, '2024-06-10 18:07:06', '2024-06-10 18:13:07', 'payunia.1718043187.jpg');





INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Montañas', 'montañas.webp', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Valles', 'valles.jpg', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'Rios', 'rios.jpg', NULL, NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `cover_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'Mesetas', 'mesetas.jpg', NULL, NULL, NULL),
(5, 'Cascadas', 'cascadas.webp', NULL, NULL, NULL),
(6, 'Lagos', 'Lagos.jpg', NULL, NULL, NULL);







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
('YyxK00k98rN0tHstmdARtjKVE8AzMMeLFM4n2Kdt', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWWpneFdFcXF4RDRwdmY0STR4bEFMT0RKU3dSZ3dqb0Q3djRqRzllUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9ibG9nX3Byb3llY3QudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MjQ6Imh0dHA6Ly9ibG9nX3Byb3llY3QudGVzdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1718043821);


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