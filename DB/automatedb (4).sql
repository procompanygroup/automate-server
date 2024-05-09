-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 09, 2024 at 02:13 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `automatedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `meta_key` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `status` int DEFAULT '0',
  `update_user_id` bigint UNSIGNED DEFAULT NULL,
  `create_user_id` bigint UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `desc`, `meta_key`, `parent_id`, `sequence`, `status`, `update_user_id`, `create_user_id`, `notes`, `created_at`, `updated_at`, `code`) VALUES
(1, 'footer-sections', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 'footer-sections'),
(2, 'main-menu', NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, 'main-menu'),
(3, 'Company', 'company', NULL, 'company', 2, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 09:33:11', 'company'),
(4, 'Projects', 'projects', NULL, 'projects', 2, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 09:35:27', 'projects'),
(5, 'Products', 'products', NULL, NULL, 2, 0, 1, 1, NULL, NULL, NULL, '2024-04-29 07:17:53', 'products'),
(6, 'Services', 'services', NULL, 'services', 2, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 09:37:45', 'services'),
(7, 'Contacts', 'contacts', NULL, 'contacts', 2, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 09:38:40', 'contacts'),
(8, 'Career', 'career', NULL, 'career', 2, 0, 1, 1, NULL, NULL, NULL, '2024-04-29 15:18:05', 'career'),
(9, 'About Us', 'about-us', NULL, 'about us', 3, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 14:51:05', 'about-us'),
(10, 'Our History', 'our-history', NULL, 'our history', 3, 0, 0, 1, NULL, NULL, NULL, '2024-04-30 17:30:19', 'our-history'),
(11, 'Certificates', 'certificates', NULL, 'certificates', 3, 0, 0, 1, NULL, NULL, NULL, '2024-04-30 17:30:12', 'certificates'),
(12, 'Human Resources', 'human-resources', NULL, 'human resources', 3, 0, 0, 1, NULL, NULL, NULL, '2024-04-30 17:29:56', 'human-resources'),
(13, 'R-D', 'r-d', NULL, 'R-D', 3, 0, 0, 1, NULL, NULL, NULL, '2024-04-30 17:29:50', 'R&D'),
(14, 'sponsorships', 'sponsorships', NULL, NULL, 3, 0, 0, 1, NULL, NULL, NULL, '2024-04-30 17:29:44', 'Sponsorships'),
(15, 'Home', 'home', NULL, 'home', 2, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 09:33:11', 'home'),
(16, 'References', 'references', NULL, 'references', 15, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 09:38:40', 'references'),
(17, 'Catalog', 'catalog', NULL, 'catalog', 15, 0, 1, 1, NULL, NULL, NULL, '2024-05-09 11:50:29', 'catalog');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `status` int DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `htmlcode` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `notes`, `sequence`, `status`, `image`, `htmlcode`, `created_at`, `updated_at`, `is_default`) VALUES
(7, 'ar', 'العربية', NULL, 0, 1, 'ar7.svg', NULL, '2024-04-09 22:20:21', '2024-04-24 21:32:47', 0),
(8, 'en', 'English', NULL, 0, 1, 'en8.svg', NULL, '2024-04-09 22:21:07', '2024-04-24 21:32:47', 1),
(11, 'tr', 'Türkçe', NULL, 0, 1, 'tr11.svg', NULL, '2024-04-20 21:01:27', '2024-04-24 21:32:47', 0),
(12, 'de', 'Deutsch', NULL, 0, 1, 'de12.svg', NULL, '2024-04-20 21:02:33', '2024-04-24 21:32:47', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lang_posts`
--

