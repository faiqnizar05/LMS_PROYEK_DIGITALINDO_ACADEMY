-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Nov 2025 pada 15.15
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_digitalindo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('instuctor@example.com|127.0.0.1', 'i:3;', 1762623446),
('instuctor@example.com|127.0.0.1:timer', 'i:1762623446;', 1762623446);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_token` char(36) DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Teknisi Komputer', 'teknisi-komputer', 'http://127.0.0.1:8000/upload/category/690f6c9e63a03.png', '2025-11-08 09:15:26', '2025-11-08 09:15:26'),
(2, 'Web Desain', 'web-desain', 'http://127.0.0.1:8000/upload/category/690f6caa520ce.png', '2025-11-08 09:15:38', '2025-11-08 09:15:38'),
(3, 'Digital Marketing AI dan Content Creator', 'digital-marketing-ai-dan-content-creator', 'http://127.0.0.1:8000/upload/category/690f6cb903f0c.png', '2025-11-08 09:15:53', '2025-11-08 09:15:53'),
(4, 'Microsoft Office', 'microsoft-office', 'http://127.0.0.1:8000/upload/category/690f6cc648ead.png', '2025-11-08 09:16:06', '2025-11-08 09:16:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_discount` varchar(255) NOT NULL,
  `coupon_validity` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `course_image` varchar(255) DEFAULT NULL,
  `course_title` text DEFAULT NULL,
  `course_name` text DEFAULT NULL,
  `course_name_slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `certificate` varchar(255) DEFAULT NULL,
  `duration` decimal(8,2) DEFAULT NULL,
  `selling_price` int(11) DEFAULT NULL,
  `discount_price` int(11) DEFAULT NULL,
  `prerequisites` text DEFAULT NULL,
  `bestseller` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `highestrated` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `courses`
--

INSERT INTO `courses` (`id`, `category_id`, `subcategory_id`, `instructor_id`, `course_image`, `course_title`, `course_name`, `course_name_slug`, `description`, `video_url`, `label`, `resources`, `certificate`, `duration`, `selling_price`, `discount_price`, `prerequisites`, `bestseller`, `featured`, `highestrated`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 3, 'http://127.0.0.1:8000/upload/course/690f714a4f108.png', 'Menguasai Strategi Digital Marketing Modern', 'Kursus Digital Marketing AI dan Content Creator', 'kursus-digital-marketing-ai-dan-content-creator', '<p><strong data-start=\"167\" data-end=\"188\" data-pasted=\"true\">Digital Marketing</strong> adalah strategi pemasaran yang memanfaatkan teknologi digital dan internet untuk mempromosikan produk, layanan, atau merek kepada audiens yang lebih luas. Melalui berbagai saluran seperti media sosial, mesin pencari, email, website, dan iklan online, digital marketing membantu bisnis menjangkau pelanggan secara lebih efektif dan terukur.</p>', 'https://www.youtube.com/watch?v=01Imoibt4as', NULL, '5', 'yes', 60.00, 3000000, 2300000, NULL, 'yes', 'yes', 'yes', 0, '2025-11-08 09:35:22', '2025-11-08 10:03:45'),
(2, 2, 10, 3, 'http://127.0.0.1:8000/upload/course/690f7227f14a4.png', 'Pelatihan Web Desain Profesional untuk Pemula', 'Web Desain', 'web-desain', '<p>Kursus <strong data-start=\"161\" data-end=\"187\" data-pasted=\"true\">Web Desain Profesional</strong> ini dirancang untuk membantu peserta memahami cara merancang dan membangun tampilan website yang menarik, interaktif, serta responsif. Dalam kursus ini, peserta akan mempelajari konsep dasar <strong data-start=\"379\" data-end=\"413\">desain antarmuka pengguna (UI)</strong> dan <strong data-start=\"418\" data-end=\"446\">pengalaman pengguna (UX)</strong>, serta penggunaan bahasa pemrograman seperti <strong data-start=\"492\" data-end=\"500\">HTML</strong>, <strong data-start=\"502\" data-end=\"509\">CSS</strong>, dan <strong data-start=\"515\" data-end=\"529\">JavaScript</strong> untuk menghidupkan tampilan website.</p>', 'https://www.youtube.com/watch?v=01Imoibt4as', 'beginer', '5', 'yes', 60.00, 3000000, 1500000, '<p>🕒 <strong data-start=\"874\" data-end=\"940\" data-pasted=\"true\">Bersedia mengikuti seluruh sesi pembelajaran dan tugas praktik</strong> untuk membangun portofolio desain web yang solid.</p>', 'yes', 'yes', 'yes', 0, '2025-11-08 09:38:38', '2025-11-08 09:39:03'),
(3, 1, 6, 3, 'http://127.0.0.1:8000/upload/course/690f72da85778.png', 'Menjadi Profesional dalam Teknisi Komputer', 'Teknisi Komputer', 'teknisi-komputer', '<p>Kursus Teknisi Komputer ini dirancang untuk membekali peserta dengan pengetahuan dan keterampilan dalam merakit, memelihara, serta memperbaiki komputer dan perangkat keras (hardware). Peserta akan mempelajari cara kerja berbagai komponen komputer, seperti prosesor, RAM, hard drive, motherboard, dan sistem pendingin, serta memahami cara menginstal sistem operasi dan perangkat lunak pendukung.</p>', 'https://www.youtube.com/watch?v=01Imoibt4as', 'beginer', '5', 'yes', 60.00, 3000000, 1500000, '<p>🎨 Memiliki minat dalam bidang desain dan teknologi &mdash; terutama dalam pembuatan tampilan website yang menarik dan fungsional.</p>', 'yes', 'yes', 'yes', 0, '2025-11-08 09:42:02', '2025-11-08 09:42:02'),
(4, 4, 3, 3, 'http://127.0.0.1:8000/upload/course/690f731269b66.png', 'Menjadi Profesional dalam Micorosft Office', 'Microsoft Office', 'microsoft-office', '<p>Kursus <strong data-start=\"173\" data-end=\"193\" data-pasted=\"true\">Microsoft Office</strong> ini dirancang untuk membantu peserta menguasai berbagai aplikasi perkantoran penting seperti <strong data-start=\"287\" data-end=\"337\">Microsoft Word, Excel, PowerPoint, dan Outlook</strong>. Melalui kursus ini, peserta akan belajar cara membuat dokumen profesional, mengelola data dan laporan dengan efisien, serta menyusun presentasi yang menarik dan informatif.</p>', 'https://www.youtube.com/watch?v=01Imoibt4as', 'beginer', '5', 'yes', 60.00, 3000000, 1500000, '<p>Kursus Microsoft Office ini dirancang untuk membantu peserta menguasai berbagai aplikasi perkantoran penting seperti Microsoft Word, Excel, PowerPoint, dan Outlook. Melalui kursus ini, peserta akan belajar cara membuat dokumen profesional, mengelola data dan laporan dengan efisien, serta menyusun presentasi yang menarik dan informatif.</p>', 'yes', 'yes', 'yes', 0, '2025-11-08 09:42:58', '2025-11-08 09:42:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `course_goals`
--

CREATE TABLE `course_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `goal_name` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `course_goals`
--

