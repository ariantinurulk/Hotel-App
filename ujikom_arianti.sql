-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Mar 2023 pada 13.19
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujikom_arianti`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','resepsionis') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'resepsionis',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `nama`, `username`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', 'admin', '$2y$10$dYUqtcXEcHrZ5hdq5Edmv.cRe5jP5ryB5wO3jJLgNqpIRSx1oLEIa', NULL, '2022-06-02 23:53:55', '2022-06-02 23:53:55'),
(2, 'Resepsionis', 'resepsionis', 'resepsionis', '$2y$10$3p9RFHgMzjSgPR3LwuWG5eiRC/tc.UCo0TVm5MmbiR.uVFKodifqa', NULL, '2022-06-02 23:53:55', '2022-06-02 23:53:55'),
(3, 'Hayabusa', 'haya', 'resepsionis', '$2y$10$KrdtB4VLDrTskdiqkkn04eXhngPzsGWl58qrFGQ1JWgePLCIp30MS', NULL, '2022-06-02 23:53:55', '2022-06-02 23:53:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_hotels`
--

CREATE TABLE `fasilitas_hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_fasilitas_hotel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_fasilitas_hotel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi_fasilitas_hotel` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fasilitas_hotels`
--

INSERT INTO `fasilitas_hotels` (`id`, `nama_fasilitas_hotel`, `foto_fasilitas_hotel`, `deskripsi_fasilitas_hotel`) VALUES
(1, 'Kolam Renang', '675_1654612981.jpeg', 'Kolam renang adalah suatu kontruksi buatan yang dirancang untuk diisi dengan air dan digunakan untuk berenang, menyelam atau aktivitas air lainnya.'),
(2, 'Restoran OutDoor', '738_1654613183.jpeg', 'restoran adalah istilah umum untuk menyebut usaha gastronomi yang menyajikan hidangan kepada masyarakat dan menyediakan tempat untuk menikmati hidangan tersebut serta menetapkan tarif tertentu untuk makanan dan pelayanannya.'),
(3, 'Taman', '978_1654613389.jpeg', 'Taman adalah sebidang lahan berpagar yang digunakan untuk mendapatkan kesenangan, kegembiraan, dan kenyamanan.'),
(4, 'Sarapan Pagi Gratis', '709_1654613612.jpg', 'Hotel ini menyiapkan Sarapan Pagi gratis untuk Pelangganya.'),
(5, 'SPA Salon/Kecantikan', '372_1654613837.jpeg', 'Hotel ini menyidiakan Fasilitas Salon Kecantikan untuk Perempuan yang membutuhkan.'),
(6, 'Ruang Olahraga', '835_1654614146.jpeg', 'Untuk kamu yang selalu menjaga kebugaran tubuh, tentunya membutuhkan  ruang fitness, Hotel ini juga menyidiakannya.'),
(7, 'Lobi Hotel', '626_1654614221.jpeg', 'Lobi hotel untuk kamu yang ingin melakukan Chekin dan Check di Hotel Kami.'),
(8, 'Bar', '356_1654614553.jpeg', 'Bar di Hotel kami menyidiakan Segala macam minuman Beralkohol yang Anda butuhkan.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_kamars`
--

CREATE TABLE `fasilitas_kamars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kamar_id` bigint(20) UNSIGNED NOT NULL,
  `nama_fasilitas_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fasilitas_kamars`
--

