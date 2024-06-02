-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 02, 2024 at 11:21 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(17, 'Catalog', 'catalog', NULL, 'catalog', 15, 0, 1, 1, NULL, NULL, NULL, '2024-05-09 11:50:29', 'catalog'),
(18, 'Translate', 'translate', NULL, 'translate', 0, 0, 1, 1, NULL, NULL, NULL, '2024-04-28 09:33:11', 'translate'),
(19, 'Main Banner', 'main-banner', NULL, '', 15, 0, 1, 1, NULL, NULL, NULL, '2024-05-20 18:15:12', 'main-banner'),
(20, 'Project Banner', 'project-banner', NULL, '', 15, 0, 0, 1, NULL, NULL, NULL, '2024-05-29 06:38:26', 'project-banner');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
(7, 'ar', 'العربية', NULL, 0, 1, 'ar7.svg', NULL, '2024-04-09 22:20:21', '2024-06-01 06:21:45', 0),
(8, 'en', 'English', NULL, 0, 1, 'en8.svg', NULL, '2024-04-09 22:21:07', '2024-04-24 21:32:47', 1),
(11, 'tr', 'Türkçe', NULL, 0, 1, 'tr11.svg', NULL, '2024-04-20 21:01:27', '2024-06-01 06:34:41', 0),
(12, 'de', 'Deutsch', NULL, 0, 0, 'de12.svg', NULL, '2024-04-20 21:02:33', '2024-05-22 14:45:49', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lang_posts`
--

INSERT INTO `lang_posts` (`id`, `lang_id`, `category_id`, `post_id`, `main_table`, `title_trans`, `content_trans`, `name`, `notes`, `created_at`, `updated_at`) VALUES
(1, 8, NULL, 1, NULL, 'Prevalent Automation', '<p>\r\nTurkey - Istanbul\r\n              <br>\r\n              <strong>Phone:</strong> +905011291958<br>\r\n              <strong>Email:</strong> info@prevalentautomation.com<br>\r\n            </p>', NULL, NULL, '2024-04-27 12:27:01', '2024-05-30 00:36:46'),
(2, 7, NULL, 1, NULL, 'Prevalent Automation', '<p><span style=\"font-size: 1rem;\">&nbsp;تركيا -&nbsp;</span><span style=\"font-size: 1rem;\">استانبول</span><span style=\"font-size: 1rem;\">&nbsp;</span></p><p><strong style=\"font-size: 12px;\">موبايل:</strong><span style=\"font-size: 1rem;\">905011291958+</span></p><p>\r\n              <strong style=\"font-size:10px\">بريد الكتروني :</strong><span>info@prevalentautomation.com</span>\r\n            </p>', NULL, NULL, '2024-04-27 12:28:23', '2024-06-01 06:46:38'),
(3, 8, NULL, 2, NULL, 'Useful Links', '<ul>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en\">Home</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/about-us\">About us</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/projects\">Projects</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/services\">Services</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/contacts\">Contacts</a></li>\r\n            </ul>', NULL, NULL, '2024-04-27 12:49:51', '2024-06-01 06:56:45'),
(4, 8, NULL, 3, NULL, 'Our Services', '<ul>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/services\">PLC Programming</a></li>\r\n     <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/services\">Project management</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/services\">Industrial touch screen HMI</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/services\">SCADA systems</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/en/page/services\">Image processing</a></li>\r\n            </ul>', NULL, NULL, '2024-04-27 12:53:23', '2024-05-29 22:37:58'),
(5, 8, NULL, 4, NULL, 'Our Social Networks', NULL, NULL, NULL, '2024-04-27 12:53:50', '2024-04-27 12:53:50'),
(6, 8, NULL, 5, NULL, 'Copyright', '<div class=\"copyright\">\r\n        © Copyright <strong><span>Prevalent Automation</span></strong>. All Rights Reserved\r\n      </div>\r\n      <div class=\"credits\">\r\n                 <a href=\"#\"></a>\r\n      </div>', NULL, NULL, '2024-04-27 12:58:16', '2024-04-27 14:33:46'),
(7, 7, NULL, 2, NULL, 'روابط مفيدة', '<ul>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar\">الرئيسية</a></li>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/about-us\">حولنا</a></li>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/projects\">مشاريعنا</a></li>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/services\">خدماتنا</a></li>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/contacts\">اتصل بنا</a></li>\r\n            </ul>', NULL, NULL, '2024-04-27 14:39:07', '2024-06-01 06:55:35'),
(8, 7, NULL, 3, NULL, 'خدماتنا', '<ul>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/services\">برمجة PLC</a></li>\r\n     <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/services\">إدارة المشاريع</a></li>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/services\">شاشة اللمس الصناعية HMI</a></li>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/services\">أنظمة SCADA</a></li>\r\n              <li><i class=\"bx bx-chevron-left\"></i> <a href=\"https://test.prevalentautomation.com/lang/ar/page/services\">معالجة الصور</a></li>\r\n            </ul>', NULL, NULL, '2024-04-27 14:39:35', '2024-06-01 06:59:44'),
(9, 7, 3, NULL, NULL, 'الشركة', NULL, NULL, NULL, '2024-04-28 09:34:34', '2024-04-28 09:34:34'),
(10, 8, 3, NULL, NULL, 'Company', NULL, NULL, NULL, '2024-04-28 09:34:41', '2024-04-28 09:34:41'),
(11, 8, 4, NULL, NULL, 'Projects', '<p>Our Projects</p>', NULL, NULL, '2024-04-28 09:35:32', '2024-05-18 18:48:41'),
(12, 7, 4, NULL, NULL, 'مشاريعنا', '<p>مشاريعنا</p>', NULL, NULL, '2024-04-28 09:36:24', '2024-05-19 20:06:25'),
(13, 7, 5, NULL, NULL, 'المنتجات', NULL, NULL, NULL, '2024-04-28 09:37:00', '2024-04-28 09:37:00'),
(14, 8, 5, NULL, NULL, 'Products', '<p>Our Products</p>', NULL, NULL, '2024-04-28 09:37:04', '2024-06-02 12:43:03'),
(15, 8, 6, NULL, NULL, 'Services', '<p>Our Services</p>', NULL, NULL, '2024-04-28 09:37:31', '2024-05-27 16:56:36'),
(16, 7, 6, NULL, NULL, 'خدماتنا', NULL, NULL, NULL, '2024-04-28 09:38:00', '2024-04-28 09:38:00'),
(17, 8, 7, NULL, NULL, 'Contacts', '<div class=\"section-title\">\r\n       \r\n          <h3><span>Contact Us</span></h3>\r\n          <p></p>\r\n        </div>\r\n\r\n        <div class=\"row\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"info-box mb-4\">\r\n              <i class=\"bx bx-map\"></i>\r\n              <h3>Our Address</h3>\r\n              <p>Turkey - Istanbul</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-envelope\"></i>\r\n              <h3>Email Us</h3>\r\n              <p>info@prevalentautomation.com</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-phone-call\"></i>\r\n              <h3>Call Us</h3>\r\n              <p>+905011291958</p>\r\n            </div>\r\n          </div>\r\n\r\n        </div>', NULL, NULL, '2024-04-28 09:38:38', '2024-06-01 10:37:51'),
(18, 7, 7, NULL, NULL, 'اتصل بنا', '<div class=\"section-title\">\r\n           \r\n          <h3><span>اتصل بنا</span></h3>\r\n          <p></p>\r\n        </div>\r\n\r\n        <div class=\"row\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"info-box mb-4\">\r\n              <i class=\"bx bx-map\"></i>\r\n              <h3>العنوان</h3>\r\n              <p style=\"font-size:18px;\"> تركيا - استانبول </p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-envelope\"></i>\r\n              <h3>البريد الالكتروني</h3>\r\n              <p style=\"font-size:18px;\">info@prevalentautomation.com</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-phone-call\"></i>\r\n              <h3>موبايل</h3>\r\n              <p style=\"font-size:18px;\">905011291958+</p>\r\n            </div>\r\n          </div>\r\n\r\n        </div>', NULL, NULL, '2024-04-28 09:38:51', '2024-06-01 10:50:27'),
(19, 8, 8, NULL, NULL, 'Career', NULL, NULL, NULL, '2024-04-28 09:40:43', '2024-04-28 09:40:43'),
(20, 7, 8, NULL, NULL, 'الوظائف', NULL, NULL, NULL, '2024-04-28 09:40:53', '2024-04-28 09:40:53'),
(21, 8, 9, NULL, NULL, 'About Us', '<!-- ======= Services Section ======= -->\r\n    <section id=\"services\" class=\"services about-content\">\r\n      <div class=\"container\" data-aos=\"fade-up\">\r\n\r\n        <div class=\"section-title\">\r\n           \r\n         \r\n           </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch\" data-aos=\"zoom-in\" data-aos-delay=\"100\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bxl-dribbble\"></i></div>\r\n              <h4><a href=\"\">About Us</a></h4>\r\n              <p>The Co-founder of PreValent was based on the ideas of a group of experienced Electrical-Electronic Engineer in 2008. PreValent which was established on this basis was incorporated in 2018. It provides service in Industrial Automation to many sectors especially in Cement,chemecals ,Pharmaceutical , Plastics , and water treament manufacturing.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0\" data-aos=\"zoom-in\" data-aos-delay=\"200\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-file\"></i></div>\r\n              <h4><a href=\"\">Our Mission</a></h4>\r\n              <p>PreValent Automation has undertaken the mission of contributing to our country\'s industrialization and international expansion with the services it provides and performs in the market. Strong capital and know-how, experienced and competent manpower, flexible organizational structure, high quality and diverse service portfolio are our biggest sources of power supporting our mission.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0\" data-aos=\"zoom-in\" data-aos-delay=\"300\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-tachometer\"></i></div>\r\n              <h4><a href=\"\">Our Vision</a></h4>\r\n              <p>In constantly developing/changing Turkey and the world economy, to contribute the environment and country\'s economy with a high level of service.\r\n\r\nUnderstanding of efficient and determined work, timely and complete fulfillment of the responsibilities undertaken, absolute customer satisfaction, prioritizing human relations, demonstrating maximum diligence in every job, big or small, never compromising on quality, maintaining a peaceful business life with our employees.</p>\r\n            </div>\r\n          </div>\r\n\r\n         \r\n        </div>\r\n\r\n      </div>\r\n    </section><!-- End Services Section -->', NULL, NULL, '2024-04-28 14:50:22', '2024-04-29 17:08:54'),
(22, 7, 9, NULL, NULL, 'حولنا', '<!-- ======= Services Section ======= -->\r\n    <section id=\"services\" class=\"services about-content\">\r\n      <div class=\"container\" data-aos=\"fade-up\">\r\n\r\n        <div class=\"section-title\">\r\n           \r\n         \r\n           </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch\" data-aos=\"zoom-in\" data-aos-delay=\"100\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bxl-dribbble\"></i></div>\r\n              <h4><a href=\"\">حولنا</a></h4>\r\n              <p style=\"text-align: justify; \">اعتمد المؤسس المشارك لشركة PreValent على أفكار مجموعة من المهندسين الكهربائيين والإلكترونيين ذوي الخبرة في عام 2008. تأسست شركة PreValent التي تم تأسيسها على هذا الأساس في عام 2018. وهي تقدم خدمة الأتمتة الصناعية للعديد من القطاعات خاصة في مجال الأسمنت والمواد الكيميائية والصناعات الكيماوية. صناعة الأدوية والبلاستيك ومعالجة المياه.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0\" data-aos=\"zoom-in\" data-aos-delay=\"200\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-file\"></i></div>\r\n              <h4><a href=\"\">مهمتنا</a></h4>\r\n              <p style=\"text-align: justify; \">لقد تولت شركة PreValent Automation مهمة المساهمة في التصنيع والتوسع الدولي في بلدنا من خلال الخدمات التي تقدمها وتنفذها في السوق. رأس المال القوي والمعرفة، والقوى العاملة ذات الخبرة والكفاءة، والهيكل التنظيمي المرن، والجودة العالية ومجموعة الخدمات المتنوعة هي أكبر مصادر القوة التي تدعم مهمتنا.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0\" data-aos=\"zoom-in\" data-aos-delay=\"300\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-tachometer\"></i></div>\r\n              <h4><a href=\"\">رؤيتنا</a></h4>\r\n              <p style=\"text-align: justify; \">في التطوير/التغيير المستمر لتركيا والاقتصاد العالمي، للمساهمة في البيئة واقتصاد البلاد بمستوى عالٍ من الخدمة. فهم العمل الفعال والحازم، والوفاء الكامل وفي الوقت المناسب بالمسؤوليات المضطلع بها، والرضا التام للعملاء، وإعطاء الأولوية للعلاقات الإنسانية، وإظهار أقصى قدر من الاجتهاد في كل وظيفة، كبيرة كانت أم صغيرة، وعدم المساومة على الجودة أبدًا، والحفاظ على حياة عمل سلمية مع موظفينا.</p>\r\n            </div>\r\n          </div>\r\n\r\n         \r\n        </div>\r\n\r\n      </div>\r\n    </section><!-- End Services Section -->', NULL, NULL, '2024-04-28 14:57:12', '2024-05-19 20:03:49'),
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
(39, 11, 4, NULL, NULL, 'Projeler', '<p>Projelerimiz</p>', NULL, NULL, '2024-04-29 17:29:21', '2024-06-01 07:16:35'),
(40, 12, 4, NULL, NULL, 'Projecten', NULL, NULL, NULL, '2024-04-29 17:29:35', '2024-05-01 14:06:39'),
(41, 12, 5, NULL, NULL, 'Produkte', NULL, NULL, NULL, '2024-04-29 17:30:23', '2024-04-29 17:30:23'),
(42, 11, 5, NULL, NULL, 'Ürünler', NULL, NULL, NULL, '2024-04-29 17:30:36', '2024-04-29 17:30:36'),
(43, 11, 6, NULL, NULL, 'Hizmetler', NULL, NULL, NULL, '2024-04-29 17:31:29', '2024-04-29 17:31:29'),
(44, 12, 6, NULL, NULL, 'Diensten', NULL, NULL, NULL, '2024-04-29 17:32:14', '2024-04-29 17:32:14'),
(45, 12, 7, NULL, NULL, 'Contacten', '<div class=\"section-title\">\r\n          <h2>Contact</h2>\r\n          <h3><span>Contact Us</span></h3>\r\n          <p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis est adipisci expedita at voluptas atque vitae autem.</p>\r\n        </div>\r\n\r\n        <div class=\"row\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"info-box mb-4\">\r\n              <i class=\"bx bx-map\"></i>\r\n              <h3>Our Address</h3>\r\n              <p>A108 Adam Street, New York, NY 535022</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-envelope\"></i>\r\n              <h3>Email Us</h3>\r\n              <p>contact@example.com</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-phone-call\"></i>\r\n              <h3>Call Us</h3>\r\n              <p>+1 5589 55488 55</p>\r\n            </div>\r\n          </div>\r\n\r\n        </div>', NULL, NULL, '2024-04-29 17:32:55', '2024-05-12 09:41:16'),
(46, 11, 7, NULL, NULL, 'Kişiler', '<div class=\"section-title\">\r\n       \r\n          <h3><span>Kişiler</span></h3>\r\n          <p></p>\r\n        </div>\r\n\r\n        <div class=\"row\" data-aos=\"fade-up\" data-aos-delay=\"100\">\r\n          <div class=\"col-lg-6\">\r\n            <div class=\"info-box mb-4\">\r\n              <i class=\"bx bx-map\"></i>\r\n              <h3>Adres</h3>\r\n              <p>Türkiye - İstanbul</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-envelope\"></i>\r\n              <h3>E-posta</h3>\r\n              <p>info@prevalentautomation.com</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-3 col-md-6\">\r\n            <div class=\"info-box  mb-4\">\r\n              <i class=\"bx bx-phone-call\"></i>\r\n              <h3>Telefon</h3>\r\n              <p>+905011291958</p>\r\n            </div>\r\n          </div>\r\n\r\n        </div>', NULL, NULL, '2024-04-29 17:33:10', '2024-06-01 10:47:10'),
(47, 11, 8, NULL, NULL, 'Kariyer', NULL, NULL, NULL, '2024-04-29 17:33:48', '2024-04-29 17:33:48'),
(48, 12, 8, NULL, NULL, 'Carrière', NULL, NULL, NULL, '2024-04-29 17:34:04', '2024-04-29 17:34:04'),
(49, 12, 9, NULL, NULL, 'Over ons', NULL, NULL, NULL, '2024-04-29 17:35:25', '2024-04-29 17:35:25'),
(50, 11, 9, NULL, NULL, 'Hakkımızda', '<!-- ======= Services Section ======= -->\r\n    <section id=\"services\" class=\"services about-content\">\r\n      <div class=\"container\" data-aos=\"fade-up\">\r\n\r\n        <div class=\"section-title\">\r\n           \r\n         \r\n           </div>\r\n\r\n        <div class=\"row\">\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch\" data-aos=\"zoom-in\" data-aos-delay=\"100\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bxl-dribbble\"></i></div>\r\n              <h4><a href=\"\">Hakkımızda</a></h4>\r\n              <p>PreValent Kurucu Ortağı, 2008 yılında bir grup deneyimli Elektrik-Elektronik Mühendisinin fikirlerine dayanarak kurulmuştur. Bu temel üzerine kurulan PreValent, 2018 yılında kurulmuştur. Çimento, kimya, kimya başta olmak üzere birçok sektöre Endüstriyel Otomasyon konusunda hizmet vermektedir. İlaç, Plastik ve su arıtma imalatı.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0\" data-aos=\"zoom-in\" data-aos-delay=\"200\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-file\"></i></div>\r\n              <h4><a href=\"\">Görevimiz</a></h4>\r\n              <p>PreValent Otomasyon, pazarda sunduğu ve gerçekleştirdiği hizmetlerle ülkemizin sanayileşmesine ve uluslararası büyümesine katkıda bulunma misyonunu üstlenmiştir. Güçlü sermaye ve bilgi birikimi, deneyimli ve yetkin insan gücü, esnek organizasyon yapısı, kaliteli ve çeşitli hizmet portföyü misyonumuzu destekleyen en büyük güç kaynaklarımızdır.</p>\r\n            </div>\r\n          </div>\r\n\r\n          <div class=\"col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0\" data-aos=\"zoom-in\" data-aos-delay=\"300\">\r\n            <div class=\"icon-box\">\r\n              <div class=\"icon\"><i class=\"bx bx-tachometer\"></i></div>\r\n              <h4><a href=\"\">Vizyonumuz</a></h4>\r\n              <p>Sürekli gelişen/değişen Türkiye ve dünya ekonomisine, çevreye ve ülke ekonomisine üst düzeyde hizmetle katkıda bulunmak.\r\n\r\nVerimli ve kararlı çalışma anlayışı, üstlenilen sorumlulukların zamanında ve eksiksiz yerine getirilmesi, mutlak müşteri memnuniyeti, insan ilişkilerini ön planda tutmak, büyük küçük her işte maksimum titizlik göstermek, kaliteden asla ödün vermemek, çalışanlarımızla huzurlu bir iş hayatı sürdürmek.</p>\r\n            </div>\r\n          </div>\r\n\r\n         \r\n        </div>\r\n\r\n      </div>\r\n    </section><!-- End Services Section -->', NULL, NULL, '2024-04-29 17:36:39', '2024-06-01 07:13:39'),
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
(63, 7, NULL, 13, NULL, 'خلط الخرسانة الاسمنتية', 'تم تنفيذ المشروع باستخدام Siemens PLCs وWINCC SCADA وقاعدة بيانات SQL (PLC: S71200، WINCC: TIA Professional)', NULL, NULL, '2024-05-03 20:19:30', '2024-05-19 20:09:47'),
(64, 8, NULL, 13, NULL, 'Cement Concrete Mixing', 'The project had been executed by using Siemens PLCs ,WINCC SCADA , and SQL database (PLC : S71200 , WINCC : TIA professional)', NULL, NULL, '2024-05-03 20:21:14', '2024-05-18 18:43:33'),
(65, 8, NULL, 15, NULL, 'Waste Water Treatment', 'The project had been executed by using Siemens PLCs S7400, and WINCC explorer SCADA system including the reporting system and smart alarming by using SMS or emails.', NULL, NULL, '2024-05-04 11:20:04', '2024-05-18 18:42:11'),
(66, 8, NULL, 16, NULL, 'Cement Plant Example', 'We had been involved with FLSmidth team of commissioning , operating , and maintenance of the cement plant of HOLCIM group during 2009 till 2014.<br>we were responsible about automation plc programming especially S7300 , and S7400 PLCs including Proface HMIs.', NULL, NULL, '2024-05-04 11:20:51', '2024-05-22 14:29:53'),
(67, 8, NULL, 17, NULL, 'Clean Water Pump Station', 'We had used Siemens S71500 PLCs via TIA  portal V17 platform to communicate with power 5 system via modbus TCP/IP protocol and PROFIBUS communication to control with SIPROTEC protection relay of 12 clean water pumps of barrage', NULL, NULL, '2024-05-04 11:22:27', '2024-05-20 13:20:11'),
(68, 7, NULL, 17, NULL, 'محطة ضخ المياه النظيفة', 'لقد استخدمنا Siemens S71500 PLCs عبر منصة TIA Portal V17 للتواصل مع نظام power 5 عبر بروتوكول modbus TCP/IP واتصال PROFIBUS للتحكم مع مرحل حماية SIPROTEC لـ 12 مضخة مياه نظيفة من الوابل', NULL, NULL, '2024-05-04 11:22:34', '2024-06-01 09:57:52'),
(70, 8, 16, NULL, NULL, 'References', '<h2></h2>\r\n<p>References</p>', NULL, NULL, '2024-05-04 13:50:46', '2024-05-16 15:42:29'),
(74, 8, NULL, 25, NULL, 'ABB', NULL, NULL, NULL, '2024-05-06 09:05:26', '2024-05-16 15:34:34'),
(75, 8, NULL, 22, NULL, 'Siemens', NULL, NULL, NULL, '2024-05-06 09:05:46', '2024-05-16 15:32:40'),
(76, 8, NULL, 23, NULL, 'Omron', NULL, NULL, NULL, '2024-05-06 09:06:03', '2024-05-16 14:09:32'),
(77, 8, NULL, 24, NULL, 'Schneider', NULL, NULL, NULL, '2024-05-06 09:06:19', '2024-05-16 15:34:10'),
(78, 8, 17, NULL, NULL, 'Catalog', NULL, NULL, NULL, '2024-05-08 11:03:47', '2024-05-08 11:03:47'),
(79, 7, 17, NULL, NULL, 'الكاتالوج', NULL, NULL, NULL, '2024-05-08 11:04:04', '2024-05-08 11:04:04'),
(80, 11, 17, NULL, NULL, 'Katalog', NULL, NULL, NULL, '2024-05-09 12:05:27', '2024-05-09 12:05:27'),
(81, 8, NULL, 26, NULL, 'Your Name', NULL, NULL, NULL, '2024-05-12 09:19:07', '2024-05-12 09:19:07'),
(82, 7, NULL, 26, NULL, 'الاسم', NULL, NULL, NULL, '2024-05-12 09:19:33', '2024-05-12 09:19:33'),
(83, 7, NULL, 27, NULL, 'البريد الالكتروني', NULL, NULL, NULL, '2024-05-12 09:21:04', '2024-05-12 09:21:04'),
(84, 8, NULL, 28, NULL, 'Subject', NULL, NULL, NULL, '2024-05-12 09:22:49', '2024-05-12 09:22:49'),
(85, 7, NULL, 28, NULL, 'الموضوع', NULL, NULL, NULL, '2024-05-12 09:23:19', '2024-05-12 09:23:19'),
(86, 8, NULL, 29, NULL, 'Message', NULL, NULL, NULL, '2024-05-12 09:23:46', '2024-05-12 09:23:46'),
(87, 7, NULL, 29, NULL, 'نص الرسالة', NULL, NULL, NULL, '2024-05-12 09:23:55', '2024-05-12 09:23:55'),
(88, 8, NULL, 30, NULL, 'Send Message', NULL, NULL, NULL, '2024-05-12 09:24:43', '2024-05-12 09:24:43'),
(89, 7, NULL, 30, NULL, 'ارسال', NULL, NULL, NULL, '2024-05-12 09:24:50', '2024-05-12 09:24:50'),
(90, 7, NULL, 32, NULL, 'فشل في ارسال الرسالة', NULL, NULL, NULL, '2024-05-12 09:27:11', '2024-05-13 07:45:13'),
(91, 8, NULL, 32, NULL, 'Failed to send message!', NULL, NULL, NULL, '2024-05-12 09:27:15', '2024-05-13 07:41:50'),
(92, 8, NULL, 31, NULL, 'Your message has been sent. Thank you!', NULL, NULL, NULL, '2024-05-12 09:33:24', '2024-05-12 09:33:24'),
(93, 7, NULL, 31, NULL, 'تم الارسال بنجاح. شكرا لك!', '<p><br></p>', NULL, NULL, '2024-05-12 09:34:39', '2024-05-12 09:34:39'),
(94, 8, NULL, 27, NULL, 'Your Email', NULL, NULL, NULL, '2024-05-12 13:17:10', '2024-05-12 13:17:10'),
(95, 11, NULL, 26, NULL, 'Adınız', NULL, NULL, NULL, '2024-05-13 07:24:05', '2024-05-13 07:24:05'),
(96, 12, NULL, 26, NULL, 'Uw naam', NULL, NULL, NULL, '2024-05-13 07:24:31', '2024-05-13 07:24:47'),
(97, 12, NULL, 27, NULL, 'Jouw email', NULL, NULL, NULL, '2024-05-13 07:26:00', '2024-05-13 07:26:00'),
(98, 11, NULL, 27, NULL, 'E-posta adresiniz', NULL, NULL, NULL, '2024-05-13 07:26:13', '2024-05-13 07:26:13'),
(99, 11, NULL, 28, NULL, 'Ders', NULL, NULL, NULL, '2024-05-13 07:27:07', '2024-05-13 07:27:07'),
(100, 12, NULL, 28, NULL, 'Onderwerp', NULL, NULL, NULL, '2024-05-13 07:27:23', '2024-05-13 07:27:23'),
(101, 12, NULL, 29, NULL, 'Bericht', NULL, NULL, NULL, '2024-05-13 07:28:59', '2024-05-13 07:28:59'),
(102, 11, NULL, 29, NULL, 'İleti', NULL, NULL, NULL, '2024-05-13 07:29:54', '2024-05-13 07:29:54'),
(103, 11, NULL, 30, NULL, 'Göndermek', NULL, NULL, NULL, '2024-05-13 07:32:34', '2024-05-13 07:32:34'),
(104, 12, NULL, 30, NULL, 'versturen', NULL, NULL, NULL, '2024-05-13 07:32:59', '2024-05-13 07:32:59'),
(105, 12, NULL, 31, NULL, 'Je bericht is verzonden. Bedankt!', NULL, NULL, NULL, '2024-05-13 07:34:26', '2024-05-13 07:34:26'),
(106, 11, NULL, 31, NULL, 'Mesajınız gönderildi. Teşekkür ederim!', NULL, NULL, NULL, '2024-05-13 07:34:38', '2024-05-13 07:34:38'),
(107, 11, NULL, 32, NULL, 'Mesaj gönderilemedi!', NULL, NULL, NULL, '2024-05-13 07:43:35', '2024-05-13 07:43:35'),
(108, 12, NULL, 32, NULL, 'Kan bericht niet verzenden!', NULL, NULL, NULL, '2024-05-13 07:43:56', '2024-05-13 07:43:56'),
(109, 8, NULL, 33, NULL, 'Sick', NULL, NULL, NULL, '2024-05-16 14:12:15', '2024-05-16 14:12:15'),
(110, 8, NULL, 34, NULL, 'Balluf', NULL, NULL, NULL, '2024-05-16 14:13:13', '2024-05-16 14:13:13'),
(111, 8, NULL, 35, NULL, 'Euchner', NULL, NULL, NULL, '2024-05-16 14:13:50', '2024-05-16 14:13:50'),
(112, 8, NULL, 36, NULL, 'HOLCIM GROUP', NULL, NULL, NULL, '2024-05-16 14:14:23', '2024-05-16 14:14:23'),
(113, 8, NULL, 37, NULL, 'more..', NULL, NULL, NULL, '2024-05-18 18:02:56', '2024-05-18 18:02:56'),
(114, 7, NULL, 37, NULL, 'المزيد...', NULL, NULL, NULL, '2024-05-18 18:02:59', '2024-05-18 18:02:59'),
(115, 7, NULL, 22, NULL, 'Siemens', NULL, NULL, NULL, '2024-05-19 18:14:31', '2024-05-19 18:14:31'),
(116, 11, NULL, 22, NULL, 'Siemens', NULL, NULL, NULL, '2024-05-19 18:14:37', '2024-05-19 18:14:37'),
(117, 12, NULL, 22, NULL, 'Siemens', NULL, NULL, NULL, '2024-05-19 18:14:39', '2024-05-19 18:14:39'),
(118, 7, NULL, 23, NULL, 'Omron', NULL, NULL, NULL, '2024-05-19 18:14:57', '2024-05-19 18:14:57'),
(119, 11, NULL, 23, NULL, 'Omron', NULL, NULL, NULL, '2024-05-19 18:15:00', '2024-05-19 18:15:00'),
(120, 12, NULL, 23, NULL, 'Omron', NULL, NULL, NULL, '2024-05-19 18:15:02', '2024-05-19 18:15:02'),
(121, 7, NULL, 24, NULL, 'Schneider', NULL, NULL, NULL, '2024-05-19 18:15:25', '2024-05-19 18:15:25'),
(122, 11, NULL, 24, NULL, 'Schneider', NULL, NULL, NULL, '2024-05-19 18:15:27', '2024-05-19 18:15:27'),
(123, 12, NULL, 24, NULL, 'Schneider', NULL, NULL, NULL, '2024-05-19 18:15:29', '2024-05-19 18:15:29'),
(124, 7, NULL, 25, NULL, 'ABB', NULL, NULL, NULL, '2024-05-19 18:16:04', '2024-05-19 18:16:04'),
(125, 11, NULL, 25, NULL, 'ABB', NULL, NULL, NULL, '2024-05-19 18:16:07', '2024-05-19 18:16:07'),
(126, 12, NULL, 25, NULL, 'ABB', NULL, NULL, NULL, '2024-05-19 18:16:09', '2024-05-19 18:16:09'),
(127, 7, NULL, 33, NULL, 'Sick', NULL, NULL, NULL, '2024-05-19 18:16:28', '2024-05-19 18:16:28'),
(128, 11, NULL, 33, NULL, 'Sick', NULL, NULL, NULL, '2024-05-19 18:16:31', '2024-05-19 18:16:31'),
(129, 12, NULL, 33, NULL, 'Sick', NULL, NULL, NULL, '2024-05-19 18:16:33', '2024-05-19 18:16:33'),
(130, 7, NULL, 34, NULL, 'Balluf', NULL, NULL, NULL, '2024-05-19 18:16:50', '2024-05-19 18:16:50'),
(131, 11, NULL, 34, NULL, 'Balluf', NULL, NULL, NULL, '2024-05-19 18:16:53', '2024-05-19 18:16:53'),
(132, 12, NULL, 34, NULL, 'Balluf', NULL, NULL, NULL, '2024-05-19 18:16:55', '2024-05-19 18:16:55'),
(133, 7, NULL, 35, NULL, 'Euchner', NULL, NULL, NULL, '2024-05-19 18:17:10', '2024-05-19 18:17:10'),
(134, 11, NULL, 35, NULL, 'Euchner', NULL, NULL, NULL, '2024-05-19 18:17:13', '2024-05-19 18:17:13'),
(135, 12, NULL, 35, NULL, 'Euchner', NULL, NULL, NULL, '2024-05-19 18:17:15', '2024-05-19 18:17:15'),
(136, 7, NULL, 36, NULL, 'HOLCIM GROUP', NULL, NULL, NULL, '2024-05-19 18:17:33', '2024-05-19 18:17:33'),
(137, 11, NULL, 36, NULL, 'HOLCIM GROUP', NULL, NULL, NULL, '2024-05-19 18:17:35', '2024-05-19 18:17:35'),
(138, 12, NULL, 36, NULL, 'HOLCIM GROUP', NULL, NULL, NULL, '2024-05-19 18:17:37', '2024-05-19 18:17:37'),
(139, 7, NULL, 4, NULL, 'التواصل الاجتماعي', NULL, NULL, NULL, '2024-05-19 18:49:24', '2024-05-19 18:49:24'),
(140, 7, NULL, 5, NULL, 'Copyright', '<div class=\"copyright\">\r\n        جميع الحقوق محفوظة ©<strong><span style=\"font-family:sans-serif;\">Prevalent Automation</span></strong>.\r\n      </div>\r\n      <div class=\"credits\">\r\n                 <a href=\"#\"></a>\r\n      </div>', NULL, NULL, '2024-05-19 18:53:48', '2024-05-19 18:56:45'),
(141, 7, NULL, 15, NULL, 'معالجة مياه الصرف الصحي', 'تم تنفيذ المشروع باستخدام Siemens PLCs S7400 ونظام WINCC explorer SCADA بما في ذلك نظام التقارير والإنذار الذكي باستخدام الرسائل القصيرة أو رسائل البريد الإلكتروني.', NULL, NULL, '2024-05-19 20:12:17', '2024-05-19 20:12:17'),
(142, 8, NULL, 40, NULL, 'Rewinding and Winding Machine', 'Rewinding and Winding Machine of the Textile products:\r\n<br>\r\nWe had achieved the designing, programming , and commissioning of Winding line of clothes and textiles which control the tensions , length and process of the rollers.', NULL, NULL, '2024-05-20 15:12:58', '2024-05-20 15:45:41'),
(143, 8, NULL, 39, NULL, 'Laundry Machine Body Welding Line', 'We had upgraded the automation system of Laundry machine body welding line automation system from Siemens S5 to Siemens S7.', NULL, NULL, '2024-05-20 15:24:11', '2024-05-20 15:41:02'),
(144, 8, NULL, 38, NULL, 'Automatic Roll WareHouse System', 'Automatic Roll WareHouse System of textile rollers had been done by using Siemens S71500 , Basic HMI , and 4 axis Siemens SINAMICs drives S7210<br> this kind of machines used to the rollers in rows to earn more spaces at factories.', NULL, NULL, '2024-05-20 15:30:46', '2024-05-20 15:32:52'),
(145, 8, NULL, 41, NULL, 'Iron Dome Press Machine', 'We had upgraded the automation system of Iron Dome Press Machine form Siemens S5 to Siemens S7.<br>The machine could record the events and playback them according the operator action at the machine by using C# desktop tool which writing all the events at SQL database', NULL, NULL, '2024-05-20 15:48:44', '2024-05-20 15:48:44'),
(146, 8, 19, NULL, NULL, 'Prevalent Automation', '<h1><span> Prevalent Automation</span></h1>\r\n            <h2> Industrial Automation to many sectors</h2>', NULL, NULL, '2024-05-20 18:09:53', '2024-05-20 18:09:53'),
(147, 7, 19, NULL, NULL, 'Prevalent Automation', '<h1><span> Prevalent Automation</span></h1>\r\n            <h2> Industrial Automation to many sectors</h2>', NULL, NULL, '2024-05-20 18:10:14', '2024-05-20 18:10:14'),
(148, 8, NULL, 42, NULL, 'Fuel Boiler System', 'The heavy fuel system used with many manufacturing like Cement, so the customer asked from us to design HMI system according to exist PI&amp;&amp;D and PLC programming according to algorithms had been done by the process team', NULL, NULL, '2024-05-21 17:08:28', '2024-05-22 14:31:10'),
(149, 8, NULL, 43, NULL, 'ABB Drives Commissioning', 'We are comfortable to give full automation , troubleshooting services , and maintenance of ABB drives', NULL, NULL, '2024-05-26 19:27:15', '2024-05-26 19:27:46'),
(150, 8, NULL, 44, NULL, 'HYDRAULIC PROJECT EXAMPLE', 'Heavy equipment hoist and hydraulic control like reclaimer and stacker of cement manufacturing electrical panel design , PLC programming , and maintenance', NULL, NULL, '2024-05-26 19:34:47', '2024-05-26 19:35:36'),
(151, 8, NULL, 45, NULL, 'Roll Form Cut Machines', 'Roll Forming Machine Line Electrical Panel Designing , PLC programming , Commissioning , and maintenance <br>The machine consisted of five servo drives one as master positioner and four as speed salves.<br>The slaves moved according to the master movement.<br>The master moved according set points map set from the HMI from the operator', NULL, NULL, '2024-05-26 19:57:33', '2024-05-26 19:57:33'),
(152, 8, NULL, 47, NULL, 'SCADA system', 'Installation , designing , and commissioning of the SCADA system of water streaming System by using PID control', NULL, NULL, '2024-05-26 20:03:38', '2024-05-26 20:03:38'),
(153, 8, NULL, 46, NULL, 'REFRIGERATOR INJECTOR LINE', 'Electrical Panel Designing , PLC , SCADA programming , and operation of the refrigerator machine &nbsp; line foaming injection process', NULL, NULL, '2024-05-26 20:16:59', '2024-05-26 20:16:59'),
(154, 8, NULL, 48, NULL, 'PLC Programming', '<p>Including&nbsp; programming , Commissioning , System operation , and maintenance<br></p>', NULL, NULL, '2024-05-27 16:41:44', '2024-05-29 22:34:45'),
(155, 8, NULL, 53, NULL, 'Siemens PCS', NULL, NULL, NULL, '2024-05-27 16:44:43', '2024-05-27 16:44:43'),
(156, 8, NULL, 49, NULL, 'Project management', '<p>Including Project estimation , designing , cost , and real time expectation of the project<br></p>', NULL, NULL, '2024-05-27 16:45:18', '2024-05-27 16:45:18'),
(157, 8, NULL, 50, NULL, 'Industrial touch screen HMI', '<p>Designing&nbsp; , programming and communications (Siemens , OMRON ,ABB , Schnieder)</p>', NULL, NULL, '2024-05-27 16:46:32', '2024-05-27 16:46:32'),
(158, 8, NULL, 51, NULL, 'SCADA systems', '<p>Including WINCC , Wonderware , C# , C++ , and PHP<br></p>', NULL, NULL, '2024-05-27 16:47:04', '2024-05-27 16:47:04'),
(159, 8, NULL, 52, NULL, 'Image processing', '<p>(Keyence and C++)<br></p>', NULL, NULL, '2024-05-27 16:47:34', '2024-05-27 16:47:34'),
(160, 8, NULL, 54, NULL, 'SINAMICs Drives', '<p>(S110, S120 ,S150 , G120C, G120)<br></p>', NULL, NULL, '2024-05-27 16:48:37', '2024-05-27 16:48:37'),
(161, 8, NULL, 55, NULL, 'ABB drives', NULL, NULL, NULL, '2024-05-27 16:49:05', '2024-05-27 16:49:05'),
(162, 8, NULL, 56, NULL, 'SCHNEIDER AVITAR Drives', NULL, NULL, NULL, '2024-05-27 16:49:29', '2024-05-27 16:49:29'),
(163, 8, NULL, 57, NULL, 'DANFOSS Drives', NULL, NULL, NULL, '2024-05-27 16:49:52', '2024-05-27 16:49:52'),
(164, 8, NULL, 58, NULL, 'LENZE Drives', NULL, NULL, NULL, '2024-05-27 16:50:13', '2024-05-27 16:50:13'),
(165, 8, NULL, 59, NULL, 'Control Technics Drives', NULL, NULL, NULL, '2024-05-27 16:50:29', '2024-05-27 16:50:29'),
(166, 7, NULL, 48, NULL, 'برمجة PLC', '<p>متضمنا البرمجة والتكليف وتشغيل النظام والصيانة<br></p>', NULL, NULL, '2024-05-29 06:43:54', '2024-05-31 19:16:01'),
(167, 11, NULL, 48, NULL, 'PLC Programlama', '<p>Programlama, Devreye Alma, Sistem işletimi ve bakım dahil<br></p>', NULL, NULL, '2024-05-31 19:15:09', '2024-05-31 19:15:09'),
(168, 7, NULL, 49, NULL, 'إدارة المشاريع', '<p>بما في ذلك تقدير المشروع والتصميم والتكلفة والتوقعات في الوقت الحقيقي للمشروع<br></p>', NULL, NULL, '2024-05-31 19:17:14', '2024-05-31 19:18:12'),
(169, 11, NULL, 49, NULL, 'Proje Yönetimi', '<p>Proje tahmini, tasarımı, maliyeti ve projenin gerçek zamanlı beklentisi dahil<br></p>', NULL, NULL, '2024-05-31 19:17:28', '2024-05-31 19:17:51'),
(170, 11, NULL, 50, NULL, 'Endüstriyel dokunmatik ekranlı HMI', '<p>Tasarım, programlama ve iletişim (Siemens, OMRON, ABB, Schnieder)<br></p>', NULL, NULL, '2024-05-31 19:19:08', '2024-05-31 19:20:38'),
(171, 7, NULL, 50, NULL, 'شاشة اللمس الصناعية HMI', '<p>التصميم والبرمجة والاتصالات (Siemens، OMRON، ABB، Schneider)<br></p>', NULL, NULL, '2024-05-31 19:19:10', '2024-05-31 19:22:25'),
(172, 7, NULL, 51, NULL, 'أنظمة SCADA', '<p>بما في ذلك WINCC، وWonderware، وC#، وC++، وPHP<br></p>', NULL, NULL, '2024-05-31 19:25:51', '2024-05-31 19:25:51'),
(173, 11, NULL, 51, NULL, 'SCADA sistemleri', '<p>WINCC, Wonderware, C#, C++ ve PHP dahil<br></p>', NULL, NULL, '2024-06-01 05:17:47', '2024-06-01 05:17:47'),
(174, 11, NULL, 52, NULL, 'Görüntü işleme', '<p>(Keyence ve C++)<br></p>', NULL, NULL, '2024-06-01 05:26:53', '2024-06-01 05:29:01'),
(175, 7, NULL, 52, NULL, 'معالجة الصور', '<p style=\"direction: rtl; \">(Keyence و ++C)<br></p>', NULL, NULL, '2024-06-01 05:27:09', '2024-06-01 05:28:50'),
(176, 7, NULL, 53, NULL, 'Siemens PCS', NULL, NULL, NULL, '2024-06-01 06:06:31', '2024-06-01 06:06:31'),
(177, 11, NULL, 53, NULL, 'Siemens PCS', NULL, NULL, NULL, '2024-06-01 06:06:34', '2024-06-01 06:06:34'),
(178, 7, NULL, 54, NULL, 'محركات SINAMICS', '<p>(S110, S120 ,S150 , G120C, G120)<br></p>', NULL, NULL, '2024-06-01 06:14:03', '2024-06-01 06:14:30'),
(179, 11, NULL, 54, NULL, 'SINAMIC Sürücüleri', '<p>(S110, S120 ,S150 , G120C, G120)<br></p>', NULL, NULL, '2024-06-01 06:14:14', '2024-06-01 06:14:32'),
(180, 11, NULL, 55, NULL, 'ABB sürücüleri', NULL, NULL, NULL, '2024-06-01 06:15:02', '2024-06-01 06:15:02'),
(181, 7, NULL, 55, NULL, 'محركات ABB', NULL, NULL, NULL, '2024-06-01 06:15:30', '2024-06-01 06:15:30'),
(182, 7, NULL, 56, NULL, 'محركات SCHNEIDER AVITAR', NULL, NULL, NULL, '2024-06-01 06:16:42', '2024-06-01 06:37:50'),
(183, 11, NULL, 56, NULL, 'SCHNEIDER AVITAR Sürücüler', NULL, NULL, NULL, '2024-06-01 06:17:43', '2024-06-01 06:17:43'),
(184, 11, NULL, 57, NULL, 'DANFOSS Sürücüleri', NULL, NULL, NULL, '2024-06-01 06:18:20', '2024-06-01 06:18:20'),
(185, 7, NULL, 57, NULL, 'محركات DANFOSS', NULL, NULL, NULL, '2024-06-01 06:18:41', '2024-06-01 06:37:08'),
(186, 11, NULL, 58, NULL, 'LENZE Sürücüler', NULL, NULL, NULL, '2024-06-01 06:19:39', '2024-06-01 06:19:39'),
(187, 7, NULL, 58, NULL, 'محركات LENZE', NULL, NULL, NULL, '2024-06-01 06:19:57', '2024-06-01 06:38:17'),
(188, 7, NULL, 59, NULL, 'تقنيات التحكم بالمحركات', NULL, NULL, NULL, '2024-06-01 06:20:56', '2024-06-01 06:20:56'),
(189, 11, NULL, 59, NULL, 'Control Techniques Sürücüleri', NULL, NULL, NULL, '2024-06-01 06:21:18', '2024-06-01 06:21:18'),
(190, 11, NULL, 2, NULL, 'kullanışlı bağlantılar', '<ul>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr\">ANASAYFA</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/about-us\">Hakkımızda</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/projects\">Projeler</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/services\">Hizmetler</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/contacts\">Kişiler</a></li>\r\n            </ul>', NULL, NULL, '2024-06-01 06:51:22', '2024-06-01 06:54:33'),
(191, 11, NULL, 3, NULL, 'Hizmetler', '<ul>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/services\">PLC Programlama</a></li>\r\n     <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/services\">Proje Yönetimi</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/services\">Endüstriyel dokunmatik ekranlı HMI</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/services\">SCADA sistemleri</a></li>\r\n              <li><i class=\"bx bx-chevron-right\"></i> <a href=\"https://test.prevalentautomation.com/lang/tr/page/services\">Görüntü işleme</a></li>\r\n            </ul>', NULL, NULL, '2024-06-01 07:01:17', '2024-06-01 07:02:17'),
(192, 11, NULL, 1, NULL, 'Prevalent Automation', '<p>\r\nTürkiye - İstanbul\r\n              <br>\r\n              <strong>Telefon:</strong> +905011291958<br>\r\n              <strong>E-posta:</strong> info@prevalentautomation.com<br>\r\n            </p>', NULL, NULL, '2024-06-01 07:02:57', '2024-06-01 07:04:14'),
(193, 11, NULL, 5, NULL, 'Copyright', '<div class=\"copyright\">\r\n        © Telif hakkı <strong><span>Prevalent Automation</span></strong>. Her hakkı saklıdır\r\n      </div>\r\n      <div class=\"credits\">\r\n                 <a href=\"#\"></a>\r\n      </div>', NULL, NULL, '2024-06-01 07:06:42', '2024-06-01 07:06:42'),
(194, 11, NULL, 4, NULL, 'Sosyal Ağlarımız', NULL, NULL, NULL, '2024-06-01 07:09:29', '2024-06-01 07:09:29'),
(195, 11, NULL, 13, NULL, 'Çimento Beton Karıştırma', 'Proje Siemens PLC\'ler, WINCC SCADA ve SQL veritabanı (PLC : S71200 , WINCC : TIA profesyonel) kullanılarak yürütülmüştür.', NULL, NULL, '2024-06-01 07:17:49', '2024-06-01 07:18:18'),
(196, 11, NULL, 37, NULL, 'Daha...', NULL, NULL, NULL, '2024-06-01 07:19:42', '2024-06-01 07:19:42'),
(197, 11, NULL, 16, NULL, 'Çimento Fabrikası Örneği', '2009 - 2014 yılları arasında HOLCIM grubuna ait çimento fabrikasının FLSmidth ekibinin devreye alma, işletme ve bakımında görev aldık.<br>Proface HMI\'lar da dahil olmak üzere S7300 ve S7400 PLC\'ler başta olmak üzere otomasyon plc programlamasından sorumluyduk.', NULL, NULL, '2024-06-01 09:52:21', '2024-06-01 09:52:55'),
(198, 7, NULL, 16, NULL, 'مثال مصنع الأسمنت', 'لقد شاركنا مع فريق FLSmidth في تشغيل وصيانة مصنع الأسمنت التابع لمجموعة HOLCIM خلال الفترة من 2009 حتى 2014.<br>كنا مسؤولين عن برمجة أتمتة PLC وخاصة S7300 وS7400 PLCs بما في ذلك Proface HMIs.', NULL, NULL, '2024-06-01 09:52:24', '2024-06-01 10:32:07'),
(199, 11, NULL, 17, NULL, 'Temiz Su Pompa İstasyonu', '12 adet temiz su baraj pompasının SIPROTEC koruma rölesi ile kontrol edilmesi için modbus TCP/IP protokolü üzerinden Power 5 sistemi ile iletişim kurmak için Siemens S71500 PLC\'leri TIA portal V17 platformu üzerinden ve PROFIBUS iletişimi ile kullanmıştık.', NULL, NULL, '2024-06-01 09:56:57', '2024-06-01 09:57:18'),
(200, 7, NULL, 38, NULL, 'نظام مستودع الرولات الأوتوماتيكي', 'تم تنفيذ نظام مستودع الرول الأوتوماتيكي لبكرات النسيج باستخدام Siemens S71500 و Basic HMI و 4 محاور Siemens SINAMICs Drives S7210 <br> هذا النوع من الآلات المستخدمة للبكرات في الصفوف لكسب المزيد من المساحات في المصانع.', NULL, NULL, '2024-06-01 09:58:30', '2024-06-01 09:59:42'),
(201, 11, NULL, 38, NULL, 'Otomatik Rulo Depo Sistemi', 'Tekstil rulolarının Otomatik Rulo Depo Sistemi, Siemens S71500, Temel HMI ve 4 eksenli Siemens SINAMIC tahrikli S7210<br> kullanılarak fabrikalarda daha fazla yer kazanmak için ruloları sıra halinde kullanan makineler kullanılarak yapılmıştır.', NULL, NULL, '2024-06-01 09:58:43', '2024-06-01 09:59:07'),
(202, 7, NULL, 39, NULL, 'خط لحام جسم آلة الغسيل', 'لقد قمنا بتحديث نظام التشغيل الآلي لنظام أتمتة خط لحام جسم آلة الغسيل من Siemens S5 إلى Siemens S7.', NULL, NULL, '2024-06-01 10:00:52', '2024-06-01 10:01:48'),
(203, 11, NULL, 39, NULL, 'Çamaşır Makinesi Gövde Kaynak Hattı', 'Çamaşır makinesi gövde kaynak hattı otomasyon sisteminin otomasyon sistemini Siemens S5\'ten Siemens S7\'ye yükselttik.', NULL, NULL, '2024-06-01 10:00:55', '2024-06-01 10:01:25'),
(204, 7, NULL, 40, NULL, 'آلة اللف', 'آلة لف المنتجات النسيجية:\r\n<br>\r\nلقد أنجزنا تصميم وبرمجة وتشغيل خط لف الملابس والمنسوجات الذي يتحكم في شد وطول ومعالجة البكرات.', NULL, NULL, '2024-06-01 10:03:06', '2024-06-01 10:28:54'),
(205, 11, NULL, 40, NULL, 'Sarma Makinası', 'Tekstil Ürünleri Sarma ve Sarma Makinesi:\r\n<br>\r\nSilindirlerin gerilimini, uzunluğunu ve sürecini kontrol eden giysi ve tekstil sarma hattının tasarımını, programlanmasını ve devreye alınmasını gerçekleştirdik.', NULL, NULL, '2024-06-01 10:03:29', '2024-06-01 10:04:59'),
(206, 11, NULL, 41, NULL, 'Demir Kubbe Pres Makinası', 'Demir Kubbe Pres Makinasının otomasyon sistemini Siemens S5\'ten Siemens S7\'ye yükseltmiştik.<br>Makine, tüm olayları SQL veri tabanına yazan C# masaüstü aracını kullanarak, olayları kaydedebiliyor ve operatörün makinedeki hareketine göre oynatabiliyordu.', NULL, NULL, '2024-06-01 10:06:00', '2024-06-01 10:07:03'),
(207, 7, NULL, 41, NULL, 'آلة ضغط القبة الحديدية', 'لقد قمنا بترقية نظام التشغيل الآلي لآلة ضغط القبة الحديدية من Siemens S5 إلى Siemens S7.<br>يمكن للآلة تسجيل الأحداث وتشغيلها وفقًا لإجراءات المشغل على الآلة باستخدام أداة سطح المكتب C# التي تكتب جميع الأحداث في قاعدة بيانات SQL', NULL, NULL, '2024-06-01 10:06:12', '2024-06-01 10:06:42'),
(208, 11, NULL, 42, NULL, 'Yakıt Kazanı Sistemi', 'Çimento gibi birçok imalatta kullanılan ağır yakıt sistemi, bu nedenle müşteri bizden HMI sisteminin mevcut PI &amp; D\'ye göre tasarlanmasını ve algoritmalara göre PLC programlamanın proses ekibi tarafından yapılmasını istedi.', NULL, NULL, '2024-06-01 10:08:15', '2024-06-01 10:10:15'),
(209, 7, NULL, 42, NULL, 'نظام غلايات الوقود', 'نظام الوقود الثقيل المستخدم في العديد من الصناعات مثل الأسمنت، لذلك طلب العميل منا تصميم نظام HMI وفقًا لبرمجة PI&amp;&amp;D وPLC وفقًا للخوارزميات التي تم إجراؤها بواسطة فريق المعالجة', NULL, NULL, '2024-06-01 10:08:40', '2024-06-01 10:09:48'),
(210, 7, NULL, 43, NULL, 'ABB محركات التكليف', 'نحن ممتنون لتقديم خدمات الأتمتة الكاملة واستكشاف الأخطاء وإصلاحها وصيانة محركات ABB', NULL, NULL, '2024-06-01 10:10:41', '2024-06-01 10:15:04'),
(211, 11, NULL, 43, NULL, 'ABB Sürücülerinin Devreye Alınması', 'ABB sürücülerinin tam otomasyonunu, sorun giderme hizmetlerini ve bakımını verme konusunda rahatız', NULL, NULL, '2024-06-01 10:11:01', '2024-06-01 10:15:19'),
(212, 11, NULL, 44, NULL, 'HİDROLİK PROJE ÖRNEĞİ', 'Çimento üretimi elektrik panosu tasarımı, PLC programlama ve bakım istifleyici ve istifleyici gibi ağır ekipman kaldırma ve hidrolik kontrolü', NULL, NULL, '2024-06-01 10:15:47', '2024-06-01 10:16:37'),
(213, 7, NULL, 44, NULL, 'مثال على المشروع الهيدروليكي', 'رافعة المعدات الثقيلة والتحكم الهيدروليكي مثل جهاز الاستخلاص والمكدس لتصميم اللوحات الكهربائية لتصنيع الأسمنت وبرمجة PLC والصيانة', NULL, NULL, '2024-06-01 10:15:57', '2024-06-01 10:16:21'),
(214, 11, NULL, 45, NULL, 'Rulo Form Kesim Makinaları', 'Rulo Şekillendirme Makinesi Hattı Elektrik Panosu Tasarımı, PLC programlama, devreye alma ve bakım <br>Makine, biri ana konumlandırıcı ve dördü hız kurtarıcı olarak beş servo sürücüden oluşuyordu.<br>Köleler ana harekete göre hareket ediyordu.<br> Master, operatör tarafından HMI\'dan belirlenen ayar noktaları haritasına göre hareket etti', NULL, NULL, '2024-06-01 10:17:42', '2024-06-01 10:19:18'),
(215, 7, NULL, 45, NULL, 'ماكينات قطع قوالب الرول', 'تصميم اللوحات الكهربائية لخط ماكينة التشكيل، وبرمجة PLC، والتشغيل، والصيانة <br>تتكون الآلة من خمسة محركات مؤازرة، واحدة كمحدد موضع رئيسي وأربعة كمراهم للسرعة.<br>وتحرك العبيد وفقًا للحركة الرئيسية.<br> تحرك السيد وفقًا لخريطة النقاط المحددة التي تم تعيينها من HMI من المشغل', NULL, NULL, '2024-06-01 10:18:01', '2024-06-01 10:18:31'),
(216, 11, NULL, 46, NULL, 'BUZDOLABI ENJEKTÖR HATTI', 'Buzdolabı makine hattı köpük enjeksiyon prosesinin Elektrik Pano Tasarımı, PLC, SCADA programlaması ve işletilmesi', NULL, NULL, '2024-06-01 10:19:54', '2024-06-01 10:20:49'),
(217, 7, NULL, 46, NULL, 'خط حاقن الثلاجة', 'تصميم اللوحات الكهربائية، وبرمجة PLC، وSCADA، وتشغيل عملية حقن الرغوة لخط ماكينات الثلاجة', NULL, NULL, '2024-06-01 10:20:04', '2024-06-01 10:20:34'),
(218, 11, NULL, 47, NULL, 'SCADA sistemi', 'Su akış sisteminin SCADA sisteminin PID kontrol kullanılarak kurulumu, projelendirilmesi ve devreye alınması', NULL, NULL, '2024-06-01 10:21:30', '2024-06-01 10:22:49');
INSERT INTO `lang_posts` (`id`, `lang_id`, `category_id`, `post_id`, `main_table`, `title_trans`, `content_trans`, `name`, `notes`, `created_at`, `updated_at`) VALUES
(219, 7, NULL, 47, NULL, 'نظام SCADA', 'تركيب وتصميم وتشغيل نظام SCADA لنظام تدفق المياه باستخدام التحكم PID', NULL, NULL, '2024-06-01 10:21:57', '2024-06-01 10:22:22'),
(220, 11, NULL, 15, NULL, 'Atık su arıtma', 'Proje, Siemens PLC\'leri S7400 ve WINCC explorer SCADA sistemi kullanılarak, raporlama sistemi ve SMS veya e-posta yoluyla akıllı alarm verme sistemi kullanılarak yürütülmüştür.', NULL, NULL, '2024-06-01 10:34:43', '2024-06-01 10:35:14'),
(221, 11, 16, NULL, NULL, 'Referanslar', '<h2></h2>\r\n<p>Referanslar</p>', NULL, NULL, '2024-06-01 10:55:12', '2024-06-01 10:55:12'),
(222, 7, 16, NULL, NULL, 'المراجع', '<h2></h2>\r\n<p>المراجع</p>', NULL, NULL, '2024-06-01 10:56:13', '2024-06-01 10:56:13'),
(223, 8, NULL, 60, NULL, 'Siemens S71200', '<p></p>', NULL, NULL, '2024-06-02 12:45:56', '2024-06-02 12:46:05'),
(224, 7, NULL, 60, NULL, 'Siemens S71200', NULL, NULL, NULL, '2024-06-02 12:46:21', '2024-06-02 12:46:21'),
(225, 11, NULL, 60, NULL, 'Siemens S71200', NULL, NULL, NULL, '2024-06-02 12:46:24', '2024-06-02 12:46:24'),
(229, 8, NULL, 62, NULL, 'Siemens S71500', NULL, NULL, NULL, '2024-06-02 18:47:27', '2024-06-02 18:47:27'),
(230, 7, NULL, 62, NULL, 'Siemens S71500', NULL, NULL, NULL, '2024-06-02 18:47:30', '2024-06-02 18:47:30'),
(231, 11, NULL, 62, NULL, 'Siemens S71500', NULL, NULL, NULL, '2024-06-02 18:47:34', '2024-06-02 18:47:34'),
(232, 8, NULL, 63, NULL, 'Siemens S7300', NULL, NULL, NULL, '2024-06-02 18:49:47', '2024-06-02 18:49:47'),
(233, 7, NULL, 63, NULL, 'Siemens S7300', NULL, NULL, NULL, '2024-06-02 18:49:49', '2024-06-02 18:49:49'),
(234, 11, NULL, 63, NULL, 'Siemens S7300', NULL, NULL, NULL, '2024-06-02 18:49:52', '2024-06-02 18:49:52'),
(235, 8, NULL, 64, NULL, 'Siemens S7400', NULL, NULL, NULL, '2024-06-02 18:50:56', '2024-06-02 18:50:56'),
(236, 7, NULL, 64, NULL, 'Siemens S7400', NULL, NULL, NULL, '2024-06-02 18:51:03', '2024-06-02 18:51:03'),
(237, 11, NULL, 64, NULL, 'Siemens S7400', NULL, NULL, NULL, '2024-06-02 18:51:06', '2024-06-02 18:51:06'),
(238, 8, NULL, 65, NULL, 'SINAMICs G120', NULL, NULL, NULL, '2024-06-02 18:59:12', '2024-06-02 18:59:12'),
(239, 7, NULL, 65, NULL, 'SINAMICs G120', NULL, NULL, NULL, '2024-06-02 18:59:16', '2024-06-02 18:59:16'),
(240, 11, NULL, 65, NULL, 'SINAMICs G120', NULL, NULL, NULL, '2024-06-02 18:59:18', '2024-06-02 18:59:18'),
(241, 8, NULL, 66, NULL, 'SINAMICs S210', NULL, NULL, NULL, '2024-06-02 19:08:57', '2024-06-02 19:08:57'),
(242, 7, NULL, 66, NULL, 'SINAMICs S210', NULL, NULL, NULL, '2024-06-02 19:09:00', '2024-06-02 19:09:00'),
(243, 11, NULL, 66, NULL, 'SINAMICs S210', NULL, NULL, NULL, '2024-06-02 19:09:04', '2024-06-02 19:09:04'),
(244, 8, NULL, 67, NULL, 'SINAMUCs S110', NULL, NULL, NULL, '2024-06-02 19:10:21', '2024-06-02 19:10:21'),
(245, 7, NULL, 67, NULL, 'SINAMUCs S110', NULL, NULL, NULL, '2024-06-02 19:13:27', '2024-06-02 19:13:27'),
(246, 11, NULL, 67, NULL, 'SINAMUCs S110', NULL, NULL, NULL, '2024-06-02 19:13:31', '2024-06-02 19:13:31'),
(247, 8, NULL, 68, NULL, 'SINAMICs S120', NULL, NULL, NULL, '2024-06-02 19:15:46', '2024-06-02 19:15:46'),
(248, 7, NULL, 68, NULL, 'SINAMICs S120', NULL, NULL, NULL, '2024-06-02 19:15:48', '2024-06-02 19:15:48'),
(249, 11, NULL, 68, NULL, 'SINAMICs S120', NULL, NULL, NULL, '2024-06-02 19:15:51', '2024-06-02 19:15:51'),
(250, 8, NULL, 69, NULL, 'SINAMICs V20', NULL, NULL, NULL, '2024-06-02 19:16:57', '2024-06-02 19:16:57'),
(251, 7, NULL, 69, NULL, 'SINAMICs V20', NULL, NULL, NULL, '2024-06-02 19:16:59', '2024-06-02 19:16:59'),
(252, 11, NULL, 69, NULL, 'SINAMICs V20', NULL, NULL, NULL, '2024-06-02 19:17:01', '2024-06-02 19:17:01'),
(253, 8, NULL, 70, NULL, 'SINAMICs V90', NULL, NULL, NULL, '2024-06-02 19:18:15', '2024-06-02 19:18:15'),
(254, 7, NULL, 70, NULL, 'SINAMICs V90', NULL, NULL, NULL, '2024-06-02 19:18:18', '2024-06-02 19:18:18'),
(255, 11, NULL, 70, NULL, 'SINAMICs V90', NULL, NULL, NULL, '2024-06-02 19:18:21', '2024-06-02 19:18:21'),
(256, 8, NULL, 71, NULL, 'Siemens Basic HMIs', NULL, NULL, NULL, '2024-06-02 19:20:36', '2024-06-02 19:20:36'),
(257, 7, NULL, 71, NULL, 'Siemens Basic HMIs', NULL, NULL, NULL, '2024-06-02 19:20:41', '2024-06-02 19:20:41'),
(258, 11, NULL, 71, NULL, 'Siemens Basic HMIs', NULL, NULL, NULL, '2024-06-02 19:20:44', '2024-06-02 19:20:44'),
(259, 8, NULL, 72, NULL, 'Siemens Comfort HMIs', NULL, NULL, NULL, '2024-06-02 19:21:41', '2024-06-02 19:21:41'),
(260, 7, NULL, 72, NULL, 'Siemens Comfort HMIs', NULL, NULL, NULL, '2024-06-02 19:21:43', '2024-06-02 19:21:43'),
(261, 11, NULL, 72, NULL, 'Siemens Comfort HMIs', NULL, NULL, NULL, '2024-06-02 19:21:46', '2024-06-02 19:21:46'),
(262, 8, NULL, 73, NULL, 'Siemens WINCC SCADA', '(Flexible , Advanced , and professional)', NULL, NULL, '2024-06-02 19:22:49', '2024-06-02 19:22:49'),
(263, 7, NULL, 73, NULL, 'Siemens WINCC SCADA', NULL, NULL, NULL, '2024-06-02 19:22:56', '2024-06-02 19:22:56'),
(264, 11, NULL, 73, NULL, 'Siemens WINCC SCADA', '(Esnek, Gelişmiş ve profesyonel)', NULL, NULL, '2024-06-02 19:22:59', '2024-06-02 19:25:19'),
(265, 8, NULL, 74, NULL, 'OMRON PLCs', '(Nx families , and NJ families', NULL, NULL, '2024-06-02 19:29:30', '2024-06-02 19:29:40'),
(266, 11, NULL, 74, NULL, 'OMRON PLCs', NULL, NULL, NULL, '2024-06-02 19:30:47', '2024-06-02 19:30:47'),
(267, 7, NULL, 74, NULL, 'OMRON PLCs', '(عائلة Nx، وعائلة NJ)', NULL, NULL, '2024-06-02 19:31:52', '2024-06-02 19:31:52'),
(268, 8, NULL, 75, NULL, 'OMRON HMIs', '(NA Families )', NULL, NULL, '2024-06-02 19:40:19', '2024-06-02 19:40:19'),
(269, 7, NULL, 75, NULL, 'OMRON HMIs', NULL, NULL, NULL, '2024-06-02 19:41:23', '2024-06-02 19:41:23'),
(270, 11, NULL, 75, NULL, 'OMRON HMIs', '<p>(NA Aileleri)<br></p>', NULL, NULL, '2024-06-02 19:41:31', '2024-06-02 19:41:31'),
(271, 8, NULL, 76, NULL, 'ABB Drives', NULL, NULL, NULL, '2024-06-02 19:42:20', '2024-06-02 19:44:12'),
(272, 7, NULL, 76, NULL, 'محركات ABB', NULL, NULL, NULL, '2024-06-02 19:43:10', '2024-06-02 19:44:05'),
(273, 11, NULL, 76, NULL, 'ABB Sürücüleri', NULL, NULL, NULL, '2024-06-02 19:43:46', '2024-06-02 19:44:00'),
(274, 8, NULL, 77, NULL, 'ABB PLCs', NULL, NULL, NULL, '2024-06-02 19:44:44', '2024-06-02 19:44:44'),
(275, 7, NULL, 77, NULL, 'ABB PLCs', NULL, NULL, NULL, '2024-06-02 19:44:49', '2024-06-02 19:44:49'),
(276, 11, NULL, 77, NULL, 'ABB PLCs', NULL, NULL, NULL, '2024-06-02 19:45:00', '2024-06-02 19:45:00'),
(277, 8, NULL, 78, NULL, 'Schneider Drives', 'ATV 320 , ATV 340', NULL, NULL, '2024-06-02 19:47:25', '2024-06-02 19:48:48'),
(278, 7, NULL, 78, NULL, 'محركات Schneider', 'ATV 320 , ATV 340', NULL, NULL, '2024-06-02 19:48:05', '2024-06-02 19:48:05'),
(279, 11, NULL, 78, NULL, 'Schneider Sürücüleri', 'ATV 320 , ATV 340', NULL, NULL, '2024-06-02 19:48:39', '2024-06-02 19:48:39'),
(280, 8, NULL, 79, NULL, 'Schneider PLCs', NULL, NULL, NULL, '2024-06-02 19:49:57', '2024-06-02 19:49:57'),
(281, 7, NULL, 79, NULL, 'Schneider PLCs', NULL, NULL, NULL, '2024-06-02 19:50:13', '2024-06-02 19:50:13'),
(282, 11, NULL, 79, NULL, 'Schneider PLCs', NULL, NULL, NULL, '2024-06-02 19:50:42', '2024-06-02 19:50:42');

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
(7, 1, 16, NULL, NULL, 0, 1, NULL, NULL, NULL),
(9, 1, 15, NULL, NULL, 3, 1, NULL, NULL, NULL),
(10, 1, 14, NULL, NULL, 1, 1, NULL, NULL, NULL),
(13, 2, 14, NULL, NULL, 1, 1, NULL, NULL, NULL),
(14, 2, 15, NULL, NULL, 2, 1, NULL, NULL, NULL),
(15, 2, 16, NULL, NULL, 0, 1, NULL, NULL, NULL),
(16, 2, 17, NULL, NULL, 3, 1, NULL, NULL, NULL),
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
(29, 1, 17, NULL, NULL, 2, 1, NULL, NULL, NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(99, '5424199.webp', '', '', 'posts', 'image', 0, '2024-05-02 12:49:50', '2024-05-19 15:12:37'),
(109, '70925109.webp', '', '', 'posts', 'image', 0, '2024-05-04 11:20:14', '2024-05-19 14:54:40'),
(116, '27274116.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:08:19', '2024-05-16 15:21:54'),
(117, '30015117.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:08:50', '2024-05-16 15:07:33'),
(118, '63385118.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:10:02', '2024-05-16 15:22:19'),
(119, '18843119.webp', '', '', 'posts', 'image', 0, '2024-05-06 09:10:41', '2024-05-16 15:21:28'),
(233, '24720233.pdf', '', '', 'categories', 'pdf', 0, '2024-05-09 11:57:49', '2024-05-09 12:02:30'),
(234, '17754234.webp', '', '', 'posts', 'image', 0, '2024-05-16 14:12:31', '2024-05-16 15:23:09'),
(235, '95264235.webp', '', '', 'posts', 'image', 0, '2024-05-16 14:13:29', '2024-05-16 15:23:27'),
(236, '42468236.webp', '', '', 'posts', 'image', 0, '2024-05-16 14:14:00', '2024-05-16 15:23:48'),
(237, '81326237.webp', '', '', 'posts', 'image', 0, '2024-05-16 14:14:34', '2024-05-16 15:24:17'),
(238, '66417238.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:10:18', '2024-05-18 12:10:21'),
(240, '40078240.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:13', '2024-05-18 12:11:13'),
(241, '98624241.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:13', '2024-05-18 12:11:13'),
(242, '73294242.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:14', '2024-05-18 12:11:14'),
(243, '47738243.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:14', '2024-05-18 12:11:15'),
(244, '57995244.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:16', '2024-05-18 12:11:16'),
(245, '46317245.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:16', '2024-05-18 12:11:16'),
(246, '91420246.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:17', '2024-05-18 12:11:17'),
(247, '11088247.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:17', '2024-05-18 12:11:18'),
(248, '10762248.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:11:18', '2024-05-18 12:11:19'),
(250, '70704250.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:02', '2024-05-18 12:13:02'),
(251, '25146251.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:02', '2024-05-18 12:13:03'),
(252, '36429252.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:03', '2024-05-18 12:13:04'),
(253, '21259253.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:05', '2024-05-18 12:13:05'),
(254, '96585254.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:06', '2024-05-18 12:13:07'),
(255, '20859255.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:07', '2024-05-18 12:13:07'),
(256, '70733256.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:08', '2024-05-18 12:13:08'),
(257, '38406257.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:08', '2024-05-18 12:13:09'),
(258, '77359258.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:10', '2024-05-18 12:13:11'),
(259, '57707259.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:11', '2024-05-18 12:13:11'),
(260, '29621260.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:12', '2024-05-18 12:13:13'),
(261, '32980261.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:13', '2024-05-18 12:13:13'),
(262, '51876262.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:14', '2024-05-18 12:13:15'),
(263, '62446263.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:15', '2024-05-18 12:13:16'),
(264, '16907264.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:17', '2024-05-18 12:13:18'),
(265, '56278265.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:19', '2024-05-18 12:13:20'),
(266, '89373266.webp', '', '', 'posts', 'image', 0, '2024-05-18 12:13:21', '2024-05-18 12:13:22'),
(268, '49356268.webp', '', '', 'posts', 'image', 0, '2024-05-18 13:56:31', '2024-05-18 13:56:32'),
(269, '30999269.webp', '', '', 'posts', 'image', 0, '2024-05-18 13:56:53', '2024-05-18 13:56:54'),
(270, '83119270.mp4', '', '', 'posts', 'video', 0, '2024-05-18 15:18:30', '2024-05-18 15:18:30'),
(271, '82182271.webp', '', '', 'posts', 'image', 0, '2024-05-19 14:52:50', '2024-05-19 14:52:53'),
(272, '18775272.webp', '', '', 'posts', 'image', 0, '2024-05-19 14:53:52', '2024-05-19 14:53:53'),
(273, '94438273.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:16:24', '2024-05-21 12:48:29'),
(274, '10453274.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:16:30', '2024-05-20 13:16:30'),
(275, '19816275.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:16:54', '2024-05-20 13:16:54'),
(276, '76982276.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:16:55', '2024-05-20 13:16:55'),
(277, '91096277.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:16:57', '2024-05-20 13:16:57'),
(278, '22839278.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:17:20', '2024-05-20 13:17:20'),
(279, '58462279.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:17:23', '2024-05-20 13:17:23'),
(280, '36408280.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:17:25', '2024-05-20 13:17:25'),
(281, '72375281.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:17:29', '2024-05-20 13:17:29'),
(282, '63264282.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:17:43', '2024-05-20 13:17:43'),
(283, '52430283.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:17:44', '2024-05-20 13:17:44'),
(284, '37333284.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:17:56', '2024-05-20 13:17:56'),
(285, '92846285.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:22:31', '2024-05-21 12:48:41'),
(286, '86573286.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:23:20', '2024-05-20 13:23:20'),
(287, '79391287.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:23:21', '2024-05-20 13:23:21'),
(288, '54873288.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:23:21', '2024-05-20 13:23:21'),
(289, '62921289.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:23:22', '2024-05-20 13:23:22'),
(290, '93688290.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:23:22', '2024-05-20 13:23:23'),
(291, '19622291.webp', '', '', 'posts', 'image', 0, '2024-05-20 13:23:23', '2024-05-20 13:23:23'),
(296, NULL, '', '', 'posts', 'image', 0, '2024-05-20 15:15:00', '2024-05-20 15:15:00'),
(297, NULL, '', '', 'posts', 'image', 0, '2024-05-20 15:16:23', '2024-05-20 15:16:23'),
(298, NULL, '', '', 'posts', 'image', 0, '2024-05-20 15:16:41', '2024-05-20 15:16:41'),
(299, NULL, '', '', 'posts', 'image', 0, '2024-05-20 15:19:03', '2024-05-20 15:19:03'),
(300, NULL, '', '', 'posts', 'image', 0, '2024-05-20 15:19:38', '2024-05-20 15:19:38'),
(301, NULL, '', '', 'posts', 'image', 0, '2024-05-20 15:21:13', '2024-05-20 15:21:13'),
(307, '28042307.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:33:25', '2024-05-21 17:01:44'),
(308, '25327308.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:33:27', '2024-05-20 15:33:28'),
(309, '50565309.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:33:28', '2024-05-20 15:33:28'),
(310, '90977310.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:33:29', '2024-05-20 15:33:30'),
(311, '88924311.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:33:30', '2024-05-20 15:33:31'),
(312, '51007312.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:33:31', '2024-05-20 15:33:32'),
(313, '10395313.mp4', '', '', 'posts', 'video', 0, '2024-05-20 15:34:09', '2024-05-20 15:34:09'),
(315, '87303315.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:46:16', '2024-05-21 16:55:56'),
(316, '50597316.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:46:17', '2024-05-20 15:46:18'),
(317, '33734317.mp4', '', '', 'posts', 'video', 0, '2024-05-20 15:46:56', '2024-05-20 15:46:57'),
(318, '60877318.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:49:12', '2024-05-21 17:03:47'),
(319, '81739319.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:49:14', '2024-05-21 17:03:55'),
(320, '57828320.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:49:14', '2024-05-20 15:49:15'),
(321, '88365321.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:49:16', '2024-05-20 15:49:19'),
(322, '91775322.webp', '', '', 'posts', 'image', 0, '2024-05-20 15:49:19', '2024-05-20 15:49:21'),
(323, '27220323.mp4', '', '', 'posts', 'video', 0, '2024-05-20 15:49:44', '2024-05-20 15:49:44'),
(324, '27559324.mp4', '', '', 'posts', 'video', 0, '2024-05-20 15:52:09', '2024-05-20 15:52:10'),
(325, '83623325.webp', '', '', 'posts', 'image', 0, '2024-05-20 16:09:05', '2024-05-26 19:50:36'),
(328, '74003328.webp', '', '', 'categories', 'image', 0, '2024-05-20 21:09:00', '2024-05-20 21:09:01'),
(329, '37614329.mp4', '', '', 'categories', 'video', 0, '2024-05-20 21:09:29', '2024-05-20 21:09:29'),
(330, '23225330.webp', '', '', 'posts', 'image', 0, '2024-05-21 16:55:48', '2024-05-21 16:55:49'),
(331, '13457331.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:34', '2024-05-21 17:09:34'),
(332, '32658332.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:34', '2024-05-21 17:09:35'),
(333, '21422333.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:35', '2024-05-21 17:09:35'),
(334, '88430334.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:35', '2024-05-21 17:09:36'),
(335, '21374335.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:36', '2024-05-21 17:09:36'),
(336, '47828336.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:37', '2024-05-21 17:09:37'),
(337, '71500337.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:38', '2024-05-21 17:09:38'),
(338, '52816338.webp', '', '', 'posts', 'image', 0, '2024-05-21 17:09:38', '2024-05-21 17:09:39'),
(339, '75501339.webp', '', '', 'categories', 'image', 0, '2024-05-22 20:03:10', '2024-05-22 20:03:10'),
(340, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:28:37', '2024-05-26 19:28:37'),
(341, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:28:43', '2024-05-26 19:28:43'),
(342, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:28:45', '2024-05-26 19:28:45'),
(343, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:28:47', '2024-05-26 19:28:47'),
(344, '38041344.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:28:49', '2024-05-26 19:28:49'),
(345, '96799345.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:28:50', '2024-05-26 19:28:51'),
(346, '71911346.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:28:51', '2024-05-26 19:28:51'),
(347, '97571347.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:28:52', '2024-05-26 19:28:52'),
(348, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:30:50', '2024-05-26 19:30:50'),
(349, '37479349.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:35:53', '2024-05-26 19:35:53'),
(350, '82157350.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:35:54', '2024-05-26 19:35:54'),
(351, '55418351.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:35:54', '2024-05-26 19:35:55'),
(352, '17904352.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:35:55', '2024-05-26 19:35:56'),
(353, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:39:09', '2024-05-26 19:39:09'),
(354, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:39:56', '2024-05-26 19:39:56'),
(355, NULL, '', '', 'posts', 'image', 0, '2024-05-26 19:41:57', '2024-05-26 19:41:57'),
(356, '77676356.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:43:37', '2024-05-26 19:43:39'),
(357, '87474357.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:09', '2024-05-26 19:58:11'),
(359, '19457359.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:13', '2024-05-26 19:58:15'),
(360, '48925360.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:15', '2024-05-26 19:58:16'),
(361, '99092361.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:16', '2024-05-26 19:58:16'),
(362, '17049362.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:20', '2024-05-26 19:58:21'),
(363, '99965363.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:22', '2024-05-26 19:58:24'),
(364, '35970364.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:25', '2024-05-26 19:58:25'),
(365, '25479365.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:26', '2024-05-26 19:58:26'),
(366, '98231366.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:26', '2024-05-26 19:58:27'),
(367, '21653367.webp', '', '', 'posts', 'image', 0, '2024-05-26 19:58:27', '2024-05-26 19:58:28'),
(368, '70705368.mp4', '', '', 'posts', 'video', 0, '2024-05-26 20:00:06', '2024-05-26 20:00:07'),
(369, '45810369.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:48', '2024-05-26 20:08:49'),
(370, '54604370.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:49', '2024-05-26 20:08:50'),
(371, '56867371.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:50', '2024-05-26 20:08:50'),
(372, '19038372.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:51', '2024-05-26 20:08:52'),
(373, '24896373.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:52', '2024-05-26 20:08:52'),
(374, '50558374.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:53', '2024-05-26 20:08:55'),
(375, '57740375.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:56', '2024-05-26 20:08:57'),
(376, '79725376.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:08:58', '2024-05-26 20:08:59'),
(377, '14844377.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:09:00', '2024-05-26 20:09:00'),
(378, '74553378.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:09:00', '2024-05-26 20:09:01'),
(379, '88674379.mp4', '', '', 'posts', 'video', 0, '2024-05-26 20:10:54', '2024-05-26 20:10:54'),
(380, '59789380.webp', '', '', 'posts', 'image', 0, '2024-05-26 20:13:27', '2024-05-26 20:13:28'),
(381, '24606381.webp', '', '', 'posts', 'image', 0, '2024-06-02 12:48:15', '2024-06-02 12:48:18'),
(382, '17012382.webp', '', '', 'posts', 'image', 0, '2024-06-02 18:49:13', '2024-06-02 18:49:21'),
(383, '56850383.webp', '', '', 'posts', 'image', 0, '2024-06-02 18:50:01', '2024-06-02 18:50:01'),
(384, '89586384.webp', '', '', 'posts', 'image', 0, '2024-06-02 18:51:25', '2024-06-02 18:51:39'),
(385, '95787385.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:08:16', '2024-06-02 19:08:24'),
(386, '38159386.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:08:36', '2024-06-02 19:08:37'),
(387, '64714387.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:09:29', '2024-06-02 19:09:30'),
(388, '41432388.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:09:42', '2024-06-02 19:09:51'),
(389, '45621389.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:14:06', '2024-06-02 19:14:18'),
(390, '84642390.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:14:36', '2024-06-02 19:14:41'),
(391, '66755391.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:16:00', '2024-06-02 19:16:06'),
(392, '10421392.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:16:21', '2024-06-02 19:16:22'),
(393, '57725393.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:17:19', '2024-06-02 19:17:20'),
(394, '14283394.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:17:35', '2024-06-02 19:17:36'),
(395, '40933395.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:18:29', '2024-06-02 19:18:29'),
(396, '70670396.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:18:45', '2024-06-02 19:18:47'),
(397, '63094397.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:21:04', '2024-06-02 19:21:04'),
(398, '76632398.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:21:56', '2024-06-02 19:21:57'),
(399, '58475399.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:25:31', '2024-06-02 19:25:35'),
(400, '11704400.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:39:27', '2024-06-02 19:39:28'),
(401, '80054401.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:41:47', '2024-06-02 19:41:48'),
(402, '34767402.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:45:33', '2024-06-02 19:45:34'),
(403, '90286403.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:49:25', '2024-06-02 19:49:25'),
(404, '72330404.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:51:21', '2024-06-02 19:51:22'),
(405, '74120405.webp', '', '', 'posts', 'image', 0, '2024-06-02 19:52:42', '2024-06-02 19:52:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_posts`
--

INSERT INTO `media_posts` (`id`, `media_id`, `category_id`, `post_id`, `main_table`, `sequence`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(3, 77, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 12:59:32', '2024-04-28 12:59:32'),
(4, 78, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 13:04:03', '2024-04-28 13:04:03'),
(5, 79, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 13:11:16', '2024-04-28 13:11:16'),
(6, 80, 3, NULL, NULL, 0, 1, NULL, '2024-04-28 13:11:16', '2024-04-28 13:11:16'),
(25, 99, NULL, 13, NULL, 0, 1, NULL, '2024-05-02 12:49:51', '2024-05-02 12:49:51'),
(35, 109, NULL, 15, NULL, 0, 1, NULL, '2024-05-04 11:20:15', '2024-05-04 11:20:15'),
(42, 116, NULL, 24, NULL, 0, 1, NULL, '2024-05-06 09:08:19', '2024-05-06 09:08:19'),
(43, 117, NULL, 22, NULL, 0, 1, NULL, '2024-05-06 09:08:50', '2024-05-06 09:08:50'),
(44, 118, NULL, 25, NULL, 0, 1, NULL, '2024-05-06 09:10:02', '2024-05-06 09:10:02'),
(45, 119, NULL, 23, NULL, 0, 1, NULL, '2024-05-06 09:10:41', '2024-05-06 09:10:41'),
(159, 233, 17, NULL, NULL, 0, 1, NULL, '2024-05-09 11:57:49', '2024-05-09 11:57:49'),
(160, 234, NULL, 33, NULL, 0, 1, NULL, '2024-05-16 14:12:31', '2024-05-16 14:12:31'),
(161, 235, NULL, 34, NULL, 0, 1, NULL, '2024-05-16 14:13:29', '2024-05-16 14:13:29'),
(162, 236, NULL, 35, NULL, 0, 1, NULL, '2024-05-16 14:14:00', '2024-05-16 14:14:00'),
(163, 237, NULL, 36, NULL, 0, 1, NULL, '2024-05-16 14:14:35', '2024-05-16 14:14:35'),
(164, 238, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:10:21', '2024-05-18 12:10:21'),
(166, 240, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:13', '2024-05-18 12:11:13'),
(167, 241, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:13', '2024-05-18 12:11:13'),
(168, 242, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:14', '2024-05-18 12:11:14'),
(169, 243, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:15', '2024-05-18 12:11:15'),
(170, 244, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:16', '2024-05-18 12:11:16'),
(171, 245, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:16', '2024-05-18 12:11:16'),
(172, 246, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:17', '2024-05-18 12:11:17'),
(173, 247, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:18', '2024-05-18 12:11:18'),
(174, 248, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 12:11:19', '2024-05-18 12:11:19'),
(176, 250, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:02', '2024-05-18 12:13:02'),
(177, 251, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:03', '2024-05-18 12:13:03'),
(178, 252, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:04', '2024-05-18 12:13:04'),
(179, 253, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:05', '2024-05-18 12:13:05'),
(180, 254, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:07', '2024-05-18 12:13:07'),
(181, 255, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:07', '2024-05-18 12:13:07'),
(182, 256, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:08', '2024-05-18 12:13:08'),
(183, 257, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:09', '2024-05-18 12:13:09'),
(184, 258, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:11', '2024-05-18 12:13:11'),
(185, 259, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:11', '2024-05-18 12:13:11'),
(186, 260, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:13', '2024-05-18 12:13:13'),
(187, 261, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:13', '2024-05-18 12:13:13'),
(188, 262, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:15', '2024-05-18 12:13:15'),
(189, 263, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:16', '2024-05-18 12:13:16'),
(190, 264, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:18', '2024-05-18 12:13:18'),
(191, 265, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:20', '2024-05-18 12:13:20'),
(192, 266, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 12:13:22', '2024-05-18 12:13:22'),
(194, 268, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 13:56:32', '2024-05-18 13:56:32'),
(195, 269, NULL, 13, NULL, 0, 1, NULL, '2024-05-18 13:56:54', '2024-05-18 13:56:54'),
(196, 270, NULL, 15, NULL, 0, 1, NULL, '2024-05-18 15:18:30', '2024-05-18 15:18:30'),
(197, 271, NULL, 13, NULL, 0, 1, NULL, '2024-05-19 14:52:53', '2024-05-19 14:52:53'),
(198, 272, NULL, 15, NULL, 0, 1, NULL, '2024-05-19 14:53:53', '2024-05-19 14:53:53'),
(199, 273, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:16:27', '2024-05-20 13:16:27'),
(200, 274, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:16:30', '2024-05-20 13:16:30'),
(201, 275, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:16:54', '2024-05-20 13:16:54'),
(202, 276, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:16:56', '2024-05-20 13:16:56'),
(203, 277, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:16:57', '2024-05-20 13:16:57'),
(204, 278, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:17:20', '2024-05-20 13:17:20'),
(205, 279, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:17:23', '2024-05-20 13:17:23'),
(206, 280, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:17:25', '2024-05-20 13:17:25'),
(207, 281, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:17:29', '2024-05-20 13:17:29'),
(208, 282, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:17:43', '2024-05-20 13:17:43'),
(209, 283, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:17:44', '2024-05-20 13:17:44'),
(210, 284, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:17:56', '2024-05-20 13:17:56'),
(211, 285, NULL, 16, NULL, 0, 1, NULL, '2024-05-20 13:22:31', '2024-05-20 13:22:31'),
(212, 286, NULL, 17, NULL, 0, 1, NULL, '2024-05-20 13:23:20', '2024-05-20 13:23:20'),
(213, 287, NULL, 17, NULL, 0, 1, NULL, '2024-05-20 13:23:21', '2024-05-20 13:23:21'),
(214, 288, NULL, 17, NULL, 0, 1, NULL, '2024-05-20 13:23:21', '2024-05-20 13:23:21'),
(215, 289, NULL, 17, NULL, 0, 1, NULL, '2024-05-20 13:23:22', '2024-05-20 13:23:22'),
(216, 290, NULL, 17, NULL, 0, 1, NULL, '2024-05-20 13:23:23', '2024-05-20 13:23:23'),
(217, 291, NULL, 17, NULL, 0, 1, NULL, '2024-05-20 13:23:23', '2024-05-20 13:23:23'),
(227, 307, NULL, 38, NULL, 0, 1, NULL, '2024-05-20 15:33:27', '2024-05-20 15:33:27'),
(228, 308, NULL, 38, NULL, 0, 1, NULL, '2024-05-20 15:33:28', '2024-05-20 15:33:28'),
(229, 309, NULL, 38, NULL, 0, 1, NULL, '2024-05-20 15:33:28', '2024-05-20 15:33:28'),
(230, 310, NULL, 38, NULL, 0, 1, NULL, '2024-05-20 15:33:30', '2024-05-20 15:33:30'),
(231, 311, NULL, 38, NULL, 0, 1, NULL, '2024-05-20 15:33:31', '2024-05-20 15:33:31'),
(232, 312, NULL, 38, NULL, 0, 1, NULL, '2024-05-20 15:33:32', '2024-05-20 15:33:32'),
(233, 313, NULL, 38, NULL, 0, 1, NULL, '2024-05-20 15:34:09', '2024-05-20 15:34:09'),
(235, 315, NULL, 40, NULL, 0, 1, NULL, '2024-05-20 15:46:17', '2024-05-20 15:46:17'),
(236, 316, NULL, 40, NULL, 0, 1, NULL, '2024-05-20 15:46:18', '2024-05-20 15:46:18'),
(237, 317, NULL, 40, NULL, 0, 1, NULL, '2024-05-20 15:46:57', '2024-05-20 15:46:57'),
(238, 318, NULL, 41, NULL, 0, 1, NULL, '2024-05-20 15:49:13', '2024-05-20 15:49:13'),
(239, 319, NULL, 41, NULL, 0, 1, NULL, '2024-05-20 15:49:14', '2024-05-20 15:49:14'),
(240, 320, NULL, 41, NULL, 0, 1, NULL, '2024-05-20 15:49:15', '2024-05-20 15:49:15'),
(241, 321, NULL, 41, NULL, 0, 1, NULL, '2024-05-20 15:49:19', '2024-05-20 15:49:19'),
(242, 322, NULL, 41, NULL, 0, 1, NULL, '2024-05-20 15:49:21', '2024-05-20 15:49:21'),
(243, 323, NULL, 41, NULL, 0, 1, NULL, '2024-05-20 15:49:44', '2024-05-20 15:49:44'),
(244, 324, NULL, 39, NULL, 0, 1, NULL, '2024-05-20 15:52:10', '2024-05-20 15:52:10'),
(245, 325, NULL, 39, NULL, 0, 1, NULL, '2024-05-20 16:09:05', '2024-05-20 16:09:05'),
(248, 328, 19, NULL, NULL, 0, 1, NULL, '2024-05-20 21:09:01', '2024-05-20 21:09:01'),
(249, 329, 19, NULL, NULL, 0, 1, NULL, '2024-05-20 21:09:29', '2024-05-20 21:09:29'),
(250, 330, NULL, 40, NULL, 0, 1, NULL, '2024-05-21 16:55:49', '2024-05-21 16:55:49'),
(251, 331, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:34', '2024-05-21 17:09:34'),
(252, 332, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:35', '2024-05-21 17:09:35'),
(253, 333, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:35', '2024-05-21 17:09:35'),
(254, 334, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:36', '2024-05-21 17:09:36'),
(255, 335, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:36', '2024-05-21 17:09:36'),
(256, 336, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:37', '2024-05-21 17:09:37'),
(257, 337, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:38', '2024-05-21 17:09:38'),
(258, 338, NULL, 42, NULL, 0, 1, NULL, '2024-05-21 17:09:39', '2024-05-21 17:09:39'),
(259, 339, 20, NULL, NULL, 0, 1, NULL, '2024-05-22 20:03:10', '2024-05-22 20:03:10'),
(260, 344, NULL, 43, NULL, 0, 1, NULL, '2024-05-26 19:28:49', '2024-05-26 19:28:49'),
(261, 345, NULL, 43, NULL, 0, 1, NULL, '2024-05-26 19:28:51', '2024-05-26 19:28:51'),
(262, 346, NULL, 43, NULL, 0, 1, NULL, '2024-05-26 19:28:51', '2024-05-26 19:28:51'),
(263, 347, NULL, 43, NULL, 0, 1, NULL, '2024-05-26 19:28:52', '2024-05-26 19:28:52'),
(264, 349, NULL, 44, NULL, 0, 1, NULL, '2024-05-26 19:35:53', '2024-05-26 19:35:53'),
(265, 350, NULL, 44, NULL, 0, 1, NULL, '2024-05-26 19:35:54', '2024-05-26 19:35:54'),
(266, 351, NULL, 44, NULL, 0, 1, NULL, '2024-05-26 19:35:55', '2024-05-26 19:35:55'),
(267, 352, NULL, 44, NULL, 0, 1, NULL, '2024-05-26 19:35:56', '2024-05-26 19:35:56'),
(268, 356, NULL, 43, NULL, 0, 1, NULL, '2024-05-26 19:43:39', '2024-05-26 19:43:39'),
(269, 357, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:11', '2024-05-26 19:58:11'),
(271, 359, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:15', '2024-05-26 19:58:15'),
(272, 360, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:16', '2024-05-26 19:58:16'),
(273, 361, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:16', '2024-05-26 19:58:16'),
(274, 362, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:21', '2024-05-26 19:58:21'),
(275, 363, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:24', '2024-05-26 19:58:24'),
(276, 364, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:25', '2024-05-26 19:58:25'),
(277, 365, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:26', '2024-05-26 19:58:26'),
(278, 366, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:27', '2024-05-26 19:58:27'),
(279, 367, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 19:58:28', '2024-05-26 19:58:28'),
(280, 368, NULL, 45, NULL, 0, 1, NULL, '2024-05-26 20:00:07', '2024-05-26 20:00:07'),
(281, 369, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:49', '2024-05-26 20:08:49'),
(282, 370, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:50', '2024-05-26 20:08:50'),
(283, 371, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:50', '2024-05-26 20:08:50'),
(284, 372, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:52', '2024-05-26 20:08:52'),
(285, 373, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:52', '2024-05-26 20:08:52'),
(286, 374, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:55', '2024-05-26 20:08:55'),
(287, 375, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:57', '2024-05-26 20:08:57'),
(288, 376, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:08:59', '2024-05-26 20:08:59'),
(289, 377, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:09:00', '2024-05-26 20:09:00'),
(290, 378, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:09:01', '2024-05-26 20:09:01'),
(291, 379, NULL, 46, NULL, 0, 1, NULL, '2024-05-26 20:10:54', '2024-05-26 20:10:54'),
(292, 380, NULL, 47, NULL, 0, 1, NULL, '2024-05-26 20:13:28', '2024-05-26 20:13:28'),
(293, 381, NULL, 60, NULL, 0, 1, NULL, '2024-06-02 12:48:18', '2024-06-02 12:48:18'),
(294, 382, NULL, 62, NULL, 0, 1, NULL, '2024-06-02 18:49:21', '2024-06-02 18:49:21'),
(295, 383, NULL, 63, NULL, 0, 1, NULL, '2024-06-02 18:50:01', '2024-06-02 18:50:01'),
(296, 384, NULL, 64, NULL, 0, 1, NULL, '2024-06-02 18:51:39', '2024-06-02 18:51:39'),
(297, 385, NULL, 65, NULL, 0, 1, NULL, '2024-06-02 19:08:24', '2024-06-02 19:08:24'),
(298, 386, NULL, 65, NULL, 0, 1, NULL, '2024-06-02 19:08:37', '2024-06-02 19:08:37'),
(299, 387, NULL, 66, NULL, 0, 1, NULL, '2024-06-02 19:09:30', '2024-06-02 19:09:30'),
(300, 388, NULL, 66, NULL, 0, 1, NULL, '2024-06-02 19:09:51', '2024-06-02 19:09:51'),
(301, 389, NULL, 67, NULL, 0, 1, NULL, '2024-06-02 19:14:20', '2024-06-02 19:14:20'),
(302, 390, NULL, 67, NULL, 0, 1, NULL, '2024-06-02 19:14:41', '2024-06-02 19:14:41'),
(303, 391, NULL, 68, NULL, 0, 1, NULL, '2024-06-02 19:16:06', '2024-06-02 19:16:06'),
(304, 392, NULL, 68, NULL, 0, 1, NULL, '2024-06-02 19:16:22', '2024-06-02 19:16:22'),
(305, 393, NULL, 69, NULL, 0, 1, NULL, '2024-06-02 19:17:20', '2024-06-02 19:17:20'),
(306, 394, NULL, 69, NULL, 0, 1, NULL, '2024-06-02 19:17:36', '2024-06-02 19:17:36'),
(307, 395, NULL, 70, NULL, 0, 1, NULL, '2024-06-02 19:18:29', '2024-06-02 19:18:29'),
(308, 396, NULL, 70, NULL, 0, 1, NULL, '2024-06-02 19:18:47', '2024-06-02 19:18:47'),
(309, 397, NULL, 71, NULL, 0, 1, NULL, '2024-06-02 19:21:04', '2024-06-02 19:21:04'),
(310, 398, NULL, 72, NULL, 0, 1, NULL, '2024-06-02 19:21:57', '2024-06-02 19:21:57'),
(311, 399, NULL, 73, NULL, 0, 1, NULL, '2024-06-02 19:25:35', '2024-06-02 19:25:35'),
(312, 400, NULL, 74, NULL, 0, 1, NULL, '2024-06-02 19:39:28', '2024-06-02 19:39:28'),
(313, 401, NULL, 75, NULL, 0, 1, NULL, '2024-06-02 19:41:48', '2024-06-02 19:41:48'),
(314, 402, NULL, 77, NULL, 0, 1, NULL, '2024-06-02 19:45:34', '2024-06-02 19:45:34'),
(315, 403, NULL, 78, NULL, 0, 1, NULL, '2024-06-02 19:49:25', '2024-06-02 19:49:25'),
(316, 404, NULL, 79, NULL, 0, 1, NULL, '2024-06-02 19:51:22', '2024-06-02 19:51:22'),
(317, 405, NULL, 76, NULL, 0, 1, NULL, '2024-06-02 19:52:44', '2024-06-02 19:52:44');

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
  `migration` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `meta_key`, `content`, `category_id`, `sequence`, `status`, `update_user_id`, `create_user_id`, `notes`, `created_at`, `updated_at`, `code`) VALUES
(1, 'Section 1', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'section-1'),
(2, 'Section 2', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:13', 'section-2'),
(3, 'Section 3', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:18', 'section-3'),
(4, 'Social Title', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:24', 'social-title'),
(5, 'Footer Copyright', NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:29', 'footer-copyright'),
(13, 'Cement Concrete Mixing', 'cement-concrete-mixing', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-02 12:48:51', '2024-05-16 16:27:31', NULL),
(15, 'Waste Water Treatment', 'waste-water-treatment', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-02 12:49:21', '2024-05-16 16:28:37', NULL),
(16, 'Cement Plant Example', 'cement-plant-example', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-02 12:49:30', '2024-05-20 13:14:23', NULL),
(17, 'Clean Water Pump Station', 'clean-water-pump-station', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-04 11:21:58', '2024-05-20 13:19:32', NULL),
(22, 'Siemens', 'siemens', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:03:29', '2024-05-16 15:45:39', NULL),
(23, 'Omron', 'omron', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:03:39', '2024-05-16 14:09:20', NULL),
(24, 'Schneider', 'schneider', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:04:26', '2024-05-16 14:10:10', NULL),
(25, 'ABB', 'abb', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-06 09:04:58', '2024-05-16 14:10:52', NULL),
(26, 'Name', NULL, NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'contact_name'),
(27, 'Email', NULL, NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'contact_email'),
(28, 'Subject', NULL, NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'contact_subject'),
(29, 'Message', NULL, NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'contact_message'),
(30, 'Send button', NULL, NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'contact_send'),
(31, 'Success message', NULL, NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'contact_success'),
(32, 'Error message', NULL, NULL, NULL, 7, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'contact_error'),
(33, 'Sick', 'sick', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-16 14:11:32', '2024-05-16 14:11:32', NULL),
(34, 'Balluf', 'balluf', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-16 14:11:40', '2024-05-16 14:11:40', NULL),
(35, 'Euchner', 'euchner', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-16 14:11:46', '2024-05-16 14:11:46', NULL),
(36, 'HOLCIM GROUP', 'holcim-group', NULL, NULL, 16, 0, 1, NULL, NULL, NULL, '2024-05-16 14:11:50', '2024-05-16 14:11:50', NULL),
(37, 'More', 'more', NULL, NULL, 18, 0, 1, NULL, NULL, NULL, NULL, '2024-04-27 14:23:07', 'more'),
(38, 'Automatic Roll WareHouse System', 'automatic-roll-warehouse-system', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-20 13:25:49', '2024-05-20 13:25:49', NULL),
(39, 'Laundry Machine Body Welding Line', 'laundry-machine-body-welding-line', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-20 13:26:43', '2024-05-20 13:26:43', NULL),
(40, 'Rewinding and Winding Machine', 'rewinding-and-winding-machine', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-20 13:27:29', '2024-05-20 15:44:26', NULL),
(41, 'Iron Dome Press Machine', 'iron-dome-press-machine', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-20 15:47:35', '2024-05-20 15:47:35', NULL),
(42, 'Fuel Boiler System', 'fuel-boiler-system', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-21 17:07:53', '2024-05-21 17:07:53', NULL),
(43, 'ABB Drives Commissioning', 'abb-drives-commissioning', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-26 19:26:14', '2024-05-26 19:26:14', NULL),
(44, 'HYDRAULIC PROJECT EXAMPLE', 'hydraulic-project-example', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-26 19:26:43', '2024-05-26 19:26:43', NULL),
(45, 'Roll Form Cut Machines', 'roll-form-cut-machines', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-26 19:54:46', '2024-05-26 19:54:46', NULL),
(46, 'REFRIGERATOR INJECTOR LINE', 'refrigerator-injector-line', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-26 20:01:45', '2024-05-26 20:01:45', NULL),
(47, 'SCADA system', 'scada-system', NULL, NULL, 4, 0, 1, NULL, NULL, NULL, '2024-05-26 20:03:07', '2024-05-26 20:03:07', NULL),
(48, 'PLC Programming', 'plc-programming', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:40:33', '2024-05-31 19:09:10', NULL),
(49, 'Project management', 'project-management', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:42:15', '2024-05-27 16:42:15', NULL),
(50, 'Industrial touch screen HMI', 'industrial-touch-screen-hmi', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:42:51', '2024-05-27 16:42:51', NULL),
(51, 'SCADA systems', 'scada-systems', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:01', '2024-05-27 16:43:01', NULL),
(52, 'Image processing', 'image-processing', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:09', '2024-05-27 16:43:09', NULL),
(53, 'Siemens PCS', 'siemens-pcs', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:15', '2024-05-27 16:44:28', NULL),
(54, 'SINAMICs Drives', 'sinamics-drives', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:25', '2024-05-27 16:43:25', NULL),
(55, 'ABB drives', 'abb-drives', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:32', '2024-05-27 16:43:32', NULL),
(56, 'SCHNEIDER AVITAR Drives', 'schneider-avitar-drives', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:41', '2024-05-27 16:43:41', NULL),
(57, 'DANFOSS Drives', 'danfoss-drives', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:50', '2024-05-27 16:43:50', NULL),
(58, 'LENZE Drives', 'lenze-drives', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:43:56', '2024-05-27 16:43:56', NULL),
(59, 'Control Technics Drives', 'control-technics-drives', NULL, NULL, 6, 0, 1, NULL, NULL, NULL, '2024-05-27 16:44:05', '2024-05-27 16:44:05', NULL),
(60, 'Siemens S71200', 'siemens-s71200', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 12:45:17', '2024-06-02 12:45:17', NULL),
(62, 'Siemens S71500', 'siemens-s71500', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:40:15', '2024-06-02 18:40:15', NULL),
(63, 'Siemens S7300', 'siemens-s7300', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:40:28', '2024-06-02 18:40:28', NULL),
(64, 'Siemens S7400', 'siemens-s7400', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:40:39', '2024-06-02 18:40:39', NULL),
(65, 'SINAMICs G120', 'sinamics-g120', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:41:07', '2024-06-02 18:41:07', NULL),
(66, 'SINAMICs S210', 'sinamics-s210', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:41:20', '2024-06-02 18:41:20', NULL),
(67, 'SINAMUCs S110', 'sinamucs-s110', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:41:27', '2024-06-02 18:41:27', NULL),
(68, 'SINAMICs S120', 'sinamics-s120', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:41:36', '2024-06-02 18:41:36', NULL),
(69, 'SINAMICs V20', 'sinamics-v20', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:41:43', '2024-06-02 18:41:43', NULL),
(70, 'SINAMICs V90', 'sinamics-v90', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:41:50', '2024-06-02 18:41:50', NULL),
(71, 'Siemens Basic HMIs', 'siemens-basic-hmis', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:42:10', '2024-06-02 18:42:10', NULL),
(72, 'Siemens Comfort HMIs', 'siemens-comfort-hmis', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:42:20', '2024-06-02 18:42:20', NULL),
(73, 'Siemens WINCC SCADA', 'siemens-wincc-scada', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:42:34', '2024-06-02 18:42:34', NULL),
(74, 'OMRON PLCs', 'omron-plcs', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:42:46', '2024-06-02 18:42:46', NULL),
(75, 'OMRON HMIs', 'omron-hmis', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:43:21', '2024-06-02 18:43:21', NULL),
(76, 'ABB Drives', 'abb-drives', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:43:46', '2024-06-02 18:43:46', NULL),
(77, 'ABB PLCs', 'abb-plcs', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:43:55', '2024-06-02 18:43:55', NULL),
(78, 'Schneider Drives', 'schneider-drives', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:44:21', '2024-06-02 18:44:21', NULL),
(79, 'Schneider PLCs', 'schneider-plcs', NULL, NULL, 5, 0, 1, NULL, NULL, NULL, '2024-06-02 18:45:08', '2024-06-02 18:45:08', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(16, 'Name', 'instagram', 'Code', 'instagram', 'Link', 'https://www.instagram.com/p/Ckf3G0FIDb7/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA%3D%3D&img_index=1', 'social', '', 0, '', '', 1, '2024-04-22 17:02:03', '2024-05-30 16:23:38'),
(17, 'Name', 'twitter', 'Code', 'twitter', 'Link', 'https://twitter.com', 'social', '', 0, '', '', 1, '2024-04-22 17:02:28', '2024-04-24 14:55:26'),
(18, 'Name', 'linkedin', 'Code', 'linkedin', 'Link', 'https://www.linkedin.com/', 'social', '', 0, '', '', 1, '2024-04-24 14:57:07', '2024-04-24 14:57:07'),
(19, 'whatsapp', '+905011291958', NULL, NULL, NULL, NULL, 'site-info', 'whatsapp', 0, NULL, 'whatsapp', 1, NULL, '2024-04-30 16:30:46'),
(20, 'Location', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d385396.3211659778!2d28.6825179770093!3d41.00537019816266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14caa7040068086b%3A0xe1ccfe98bc01b0d0!2zxLBzdGFuYnVsLCBUw7xya2l5ZQ!5e0!3m2!1sen!2s!4v1717320062098!5m2!1sen!2s', NULL, NULL, NULL, NULL, 'site-info', 'location', 0, NULL, 'location', 1, NULL, '2024-06-02 16:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `createuser_id` bigint UNSIGNED DEFAULT NULL,
  `updateuser_id` bigint UNSIGNED DEFAULT NULL,
  `mobile` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `first_name`, `last_name`, `user_name`, `role`, `token`, `createuser_id`, `updateuser_id`, `mobile`, `remember_token`, `created_at`, `updated_at`, `image`, `is_active`) VALUES
(1, 'najyms@gmail.com', 'najyms@gmail.com', NULL, '$2y$12$dYqjMMIfTexfzNRdBIOQdueDF883JjYD1v1lTrP5hSx9yK4WxfSHW', 'ahmad', 'ms', NULL, 'admin', 'cuazVdoOzmwIySszyF2Hm6:APA91bEYValX5_T_V8vxWG693VEfGlytytYEiQi3IYZ-YQ2y5cYa1riz6Ox4f15YuEokXslKmELDXjamslqiT4ySDD8cC2uQo5SURTkf3Vq87fbhfrOqeYOggOGEiz075bTAepER4dNj', NULL, 1, NULL, 'GCSgBCCMiOsx2za44ciujeN62RBFdsSUwKeRNiGQw462CL92rvB2N0LVqlWt', '2024-01-11 12:47:38', '2024-05-30 06:57:26', '922971.webp', 0),
(23, 'Jamil Rahwan', 'jamil.rahwan@gmail.com', NULL, '$2y$12$esNUlqBYCM9p3Z.bD3cvVuN8qzcwadoAa4DMO75fGQg19ai1DJ0zq', 'Jamil', 'Rahwan', NULL, 'admin', NULL, 1, 1, '00905011291958', 'n7crbhFkclo4oGc0Ajmn5ytZDyTgMT7x0BqkYhMzMpxo5XRRXzcJk5Nz1OCY', '2024-05-30 06:31:19', '2024-05-30 06:35:53', '3170423.webp', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