INSERT INTO `course_goals` (`id`, `course_id`, `goal_name`, `created_at`, `updated_at`) VALUES
(9, 2, '🚀 Memahami konsep dasar digital marketing, termasuk strategi promosi melalui media sosial, SEO, dan kampanye iklan online.', '2025-11-08 09:39:04', '2025-11-08 09:39:04'),
(10, 2, '🧩 Mengetahui dasar penggunaan internet dan media digital, seperti mengunduh file dan mengakses situs web.', '2025-11-08 09:39:04', '2025-11-08 09:39:04'),
(11, 3, '🚀 Memahami konsep dasar digital marketing, termasuk strategi promosi melalui media sosial, SEO, dan kampanye iklan online.', '2025-11-08 09:42:02', '2025-11-08 09:42:02'),
(12, 4, '🚀 Memahami konsep dasar digital marketing, termasuk strategi promosi melalui media sosial, SEO, dan kampanye iklan online.', '2025-11-08 09:42:58', '2025-11-08 09:42:58'),
(13, 1, '🚀 Memahami konsep dasar digital marketing, termasuk strategi promosi melalui media sosial, SEO, dan kampanye iklan online.', '2025-11-08 10:03:45', '2025-11-08 10:03:45'),
(14, 1, '🧠 Memiliki pengetahuan dasar komputer dan internet — mampu menggunakan browser, email, dan media sosial.', '2025-11-08 10:03:45', '2025-11-08 10:03:45'),
(15, 1, '💻 Mempunyai perangkat komputer atau laptop dengan koneksi internet yang stabil.', '2025-11-08 10:03:45', '2025-11-08 10:03:45'),
(16, 1, '✍️ Memiliki minat dalam bidang pemasaran dan teknologi digital.', '2025-11-08 10:03:45', '2025-11-08 10:03:45'),
(17, 1, '🕒 Kesediaan untuk mengikuti seluruh sesi pembelajaran dan tugas proyek.', '2025-11-08 10:03:45', '2025-11-08 10:03:45'),
(18, 1, '📱 Akun aktif media sosial (seperti Instagram, Facebook, atau TikTok) untuk praktik strategi promosi online.', '2025-11-08 10:03:45', '2025-11-08 10:03:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `course_lectures`
--

CREATE TABLE `course_lectures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `lecture_title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `video_duration` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `course_sections`
--

CREATE TABLE `course_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `section_title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Struktur dari tabel `googles`
--

CREATE TABLE `googles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `secret_key` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `info_boxes`
--

CREATE TABLE `info_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_28_174557_create_categories_table', 1),
(5, '2025_01_30_033840_create_sub_categories_table', 1),
(6, '2025_02_04_174735_create_sliders_table', 1),
(7, '2025_02_08_180721_create_info_boxes_table', 1),
(8, '2025_02_21_032758_create_courses_table', 1),
(9, '2025_02_22_023806_create_course_goals_table', 1),
(10, '2025_03_08_022906_create_course_sections_table', 1),
(11, '2025_03_08_023029_create_course_lectures_table', 1),
(12, '2025_04_21_032032_create_wishlists_table', 1),
(13, '2025_05_01_135504_create_carts_table', 1),
(14, '2025_05_11_032228_create_coupons_table', 1),
(15, '2025_05_18_153021_create_stripes_table', 1),
(16, '2025_05_24_170819_create_payments_table', 1),
(17, '2025_06_14_072529_create_googles_table', 1),
(18, '2025_07_19_063458_create_smtps_table', 1),
(19, '2025_07_26_092742_create_partners_table', 1),
(20, '2025_07_28_082612_create_site_infos_table', 1),
(21, '2025_10_31_143507_create_transactions_table', 1),
(22, '2025_10_31_145953_create_orders_table', 1),
(23, '2025_11_08_105109_create_ulasans_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `course_title` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `payment_id`, `user_id`, `course_id`, `instructor_id`, `course_title`, `price`, `created_at`, `updated_at`) VALUES
(1, NULL, 2, 1, 3, 'Menguasai Strategi Digital Marketing Modern dengan Kecerdasan Buatan dan Kreativitas Konten', 2300000, '2025-11-08 10:01:13', '2025-11-08 10:01:13'),
(2, NULL, 3, 1, 3, 'Menguasai Strategi Digital Marketing Modern', 2300000, '2025-11-08 10:03:56', '2025-11-08 10:03:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cash_delivery` varchar(255) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `order_month` varchar(255) DEFAULT NULL,
  `order_year` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `transaction_id`, `name`, `email`, `phone`, `address`, `cash_delivery`, `total_amount`, `payment_type`, `invoice_no`, `order_date`, `order_month`, `order_year`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DIAC202511081701131', 'Jakarta', 'user@example.com', '085692476174', 'Jakarta', NULL, '2300000', '-', '-', NULL, NULL, NULL, 'PENDING', '2025-11-08 10:01:13', '2025-11-08 10:01:13'),
(2, 'DIAC202511081703562', 'Adi Priatna', 'instructor@example.com', '085692476174', 'Depok', NULL, '2300000', '-', '-', NULL, NULL, NULL, 'PENDING', '2025-11-08 10:03:56', '2025-11-08 10:03:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('999POPg2TD9BoesEhzxxxg5cpMN78ejYcn35iNX2', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTTZXZmtvSXdDWFFGRkZQUnlXbm5zU0pzTzk1QWdlem9UOGhBcUpHUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnN0cnVjdG9yL2Rhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1762623473);

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_infos`
--

CREATE TABLE `site_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `short_description`, `video_url`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Web Desain', 'Web Desain adalah proses merancang tampilan dan struktur sebuah website agar terlihat menarik, mudah digunakan, dan berfungsi dengan baik. Dalam web desain, elemen visual seperti warna, tipografi, tata letak, serta gambar dipadukan dengan prinsip pengalaman pengguna (User Experience/UX) untuk menciptakan situs yang tidak hanya indah secara estetika, tetapi juga efektif dalam menyampaikan informasi.', 'https://youtu.be/h95cQkEWBx0', 'http://127.0.0.1:8000/upload/slider/690f6fd9a67f0.png', '2025-11-08 09:29:13', '2025-11-08 09:29:13'),
(2, 'Digital Marketing', 'Digital Marketing adalah strategi pemasaran yang memanfaatkan teknologi digital dan internet untuk mempromosikan produk, layanan, atau merek kepada audiens yang lebih luas. Melalui berbagai saluran seperti media sosial, mesin pencari, email, website, dan iklan online, digital marketing membantu bisnis menjangkau pelanggan secara lebih efektif dan terukur.', 'https://youtu.be/h95cQkEWBx0', 'http://127.0.0.1:8000/upload/slider/690f700701958.png', '2025-11-08 09:29:59', '2025-11-08 09:29:59'),
(3, 'Teknisi Komputer', 'Teknisi Komputer adalah profesi yang berfokus pada perawatan, perbaikan, dan pengelolaan perangkat keras (hardware) maupun perangkat lunak (software) komputer.', 'https://youtu.be/h95cQkEWBx0', 'http://127.0.0.1:8000/upload/slider/690f704673685.png', '2025-11-08 09:31:02', '2025-11-08 09:31:02'),
(4, 'Microsft Office', 'Microsoft Office adalah paket aplikasi perkantoran yang dirancang untuk membantu dalam pekerjaan administrasi, pendidikan, maupun bisnis sehari-hari.', 'https://youtu.be/h95cQkEWBx0', 'http://127.0.0.1:8000/upload/slider/690f706e6aa45.png', '2025-11-08 09:31:42', '2025-11-08 09:31:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `smtps`
--

CREATE TABLE `smtps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mailer` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stripes`
--

CREATE TABLE `stripes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publish_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 3, 'Digital Marketing', 'digital-marketing', '2025-11-08 09:17:22', '2025-11-08 09:17:22'),
(2, 3, 'Content Creator', 'content-creator', '2025-11-08 09:17:33', '2025-11-08 09:17:33'),
(3, 4, 'Microsoft Word', 'microsoft-word', '2025-11-08 09:20:02', '2025-11-08 09:20:02'),
(4, 4, 'Microsoft Excel', 'microsoft-excel', '2025-11-08 09:20:12', '2025-11-08 09:20:12'),
(5, 4, 'Microsoft Powe Point', 'microsoft-powe-point', '2025-11-08 09:20:28', '2025-11-08 09:20:28'),
(6, 1, 'Perangkat Keras (Hardware)', 'perangkat-keras-hardware', '2025-11-08 09:20:54', '2025-11-08 09:20:54'),
(7, 1, 'Perangkat Lunak(Software)', 'perangkat-lunaksoftware', '2025-11-08 09:21:02', '2025-11-08 09:21:02'),
(8, 1, 'Sistem Operasi', 'sistem-operasi', '2025-11-08 09:21:09', '2025-11-08 09:21:09'),
(9, 2, 'Seo Website', 'seo-website', '2025-11-08 09:21:19', '2025-11-08 09:21:19'),
(10, 2, 'Desain Antarmuka (UI Design)', 'desain-antarmuka-ui-design', '2025-11-08 09:22:06', '2025-11-08 09:22:06'),
(11, 2, 'Pengalaman Pengguna (UX Design)', 'pengalaman-pengguna-ux-design', '2025-11-08 09:22:14', '2025-11-08 09:22:14'),
(12, 2, 'Desain Responsif', 'desain-responsif', '2025-11-08 09:22:21', '2025-11-08 09:22:21'),
(13, 2, 'Prototyping dan Wireframing', 'prototyping-dan-wireframing', '2025-11-08 09:22:29', '2025-11-08 09:22:29'),
(14, 2, 'HTML, CSS & JavaScript Dasar', 'html-css--javascript-dasar', '2025-11-08 09:22:38', '2025-11-08 09:22:38'),
(15, 2, 'Desain Landing Page', 'desain-landing-page', '2025-11-08 09:22:46', '2025-11-08 09:22:46'),
(16, 2, 'Desain Web dengan Figma', 'desain-web-dengan-figma', '2025-11-08 09:22:53', '2025-11-08 09:22:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ulasans`
--

CREATE TABLE `ulasans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('user','instructor','admin') NOT NULL DEFAULT 'user',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `bio` longtext DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `experience` longtext DEFAULT NULL,
  `gender` enum('male','female') NOT NULL DEFAULT 'male',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `name`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `bio`, `day`, `month`, `year`, `city`, `country`, `experience`, `gender`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Faiq Nizar', 'admin@example.com', NULL, '$2y$12$sFmQS69u2XzxASX3phXHB.Unl6ZT/KfIlWyCQxMq1ecMnYwb4cLlK', 'http://127.0.0.1:8000/upload/user/690f70af11548.png', '098040284', 'Jakarta', 'admin', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, NULL, '2025-11-08 09:32:47'),
(2, 'Muhammad Nizar', 'Jakarta', 'Jakarta', 'user@example.com', NULL, '$2y$12$SGcbbu8t0PfmtxntYEVZ4.anBfGzBj5UyCehYmBqye/lx54dmodx6', 'http://127.0.0.1:8000/upload/user/690f75b976975.jpg', '085692476174', 'Jakarta', 'user', '1', 'Programmer Profesional', NULL, NULL, NULL, NULL, NULL, NULL, 'male', NULL, NULL, '2025-11-08 09:54:17'),
(3, NULL, NULL, 'Adi Priatna', 'instructor@example.com', NULL, '$2y$12$5dZhgV8rXVHy4RTwdkPYuuefMaxA14cWHL2RcjA4mHxWDCfjXzYZO', 'http://127.0.0.1:8000/upload/user/690f735dbb753.jpg', '085692476174', 'Depok', 'instructor', '1', 'Adi Priatna adalah seorang instruktur berpengalaman di bidang aplikasi perkantoran dan teknologi informasi, dengan lebih dari 5 tahun pengalaman mengajar Microsoft Office di berbagai lembaga pendidikan dan pelatihan profesional. Ia memiliki keahlian dalam mengajarkan penggunaan Microsoft Word, Excel, PowerPoint, dan Outlook secara efektif untuk kebutuhan kerja maupun pendidikan.\r\n\r\nSebagai pengajar, Rina dikenal dengan gaya mengajarnya yang interaktif, sabar, dan mudah dipahami, sehingga peserta dapat belajar dengan nyaman dari level dasar hingga mahir. Melalui kursus ini, ia berkomitmen membantu peserta menjadi lebih produktif, profesional, dan percaya diri dalam menggunakan Microsoft Office di dunia kerja nyata.', NULL, NULL, NULL, 'Depok', 'Indonesia', 'Microsoft Office', 'male', NULL, NULL, '2025-11-08 09:44:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_course_id_foreign` (`course_id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `course_goals`
--
ALTER TABLE `course_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_goals_course_id_foreign` (`course_id`);

--
-- Indeks untuk tabel `course_lectures`
--
ALTER TABLE `course_lectures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_lectures_section_id_foreign` (`section_id`);

--
-- Indeks untuk tabel `course_sections`
--
ALTER TABLE `course_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_sections_course_id_foreign` (`course_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `googles`
--
ALTER TABLE `googles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `info_boxes`
--
ALTER TABLE `info_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `site_infos`
--
ALTER TABLE `site_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `smtps`
--
ALTER TABLE `smtps`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stripes`
--
ALTER TABLE `stripes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ulasans`
--
ALTER TABLE `ulasans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ulasans_course_id_foreign` (`course_id`),
  ADD KEY `ulasans_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_course_id_foreign` (`course_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `course_goals`
--
ALTER TABLE `course_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `course_lectures`
--
ALTER TABLE `course_lectures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `googles`
--
ALTER TABLE `googles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `info_boxes`
--
ALTER TABLE `info_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `site_infos`
--
ALTER TABLE `site_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `smtps`
--
ALTER TABLE `smtps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stripes`
--
ALTER TABLE `stripes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ulasans`
--
ALTER TABLE `ulasans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `course_goals`
--
ALTER TABLE `course_goals`
  ADD CONSTRAINT `course_goals_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `course_lectures`
--
ALTER TABLE `course_lectures`
  ADD CONSTRAINT `course_lectures_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `course_sections` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `course_sections`
--
ALTER TABLE `course_sections`
  ADD CONSTRAINT `course_sections_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ulasans`
--
ALTER TABLE `ulasans`
  ADD CONSTRAINT `ulasans_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulasans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