INSERT INTO `fasilitas_kamars` (`id`, `kamar_id`, `nama_fasilitas_kamar`) VALUES
(1, 1, 'TV'),
(2, 1, 'AC'),
(3, 2, 'TV'),
(4, 2, 'AC');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamars`
--

CREATE TABLE `kamars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kamar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_kamar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jum_kamar` int(11) NOT NULL,
  `harga_kamar` int(11) DEFAULT NULL,
  `deskripsi_kamar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kamars`
--

INSERT INTO `kamars` (`id`, `nama_kamar`, `foto_kamar`, `jum_kamar`, `harga_kamar`, `deskripsi_kamar`) VALUES
(1, 'Deluxe Room', '94_1654312053.jpg', 10, 600000, 'Deluxe Room memiliki ukuran luas standar sekitar 40 meter persegi dan biasanya memiliki lokasi dengan pemandangan yang lebih bagus daripada kamar standar.'),
(2, 'Standard Room', '256_1654611509.jpeg', 15, 700000, 'Kamar Standard memiliki fasilitas yang paling dasar, biasanya sebuah televisi, pembuat kopi, telepon, meja, kloset dan kamar mandi.'),
(3, 'Twin Room', '752_1654611078.jpeg', 10, 500000, 'Twin room memiliki dua buah tempat tidur yang biasanya terpisah dan masing-masing berukuran single.'),
(4, 'Single Room', '223_1654607099.jpeg', 6, 250000, 'Single Room adalah sebuah Kamar untuk satu orang yang dilengkapi dengan satu buah tempat tidur berukuran Single untuk satu orang.'),
(5, 'Family Room', '659_1654612153.jpg', 12, 800000, 'Kamar hotel ini cocok untuk keluarga dengan satu tempat tidur berukuran besar untuk dua orang dan satu tempat tidur berukuran kecil atau single.'),
(6, 'Junior suite Room', '83_1654612794.jpeg', 10, 850000, 'unior suite room ditandai dengan adanya ruang tamu.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_04_23_031717_create_admins_table', 1),
(3, '2022_05_08_020226_create_kamars_table', 1),
(4, '2022_05_09_094800_create_fasilitas_kamars_table', 1),
(5, '2022_05_11_020045_create_fasilitas_hotels_table', 1),
(6, '2022_05_31_123135_create_pemesanans_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanans`
--

CREATE TABLE `pemesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kamar_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tgl_checkin` date NOT NULL,
  `tgl_checkout` date NOT NULL,
  `jum_kamar_dipesan` int(11) NOT NULL,
  `nama_pemesan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_pemesan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_tamu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pesan','checkin','checkout','batal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pesan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pemesanans`
--