DROP TABLE IF EXISTS `lang_posts`;
CREATE TABLE IF NOT EXISTS `lang_posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `main_table` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_trans` text COLLATE utf8mb4_unicode_ci,
  `content_trans` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lang_posts`
--

INSERT INTO `lang_posts` (`id`, `lang_id`, `category_id`, `post_id`, `main_table`, `title_trans`, `content_trans`, `name`, `notes`, `created_at`, `updated_at`) VALUES
(1, 8, NULL, 1, NULL, 'Prevalent Automation', '<p>\r\n              A108 Adam Street <br>\r\n              New York, NY 535022<br>\r\n              United States <br><br>\r\n              <strong>Phone:</strong> +1 5589 55488 55<br>\r\n              <strong>Email:</strong> info@example.com<br>\r\n            </p>', NULL, NULL, '2024-04-27 12:27:01', '2024-04-27 13:47:55'),
(2, 7, NULL, 1, NULL, 'Prevalent Automation', '<p><font color=\"#777777\" face=\"Roboto, sans-serif\"><span style=\"font-size: 14px;\">-</span></font><br style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\">تركيا</span><br style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\"><br style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"font-weight: bolder; color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\">Phone:</span><span style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\">&nbsp;+1 5589 55488 55</span><br style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\"><span style=\"font-weight: bolder; color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\">Email:</span><span style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\">&nbsp;info@example.com</span><br></p>', NULL, NULL, '2024-04-27 12:28:23', '2024-04-27 14:41:26'),
(3, 8, NULL, 2, NULL, 'Useful Links', '<ul>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Home</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">About us</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Services</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Terms of service</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Privacy policy</a></li>\r\n            </ul>', NULL, NULL, '2024-04-27 12:49:51', '2024-05-08 08:28:43'),
(4, 8, NULL, 3, NULL, 'Our Services', '<ul>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Web Design</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Web Development</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Product Management</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Marketing</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"#\">Graphic Design</a></li>\r\n            </ul>', NULL, NULL, '2024-04-27 12:53:23', '2024-04-27 12:53:23'),
(5, 8, NULL, 4, NULL, 'Our Social Networks', NULL, NULL, NULL, '2024-04-27 12:53:50', '2024-04-27 12:53:50'),
(6, 8, NULL, 5, NULL, 'Copyright', '<div class=\"copyright\">\r\n        © Copyright <strong><span>Prevalent Automation</span></strong>. All Rights Reserved\r\n      </div>\r\n      <div class=\"credits\">\r\n                 <a href=\"#\"></a>\r\n      </div>', NULL, NULL, '2024-04-27 12:58:16', '2024-04-27 14:33:46'),
(7, 7, NULL, 2, NULL, 'روابط مفيدة', NULL, NULL, NULL, '2024-04-27 14:39:07', '2024-04-27 14:39:07'),
(8, 7, NULL, 3, NULL, 'خدماتنا', NULL, NULL, NULL, '2024-04-27 14:39:35', '2024-04-27 14:39:35'),
(9, 7, 3, NULL, NULL, 'الشركة', NULL, NULL, NULL, '2024-04-28 09:34:34', '2024-04-28 09:34:34'),
(10, 8, 3, NULL, NULL, 'Company', NULL, NULL, NULL, '2024-04-28 09:34:41', '2024-04-28 09:34:41'),
(11, 8, 4, NULL, NULL, 'Projects', '<h2>Projects</h2>\r\n        <p>Our Projects</p>', NULL, NULL, '2024-04-28 09:35:32', '2024-05-04 11:58:42'),
(12, 7, 4, NULL, NULL, 'مشاريعنا', NULL, NULL, NULL, '2024-04-28 09:36:24', '2024-05-01 14:03:38'),
(13, 7, 5, NULL, NULL, 'المنتجات', NULL, NULL, NULL, '2024-04-28 09:37:00', '2024-04-28 09:37:00'),
(14, 8, 5, NULL, NULL, 'Products', NULL, NULL, NULL, '2024-04-28 09:37:04', '2024-04-28 09:37:04'),
(15, 8, 6, NULL, NULL, 'Services', NULL, NULL, NULL, '2024-04-28 09:37:31', '2024-04-28 09:37:31'),
(16, 7, 6, NULL, NULL, 'خدماتنا', NULL, NULL, NULL, '2024-04-28 09:38:00', '2024-04-28 09:38:00'),
(17, 8, 7, NULL, NULL, 'Contacts', NULL, NULL, NULL, '2024-04-28 09:38:38', '2024-04-28 09:38:38'),
(18, 7, 7, NULL, NULL, 'اتصل بنا', NULL, NULL, NULL, '2024-04-28 09:38:51', '2024-04-28 09:38:51'),
(19, 8, 8, NULL, NULL, 'Career', NULL, NULL, NULL, '2024-04-28 09:40:43', '2024-04-28 09:40:43'),
(20, 7, 8, NULL, NULL, 'الوظائف', NULL, NULL, NULL, '2024-04-28 09:40:53', '2024-04-28 09:40:53'),
(21, 8, 9, NULL, NULL, 'About Us', '<!-- ======= Services Section ======= -->\r\n    <section id=\"services\" class=\"services about-content\">\r\n      <div class=\"container\" data-aos=\"fade-up\">\r\n\r\n        <div class=\"section-title\">\r\n           \r\n         \r\n           </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch\" data-aos=\"zoom-in\" data-aos-delay=\"100\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bxl-dribbble\"></i></div>\r\n              <h4><a href=\"\">About Us</a></h4>\r\n              <p>The Co-founder of PreValent was based on the ideas of a group of experienced Electrical-Electronic Engineer in 2008. PreValent which was established on this basis was incorporated in 2018. It provides service in Industrial Automation to many sectors especially in Cement,chemecals ,Pharmaceutical , Plastics , and water treament manufacturing.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0\" data-aos=\"zoom-in\" data-aos-delay=\"200\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-file\"></i></div>\r\n              <h4><a href=\"\">Our Mission</a></h4>\r\n              <p>PreValent Automation has undertaken the mission of contributing to our country\'s industrialization and international expansion with the services it provides and performs in the market. Strong capital and know-how, experienced and competent manpower, flexible organizational structure, high quality and diverse service portfolio are our biggest sources of power supporting our mission.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0\" data-aos=\"zoom-in\" data-aos-delay=\"300\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-tachometer\"></i></div>\r\n              <h4><a href=\"\">Our Vision</a></h4>\r\n              <p>In constantly developing/changing Turkey and the world economy, to contribute the environment and country\'s economy with a high level of service.\r\n\r\nUnderstanding of efficient and determined work, timely and complete fulfillment of the responsibilities undertaken, absolute customer satisfaction, prioritizing human relations, demonstrating maximum diligence in every job, big or small, never compromising on quality, maintaining a peaceful business life with our employees.</p>\r\n            </div>\r\n          </div>\r\n\r\n         \r\n        </div>\r\n\r\n      </div>\r\n    </section><!-- End Services Section -->', NULL, NULL, '2024-04-28 14:50:22', '2024-04-29 17:08:54'),
(22, 7, 9, NULL, NULL, 'حولنا', NULL, NULL, NULL, '2024-04-28 14:57:12', '2024-04-28 14:57:12'),
(23, 7, 10, NULL, NULL, 'تاريخنا', NULL, NULL, NULL, '2024-04-28 14:57:55', '2024-04-28 14:57:55'),
(24, 8, 10, NULL, NULL, 'Our History', NULL, NULL, NULL, '2024-04-28 14:58:01', '2024-04-28 14:58:01'),
(25, 8, 11, NULL, NULL, 'Certificates', NULL, NULL, NULL, '2024-04-28 14:58:33', '2024-04-28 14:58:33'),
(26, 7, 11, NULL, NULL, 'الشهادات', NULL, NULL, NULL, '2024-04-28 14:59:06', '2024-04-28 14:59:06'),
(27, 8, 12, NULL, NULL, 'Human Resources', NULL, NULL, NULL, '2024-04-28 14:59:44', '2024-04-28 14:59:44'),
(28, 7, 12, NULL, NULL, 'الموارد البشرية', NULL, NULL, NULL, '2024-04-28 14:59:55', '2024-04-28 14:59:55'),
(29, 8, 13, NULL, NULL, 'R&D', NULL, NULL, NULL, '2024-04-28 15:00:36', '2024-04-28 15:00:36'),
(30, 7, 13, NULL, NULL, 'R&D', NULL, NULL, NULL, '2024-04-28 15:00:44', '2024-04-28 15:00:44'),
(31, 8, 14, NULL, NULL, 'Sponsorships', NULL, NULL, NULL, '2024-04-28 15:01:50', '2024-04-28 15:01:50'),
(32, 7, 14, NULL, NULL, 'رعاية', NULL, NULL, NULL, '2024-04-28 15:02:02', '2024-04-28 15:02:02'),
(33, 8, 15, NULL, NULL, 'Home', NULL, NULL, NULL, '2024-04-29 14:31:23', '2024-04-29 14:31:23'),
(34, 7, 15, NULL, NULL, 'الرئيسية', NULL, NULL, NULL, '2024-04-29 14:31:35', '2024-04-29 14:31:35'),
(35, 11, 15, NULL, NULL, 'ANASAYFA', '<p><br></p>', NULL, NULL, '2024-04-29 14:53:47', '2024-04-29 14:54:07'),
(36, 12, 15, NULL, NULL, 'Heim', NULL, NULL, NULL, '2024-04-29 14:55:23', '2024-04-29 14:55:23'),
(37, 11, 3, NULL, NULL, 'Şirket', NULL, NULL, NULL, '2024-04-29 17:28:33', '2024-04-29 17:28:33'),
(38, 12, 3, NULL, NULL, 'Unternehmen', NULL, NULL, NULL, '2024-04-29 17:28:50', '2024-04-29 17:28:50'),
(39, 11, 4, NULL, NULL, 'Projeler', NULL, NULL, NULL, '2024-04-29 17:29:21', '2024-05-01 14:05:54'),
(40, 12, 4, NULL, NULL, 'Projecten', NULL, NULL, NULL, '2024-04-29 17:29:35', '2024-05-01 14:06:39'),
(41, 12, 5, NULL, NULL, 'Produkte', NULL, NULL, NULL, '2024-04-29 17:30:23', '2024-04-29 17:30:23'),
(42, 11, 5, NULL, NULL, 'Ürünler', NULL, NULL, NULL, '2024-04-29 17:30:36', '2024-04-29 17:30:36'),
(43, 11, 6, NULL, NULL, 'Hizmetler', NULL, NULL, NULL, '2024-04-29 17:31:29', '2024-04-29 17:31:29'),
(44, 12, 6, NULL, NULL, 'Diensten', NULL, NULL, NULL, '2024-04-29 17:32:14', '2024-04-29 17:32:14'),
(45, 12, 7, NULL, NULL, 'Contacten', NULL, NULL, NULL, '2024-04-29 17:32:55', '2024-04-29 17:32:55'),
(46, 11, 7, NULL, NULL, 'Kişiler', NULL, NULL, NULL, '2024-04-29 17:33:10', '2024-04-29 17:33:10'),
(47, 11, 8, NULL, NULL, 'Kariyer', NULL, NULL, NULL, '2024-04-29 17:33:48', '2024-04-29 17:33:48'),
(48, 12, 8, NULL, NULL, 'Carrière', NULL, NULL, NULL, '2024-04-29 17:34:04', '2024-04-29 17:34:04'),
(49, 12, 9, NULL, NULL, 'Over ons', NULL, NULL, NULL, '2024-04-29 17:35:25', '2024-04-29 17:35:25'),
(50, 11, 9, NULL, NULL, 'Hakkımızda', NULL, NULL, NULL, '2024-04-29 17:36:39', '2024-04-29 17:36:39'),
(51, 11, 10, NULL, NULL, 'Tarihimiz', NULL, NULL, NULL, '2024-04-29 17:37:23', '2024-04-29 17:37:23'),
(52, 12, 10, NULL, NULL, 'Onze geschiedenis', NULL, NULL, NULL, '2024-04-29 17:37:46', '2024-04-29 17:37:46'),
(53, 12, 11, NULL, NULL, 'Certificaten', NULL, NULL, NULL, '2024-04-29 17:39:01', '2024-04-29 17:39:01'),
(54, 11, 11, NULL, NULL, 'Sertifikalar', NULL, NULL, NULL, '2024-04-29 17:39:20', '2024-04-29 17:39:20'),
(55, 11, 12, NULL, NULL, 'İnsan kaynakları', NULL, NULL, NULL, '2024-04-29 17:39:52', '2024-04-29 17:39:52'),
(56, 12, 12, NULL, NULL, 'Personeelszaken', NULL, NULL, NULL, '2024-04-29 17:40:05', '2024-04-29 17:40:05'),
(57, 11, 13, NULL, NULL, 'R&D', NULL, NULL, NULL, '2024-04-29 17:40:44', '2024-04-29 17:40:44'),
(58, 12, 13, NULL, NULL, 'R&D', NULL, NULL, NULL, '2024-04-29 17:40:46', '2024-04-29 17:40:46'),
(59, 11, 14, NULL, NULL, 'Sponsorluklar', NULL, NULL, NULL, '2024-04-29 17:41:20', '2024-04-29 17:41:20'),
(60, 12, 14, NULL, NULL, 'Sponsoring', NULL, NULL, NULL, '2024-04-29 17:41:41', '2024-04-29 17:41:41'),
(61, 8, NULL, 9, NULL, 'eng ref', '<p><span style=\"color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(246, 249, 254);\">Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</span><br></p>', NULL, NULL, '2024-05-02 10:51:36', '2024-05-06 07:36:45'),
(62, 7, NULL, 9, NULL, 'ar ref', '<p>ar refd</p>', NULL, NULL, '2024-05-02 10:51:51', '2024-05-02 10:51:51'),
(63, 7, NULL, 13, NULL, 'مشروع 1', '<p>تفاصيل</p>', NULL, NULL, '2024-05-03 20:19:30', '2024-05-03 20:19:30'),
(64, 8, NULL, 13, NULL, 'project1', '<p>project1 desc<br></p>', NULL, NULL, '2024-05-03 20:21:14', '2024-05-03 20:21:14'),
(65, 8, NULL, 15, NULL, 'project2', '<span>pp</span>\r\n              <p>asc as asca</p>', NULL, NULL, '2024-05-04 11:20:04', '2024-05-04 11:28:29'),
(66, 8, NULL, 16, NULL, 'project3', '<p>&nbsp;sdvsd vadv&nbsp;&nbsp;</p>', NULL, NULL, '2024-05-04 11:20:51', '2024-05-04 11:20:51'),
(67, 8, NULL, 17, NULL, 'project4', '<p>vsv vsdvscv s</p>', NULL, NULL, '2024-05-04 11:22:27', '2024-05-04 11:22:27'),
(68, 7, NULL, 17, NULL, 'مشروع4', NULL, NULL, NULL, '2024-05-04 11:22:34', '2024-05-04 11:22:43'),
(69, 8, NULL, 18, NULL, 'auto', NULL, NULL, NULL, '2024-05-04 12:13:14', '2024-05-04 12:13:14'),
(70, 8, 16, NULL, NULL, 'References', '<p>References<br></p>', NULL, NULL, '2024-05-04 13:50:46', '2024-05-04 13:50:46'),
(74, 8, NULL, 25, NULL, 'FORD OTOSAN - Turnkey Paint Shop Robotic PVC NVH UBS and Cosmetic Sealing', '<p>FORD OTOSAN - Turnkey Paint Shop Robotic PVC NVH UBS and Cosmetic Sealing</p><p>FORD OTOSAN - Turnkey Paint Shop Robotic PVC NVH UBS and Cosmetic Sealing</p><p>FORD OTOSAN - Turnkey Paint Shop Robotic PVC NVH UBS and Cosmetic Sealing<br></p>', NULL, NULL, '2024-05-06 09:05:26', '2024-05-06 09:05:26'),
(75, 8, NULL, 22, NULL, 'TOGG - Turnkey Robotic BIW (Body in-White) Greenfield', '<p>TOGG - Turnkey Robotic BIW (Body in-White) Greenfield</p><p>TOGG - Turnkey Robotic BIW (Body in-White) Greenfield</p><p>TOGG - Turnkey Robotic BIW (Body in-White) Greenfield</p><p>TOGG - Turnkey Robotic BIW (Body in-White) Greenfield<br></p>', NULL, NULL, '2024-05-06 09:05:46', '2024-05-06 09:08:40'),
(76, 8, NULL, 23, NULL, 'FORD EUROPE - Turnkey Robotic BIW (Body in-White) Greenfield / Brownfield', 'FORD EUROPE - Turnkey Robotic BIW (Body in-White) Greenfield / Brownfield\r\nFORD EUROPE - Turnkey Robotic BIW (Body in-White) Greenfield / Brownfield\r\nFORD EUROPE - Turnkey Robotic BIW (Body in-White) Greenfield / Brownfield\r\nFORD EUROPE - Turnkey Robotic BIW (Body in-White) Greenfield / Brownfield', NULL, NULL, '2024-05-06 09:06:03', '2024-05-06 09:22:28'),
(77, 8, NULL, 24, NULL, 'FORD OTOSAN - Turnkey Robotic BIW (Body in-White) Greenfield', '<p>FORD OTOSAN - Turnkey Robotic BIW (Body in-White) Greenfield</p><p>FORD OTOSAN - Turnkey Robotic BIW (Body in-White) Greenfield</p><p>FORD OTOSAN - Turnkey Robotic BIW (Body in-White) Greenfield</p><p>FORD OTOSAN - Turnkey Robotic BIW (Body in-White) Greenfield<br></p>', NULL, NULL, '2024-05-06 09:06:19', '2024-05-06 09:06:19'),
(78, 8, 17, NULL, NULL, 'Catalog', NULL, NULL, NULL, '2024-05-08 11:03:47', '2024-05-08 11:03:47'),
(79, 7, 17, NULL, NULL, 'الكاتالوج', NULL, NULL, NULL, '2024-05-08 11:04:04', '2024-05-08 11:04:04'),
(80, 11, 17, NULL, NULL, 'Katalog', NULL, NULL, NULL, '2024-05-09 12:05:27', '2024-05-09 12:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `lang_projects`
--

DROP TABLE IF EXISTS `lang_projects`;
CREATE TABLE IF NOT EXISTS `lang_projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `lang_id` bigint UNSIGNED DEFAULT NULL,
  `title_trans` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_trans` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lang_projects`
