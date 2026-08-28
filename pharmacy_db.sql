-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 avr. 2026 à 18:19
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pharmacy_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:1;', 1775780019),
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1775780018;', 1775780019);

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `jobs`
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
-- Structure de la table `job_batches`
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
-- Structure de la table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `dosage` varchar(255) DEFAULT NULL,
  `forme` varchar(255) DEFAULT NULL,
  `benefits` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `price`, `stock`, `dosage`, `forme`, `benefits`, `category`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Panadol', 20.00, 30, '500 mg', 'Comprime', 'Soulage la douleur et la fièvre', 'Analgésique', NULL, 'panadol.jpg', NULL, '2026-04-12 18:50:44'),
(2, 'Amoxicilline', 45.00, 200, '500 mg', 'Gelule', 'Infections bactériennes', 'Antibiotique', NULL, 'amox.jpg', NULL, '2026-04-12 18:50:44'),
(3, 'Vitamine C', 35.00, 50, '1000 mg', 'Comprime effervescent', 'Renforce le système immunitaire', 'Vitamines', NULL, 'vitamine_c.jpg', NULL, '2026-04-12 18:50:44'),
(4, 'Spasfon', 28.00, 300, '80 mg', 'Comprime', 'Douleurs abdominales', 'Antispasmodique', NULL, 'spasfon.jpg', NULL, '2026-04-12 18:50:44'),
(5, 'Humex', 42.00, 0, 'Sirop adulte', 'Comprime', 'Traitement du rhume et nez bouché', 'Rhume', NULL, 'humex.jpg', NULL, '2026-04-12 18:50:44'),
(6, 'Gaviscon', 38.00, 0, '10 ml', 'Suspension buvable', 'Brûlures d\'estomac et reflux', 'Estomac', NULL, 'gaviscon.jpg', NULL, '2026-04-12 18:50:44'),
(7, 'Magnésium B6', 55.00, 100, '100 mg/10 mg', 'Comprime', 'Fatigue et stress', 'Vitamines', NULL, 'magnesium.jpg', NULL, '2026-04-12 18:50:44'),
(8, 'Fervex', 33.00, 0, 'Sachet dose', 'Poudre orale', 'États grippaux et frissons', 'Rhume', NULL, 'fervex.jpg', NULL, '2026-04-12 18:50:44'),
(9, 'Voltaren Emulgel', 48.00, 50, '1%', 'Gel', 'Douleurs musculaires et articulaires', 'Anti-inflammatoire', NULL, 'voltaren.jpg', NULL, '2026-04-12 18:50:44'),
(10, 'Smecta', 25.00, 0, '3 g', 'Poudre orale', 'Traitement de la diarrhée', 'Digestion', NULL, 'smecta.jpg', NULL, '2026-04-12 18:50:44'),
(11, 'Aerius', 52.00, 0, '5 mg', 'Comprime', 'Rhinite allergique et urticaire', 'Allergie', NULL, 'aerius.jpg', NULL, '2026-04-12 18:50:44'),
(12, 'Strepsils', 30.00, 100, '0.6 mg/1.2 mg', 'Pastille', 'Maux de gorge peu intenses', 'Gorge', NULL, 'strepsils.jpg', NULL, '2026-04-12 18:50:44'),
(13, 'Biafine', 40.00, 0, 'Emulsion cutanee', 'Creme', 'Brûlures superficielles et érythèmes', 'Peau', NULL, 'biafine.jpg', NULL, '2026-04-12 18:50:44'),
(14, 'Advil 400mg', 22.00, 0, '400 mg', 'Comprime enrobe', 'Douleurs et maux de tête', 'Anti-inflammatoire', NULL, 'advil.jpg', NULL, '2026-04-12 18:50:44'),
(15, 'Meteospasmyl', 46.00, 20, '60 mg/300 mg', 'Gelule', 'Ballonnements et gaz', 'Digestion', NULL, 'meteo.jpg', NULL, '2026-04-12 18:50:44'),
(16, 'Clamoxyl', 50.00, 0, '500 mg', 'Gelule', 'Angines et otites', 'Antibiotique', NULL, 'clamoxyl.jpg', NULL, '2026-04-12 18:50:44'),
(17, 'Zyrtec', 39.00, 50, '10 mg', 'Comprime', 'Symptômes allergiques saisonniers', 'Allergie', NULL, 'zyrtec.jpg', NULL, '2026-04-12 18:50:44'),
(18, 'Biseptine', 34.00, 0, 'Solution antiseptique', 'Solution', 'Désinfection des plaies', 'Antiseptique', NULL, 'biseptine.jpg', NULL, '2026-04-12 18:50:44'),
(19, 'Motilium', 29.00, 0, '10 mg', 'Sirop', 'Nausées et vomissements', 'Digestion', NULL, 'motilium.jpg', NULL, '2026-04-12 18:50:44'),
(20, 'Efferalgan', 18.00, 100, '1 g', 'Comprime effervescent', 'Douleurs légères à modérées', 'Analgésique', NULL, 'efferalgan.jpg', NULL, '2026-04-12 18:50:44'),
(21, 'Dafalgan Codeiné', 32.00, 300, '500 mg/30 mg', 'Comprime', 'Douleurs fortes', 'Analgésique', NULL, 'dafalgan.jpg', NULL, '2026-04-12 18:50:44'),
(22, 'Solupred', 60.00, 0, '20 mg', 'Comprime orodispersible', 'Inflammations sévères', 'Corticoïde', NULL, 'solupred.jpg', NULL, '2026-04-12 18:50:44'),
(23, 'Augmentin', 85.00, 0, '1 g/125 mg', 'Comprime', 'Infections respiratoires', 'Antibiotique', NULL, 'augmentin.jpg', NULL, '2026-04-12 18:50:44'),
(24, 'Loperamide', 21.00, 200, '2 mg', 'Gelule', 'Diarrhée passagère', 'Digestion', NULL, 'loperamide.jpg', NULL, '2026-04-12 18:50:44'),
(25, 'Maalox', 36.00, 200, '400 mg/400 mg', 'Suspension buvable', 'Acidité gastrique', 'Estomac', NULL, 'maalox.jpg', NULL, '2026-04-12 18:50:44'),
(26, 'Nurofen', 27.00, 0, '400 mg', 'Comprime enrobe', 'Fièvre et douleurs chez l\'enfant', 'Anti-inflammatoire', NULL, 'nurofen.jpg', NULL, '2026-04-12 18:50:44'),
(27, 'Oscillococcinum', 95.00, 50, 'Dose unitaire', 'Granules', 'Prévention des états grippaux', 'Homéopathie', NULL, 'oscillo.jpg', NULL, '2026-04-12 18:50:44'),
(28, 'Vicks Vaporub', 44.00, 0, 'Pommade', 'Pommade', 'Congestion nasale et toux', 'Respiration', NULL, 'vicks.jpg', NULL, '2026-04-12 18:50:44'),
(29, 'Supradyn', 70.00, 300, 'Multivitamines', 'Comprime effervescent', 'Multivitamines et minéraux', 'Vitamines', NULL, 'supradyn.jpg', NULL, '2026-04-12 18:50:44'),
(30, 'Doliprane', 20.00, 100, '1000mg', 'Comprimés', 'Pas de notice', 'Médicament', 'Pas de description', 'Doliprane.jpg', '2026-04-03 09:42:59', '2026-04-12 18:50:44'),
(31, 'Paracetamol 50 mg', 12.00, 30, '50 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Comprime, dosage: 50 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(32, 'Ibuprofene 75 mg', 12.90, 31, '75 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gelule, dosage: 75 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(33, 'Aspirine 100 mg', 13.80, 32, '100 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 100 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(34, 'Diclofenac 125 mg', 14.70, 33, '125 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 125 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(35, 'Naproxene 200 mg', 15.60, 34, '200 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 200 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(36, 'Ketoprofene 250 mg', 16.50, 35, '250 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 250 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(37, 'Acide mefenamique 400 mg', 17.40, 36, '400 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 400 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(38, 'Tramadol 500 mg', 18.30, 37, '500 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 500 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(39, 'Codeine 600 mg', 19.20, 38, '600 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 600 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(40, 'Morphine 800 mg', 20.10, 39, '800 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 800 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(41, 'Amoxicilline 1 g', 21.00, 40, '1 g', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 1 g, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(42, 'Amoxiclav 2 mg/ml', 21.90, 41, '2 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 2 mg/ml, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(43, 'Cefixime 5 mg/ml', 22.80, 42, '5 mg/ml', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 5 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(44, 'Cefpodoxime 10 mg/ml', 23.70, 43, '10 mg/ml', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 10 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(45, 'Ceftriaxone 20 mg', 24.60, 44, '20 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 20 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(46, 'Azithromycine 40 mg', 25.50, 45, '40 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 40 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(47, 'Clarithromycine 1000 UI', 26.40, 46, '1000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 1000 UI, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(48, 'Erythromycine 2000 UI', 27.30, 47, '2000 UI', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 2000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(49, 'Ciprofloxacine 5000 UI', 28.20, 48, '5000 UI', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 5000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(50, 'Levofloxacine 50 mg', 29.10, 49, '50 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 50 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(51, 'Ofloxacine 75 mg', 30.00, 50, '75 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 75 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(52, 'Metronidazole 100 mg', 30.90, 51, '100 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 100 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(53, 'Doxycycline 125 mg', 31.80, 52, '125 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 125 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(54, 'Tetracycline 200 mg', 32.70, 53, '200 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 200 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(55, 'Clindamycine 250 mg', 33.60, 54, '250 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 250 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(56, 'Fluconazole 400 mg', 34.50, 55, '400 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 400 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(57, 'Itraconazole 500 mg', 35.40, 56, '500 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 500 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(58, 'Ketoconazole 600 mg', 36.30, 57, '600 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 600 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(59, 'Clotrimazole 800 mg', 37.20, 58, '800 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 800 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(60, 'Miconazole 1 g', 38.10, 59, '1 g', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 1 g, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(61, 'Omeprazole 2 mg/ml', 39.00, 60, '2 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 2 mg/ml, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(62, 'Esomeprazole 5 mg/ml', 39.90, 61, '5 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 5 mg/ml, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(63, 'Pantoprazole 10 mg/ml', 40.80, 62, '10 mg/ml', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 10 mg/ml, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(64, 'Rabeprazole 20 mg', 41.70, 63, '20 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 20 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(65, 'Lansoprazole 40 mg', 42.60, 64, '40 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 40 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(66, 'Famotidine 1000 UI', 43.50, 65, '1000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 1000 UI, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(67, 'Gaviscon Advance 2000 UI', 44.40, 66, '2000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 2000 UI, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(68, 'Maalox Plus 5000 UI', 45.30, 67, '5000 UI', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 5000 UI, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(69, 'Smecta Plus 50 mg', 46.20, 68, '50 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 50 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(70, 'Loperamide 75 mg', 47.10, 69, '75 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 75 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(71, 'Nifuroxazide 100 mg', 48.00, 70, '100 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 100 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(72, 'Domperidone 125 mg', 48.90, 71, '125 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 125 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(73, 'Metoclopramide 200 mg', 49.80, 72, '200 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 200 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(74, 'Trimebutine 250 mg', 50.70, 73, '250 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Suspension buvable, dosage: 250 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(75, 'Meteospasmyl 400 mg', 51.60, 74, '400 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Pommade, dosage: 400 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(76, 'Spasfon Lyoc 500 mg', 52.50, 75, '500 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Creme, dosage: 500 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(77, 'Macrogol 600 mg', 53.40, 76, '600 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Spray nasal, dosage: 600 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(78, 'Lactulose 800 mg', 54.30, 77, '800 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gouttes, dosage: 800 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(79, 'Bisacodyl 1 g', 55.20, 78, '1 g', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Solution, dosage: 1 g, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(80, 'Psyllium 2 mg/ml', 56.10, 79, '2 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Injection, dosage: 2 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(81, 'Cetirizine 5 mg/ml', 57.00, 80, '5 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Comprime, dosage: 5 mg/ml, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(82, 'Loratadine 10 mg/ml', 57.90, 81, '10 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gelule, dosage: 10 mg/ml, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(83, 'Fexofenadine 20 mg', 58.80, 82, '20 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Sirop, dosage: 20 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(84, 'Desloratadine 40 mg', 59.70, 83, '40 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Suspension buvable, dosage: 40 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(85, 'Levocetirizine 1000 UI', 60.60, 84, '1000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Pommade, dosage: 1000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(86, 'Chlorphenamine 2000 UI', 61.50, 85, '2000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Creme, dosage: 2000 UI, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(87, 'Montelukast 5000 UI', 62.40, 86, '5000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Spray nasal, dosage: 5000 UI, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(88, 'Salbutamol 50 mg', 63.30, 87, '50 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gouttes, dosage: 50 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(89, 'Budesonide 75 mg', 64.20, 88, '75 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Solution, dosage: 75 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(90, 'Fluticasone 100 mg', 65.10, 89, '100 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Injection, dosage: 100 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(91, 'Prednisone 125 mg', 66.00, 90, '125 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Comprime, dosage: 125 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(92, 'Prednisolone 200 mg', 66.90, 91, '200 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gelule, dosage: 200 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(93, 'Dexamethasone 250 mg', 67.80, 92, '250 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 250 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(94, 'Hydrocortisone 400 mg', 68.70, 93, '400 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 400 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(95, 'Betamethasone 500 mg', 69.60, 94, '500 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 500 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(96, 'Mupirocine 600 mg', 70.50, 95, '600 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 600 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(97, 'Fusidic Acid 800 mg', 71.40, 96, '800 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 800 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(98, 'Gentamicine Creme 1 g', 72.30, 97, '1 g', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 1 g, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(99, 'Aciclovir 2 mg/ml', 73.20, 98, '2 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 2 mg/ml, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(100, 'Valaciclovir 5 mg/ml', 74.10, 99, '5 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 5 mg/ml, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(101, 'Povidone Iodee 10 mg/ml', 75.00, 100, '10 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 10 mg/ml, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(102, 'Chlorhexidine 20 mg', 75.90, 101, '20 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 20 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(103, 'Eau oxygenee 40 mg', 76.80, 102, '40 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 40 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(104, 'Biseptine Solution 1000 UI', 77.70, 103, '1000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 1000 UI, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(105, 'Hextril 2000 UI', 78.60, 104, '2000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 2000 UI, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(106, 'Eludril 5000 UI', 79.50, 105, '5000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 5000 UI, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(107, 'Dolodent 50 mg', 80.40, 106, '50 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 50 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(108, 'Vitamine C 75 mg', 81.30, 107, '75 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 75 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(109, 'Vitamine D3 100 mg', 82.20, 108, '100 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 100 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(110, 'Vitamine B1 125 mg', 83.10, 109, '125 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 125 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(111, 'Vitamine B6 200 mg', 84.00, 110, '200 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 200 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(112, 'Vitamine B12 250 mg', 84.90, 111, '250 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 250 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(113, 'Vitamine E 400 mg', 85.80, 112, '400 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 400 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(114, 'Vitamine A 500 mg', 86.70, 113, '500 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 500 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(115, 'Acide folique 600 mg', 87.60, 114, '600 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 600 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(116, 'Fer fumarate 800 mg', 88.50, 115, '800 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 800 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(117, 'Fer sulfate 1 g', 89.40, 116, '1 g', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 1 g, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(118, 'Magnesium marin 2 mg/ml', 90.30, 117, '2 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 2 mg/ml, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(119, 'Calcium D3 5 mg/ml', 91.20, 118, '5 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 5 mg/ml, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(120, 'Zinc 10 mg/ml', 92.10, 119, '10 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 10 mg/ml, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(121, 'Omega 3 20 mg', 93.00, 120, '20 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 20 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(122, 'Multivitamines 40 mg', 93.90, 121, '40 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 40 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(123, 'Supradyn Daily 1000 UI', 94.80, 122, '1000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 1000 UI, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(124, 'Berocca 2000 UI', 95.70, 123, '2000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 2000 UI, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(125, 'Centrum 5000 UI', 96.60, 124, '5000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 5000 UI, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(126, 'Immunace 50 mg', 97.50, 125, '50 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 50 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(127, 'Gestarelle G 75 mg', 98.40, 126, '75 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 75 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(128, 'Fumafer 100 mg', 99.30, 127, '100 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 100 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(129, 'Tardyferon 125 mg', 100.20, 128, '125 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 125 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(130, 'Actifed 200 mg', 101.10, 129, '200 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 200 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(131, 'Humex Rhume 250 mg', 102.00, 130, '250 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 250 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(132, 'Rhinadvil 400 mg', 102.90, 131, '400 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 400 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(133, 'Fervex 500 mg', 103.80, 132, '500 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 500 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(134, 'Dolirhume 600 mg', 104.70, 133, '600 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Suspension buvable, dosage: 600 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(135, 'Nurofen Flash 800 mg', 105.60, 134, '800 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Pommade, dosage: 800 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(136, 'Advil LiquiCaps 1 g', 106.50, 135, '1 g', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Creme, dosage: 1 g, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(137, 'Efferalgan 2 mg/ml', 107.40, 136, '2 mg/ml', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Spray nasal, dosage: 2 mg/ml, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(138, 'Dafalgan 5 mg/ml', 108.30, 137, '5 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gouttes, dosage: 5 mg/ml, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(139, 'Doliprane 10 mg/ml', 109.20, 138, '10 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Solution, dosage: 10 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(140, 'Panadol Extra 20 mg', 110.10, 139, '20 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Injection, dosage: 20 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(141, 'Augmentin 40 mg', 111.00, 140, '40 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Comprime, dosage: 40 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(142, 'Clamoxyl 1000 UI', 111.90, 141, '1000 UI', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gelule, dosage: 1000 UI, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(143, 'Zinnat 2000 UI', 112.80, 142, '2000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Sirop, dosage: 2000 UI, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(144, 'Rocephine 5000 UI', 113.70, 143, '5000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Suspension buvable, dosage: 5000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(145, 'Flagyl 50 mg', 114.60, 144, '50 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Pommade, dosage: 50 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(146, 'Bactrim 75 mg', 115.50, 145, '75 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Creme, dosage: 75 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(147, 'Aerius 100 mg', 116.40, 146, '100 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Spray nasal, dosage: 100 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(148, 'Zyrtec 125 mg', 117.30, 147, '125 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gouttes, dosage: 125 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(149, 'Xyzall 200 mg', 118.20, 148, '200 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Solution, dosage: 200 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(150, 'Telfast 250 mg', 119.10, 149, '250 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Injection, dosage: 250 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(151, 'Ventoline 400 mg', 120.00, 150, '400 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Comprime, dosage: 400 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(152, 'Seretide 500 mg', 120.90, 151, '500 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gelule, dosage: 500 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(153, 'Symbicort 600 mg', 121.80, 152, '600 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 600 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(154, 'Spiriva 800 mg', 122.70, 153, '800 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 800 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(155, 'Bricanyl 1 g', 123.60, 154, '1 g', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 1 g, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(156, 'Metformine 2 mg/ml', 124.50, 155, '2 mg/ml', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 2 mg/ml, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(157, 'Gliclazide 5 mg/ml', 125.40, 156, '5 mg/ml', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 5 mg/ml, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(158, 'Glimepiride 10 mg/ml', 126.30, 157, '10 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 10 mg/ml, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(159, 'Insulatard 20 mg', 127.20, 158, '20 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 20 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(160, 'Lantus 40 mg', 128.10, 159, '40 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 40 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(161, 'Januvia 1000 UI', 129.00, 160, '1000 UI', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 1000 UI, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(162, 'Forxiga 2000 UI', 129.90, 161, '2000 UI', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 2000 UI, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(163, 'Losartan 5000 UI', 130.80, 162, '5000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 5000 UI, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(164, 'Valsartan 50 mg', 131.70, 163, '50 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 50 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(165, 'Candesartan 75 mg', 132.60, 164, '75 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 75 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(166, 'Amlodipine 100 mg', 133.50, 165, '100 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 100 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(167, 'Bisoprolol 125 mg', 134.40, 166, '125 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 125 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(168, 'Atenolol 200 mg', 135.30, 167, '200 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 200 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(169, 'Carvedilol 250 mg', 136.20, 168, '250 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 250 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(170, 'Ramipril 400 mg', 137.10, 169, '400 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 400 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(171, 'Perindopril 500 mg', 138.00, 170, '500 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 500 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(172, 'Furosemide 600 mg', 138.90, 171, '600 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 600 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(173, 'Spironolactone 800 mg', 139.80, 172, '800 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 800 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(174, 'Hydrochlorothiazide 1 g', 140.70, 173, '1 g', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 1 g, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(175, 'Atorvastatine 2 mg/ml', 141.60, 174, '2 mg/ml', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 2 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(176, 'Rosuvastatine 5 mg/ml', 142.50, 175, '5 mg/ml', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 5 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(177, 'Simvastatine 10 mg/ml', 143.40, 176, '10 mg/ml', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 10 mg/ml, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(178, 'Levothyrox 20 mg', 144.30, 177, '20 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 20 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(179, 'Euthyrox 40 mg', 145.20, 178, '40 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 40 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(180, 'Sirdalud 1000 UI', 146.10, 179, '1000 UI', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 1000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(181, 'Muscoril 2000 UI', 147.00, 180, '2000 UI', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 2000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(182, 'Myolastan 5000 UI', 147.90, 181, '5000 UI', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 5000 UI, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(183, 'Voltaren Emulgel 50 mg', 148.80, 182, '50 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 50 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(184, 'Fastum Gel 75 mg', 149.70, 183, '75 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 75 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13');
INSERT INTO `medicines` (`id`, `name`, `price`, `stock`, `dosage`, `forme`, `benefits`, `category`, `description`, `image`, `created_at`, `updated_at`) VALUES
(185, 'Biafine 100 mg', 150.60, 184, '100 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 100 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(186, 'Cicalfate 125 mg', 151.50, 185, '125 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 125 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(187, 'Dexeryl 200 mg', 152.40, 186, '200 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 200 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(188, 'A-Derma Exomega 250 mg', 153.30, 187, '250 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 250 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(189, 'La Roche Cicaplast 400 mg', 154.20, 188, '400 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 400 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(190, 'Uriage Bariederm 500 mg', 155.10, 189, '500 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 500 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(191, 'Smooderm 600 mg', 156.00, 190, '600 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 600 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(192, 'Bepanthen 800 mg', 156.90, 191, '800 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 800 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(193, 'Mebo 1 g', 157.80, 192, '1 g', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 1 g, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(194, 'Paracetamol 75 mg', 12.90, 31, '75 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gelule, dosage: 75 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(195, 'Ibuprofene 100 mg', 13.80, 32, '100 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 100 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(196, 'Aspirine 125 mg', 14.70, 33, '125 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 125 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(197, 'Diclofenac 200 mg', 15.60, 34, '200 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 200 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(198, 'Naproxene 250 mg', 16.50, 35, '250 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 250 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(199, 'Ketoprofene 400 mg', 17.40, 36, '400 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 400 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(200, 'Acide mefenamique 500 mg', 18.30, 37, '500 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 500 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(201, 'Tramadol 600 mg', 19.20, 38, '600 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 600 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(202, 'Codeine 800 mg', 20.10, 39, '800 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 800 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(203, 'Morphine 1 g', 21.00, 40, '1 g', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 1 g, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(204, 'Amoxicilline 2 mg/ml', 21.90, 41, '2 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 2 mg/ml, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(205, 'Amoxiclav 5 mg/ml', 22.80, 42, '5 mg/ml', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 5 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(206, 'Cefixime 10 mg/ml', 23.70, 43, '10 mg/ml', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 10 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(207, 'Cefpodoxime 20 mg', 24.60, 44, '20 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 20 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(208, 'Ceftriaxone 40 mg', 25.50, 45, '40 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 40 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(209, 'Azithromycine 1000 UI', 26.40, 46, '1000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 1000 UI, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(210, 'Clarithromycine 2000 UI', 27.30, 47, '2000 UI', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 2000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(211, 'Erythromycine 5000 UI', 28.20, 48, '5000 UI', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 5000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(212, 'Ciprofloxacine 50 mg', 29.10, 49, '50 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 50 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(213, 'Levofloxacine 75 mg', 30.00, 50, '75 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 75 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(214, 'Ofloxacine 100 mg', 30.90, 51, '100 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 100 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(215, 'Metronidazole 125 mg', 31.80, 52, '125 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 125 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(216, 'Doxycycline 200 mg', 32.70, 53, '200 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 200 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(217, 'Tetracycline 250 mg', 33.60, 54, '250 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 250 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(218, 'Clindamycine 400 mg', 34.50, 55, '400 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 400 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(219, 'Fluconazole 500 mg', 35.40, 56, '500 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 500 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(220, 'Itraconazole 600 mg', 36.30, 57, '600 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 600 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(221, 'Ketoconazole 800 mg', 37.20, 58, '800 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 800 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(222, 'Clotrimazole 1 g', 38.10, 59, '1 g', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 1 g, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(223, 'Miconazole 2 mg/ml', 39.00, 60, '2 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 2 mg/ml, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(224, 'Omeprazole 5 mg/ml', 39.90, 61, '5 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 5 mg/ml, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(225, 'Esomeprazole 10 mg/ml', 40.80, 62, '10 mg/ml', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 10 mg/ml, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(226, 'Pantoprazole 20 mg', 41.70, 63, '20 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 20 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(227, 'Rabeprazole 40 mg', 42.60, 64, '40 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 40 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(228, 'Lansoprazole 1000 UI', 43.50, 65, '1000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 1000 UI, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(229, 'Famotidine 2000 UI', 44.40, 66, '2000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 2000 UI, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(230, 'Gaviscon Advance 5000 UI', 45.30, 67, '5000 UI', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 5000 UI, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(231, 'Maalox Plus 50 mg', 46.20, 68, '50 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 50 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(232, 'Smecta Plus 75 mg', 47.10, 69, '75 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 75 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(233, 'Loperamide 100 mg', 48.00, 70, '100 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 100 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(234, 'Nifuroxazide 125 mg', 48.90, 71, '125 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 125 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(235, 'Domperidone 200 mg', 49.80, 72, '200 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 200 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(236, 'Metoclopramide 250 mg', 50.70, 73, '250 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Suspension buvable, dosage: 250 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(237, 'Trimebutine 400 mg', 51.60, 74, '400 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Pommade, dosage: 400 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(238, 'Meteospasmyl 500 mg', 52.50, 75, '500 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Creme, dosage: 500 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(239, 'Spasfon Lyoc 600 mg', 53.40, 76, '600 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Spray nasal, dosage: 600 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(240, 'Macrogol 800 mg', 54.30, 77, '800 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gouttes, dosage: 800 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(241, 'Lactulose 1 g', 55.20, 78, '1 g', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Solution, dosage: 1 g, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(242, 'Bisacodyl 2 mg/ml', 56.10, 79, '2 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Injection, dosage: 2 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(243, 'Psyllium 5 mg/ml', 57.00, 80, '5 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Comprime, dosage: 5 mg/ml, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(244, 'Cetirizine 10 mg/ml', 57.90, 81, '10 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gelule, dosage: 10 mg/ml, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(245, 'Loratadine 20 mg', 58.80, 82, '20 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Sirop, dosage: 20 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(246, 'Fexofenadine 40 mg', 59.70, 83, '40 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Suspension buvable, dosage: 40 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(247, 'Desloratadine 1000 UI', 60.60, 84, '1000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Pommade, dosage: 1000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(248, 'Levocetirizine 2000 UI', 61.50, 85, '2000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Creme, dosage: 2000 UI, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(249, 'Chlorphenamine 5000 UI', 62.40, 86, '5000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Spray nasal, dosage: 5000 UI, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(250, 'Montelukast 50 mg', 63.30, 87, '50 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gouttes, dosage: 50 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(251, 'Salbutamol 75 mg', 64.20, 88, '75 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Solution, dosage: 75 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(252, 'Budesonide 100 mg', 65.10, 89, '100 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Injection, dosage: 100 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(253, 'Fluticasone 125 mg', 66.00, 90, '125 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Comprime, dosage: 125 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(254, 'Prednisone 200 mg', 66.90, 91, '200 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gelule, dosage: 200 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(255, 'Prednisolone 250 mg', 67.80, 92, '250 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 250 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(256, 'Dexamethasone 400 mg', 68.70, 93, '400 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 400 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(257, 'Hydrocortisone 500 mg', 69.60, 94, '500 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 500 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(258, 'Betamethasone 600 mg', 70.50, 95, '600 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 600 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(259, 'Mupirocine 800 mg', 71.40, 96, '800 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 800 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(260, 'Fusidic Acid 1 g', 72.30, 97, '1 g', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 1 g, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(261, 'Gentamicine Creme 2 mg/ml', 73.20, 98, '2 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 2 mg/ml, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(262, 'Aciclovir 5 mg/ml', 74.10, 99, '5 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 5 mg/ml, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(263, 'Valaciclovir 10 mg/ml', 75.00, 100, '10 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 10 mg/ml, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(264, 'Povidone Iodee 20 mg', 75.90, 101, '20 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 20 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(265, 'Chlorhexidine 40 mg', 76.80, 102, '40 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 40 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(266, 'Eau oxygenee 1000 UI', 77.70, 103, '1000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 1000 UI, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(267, 'Biseptine Solution 2000 UI', 78.60, 104, '2000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 2000 UI, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(268, 'Hextril 5000 UI', 79.50, 105, '5000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 5000 UI, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(269, 'Eludril 50 mg', 80.40, 106, '50 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 50 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(270, 'Dolodent 75 mg', 81.30, 107, '75 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 75 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(271, 'Vitamine C 100 mg', 82.20, 108, '100 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 100 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(272, 'Vitamine D3 125 mg', 83.10, 109, '125 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 125 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(273, 'Vitamine B1 200 mg', 84.00, 110, '200 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 200 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(274, 'Vitamine B6 250 mg', 84.90, 111, '250 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 250 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(275, 'Vitamine B12 400 mg', 85.80, 112, '400 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 400 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(276, 'Vitamine E 500 mg', 86.70, 113, '500 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 500 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(277, 'Vitamine A 600 mg', 87.60, 114, '600 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 600 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(278, 'Acide folique 800 mg', 88.50, 115, '800 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 800 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(279, 'Fer fumarate 1 g', 89.40, 116, '1 g', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 1 g, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(280, 'Fer sulfate 2 mg/ml', 90.30, 117, '2 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 2 mg/ml, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(281, 'Magnesium marin 5 mg/ml', 91.20, 118, '5 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 5 mg/ml, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(282, 'Calcium D3 10 mg/ml', 92.10, 119, '10 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 10 mg/ml, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(283, 'Zinc 20 mg', 93.00, 120, '20 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 20 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(284, 'Omega 3 40 mg', 93.90, 121, '40 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 40 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(285, 'Multivitamines 1000 UI', 94.80, 122, '1000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 1000 UI, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(286, 'Supradyn Daily 2000 UI', 95.70, 123, '2000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 2000 UI, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(287, 'Berocca 5000 UI', 96.60, 124, '5000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 5000 UI, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(288, 'Centrum 50 mg', 97.50, 125, '50 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 50 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(289, 'Immunace 75 mg', 98.40, 126, '75 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 75 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(290, 'Gestarelle G 100 mg', 99.30, 127, '100 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 100 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(291, 'Fumafer 125 mg', 100.20, 128, '125 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 125 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(292, 'Tardyferon 200 mg', 101.10, 129, '200 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 200 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(293, 'Actifed 250 mg', 102.00, 130, '250 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 250 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(294, 'Humex Rhume 400 mg', 102.90, 131, '400 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 400 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(295, 'Rhinadvil 500 mg', 103.80, 132, '500 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 500 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(296, 'Fervex 600 mg', 104.70, 133, '600 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Suspension buvable, dosage: 600 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(297, 'Dolirhume 800 mg', 105.60, 134, '800 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Pommade, dosage: 800 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(298, 'Nurofen Flash 1 g', 106.50, 135, '1 g', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Creme, dosage: 1 g, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(299, 'Advil LiquiCaps 2 mg/ml', 107.40, 136, '2 mg/ml', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Spray nasal, dosage: 2 mg/ml, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(300, 'Efferalgan 5 mg/ml', 108.30, 137, '5 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gouttes, dosage: 5 mg/ml, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(301, 'Dafalgan 10 mg/ml', 109.20, 138, '10 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Solution, dosage: 10 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(302, 'Doliprane 20 mg', 110.10, 139, '20 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Injection, dosage: 20 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(303, 'Panadol Extra 40 mg', 111.00, 140, '40 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Comprime, dosage: 40 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(304, 'Augmentin 1000 UI', 111.90, 141, '1000 UI', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gelule, dosage: 1000 UI, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(305, 'Clamoxyl 2000 UI', 112.80, 142, '2000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Sirop, dosage: 2000 UI, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(306, 'Zinnat 5000 UI', 113.70, 143, '5000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Suspension buvable, dosage: 5000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(307, 'Rocephine 50 mg', 114.60, 144, '50 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Pommade, dosage: 50 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(308, 'Flagyl 75 mg', 115.50, 145, '75 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Creme, dosage: 75 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(309, 'Bactrim 100 mg', 116.40, 146, '100 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Spray nasal, dosage: 100 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(310, 'Aerius 125 mg', 117.30, 147, '125 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gouttes, dosage: 125 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(311, 'Zyrtec 200 mg', 118.20, 148, '200 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Solution, dosage: 200 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(312, 'Xyzall 250 mg', 119.10, 149, '250 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Injection, dosage: 250 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(313, 'Telfast 400 mg', 120.00, 150, '400 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Comprime, dosage: 400 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(314, 'Ventoline 500 mg', 120.90, 151, '500 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gelule, dosage: 500 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(315, 'Seretide 600 mg', 121.80, 152, '600 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 600 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(316, 'Symbicort 800 mg', 122.70, 153, '800 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 800 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(317, 'Spiriva 1 g', 123.60, 154, '1 g', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 1 g, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(318, 'Bricanyl 2 mg/ml', 124.50, 155, '2 mg/ml', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 2 mg/ml, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(319, 'Metformine 5 mg/ml', 125.40, 156, '5 mg/ml', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 5 mg/ml, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(320, 'Gliclazide 10 mg/ml', 126.30, 157, '10 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 10 mg/ml, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(321, 'Glimepiride 20 mg', 127.20, 158, '20 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 20 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(322, 'Insulatard 40 mg', 128.10, 159, '40 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 40 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(323, 'Lantus 1000 UI', 129.00, 160, '1000 UI', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 1000 UI, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(324, 'Januvia 2000 UI', 129.90, 161, '2000 UI', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 2000 UI, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(325, 'Forxiga 5000 UI', 130.80, 162, '5000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 5000 UI, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(326, 'Losartan 50 mg', 131.70, 163, '50 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 50 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(327, 'Valsartan 75 mg', 132.60, 164, '75 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 75 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(328, 'Candesartan 100 mg', 133.50, 165, '100 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 100 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(329, 'Amlodipine 125 mg', 134.40, 166, '125 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 125 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(330, 'Bisoprolol 200 mg', 135.30, 167, '200 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 200 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(331, 'Atenolol 250 mg', 136.20, 168, '250 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 250 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(332, 'Carvedilol 400 mg', 137.10, 169, '400 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 400 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(333, 'Ramipril 500 mg', 138.00, 170, '500 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 500 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(334, 'Perindopril 600 mg', 138.90, 171, '600 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 600 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(335, 'Furosemide 800 mg', 139.80, 172, '800 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 800 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(336, 'Spironolactone 1 g', 140.70, 173, '1 g', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 1 g, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(337, 'Hydrochlorothiazide 2 mg/ml', 141.60, 174, '2 mg/ml', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 2 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(338, 'Atorvastatine 5 mg/ml', 142.50, 175, '5 mg/ml', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 5 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(339, 'Rosuvastatine 10 mg/ml', 143.40, 176, '10 mg/ml', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 10 mg/ml, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(340, 'Simvastatine 20 mg', 144.30, 177, '20 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 20 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(341, 'Levothyrox 40 mg', 145.20, 178, '40 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 40 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(342, 'Euthyrox 1000 UI', 146.10, 179, '1000 UI', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 1000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(343, 'Sirdalud 2000 UI', 147.00, 180, '2000 UI', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 2000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(344, 'Muscoril 5000 UI', 147.90, 181, '5000 UI', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 5000 UI, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(345, 'Myolastan 50 mg', 148.80, 182, '50 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 50 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(346, 'Voltaren Emulgel 75 mg', 149.70, 183, '75 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 75 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(347, 'Fastum Gel 100 mg', 150.60, 184, '100 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 100 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(348, 'Biafine 125 mg', 151.50, 185, '125 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 125 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(349, 'Cicalfate 200 mg', 152.40, 186, '200 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 200 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(350, 'Dexeryl 250 mg', 153.30, 187, '250 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 250 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(351, 'A-Derma Exomega 400 mg', 154.20, 188, '400 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 400 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(352, 'La Roche Cicaplast 500 mg', 155.10, 189, '500 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 500 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(353, 'Uriage Bariederm 600 mg', 156.00, 190, '600 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 600 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13');
INSERT INTO `medicines` (`id`, `name`, `price`, `stock`, `dosage`, `forme`, `benefits`, `category`, `description`, `image`, `created_at`, `updated_at`) VALUES
(354, 'Smooderm 800 mg', 156.90, 191, '800 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 800 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(355, 'Bepanthen 1 g', 157.80, 192, '1 g', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 1 g, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(356, 'Mebo 2 mg/ml', 158.70, 193, '2 mg/ml', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Suspension buvable, dosage: 2 mg/ml, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(357, 'Paracetamol 100 mg', 13.80, 32, '100 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 100 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(358, 'Ibuprofene 125 mg', 14.70, 33, '125 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 125 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(359, 'Aspirine 200 mg', 15.60, 34, '200 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 200 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(360, 'Diclofenac 250 mg', 16.50, 35, '250 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 250 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(361, 'Naproxene 400 mg', 17.40, 36, '400 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 400 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(362, 'Ketoprofene 500 mg', 18.30, 37, '500 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 500 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(363, 'Acide mefenamique 600 mg', 19.20, 38, '600 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 600 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(364, 'Tramadol 800 mg', 20.10, 39, '800 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 800 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(365, 'Codeine 1 g', 21.00, 40, '1 g', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 1 g, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(366, 'Morphine 2 mg/ml', 21.90, 41, '2 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 2 mg/ml, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(367, 'Amoxicilline 5 mg/ml', 22.80, 42, '5 mg/ml', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 5 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(368, 'Amoxiclav 10 mg/ml', 23.70, 43, '10 mg/ml', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 10 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(369, 'Cefixime 20 mg', 24.60, 44, '20 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 20 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(370, 'Cefpodoxime 40 mg', 25.50, 45, '40 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 40 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(371, 'Ceftriaxone 1000 UI', 26.40, 46, '1000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 1000 UI, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(372, 'Azithromycine 2000 UI', 27.30, 47, '2000 UI', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 2000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(373, 'Clarithromycine 5000 UI', 28.20, 48, '5000 UI', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 5000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(374, 'Erythromycine 50 mg', 29.10, 49, '50 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 50 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(375, 'Ciprofloxacine 75 mg', 30.00, 50, '75 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 75 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(376, 'Levofloxacine 100 mg', 30.90, 51, '100 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 100 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(377, 'Ofloxacine 125 mg', 31.80, 52, '125 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 125 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(378, 'Metronidazole 200 mg', 32.70, 53, '200 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 200 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(379, 'Doxycycline 250 mg', 33.60, 54, '250 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 250 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(380, 'Tetracycline 400 mg', 34.50, 55, '400 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 400 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(381, 'Clindamycine 500 mg', 35.40, 56, '500 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 500 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(382, 'Fluconazole 600 mg', 36.30, 57, '600 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 600 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(383, 'Itraconazole 800 mg', 37.20, 58, '800 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 800 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(384, 'Ketoconazole 1 g', 38.10, 59, '1 g', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 1 g, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(385, 'Clotrimazole 2 mg/ml', 39.00, 60, '2 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 2 mg/ml, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(386, 'Miconazole 5 mg/ml', 39.90, 61, '5 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 5 mg/ml, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(387, 'Omeprazole 10 mg/ml', 40.80, 62, '10 mg/ml', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 10 mg/ml, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(388, 'Esomeprazole 20 mg', 41.70, 63, '20 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 20 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(389, 'Pantoprazole 40 mg', 42.60, 64, '40 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 40 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(390, 'Rabeprazole 1000 UI', 43.50, 65, '1000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 1000 UI, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(391, 'Lansoprazole 2000 UI', 44.40, 66, '2000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 2000 UI, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(392, 'Famotidine 5000 UI', 45.30, 67, '5000 UI', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 5000 UI, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(393, 'Gaviscon Advance 50 mg', 46.20, 68, '50 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 50 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(394, 'Maalox Plus 75 mg', 47.10, 69, '75 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 75 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(395, 'Smecta Plus 100 mg', 48.00, 70, '100 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 100 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(396, 'Loperamide 125 mg', 48.90, 71, '125 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 125 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(397, 'Nifuroxazide 200 mg', 49.80, 72, '200 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 200 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(398, 'Domperidone 250 mg', 50.70, 73, '250 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Suspension buvable, dosage: 250 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(399, 'Metoclopramide 400 mg', 51.60, 74, '400 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Pommade, dosage: 400 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(400, 'Trimebutine 500 mg', 52.50, 75, '500 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Creme, dosage: 500 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(401, 'Meteospasmyl 600 mg', 53.40, 76, '600 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Spray nasal, dosage: 600 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(402, 'Spasfon Lyoc 800 mg', 54.30, 77, '800 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gouttes, dosage: 800 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(403, 'Macrogol 1 g', 55.20, 78, '1 g', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Solution, dosage: 1 g, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(404, 'Lactulose 2 mg/ml', 56.10, 79, '2 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Injection, dosage: 2 mg/ml, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(405, 'Bisacodyl 5 mg/ml', 57.00, 80, '5 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Comprime, dosage: 5 mg/ml, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(406, 'Psyllium 10 mg/ml', 57.90, 81, '10 mg/ml', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gelule, dosage: 10 mg/ml, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(407, 'Cetirizine 20 mg', 58.80, 82, '20 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Sirop, dosage: 20 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(408, 'Loratadine 40 mg', 59.70, 83, '40 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Suspension buvable, dosage: 40 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(409, 'Fexofenadine 1000 UI', 60.60, 84, '1000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Pommade, dosage: 1000 UI, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(410, 'Desloratadine 2000 UI', 61.50, 85, '2000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Creme, dosage: 2000 UI, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(411, 'Levocetirizine 5000 UI', 62.40, 86, '5000 UI', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Spray nasal, dosage: 5000 UI, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(412, 'Chlorphenamine 50 mg', 63.30, 87, '50 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gouttes, dosage: 50 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(413, 'Montelukast 75 mg', 64.20, 88, '75 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Solution, dosage: 75 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(414, 'Salbutamol 100 mg', 65.10, 89, '100 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Injection, dosage: 100 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(415, 'Budesonide 125 mg', 66.00, 90, '125 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Comprime, dosage: 125 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(416, 'Fluticasone 200 mg', 66.90, 91, '200 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gelule, dosage: 200 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(417, 'Prednisone 250 mg', 67.80, 92, '250 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Sirop, dosage: 250 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(418, 'Prednisolone 400 mg', 68.70, 93, '400 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Suspension buvable, dosage: 400 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(419, 'Dexamethasone 500 mg', 69.60, 94, '500 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Pommade, dosage: 500 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(420, 'Hydrocortisone 600 mg', 70.50, 95, '600 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Creme, dosage: 600 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(421, 'Betamethasone 800 mg', 71.40, 96, '800 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Spray nasal, dosage: 800 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(422, 'Mupirocine 1 g', 72.30, 97, '1 g', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gouttes, dosage: 1 g, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(423, 'Fusidic Acid 2 mg/ml', 73.20, 98, '2 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Solution, dosage: 2 mg/ml, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(424, 'Gentamicine Creme 5 mg/ml', 74.10, 99, '5 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Injection, dosage: 5 mg/ml, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(425, 'Aciclovir 10 mg/ml', 75.00, 100, '10 mg/ml', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Comprime, dosage: 10 mg/ml, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(426, 'Valaciclovir 20 mg', 75.90, 101, '20 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gelule, dosage: 20 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(427, 'Povidone Iodee 40 mg', 76.80, 102, '40 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Sirop, dosage: 40 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(428, 'Chlorhexidine 1000 UI', 77.70, 103, '1000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Suspension buvable, dosage: 1000 UI, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(429, 'Eau oxygenee 2000 UI', 78.60, 104, '2000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Pommade, dosage: 2000 UI, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(430, 'Biseptine Solution 5000 UI', 79.50, 105, '5000 UI', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Creme, dosage: 5000 UI, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(431, 'Hextril 50 mg', 80.40, 106, '50 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Spray nasal, dosage: 50 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(432, 'Eludril 75 mg', 81.30, 107, '75 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gouttes, dosage: 75 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(433, 'Dolodent 100 mg', 82.20, 108, '100 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Solution, dosage: 100 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(434, 'Vitamine C 125 mg', 83.10, 109, '125 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Injection, dosage: 125 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(435, 'Vitamine D3 200 mg', 84.00, 110, '200 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Comprime, dosage: 200 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(436, 'Vitamine B1 250 mg', 84.90, 111, '250 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Gelule, dosage: 250 mg, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(437, 'Vitamine B6 400 mg', 85.80, 112, '400 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Sirop, dosage: 400 mg, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(438, 'Vitamine B12 500 mg', 86.70, 113, '500 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Suspension buvable, dosage: 500 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(439, 'Vitamine E 600 mg', 87.60, 114, '600 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Pommade, dosage: 600 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(440, 'Vitamine A 800 mg', 88.50, 115, '800 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Creme, dosage: 800 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(441, 'Acide folique 1 g', 89.40, 116, '1 g', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Spray nasal, dosage: 1 g, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(442, 'Fer fumarate 2 mg/ml', 90.30, 117, '2 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gouttes, dosage: 2 mg/ml, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(443, 'Fer sulfate 5 mg/ml', 91.20, 118, '5 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Solution, dosage: 5 mg/ml, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(444, 'Magnesium marin 10 mg/ml', 92.10, 119, '10 mg/ml', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Injection, dosage: 10 mg/ml, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(445, 'Calcium D3 20 mg', 93.00, 120, '20 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Comprime, dosage: 20 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(446, 'Zinc 40 mg', 93.90, 121, '40 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Gelule, dosage: 40 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(447, 'Omega 3 1000 UI', 94.80, 122, '1000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Sirop, dosage: 1000 UI, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(448, 'Multivitamines 2000 UI', 95.70, 123, '2000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Suspension buvable, dosage: 2000 UI, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(449, 'Supradyn Daily 5000 UI', 96.60, 124, '5000 UI', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Pommade, dosage: 5000 UI, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(450, 'Berocca 50 mg', 97.50, 125, '50 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Creme, dosage: 50 mg, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(451, 'Centrum 75 mg', 98.40, 126, '75 mg', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Spray nasal, dosage: 75 mg, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(452, 'Immunace 100 mg', 99.30, 127, '100 mg', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Gouttes, dosage: 100 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(453, 'Gestarelle G 125 mg', 100.20, 128, '125 mg', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Solution, dosage: 125 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(454, 'Fumafer 200 mg', 101.10, 129, '200 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Injection, dosage: 200 mg, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(455, 'Tardyferon 250 mg', 102.00, 130, '250 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Comprime, dosage: 250 mg, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(456, 'Actifed 400 mg', 102.90, 131, '400 mg', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Gelule, dosage: 400 mg, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(457, 'Humex Rhume 500 mg', 103.80, 132, '500 mg', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Sirop, dosage: 500 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(458, 'Rhinadvil 600 mg', 104.70, 133, '600 mg', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Suspension buvable, dosage: 600 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(459, 'Fervex 800 mg', 105.60, 134, '800 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Cardiologie', 'Forme: Pommade, dosage: 800 mg, categorie: Cardiologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(460, 'Dolirhume 1 g', 106.50, 135, '1 g', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Diabete', 'Forme: Creme, dosage: 1 g, categorie: Diabete.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(461, 'Nurofen Flash 2 mg/ml', 107.40, 136, '2 mg/ml', 'Spray nasal', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'ORL', 'Forme: Spray nasal, dosage: 2 mg/ml, categorie: ORL.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(462, 'Advil LiquiCaps 5 mg/ml', 108.30, 137, '5 mg/ml', 'Gouttes', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antiseptique', 'Forme: Gouttes, dosage: 5 mg/ml, categorie: Antiseptique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(463, 'Efferalgan 10 mg/ml', 109.20, 138, '10 mg/ml', 'Solution', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Analgesique', 'Forme: Solution, dosage: 10 mg/ml, categorie: Analgesique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(464, 'Dafalgan 20 mg', 110.10, 139, '20 mg', 'Injection', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Antibiotique', 'Forme: Injection, dosage: 20 mg, categorie: Antibiotique.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(465, 'Doliprane 40 mg', 111.00, 140, '40 mg', 'Comprime', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Anti-inflammatoire', 'Forme: Comprime, dosage: 40 mg, categorie: Anti-inflammatoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(466, 'Panadol Extra 1000 UI', 111.90, 141, '1000 UI', 'Gelule', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Allergie', 'Forme: Gelule, dosage: 1000 UI, categorie: Allergie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(467, 'Augmentin 2000 UI', 112.80, 142, '2000 UI', 'Sirop', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Digestif', 'Forme: Sirop, dosage: 2000 UI, categorie: Digestif.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(468, 'Clamoxyl 5000 UI', 113.70, 143, '5000 UI', 'Suspension buvable', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Dermatologie', 'Forme: Suspension buvable, dosage: 5000 UI, categorie: Dermatologie.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(469, 'Zinnat 50 mg', 114.60, 144, '50 mg', 'Pommade', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Vitamines', 'Forme: Pommade, dosage: 50 mg, categorie: Vitamines.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13'),
(470, 'Rocephine 75 mg', 115.50, 145, '75 mg', 'Creme', 'Medicament utilise en pratique courante au Maroc, a prendre selon avis medical et posologie recommandee.', 'Respiratoire', 'Forme: Creme, dosage: 75 mg, categorie: Respiratoire.', NULL, '2026-04-12 16:26:42', '2026-04-12 19:24:13');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_03_07_223835_create_personal_access_tokens_table', 1),
(5, '2026_03_07_230705_create_medicines_table', 1),
(6, '2026_03_25_112950_add_phone_to_users_table', 1),
(7, '2026_03_25_125751_add_stock_to_products_table', 1),
(8, '2026_03_25_160500_add_dosage_and_forme_to_medicines_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', '7461aceff661d7fd38902bd39691a77cef5c51018b13709517e6f82901e73c69', '[\"*\"]', NULL, NULL, '2026-04-04 09:22:00', '2026-04-04 09:22:00'),
(2, 'App\\Models\\User', 3, 'auth_token', '5d261de1652f08ae439ce3487900c84aaccf265f6ace6c48e12fc44e2d724451', '[\"*\"]', NULL, NULL, '2026-04-04 09:23:11', '2026-04-04 09:23:11'),
(3, 'App\\Models\\User', 3, 'auth_token', '84e47c92f5aca619fd8d73c42bcc3ec13058ab32755450437572c0bf0df515cf', '[\"*\"]', NULL, NULL, '2026-04-04 09:28:00', '2026-04-04 09:28:00'),
(4, 'App\\Models\\User', 3, 'auth_token', 'e010951fb54505f8b7caf956eddb851cd215c8dbd03a3d5dce99dac0e2080669', '[\"*\"]', NULL, NULL, '2026-04-04 10:14:19', '2026-04-04 10:14:19'),
(5, 'App\\Models\\User', 7, 'auth_token', '56ec5ba12d2f8e5dc205b57d93dd7c7f46129296dd1ccd5cdce354d0ec8d0e11', '[\"*\"]', NULL, NULL, '2026-04-09 21:02:13', '2026-04-09 21:02:13'),
(6, 'App\\Models\\User', 9, 'auth_token', 'c4e89d4b14dc44f4f79ac6cd1a2a79332d8f9b4e064949292aaeaab01da52c87', '[\"*\"]', NULL, NULL, '2026-04-09 21:17:42', '2026-04-09 21:17:42'),
(7, 'App\\Models\\User', 10, 'auth_token', '502417cd1a8b6695c7d8b331ba4f1a8aac5e62b10fff5799edcffbe1b73daa34', '[\"*\"]', NULL, NULL, '2026-04-09 21:20:47', '2026-04-09 21:20:47'),
(8, 'App\\Models\\User', 11, 'auth_token', '0259eac9d06940f54c86fbbc017a67bfa4f261382124dfdb444e841907ca1fa5', '[\"*\"]', '2026-04-09 21:38:48', NULL, '2026-04-09 21:38:34', '2026-04-09 21:38:48'),
(9, 'App\\Models\\User', 14, 'auth_token', '0573ecf2680ee454abab2498ccc8ca9bc91125b85eb6b30b307a2977186eb2a8', '[\"*\"]', NULL, NULL, '2026-04-09 23:03:21', '2026-04-09 23:03:21'),
(10, 'App\\Models\\User', 14, 'auth_token', '3314f0ff11ee7e9c717ac6f5efbb7795c111e62362f41caf11e79952d23888ab', '[\"*\"]', NULL, NULL, '2026-04-09 23:04:47', '2026-04-09 23:04:47'),
(11, 'App\\Models\\User', 15, 'auth_token', '318ccd734684969901ddd1756502a85085ef5173a8ff7ca8a0453edcd141a255', '[\"*\"]', NULL, NULL, '2026-04-09 23:11:23', '2026-04-09 23:11:23'),
(12, 'App\\Models\\User', 15, 'auth_token', '05dabad454541bc44a2854b6e91cbc970bde1e80775d9ce287a706c9a8bd5bb8', '[\"*\"]', NULL, NULL, '2026-04-09 23:13:02', '2026-04-09 23:13:02'),
(13, 'App\\Models\\User', 14, 'auth_token', '45476caaafbc5d09d49f46e7fa2097acd34a869caec816881e897f3cc782bb29', '[\"*\"]', NULL, NULL, '2026-04-12 16:10:41', '2026-04-12 16:10:41');

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
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
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0jXHibYOdhr1flkvdn3Js4M4cx960xTkyqfG9559', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUxhZ2VFdlRDVDJkR3lMSmgxRHBIZm9PWWtGbXVTVG5ySm9Oa09BMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774954897),
('24hnGHAtWH1X2TJ4gsCCsTuOZn2LloOkuZjQeqqW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjJ2cDhvN05remdLU3RpaUxGaU5ZOE1SZE9ob04wUVF3MDFwTm1WMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775227672);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', NULL, '2026-03-31 09:06:38', '$2y$12$4Cbx08DSLCrtiE.wUZk9P.DxvVKe9WyM82NF7G02xx613ooE5OQKa', 'PtIz68SLA9', '2026-03-31 09:06:38', '2026-03-31 09:06:38'),
(14, 'fatima ezzahrae lahdili', 'fatimaishrak1@gmail.com', '0644119305', '2026-04-09 23:04:24', '$2y$12$udeJQOypuqS3CQ0HH7fN3OphOktG5obZljLsJiCVtgms374hoQUsG', NULL, '2026-04-09 23:03:18', '2026-04-09 23:04:24'),
(15, 'ishrak lahdili', 'falahdili2022@gmail.com', '0619242432', '2026-04-09 23:12:39', '$2y$12$pj/QYIgDGoEwNih7nkXRwevw87ZEkYQwv7U5Y9QbBGHDQDuGA8jdq', NULL, '2026-04-09 23:11:20', '2026-04-09 23:12:39');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