INSERT INTO `pemesanans` (`id`, `kamar_id`, `tgl_checkin`, `tgl_checkout`, `jum_kamar_dipesan`, `nama_pemesan`, `email_pemesan`, `no_hp`, `nama_tamu`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, '2022-06-05', '2022-06-06', 1, 'Daniela Mante', 'lmedhurst@gmail.com', '215-418-1168', 'Elenora Paucek', 'pesan', '2022-06-02 17:00:00', '2022-06-02 17:00:00'),
(2, 2, '2022-06-08', '2022-06-09', 1, 'Miss Onie Zemlak PhD', 'tharris@yahoo.com', '+1.586.913.5217', 'Dario Bartoletti III', 'pesan', '2022-06-06 17:00:00', '2022-06-06 17:00:00'),
(3, 2, '2022-06-05', '2022-06-07', 2, 'Ruth Kessler MD', 'alejandrin.anderson@yahoo.com', '314-593-9732', 'Rhianna Gerhold', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(4, 2, '2022-06-04', '2022-06-07', 2, 'Thelma O\'Conner', 'pauline59@gmail.com', '(209) 859-3261', 'Clementina Watsica', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(5, 2, '2022-05-29', '2022-06-01', 1, 'Rosina Hand', 'heath.pouros@hotmail.com', '551.448.4385', 'Davion Heaney', 'pesan', '2022-05-26 17:00:00', '2022-05-26 17:00:00'),
(6, 3, '2022-05-28', '2022-05-31', 2, 'Frederique Pouros', 'vmayert@gmail.com', '+1-626-456-9831', 'Dayton Gleichner', 'pesan', '2022-05-24 17:00:00', '2022-05-24 17:00:00'),
(7, 1, '2022-05-31', '2022-06-03', 2, 'Cindy Wisozk', 'green26@hotmail.com', '1-908-406-5819', 'Mr. Darrel Swift', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(8, 1, '2022-06-06', '2022-06-09', 1, 'Lera Hodkiewicz', 'jessika.carroll@yahoo.com', '(413) 394-7390', 'Elizabeth Bartell', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(9, 2, '2022-06-09', '2022-06-11', 2, 'Miss Evangeline Frami I', 'glakin@yahoo.com', '470.862.9870', 'Amparo Koss', 'pesan', '2022-06-07 17:00:00', '2022-06-07 17:00:00'),
(10, 1, '2022-05-29', '2022-05-30', 2, 'Maryse Gulgowski', 'mante.thora@hotmail.com', '640-320-7076', 'Mckenna Heller', 'pesan', '2022-05-26 17:00:00', '2022-05-26 17:00:00'),
(11, 3, '2022-06-05', '2022-06-08', 2, 'Hellen Hoppe', 'krystel.gibson@yahoo.com', '1-310-280-5886', 'Hollis Grimes', 'pesan', '2022-06-02 17:00:00', '2022-06-02 17:00:00'),
(12, 1, '2022-06-02', '2022-06-03', 2, 'Reva O\'Connell V', 'nolan.gladys@gmail.com', '+1-680-399-7368', 'Nyah Altenwerth', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(13, 1, '2022-06-06', '2022-06-09', 2, 'Vesta Sanford', 'estrella.fritsch@yahoo.com', '+1-480-633-1056', 'Heidi Ryan', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(14, 3, '2022-05-30', '2022-06-01', 2, 'Nathan Schuster', 'rullrich@yahoo.com', '(323) 595-2579', 'Mauricio Collins', 'pesan', '2022-05-27 17:00:00', '2022-05-27 17:00:00'),
(15, 1, '2022-06-01', '2022-06-03', 2, 'Dr. Aileen Hagenes', 'lura38@hotmail.com', '479.858.0559', 'Hassan Wisoky MD', 'pesan', '2022-05-28 17:00:00', '2022-05-28 17:00:00'),
(16, 3, '2022-06-07', '2022-06-09', 1, 'Marvin Barrows', 'myriam.turcotte@yahoo.com', '(248) 726-9617', 'Eugenia Wyman', 'pesan', '2022-06-03 17:00:00', '2022-06-03 17:00:00'),
(17, 1, '2022-06-09', '2022-06-10', 2, 'Zetta O\'Reilly', 'beatrice.bogan@gmail.com', '+1-559-521-0161', 'Harley Deckow', 'pesan', '2022-06-05 17:00:00', '2022-06-05 17:00:00'),
(18, 2, '2022-06-05', '2022-06-07', 1, 'Wilburn Hills', 'ron32@yahoo.com', '+1 (283) 554-6810', 'Louvenia Emmerich', 'pesan', '2022-06-02 17:00:00', '2022-06-02 17:00:00'),
(19, 2, '2022-06-08', '2022-06-09', 2, 'Maurice Bayer', 'whills@gmail.com', '+1.720.910.1074', 'Dr. Arnoldo Kutch II', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(20, 2, '2022-06-07', '2022-06-10', 1, 'Mr. Lowell Spinka V', 'conroy.ardith@hotmail.com', '+1-469-833-5180', 'Miss Bridie Dietrich', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(21, 2, '2022-06-07', '2022-06-08', 1, 'Mr. Johan Kessler DDS', 'edd62@yahoo.com', '283.642.1352', 'Ms. Jolie Gleichner IV', 'pesan', '2022-06-05 17:00:00', '2022-06-05 17:00:00'),
(22, 1, '2022-05-30', '2022-06-01', 2, 'Mr. Deontae Gulgowski Sr.', 'wcarroll@gmail.com', '1-641-249-2137', 'Ottilie Hermiston DVM', 'pesan', '2022-05-28 17:00:00', '2022-05-28 17:00:00'),
(23, 3, '2022-06-05', '2022-06-06', 1, 'Christop Strosin', 'ekrajcik@gmail.com', '+13212149908', 'Arden Ankunding', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(24, 1, '2022-05-28', '2022-05-31', 1, 'Kariane Collier', 'rschuppe@gmail.com', '(941) 920-2307', 'Alicia Kshlerin', 'pesan', '2022-05-25 17:00:00', '2022-05-25 17:00:00'),
(25, 1, '2022-05-28', '2022-05-29', 2, 'Corbin Franecki', 'fritsch.joshuah@yahoo.com', '463.731.4807', 'Lukas Schinner II', 'pesan', '2022-05-24 17:00:00', '2022-05-24 17:00:00'),
(26, 1, '2022-05-29', '2022-05-31', 2, 'Antwan Bradtke', 'gorczany.leo@hotmail.com', '+1.234.985.4448', 'Mrs. Jazmin Beatty MD', 'pesan', '2022-05-25 17:00:00', '2022-05-25 17:00:00'),
(27, 3, '2022-06-03', '2022-06-06', 1, 'Prof. Kavon Kovacek II', 'myriam.hansen@hotmail.com', '904-591-4120', 'Prof. Kiana Crist', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(28, 1, '2022-05-31', '2022-06-02', 1, 'Morgan Koelpin', 'erdman.jeanette@gmail.com', '(513) 626-4913', 'Barton Jones', 'pesan', '2022-05-28 17:00:00', '2022-05-28 17:00:00'),
(29, 2, '2022-06-09', '2022-06-12', 2, 'Randal McKenzie', 'rbogan@gmail.com', '+1-708-773-2387', 'Althea Wiza I', 'pesan', '2022-06-05 17:00:00', '2022-06-05 17:00:00'),
(30, 1, '2022-06-01', '2022-06-04', 2, 'Sadye Ritchie', 'swilkinson@hotmail.com', '615.316.5258', 'Mrs. Kenyatta Huel', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(31, 2, '2022-06-02', '2022-06-03', 2, 'Marco Jaskolski II', 'sydni.emmerich@hotmail.com', '689.902.0091', 'Royal Raynor', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(32, 2, '2022-06-05', '2022-06-07', 2, 'Sammie Franecki', 'brandy.monahan@yahoo.com', '(360) 589-2136', 'Judson Denesik', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(33, 3, '2022-05-27', '2022-05-30', 2, 'Mr. Virgil Ebert DVM', 'gay.rempel@hotmail.com', '(920) 682-1571', 'Robert Shanahan', 'pesan', '2022-05-23 17:00:00', '2022-05-23 17:00:00'),
(34, 2, '2022-06-08', '2022-06-10', 1, 'Ethel Bergstrom', 'xfarrell@yahoo.com', '(619) 916-3348', 'Loren Zulauf', 'pesan', '2022-06-05 17:00:00', '2022-06-05 17:00:00'),
(35, 3, '2022-05-30', '2022-06-02', 2, 'Alba Dicki', 'fay.clark@hotmail.com', '+1-680-672-4267', 'Prof. Enrico Greenfelder', 'pesan', '2022-05-28 17:00:00', '2022-05-28 17:00:00'),
(36, 3, '2022-06-03', '2022-06-05', 2, 'Prof. Nona Reilly MD', 'vivian36@hotmail.com', '660-822-0955', 'Lesly Mante', 'pesan', '2022-05-30 17:00:00', '2022-05-30 17:00:00'),
(37, 1, '2022-05-28', '2022-05-29', 2, 'Roma Haley', 'adelbert.strosin@hotmail.com', '+14697880647', 'Nils Deckow', 'pesan', '2022-05-24 17:00:00', '2022-05-24 17:00:00'),
(38, 2, '2022-06-06', '2022-06-08', 2, 'Prof. Jaunita Prohaska', 'gsawayn@gmail.com', '+1-870-392-6008', 'Ms. Ludie Green', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(39, 3, '2022-06-08', '2022-06-09', 1, 'Jerrold Gutkowski', 'ecassin@hotmail.com', '701-976-5432', 'Neva Feeney I', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(40, 1, '2022-06-02', '2022-06-04', 1, 'Jaclyn Emard Sr.', 'wfeest@yahoo.com', '1-620-993-1528', 'Santiago Hauck', 'pesan', '2022-05-30 17:00:00', '2022-05-30 17:00:00'),
(41, 1, '2022-06-10', '2022-06-11', 1, 'Prof. Felix Dooley', 'kilback.dolores@yahoo.com', '+1-283-252-1862', 'Marcella Kozey', 'pesan', '2022-06-08 17:00:00', '2022-06-08 17:00:00'),
(42, 3, '2022-06-06', '2022-06-07', 2, 'Prof. Hugh Schiller PhD', 'marcelo.vonrueden@gmail.com', '1-262-757-9938', 'Billie Effertz', 'pesan', '2022-06-03 17:00:00', '2022-06-03 17:00:00'),
(43, 1, '2022-06-06', '2022-06-08', 1, 'Estel Bernhard', 'qkub@hotmail.com', '341-645-2642', 'Dr. Hal Kuhic', 'pesan', '2022-06-03 17:00:00', '2022-06-03 17:00:00'),
(44, 3, '2022-06-09', '2022-06-10', 2, 'Baby Muller PhD', 'angela82@hotmail.com', '(938) 531-2471', 'Amanda Buckridge IV', 'pesan', '2022-06-06 17:00:00', '2022-06-06 17:00:00'),
(45, 2, '2022-06-09', '2022-06-10', 2, 'Ursula Carter', 'conor21@hotmail.com', '+1-386-744-7683', 'Jarrett Dare', 'pesan', '2022-06-06 17:00:00', '2022-06-06 17:00:00'),
(46, 1, '2022-05-31', '2022-06-02', 2, 'Elena Rohan I', 'rodrick51@hotmail.com', '+1-909-825-7938', 'General Schinner', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(47, 2, '2022-06-04', '2022-06-05', 1, 'Genoveva Mertz', 'cortney97@gmail.com', '629.492.9448', 'Litzy Price IV', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(48, 1, '2022-06-04', '2022-06-06', 1, 'Arjun Schowalter II', 'tkutch@hotmail.com', '1-838-529-9609', 'Major Harvey', 'pesan', '2022-06-02 17:00:00', '2022-06-02 17:00:00'),
(49, 3, '2022-06-08', '2022-06-10', 2, 'Miss Ruby Quigley', 'parker11@yahoo.com', '+1.331.747.1238', 'Nicolette Eichmann', 'pesan', '2022-06-05 17:00:00', '2022-06-05 17:00:00'),
(50, 2, '2022-06-01', '2022-06-04', 2, 'Lacey Gottlieb MD', 'sbogisich@hotmail.com', '+1-727-410-2739', 'Laisha Hayes', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(51, 3, '2022-06-03', '2022-06-04', 1, 'Florence Pouros', 'vledner@yahoo.com', '+17796440365', 'Josephine Emard', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(52, 1, '2022-06-02', '2022-06-05', 1, 'Dana Pagac DDS', 'shania68@hotmail.com', '623-563-7761', 'Jamey Kreiger', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(53, 2, '2022-05-29', '2022-05-30', 1, 'Prof. Kobe Goyette II', 'ycummerata@yahoo.com', '401.608.2783', 'Kenny Cruickshank', 'pesan', '2022-05-27 17:00:00', '2022-05-27 17:00:00'),
(54, 1, '2022-05-31', '2022-06-03', 2, 'Ezekiel Stroman II', 'kautzer.kelly@gmail.com', '+1 (636) 324-3971', 'Abigail Rippin PhD', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(55, 1, '2022-06-04', '2022-06-07', 2, 'Destiny Schinner II', 'ureynolds@yahoo.com', '+13025891901', 'Miss Abbigail Aufderhar IV', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(56, 1, '2022-06-03', '2022-06-05', 2, 'Adrian Armstrong', 'xwhite@hotmail.com', '734-595-1278', 'Morgan Dickinson', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(57, 3, '2022-06-04', '2022-06-07', 1, 'Mariela Stroman', 'pshields@gmail.com', '+1-361-902-8491', 'Tania Stokes II', 'pesan', '2022-06-02 17:00:00', '2022-06-02 17:00:00'),
(58, 2, '2022-06-10', '2022-06-12', 1, 'Clementine Nitzsche', 'shanahan.lera@hotmail.com', '281.954.0316', 'Prof. Nina Schimmel', 'pesan', '2022-06-08 17:00:00', '2022-06-08 17:00:00'),
(59, 2, '2022-06-02', '2022-06-05', 2, 'Sid Schaefer', 'murray.kris@yahoo.com', '602-823-1424', 'Jonas Hansen', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(60, 1, '2022-06-05', '2022-06-08', 1, 'Lorine Haley', 'amya87@yahoo.com', '+16893411333', 'Ms. Guadalupe Osinski', 'pesan', '2022-06-03 17:00:00', '2022-06-03 17:00:00'),
(61, 3, '2022-05-28', '2022-05-30', 2, 'Mikel Kunde', 'padberg.nickolas@gmail.com', '+15857786831', 'Everette Kuhlman', 'pesan', '2022-05-24 17:00:00', '2022-05-24 17:00:00'),
(62, 1, '2022-06-07', '2022-06-10', 1, 'Juvenal Reichert', 'wtremblay@yahoo.com', '+12817416929', 'Prof. Dakota Haley', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(63, 2, '2022-06-06', '2022-06-07', 1, 'Lyric Kunde', 'kutch.abner@gmail.com', '(801) 200-5832', 'Eleanora Murazik III', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(64, 2, '2022-06-08', '2022-06-11', 1, 'Henry West', 'hoeger.max@gmail.com', '463-316-2628', 'Dr. Merlin O\'Hara', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(65, 2, '2022-06-04', '2022-06-06', 2, 'Brannon Effertz', 'psipes@yahoo.com', '+1-402-305-9719', 'Miss Marquise Beatty MD', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(66, 3, '2022-06-07', '2022-06-10', 1, 'Prof. Laurel Stoltenberg', 'eusebio19@yahoo.com', '847.959.7918', 'Janelle Breitenberg', 'pesan', '2022-06-03 17:00:00', '2022-06-03 17:00:00'),
(67, 1, '2022-06-09', '2022-06-11', 1, 'Carmella McCullough', 'stokes.ole@hotmail.com', '+12488764606', 'Francis Heaney', 'pesan', '2022-06-06 17:00:00', '2022-06-06 17:00:00'),
(68, 2, '2022-05-27', '2022-05-29', 2, 'Miss Jennyfer Casper', 'hyman18@hotmail.com', '814-737-9792', 'Diamond Swift', 'pesan', '2022-05-24 17:00:00', '2022-05-24 17:00:00'),
(69, 3, '2022-06-01', '2022-06-02', 1, 'Otho Rolfson', 'gilbert02@hotmail.com', '414-970-1681', 'Dr. Isac Koss DDS', 'pesan', '2022-05-28 17:00:00', '2022-05-28 17:00:00'),
(70, 1, '2022-05-29', '2022-06-01', 2, 'Melyna Dooley', 'cpagac@yahoo.com', '351.713.6342', 'Prof. Elvis Leannon Jr.', 'pesan', '2022-05-26 17:00:00', '2022-05-26 17:00:00'),
(71, 1, '2022-06-02', '2022-06-03', 2, 'Prof. Kane Langworth IV', 'schiller.haskell@yahoo.com', '+1-724-509-9888', 'Effie Gerlach', 'pesan', '2022-05-31 17:00:00', '2022-05-31 17:00:00'),
(72, 3, '2022-06-01', '2022-06-04', 2, 'Millie Hilpert', 'weimann.jerome@yahoo.com', '+1 (458) 971-0230', 'Aryanna Emard Sr.', 'pesan', '2022-05-30 17:00:00', '2022-05-30 17:00:00'),
(73, 3, '2022-05-31', '2022-06-01', 2, 'Prof. Milton Johnson', 'titus65@yahoo.com', '847.846.6859', 'Dr. Collin Fadel', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(74, 1, '2022-06-06', '2022-06-07', 2, 'Maritza Gibson V', 'rossie93@hotmail.com', '+1-364-800-9411', 'Prof. Katelynn Ortiz MD', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(75, 1, '2022-06-10', '2022-06-12', 1, 'Oral Batz', 'aiyana76@yahoo.com', '1-775-789-2023', 'Hilbert Stroman MD', 'pesan', '2022-06-06 17:00:00', '2022-06-06 17:00:00'),
(76, 2, '2022-06-04', '2022-06-06', 2, 'Ms. Dessie O\'Reilly V', 'bosco.jannie@yahoo.com', '1-281-578-9834', 'Jonatan Larkin', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(77, 1, '2022-06-01', '2022-06-02', 2, 'Lucie Heidenreich', 'brody38@yahoo.com', '+1.838.330.3431', 'Felipe Walsh', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(78, 2, '2022-05-30', '2022-06-02', 1, 'Donna Romaguera', 'nasir30@hotmail.com', '+15514644444', 'Prof. Keanu Kassulke', 'pesan', '2022-05-27 17:00:00', '2022-05-27 17:00:00'),
(79, 1, '2022-05-27', '2022-05-29', 1, 'Carrie Roob', 'euna35@gmail.com', '240-501-8659', 'Adelle Mohr', 'pesan', '2022-05-24 17:00:00', '2022-05-24 17:00:00'),
(80, 3, '2022-06-03', '2022-06-04', 2, 'Dane Rau', 'randy.fisher@yahoo.com', '805.999.0089', 'Annetta Upton DDS', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(81, 2, '2022-06-10', '2022-06-11', 2, 'Dr. Marco Gislason', 'harber.kathryn@yahoo.com', '+1-430-655-4351', 'Monique Hagenes', 'pesan', '2022-06-06 17:00:00', '2022-06-06 17:00:00'),
(82, 1, '2022-06-08', '2022-06-10', 1, 'Kristopher Schulist', 'aditya.watsica@gmail.com', '+17438919247', 'Maybelle Oberbrunner', 'pesan', '2022-06-05 17:00:00', '2022-06-05 17:00:00'),
(83, 3, '2022-05-31', '2022-06-01', 2, 'Tamara Haley', 'gus.okuneva@yahoo.com', '865-400-5331', 'Wilfrid Sawayn', 'pesan', '2022-05-29 17:00:00', '2022-05-29 17:00:00'),
(84, 3, '2022-06-07', '2022-06-10', 1, 'Loren Homenick', 'olin19@yahoo.com', '631-390-3549', 'Emmy McLaughlin', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(85, 2, '2022-06-09', '2022-06-10', 1, 'Dr. Fredy Buckridge V', 'addie.schoen@gmail.com', '+1-845-510-5062', 'Jadyn Langworth', 'pesan', '2022-06-06 17:00:00', '2022-06-06 17:00:00'),
(86, 2, '2022-05-28', '2022-05-31', 1, 'Mr. Jovani Heidenreich', 'unique58@gmail.com', '+1-458-850-2681', 'Donny Connelly', 'pesan', '2022-05-26 17:00:00', '2022-05-26 17:00:00'),
(87, 1, '2022-06-06', '2022-06-08', 2, 'Mr. Desmond Hayes', 'amie.bahringer@hotmail.com', '1-269-929-2579', 'Winfield Swift', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(88, 3, '2022-06-08', '2022-06-10', 1, 'Marlene Renner', 'lucious29@hotmail.com', '(678) 590-2425', 'Halle Kassulke', 'pesan', '2022-06-04 17:00:00', '2022-06-04 17:00:00'),
(89, 3, '2022-05-29', '2022-05-30', 1, 'Madelyn Hartmann', 'ybernier@hotmail.com', '+1-580-515-1108', 'Elsie Emard', 'pesan', '2022-05-27 17:00:00', '2022-05-27 17:00:00'),
(90, 2, '2022-05-31', '2022-06-02', 1, 'Emilio Haley', 'suzanne.boehm@hotmail.com', '+1 (820) 932-8630', 'Dr. Darian Littel', 'pesan', '2022-05-27 17:00:00', '2022-05-27 17:00:00'),
(91, 1, '2022-05-31', '2022-06-01', 1, 'Natalia Lueilwitz', 'briana.hudson@hotmail.com', '+1-551-870-7442', 'Sincere Connelly I', 'pesan', '2022-05-28 17:00:00', '2022-05-28 17:00:00'),
(92, 1, '2022-06-02', '2022-06-05', 2, 'Eliza Mraz', 'gislason.ryder@gmail.com', '1-386-724-6264', 'Jeanette Heaney', 'pesan', '2022-05-30 17:00:00', '2022-05-30 17:00:00'),
(93, 2, '2022-06-05', '2022-06-07', 1, 'Edna Walter', 'ubaldo65@hotmail.com', '1-870-526-2841', 'Ernesto Kiehn MD', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(94, 3, '2022-05-29', '2022-05-31', 1, 'Burley Daugherty', 'ljacobs@yahoo.com', '352-778-4891', 'Dawn Kling Jr.', 'pesan', '2022-05-27 17:00:00', '2022-05-27 17:00:00'),
(95, 3, '2022-06-06', '2022-06-09', 2, 'Ms. Karina Rath IV', 'gratke@hotmail.com', '+1-309-344-1130', 'Maria Mayer', 'pesan', '2022-06-03 17:00:00', '2022-06-03 17:00:00'),
(96, 2, '2022-06-04', '2022-06-07', 1, 'Autumn Schuster', 'edwardo23@gmail.com', '812.527.2177', 'Christian Kutch', 'pesan', '2022-06-01 17:00:00', '2022-06-01 17:00:00'),
(97, 2, '2022-05-29', '2022-06-01', 2, 'Jayden Osinski', 'gislason.river@hotmail.com', '(585) 204-4457', 'Jayne Tromp', 'pesan', '2022-05-25 17:00:00', '2022-05-25 17:00:00'),
(98, 1, '2022-05-28', '2022-05-31', 2, 'Dr. Crystel Abshire PhD', 'krajcik.virgie@yahoo.com', '+1 (747) 369-6618', 'Sylvan Sporer', 'pesan', '2022-05-24 17:00:00', '2022-05-24 17:00:00'),
(99, 3, '2022-06-07', '2022-06-08', 1, 'Celine Mante', 'hpagac@yahoo.com', '540-751-3612', 'Jalon Bartoletti', 'pesan', '2022-06-03 17:00:00', '2022-06-03 17:00:00'),
(100, 1, '2022-05-30', '2022-06-02', 1, 'Callie Lindgren', 'faustino.hettinger@hotmail.com', '+1 (940) 463-3777', 'Mrs. Reina Hand DVM', 'pesan', '2022-05-28 17:00:00', '2022-05-28 17:00:00'),
(101, 1, '2022-06-08', '2022-06-09', 1, 'Kim Taehyung', 'kimtaehyung@gmail.com', '081215679908', 'Kim Taehyung', 'pesan', '2022-06-07 00:57:16', '2022-06-07 00:57:16'),
(102, 1, '2022-06-08', '2022-06-09', 2, 'alfiana', 'alfi@gmail.com', '081234568976', 'alfiana', 'pesan', '2022-06-07 01:42:23', '2022-06-07 01:42:23'),
(103, 1, '2022-06-08', '2022-06-09', 2, 'alfiana', 'alfi@gmail.com', '081234568976', 'alfiana', 'pesan', '2022-06-07 03:28:55', '2022-06-07 03:28:55'),
(104, 2, '2022-06-08', '2022-06-09', 2, 'zahra', 'zahra@gmail.com', '0987654321234', 'zahra', 'pesan', '2022-06-07 04:36:38', '2022-06-07 04:36:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indeks untuk tabel `fasilitas_hotels`
--
ALTER TABLE `fasilitas_hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fasilitas_kamars`
--
ALTER TABLE `fasilitas_kamars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fasilitas_kamars_kamar_id_foreign` (`kamar_id`);

--
-- Indeks untuk tabel `kamars`
--
ALTER TABLE `kamars`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemesanans_kamar_id_foreign` (`kamar_id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `fasilitas_hotels`
--
ALTER TABLE `fasilitas_hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `fasilitas_kamars`
--
ALTER TABLE `fasilitas_kamars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kamars`
--
ALTER TABLE `kamars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pemesanans`
--
ALTER TABLE `pemesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `fasilitas_kamars`
--
ALTER TABLE `fasilitas_kamars`
  ADD CONSTRAINT `fasilitas_kamars_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemesanans`
--
ALTER TABLE `pemesanans`
  ADD CONSTRAINT `pemesanans_kamar_id_foreign` FOREIGN KEY (`kamar_id`) REFERENCES `kamars` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