--

INSERT INTO `lang_projects` (`id`, `created_at`, `updated_at`, `project_id`, `lang_id`, `title_trans`, `content_trans`) VALUES
(1, '2024-04-11 15:33:39', '2024-04-11 15:53:39', 1, 8, 'En protrans', '<p>en dcascasc</p>'),
(2, '2024-04-11 16:05:33', '2024-04-11 16:25:57', 5, 8, 'pro2', '<p><span style=\"color: rgb(33, 37, 41);\">Media <b>Mauris </b>tincidunt mi<a href=\"http://google.com\" target=\"_blank\"> at erat gravida</a>, eget tristique <span style=\"background-color: rgb(0, 255, 0);\">urna bibendum.</span> Mauris pharetra purus ut ligula tempor, et vulputate metus</span><font color=\"#ff0000\"> facilisis</font><span style=\"color: rgb(33, 37, 41);\">. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas sollicitudin, nisi a luctus interdum, nisl ligula placerat mi, quis posuere purus ligula eu lectus. Donec nunc tellus, elementum sit amet ultricies at, posuere nec nunc. Nunc euismod pellentesque diam.</span><br></p>'),
(3, '2024-04-11 16:22:59', '2024-04-11 16:22:59', 5, 7, 'المشروع 2', '<p>محتوى 22</p>'),
(4, '2024-04-11 16:23:32', '2024-04-11 16:23:32', 5, 10, 'proje`2', '<p>proje`222 c</p>'),
(5, '2024-04-12 18:37:01', '2024-04-20 20:53:56', 1, 7, 'منتج', 'عربي');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `is_active`) VALUES
(1, 'header-social', 1),
(2, 'footer-social', 1),
(3, 'footer-sec-1', 1),
(4, 'footer-sec-2', 1),
(5, 'footer-sec-3', 1),
(6, 'footer-social-title', 1),
(7, 'footer-bottom', 1),
(8, 'main-menu', 1),
(9, 'whatsbutton', 1);

-- --------------------------------------------------------

--
-- Table structure for table `location_settings`
--

DROP TABLE IF EXISTS `location_settings`;
CREATE TABLE IF NOT EXISTS `location_settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `location_id` bigint UNSIGNED DEFAULT NULL,
  `setting_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dep` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `is_active` int DEFAULT '0',
  `main_table` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location_settings`
--

INSERT INTO `location_settings` (`id`, `location_id`, `setting_id`, `type`, `dep`, `sequence`, `is_active`, `main_table`, `category_id`, `post_id`) VALUES
(7, 1, 16, NULL, NULL, 2, 1, NULL, NULL, NULL),
(9, 1, 15, NULL, NULL, 3, 1, NULL, NULL, NULL),
(10, 1, 14, NULL, NULL, 0, 1, NULL, NULL, NULL),
(13, 2, 14, NULL, NULL, 0, 1, NULL, NULL, NULL),
(14, 2, 15, NULL, NULL, 1, 1, NULL, NULL, NULL),
(15, 2, 16, NULL, NULL, 3, 1, NULL, NULL, NULL),
(16, 2, 17, NULL, NULL, 2, 1, NULL, NULL, NULL),
(17, 3, NULL, NULL, NULL, 0, 1, 'posts', NULL, 1),
(18, 4, NULL, NULL, NULL, 1, 1, 'posts', NULL, 2),
(19, 5, NULL, NULL, NULL, 2, 1, 'posts', NULL, 3),
(20, 6, NULL, NULL, NULL, 3, 1, 'posts', NULL, 4),
(21, 7, NULL, NULL, NULL, 4, 1, 'posts', NULL, 5),
(22, 8, NULL, NULL, NULL, 1, 1, 'categories', 3, NULL),
(23, 8, NULL, NULL, NULL, 2, 1, 'categories', 4, NULL),
(24, 8, NULL, NULL, NULL, 3, 1, 'categories', 5, NULL),
(25, 8, NULL, NULL, NULL, 4, 1, 'categories', 6, NULL),
(26, 8, NULL, NULL, NULL, 5, 1, 'categories', 7, NULL),
(27, 8, NULL, NULL, NULL, 6, 1, 'categories', 8, NULL),
(28, 8, NULL, NULL, NULL, 0, 1, 'categories', 15, NULL),
(29, 1, 17, NULL, NULL, 1, 1, NULL, NULL, NULL),
(30, 9, 19, NULL, NULL, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mediastore`
--

DROP TABLE IF EXISTS `mediastore`;
CREATE TABLE IF NOT EXISTS `mediastore` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mediastore`
--

INSERT INTO `mediastore` (`id`, `name`, `caption`, `title`, `local_path`, `type`, `sequence`, `created_at`, `updated_at`) VALUES
(15, '6264415.webp', '', '', 'projects', 'image', 0, '2024-04-13 20:22:08', '2024-04-13 20:22:09'),
(24, '1741124.webp', '', '', 'projects', 'image', 0, '2024-04-19 08:00:10', '2024-04-19 08:00:11'),
(42, '4029642.webp', '', '', 'projects', 'image', 0, '2024-04-19 19:56:29', '2024-04-20 14:06:58'),
(43, '9275843.webp', 'dd', '', 'projects', 'image', 0, '2024-04-19 19:56:29', '2024-04-20 14:50:04'),
(45, '5126345.webp', 'ee', '', 'projects', 'image', 0, '2024-04-19 20:25:45', '2024-04-19 20:25:45'),
(47, '1612547.webp', '', '', 'projects', 'image', 0, '2024-04-19 20:25:46', '2024-04-19 20:26:14'),
(50, '1697350.webp', '', '', 'projects', 'image', 0, '2024-04-19 21:48:58', '2024-04-19 21:48:58'),
(51, '7113051.webp', '', '', 'projects', 'image', 0, '2024-04-19 21:57:39', '2024-04-20 14:08:44'),
(62, '2201762.mp4', 'sacas', '', 'projects', 'video', 0, '2024-04-20 15:15:49', '2024-04-20 15:15:49'),
(74, '8149174.mp4', '', '', 'projects', 'video', 0, '2024-04-20 19:42:14', '2024-04-20 19:42:14'),
(99, '4218099.webp', '', '', 'posts', 'image', 0, '2024-05-02 12:49:50', '2024-05-02 12:49:51'),
(101, '13449101.mp4', '', '', 'posts', 'video', 0, '2024-05-02 12:56:32', '2024-05-02 12:57:05'),
(109, '33800109.webp', '', '', 'posts', 'image', 0, '2024-05-04 11:20:14', '2024-05-04 11:20:15'),
(110, '13726110.webp', '', '', 'posts', 'image', 0, '2024-05-04 11:21:01', '2024-05-04 11:21:01'),
(111, '75674111.webp', '', '', 'posts', 'image', 0, '2024-05-04 11:22:52', '2024-05-04 11:22:53'),
(116, '95278116.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:08:19', '2024-05-06 09:08:19'),
(117, '56977117.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:08:50', '2024-05-06 09:08:50'),
(118, '71991118.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:10:02', '2024-05-06 09:10:02'),
(119, '80832119.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:10:41', '2024-05-06 09:10:41'),
(233, '24720233.pdf', '', '', 'categories', 'pdf', 0, '2024-05-09 11:57:49', '2024-05-09 12:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `media_posts`
--

DROP TABLE IF EXISTS `media_posts`;
CREATE TABLE IF NOT EXISTS `media_posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `main_table` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `status` int DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_posts`
--

INSERT INTO `media_posts` (`id`, `media_id`, `category_id`, `post_id`, `main_table`, `sequence`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(3, 77, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 12:59:32', '2024-04-28 12:59:32'),
(4, 78, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 13:04:03', '2024-04-28 13:04:03'),
(5, 79, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 13:11:16', '2024-04-28 13:11:16'),
(6, 80, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 13:11:16', '2024-04-28 13:11:16'),
(25, 99, NULL, 13, NULL, 0, 1, NULL, '2024-05-02 12:49:51', '2024-05-02 12:49:51'),
(27, 101, NULL, 13, NULL, 0, 1, NULL, '2024-05-02 12:56:32', '2024-05-02 12:56:32'),
(35, 109, NULL, 15, NULL, 0, 1, NULL, '2024-05-04 11:20:15', '2024-05-04 11:20:15'),
(36, 110, NULL, 16, NULL, 0, 1, NULL, '2024-05-04 11:21:01', '2024-05-04 11:21:01'),
(37, 111, NULL, 17, NULL, 0, 1, NULL, '2024-05-04 11:22:53', '2024-05-04 11:22:53'),
(42, 116, NULL, 24, NULL, 0, 1, NULL, '2024-05-06 09:08:19', '2024-05-06 09:08:19'),
(43, 117, NULL, 22, NULL, 0, 1, NULL, '2024-05-06 09:08:50', '2024-05-06 09:08:50'),
(44, 118, NULL, 25, NULL, 0, 1, NULL, '2024-05-06 09:10:02', '2024-05-06 09:10:02'),
(45, 119, NULL, 23, NULL, 0, 1, NULL, '2024-05-06 09:10:41', '2024-05-06 09:10:41'),
(159, 233, 17, NULL, NULL, 0, 1, NULL, '2024-05-09 11:57:49', '2024-05-09 11:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `media_projects`
--

DROP TABLE IF EXISTS `media_projects`;
CREATE TABLE IF NOT EXISTS `media_projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint UNSIGNED DEFAULT NULL,
  `media_id` bigint UNSIGNED DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `status` int DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_projects`
--

INSERT INTO `media_projects` (`id`, `created_at`, `updated_at`, `project_id`, `media_id`, `sequence`, `status`, `notes`) VALUES
(15, '2024-04-13 20:22:09', '2024-04-13 20:22:09', 4, 15, 0, 1, NULL),
(24, '2024-04-19 08:00:11', '2024-04-19 08:00:11', 6, 24, 0, 1, NULL),
(42, '2024-04-19 19:56:29', '2024-04-19 19:56:29', 1, 42, 0, 1, NULL),
(43, '2024-04-19 19:56:29', '2024-04-19 19:56:29', 1, 43, 0, 1, NULL),
(45, '2024-04-19 20:25:45', '2024-04-19 20:25:45', 1, 45, 0, 1, NULL),
(47, '2024-04-19 20:25:46', '2024-04-19 20:25:46', 1, 47, 0, 1, NULL),
(50, '2024-04-19 21:48:58', '2024-04-19 21:48:58', 1, 50, 0, 1, NULL),
(51, '2024-04-19 21:57:39', '2024-04-19 21:57:39', 1, 51, 0, 1, NULL),
(74, '2024-04-20 19:42:14', '2024-04-20 19:42:14', 1, 74, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(86, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(87, '2024_04_07_111422_create_languages_table', 1),
(88, '2024_04_07_111450_create_projects_table', 1),
(89, '2024_04_07_122139_create_mediastore_table', 1),
(90, '2024_04_07_122141_create_lang_projects_table', 1),
(91, '2024_04_07_122143_create_media_projects_table', 1),
(92, '2024_04_07_124809_add_is_default_to_languages_table', 2),
(93, '2024_04_10_214827_add_metakey_to_projects_table', 3),
(94, '2024_04_11_125202_add_project_id_to_media_projects_table', 4),
(96, '2024_04_21_112202_create_settings_table', 5),
(97, '2024_04_22_145830_create_locations_table', 6),
(98, '2024_04_22_145832_create_location_settings_table', 6),
(99, '2024_04_26_161716_create_categories_table', 7),
(100, '2024_04_26_161717_create_posts_table', 7),
(101, '2024_04_26_174228_create_lang_posts_table', 8),
(102, '2024_04_26_174229_create_media_posts_table', 8),
(103, '2024_04_26_180038_add_main_table_to_location_settings_table', 9),
(104, '2024_04_26_180050_add_code_to_categories_table', 9),
(105, '2024_04_26_180057_add_code_to_posts_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_key` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `status` int DEFAULT '0',
  `update_user_id` bigint UNSIGNED DEFAULT NULL,
  `create_user_id` bigint UNSIGNED DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `meta_key`, `content`, `category_id`, `sequence`, `status`, `update_user_id`, `create_user_id`, `notes`, `created_at`, `updated_at`, `code`) VALUES
(1, 'Section 1', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'section-1'),
(2, 'Section 2', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:13', 'section-2'),
(3, 'Section 3', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:18', 'section-3'),
(4, 'Social Title', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:24', 'social-title'),
(5, 'Footer Copyright', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:29', 'footer-copyright'),
(13, 'project44', 'project44', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-02 12:48:51', '2024-05-02 13:06:14', NULL),
(15, 'project2', 'project2', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-02 12:49:21', '2024-05-02 12:49:21', NULL),
(16, 'project3', 'project3', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-02 12:49:30', '2024-05-02 12:49:30', NULL),
(17, 'project4', 'project4', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-04 11:21:58', '2024-05-04 11:21:58', NULL),
(18, 'project5', 'project5', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-04 11:22:10', '2024-05-04 11:22:10', NULL),
(22, 'TOGG - Turnkey Robotic BIW (Body in-White) Greenfield', 'togg-turnkey-robotic-biw-body-in-white-greenfield', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:03:29', '2024-05-06 09:03:29', NULL),
(23, 'FORD EUROPE - Turnkey Robotic BIW (Body in-White) Greenfield / Brownfield', 'ford-europe-turnkey-robotic-biw-body-in-white-greenfield-brownfield', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:03:39', '2024-05-06 09:03:39', NULL),
(24, 'FORD OTOSAN - Turnkey Robotic BIW (Body in-White) Greenfield', 'ford-otosan-turnkey-robotic-biw-body-in-white-greenfield', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:04:26', '2024-05-06 09:04:26', NULL),
(25, 'FORD OTOSAN - Turnkey Paint Shop Robotic PVC NVH UBS and Cosmetic Sealing', 'ford-otosan-turnkey-paint-shop-robotic-pvc-nvh-ubs-and-cosmetic-sealing', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:04:58', '2024-05-06 09:04:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `sequence` int DEFAULT '0',
  `status` int DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `notes` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `slug`, `content`, `sequence`, `status`, `category_id`, `notes`, `created_at`, `updated_at`, `metakey`) VALUES
(4, 'pro3', 'pro3', NULL, 0, 0, NULL, NULL, '2024-04-11 09:37:01', '2024-04-11 09:37:01', 'pro3');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value1` text COLLATE utf8mb4_unicode_ci,
  `name2` text COLLATE utf8mb4_unicode_ci,
  `value2` text COLLATE utf8mb4_unicode_ci,
  `name3` text COLLATE utf8mb4_unicode_ci,
  `value3` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dep` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sequence` int DEFAULT '0',
  `section` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name1`, `value1`, `name2`, `value2`, `name3`, `value3`, `category`, `dep`, `sequence`, `section`, `location`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Site Title', 'Prevalent Automation', 'Description', 'Industrial Automation to many sectors', 'Meta', 'Cement,chemecals ,Pharmaceutical , Plastics ,water ,manufacturing', 'site-info', 'title', 0, NULL, NULL, 1, NULL, '2024-04-29 17:52:18'),
(3, 'Favicon', '752143.png', 'Logo', '442003.png', NULL, NULL, 'site-info', 'logo', 0, NULL, NULL, 1, NULL, '2024-04-21 16:53:23'),
(12, 'Phone', '+905011291958', NULL, NULL, NULL, NULL, 'header-info', 'phone', 0, NULL, 'header', 1, NULL, '2024-04-29 17:55:51'),
(13, 'Email', 'info@prevalentautomation.com', NULL, NULL, NULL, NULL, 'header-info', 'email', 0, NULL, 'header', 1, NULL, '2024-04-24 13:34:22'),
(14, 'Name', 'facebook', 'Code', 'facebook', 'Link', 'https://facebook.com', 'social', '', 0, '', '', 1, '2024-04-22 17:01:22', '2024-04-22 17:01:22'),
(15, 'Name', 'youtube', 'Code', 'youtube', 'Link', 'https://youtube.com', 'social', '', 0, '', '', 1, '2024-04-22 17:01:42', '2024-04-22 17:01:42'),
(16, 'Name', 'instagram', 'Code', 'instagram', 'Link', 'https://instagram.com', 'social', '', 0, '', '', 1, '2024-04-22 17:02:03', '2024-04-22 17:02:03'),
(17, 'Name', 'twitter', 'Code', 'twitter', 'Link', 'https://twitter.com', 'social', '', 0, '', '', 1, '2024-04-22 17:02:28', '2024-04-24 14:55:26'),
(18, 'Name', 'linkedin', 'Code', 'linkedin', 'Link', 'https://www.linkedin.com/', 'social', '', 0, '', '', 1, '2024-04-24 14:57:07', '2024-04-24 14:57:07'),
(19, 'whatsapp', '+905011291958', NULL, NULL, NULL, NULL, 'site-info', 'whatsapp', 0, NULL, 'whatsapp', 1, NULL, '2024-04-30 16:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `createuser_id` bigint UNSIGNED DEFAULT NULL,
  `updateuser_id` bigint UNSIGNED DEFAULT NULL,
  `mobile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `first_name`, `last_name`, `user_name`, `role`, `token`, `createuser_id`, `updateuser_id`, `mobile`, `remember_token`, `created_at`, `updated_at`, `image`, `is_active`) VALUES
(1, 'najyms@gmail.com', NULL, NULL, '$2y$12$hmb198tlznpCuj4fUy3uW.9XBUdfNdbQe7JD52ok4VN3K8G.q3uJC', 'ahmad', 'ms', NULL, 'admin', 'cuazVdoOzmwIySszyF2Hm6:APA91bEYValX5_T_V8vxWG693VEfGlytytYEiQi3IYZ-YQ2y5cYa1riz6Ox4f15YuEokXslKmELDXjamslqiT4ySDD8cC2uQo5SURTkf3Vq87fbhfrOqeYOggOGEiz075bTAepER4dNj', NULL, 1, NULL, 'Iy9mieWRNKq898QQTxzfTm3F5VKI26C958KDMnN484ez8UgXP966x3s43PRg', '2024-01-11 12:47:38', '2024-04-09 19:57:27', '922971.webp', 1),
(3, 'admin@gmail.com', NULL, NULL, '$2y$12$CkkT3KMcnk2qq1M9HIExPOmY7JO0yJThW.9Gv08V3uPxj.aI/pY.C', 'super', 'supervisor', NULL, 'super', NULL, 1, 3, '0213456789', NULL, '2024-02-18 11:28:55', '2024-03-23 17:26:29', NULL, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
