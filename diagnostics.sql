-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2022 at 03:16 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diagnostics`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `title`, `description`, `created_by`) VALUES
(1, 'About Little Hathee on Purpose', 'Our story begins with a bunch of socially responsible geeks who came together to realise that the world needs to support art, creativity and those who dream of it, and it is not going to happen on it’s own. That’s why we aims to target and work around it at the foundation, our little minds with much more potential but faces lack of resources', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `type`, `status`, `created_by`, `created_date_time`) VALUES
(10, 2, 'Investigation', 0, 1, '2021-12-13 10:41:20'),
(11, 1, 'Package', 0, 2, '2021-12-14 17:33:27'),
(12, 1, 'Package', 0, 1, '2021-12-24 10:40:17'),
(13, 52, 'Investigation', 0, 1, '2022-01-05 05:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`, `image`, `status`, `created_date_time`) VALUES
(1, 'Radiology', '', 'Radiologist_interpreting_MRI.jpg', 1, '2021-11-24 08:01:20'),
(2, 'Cardiology', '', 'Cardiologyhospital.png', 1, '2021-11-24 08:01:42'),
(3, 'General', '', 'generic-8.jpg', 1, '2021-11-24 08:04:45'),
(9, 'Hematology', '', '995.jpg', 1, '2022-01-08 08:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `cms_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`cms_id`, `type`, `title`, `description`, `created_date`) VALUES
(1, 'Our Story', 'Our Story', 'Our story begins with a bunch of socially responsible geeks who came together to realise that the world needs to support art, creativity and those who dream of it, and it is not going to happen on it’s own. That’s why we aims to target and work around it at the foundation, our little minds with much more potential but faces lack of resources.', '2021-10-20'),
(2, 'Feeding Creativity', 'FEEDING CREATIVITY', 'Encouraging creativity among childrens is neither a one person’s nor a one day job, it’s a process, it’s a responsibility which every one of us has to act upon someway.', '2021-10-20'),
(3, 'Social Enterprise', 'SOCIAL ENTERPRISE', 'Together, let’s try to make this world a beautiful place, if not for us, let’s do it for our child, for our future.', '2021-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` int(11) NOT NULL,
  `description` text NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `name`, `email`, `mobile`, `description`, `created_date_time`) VALUES
(1, 'Naveensriraj Kamireddy', 'snsriraj@gmail.com', 2147483647, 'Hello', '0000-00-00 00:00:00'),
(2, 'Naveensriraj Kamireddy', 'snsriraj@gmail.com', 2147483647, 'Hello', '0000-00-00 00:00:00'),
(3, 'Naveensriraj Kamireddy', 'snsriraj@gmail.com', 2147483647, 'Hello', '2021-10-22 13:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `mobile`, `email`, `password`, `status`, `created_date_time`) VALUES
(1, 'Naveen', 6302758875, 'snsriraj@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2021-12-04 08:16:51'),
(2, 'Priya', 9121459672, 'priyaneelam@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, '2021-12-14 17:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `investigations`
--

CREATE TABLE `investigations` (
  `investigation_id` int(11) NOT NULL,
  `investigation_name` varchar(255) NOT NULL,
  `short_keywords` text NOT NULL,
  `popular` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `price` double NOT NULL,
  `discount` int(11) NOT NULL,
  `discount_unit` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `investigations`
--

INSERT INTO `investigations` (`investigation_id`, `investigation_name`, `short_keywords`, `popular`, `category`, `price`, `discount`, `discount_unit`, `description`, `image`, `status`, `created_by`, `created_date_time`) VALUES
(1, 'Complete Blood Picture', 'CBP, CompleteBloodPicture', 1, 1, 2200, 25, '%', 'Complete Blood Picture - CBP', 'Radiologist_interpreting_MRI.jpg', 1, 1, '0000-00-00 00:00:00'),
(2, 'Ultrascan', 'ULT', 1, 2, 2000, 25, '%', 'Ultrascan', 'Cardiologyhospital.png', 1, 1, '0000-00-00 00:00:00'),
(3, 'Endoscopy', 'END', 1, 3, 1500, 10, '%', 'Endoscopy', 'Cardiologyhospital.png', 1, 1, '0000-00-00 00:00:00'),
(4, '(1,3)-Beta-D-Glucan', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(5, '1,25-Dihydroxy Vitamin D', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(6, '125-Di Hydroxy Cholecalciferol (Vitamin D3)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(7, '17 - OH Ketosteriods', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(8, '17-alpha Hydroxy Progesterone (17-OHP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(9, '17-Hydroxyprogesterone', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(10, '17-Ketosteroids', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(11, '24 Hrs Urinary Cortisol/Creatinine Ratio', '', 1, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(12, '24 Hrs Urine Volume', '', 1, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(13, '24-Hours Urinary Protein', '', 1, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(14, '25-Hydroxy Vitamin D', '', 1, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(15, '4Q12 (CHIC2) Deletion', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(16, '5-A Dihydro Testosterone', '', 1, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(17, '5-Hydroxy Indole Acetic Acid (5-HIAA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(18, '5-Hydroxytryptamine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(19, '6-Thioguanine', '', 1, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(20, '72 Hour Fecal Fat', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(21, 'Abdomen', '', 1, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(22, 'ABO Group and Rh Type', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(23, 'Absolute Basophil Count', '', 1, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(24, 'Absolute Eosinophil Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(25, 'Absolute Esonophil Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(26, 'Absolute Lymphocyte Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(27, 'Absolute Monocyte Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(28, 'Absolute Neutrophil Count (ANC)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(29, 'Absolute Reticulocyte Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(30, 'Acetaminophen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(31, 'Acetoacetate', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(32, 'Acetoacetic Acid', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(33, 'Acetone', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(34, 'Acetylcholine Receptor (AChR) Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(35, 'Acetylcholine Receptor Binding Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(36, 'Acetylcholine Receptor Blocking Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(37, 'Acetylcholine Receptor Modulating Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(38, 'Acetylsalicylic Acid', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(39, 'Acid Fast Suspectibility - 10 Drugs', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(40, 'Acid Fast Suspectibility - 13 Drugs', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(41, 'Acid Fast Suspectibility - 5 Drugs', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(42, 'Acid Phosphatase - Prostatic (PAP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(43, 'Acid Phosphatase - Prostatic Fraction (PAP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(44, 'Acid Phosphatase - Total', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(45, 'Acid Phosphatase (Alkaline)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(46, 'Acid-Fast Bacillus (AFB) Testing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(47, 'Acid-Fast Bacillus Smear and Culture and Sensitivity', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(48, 'aCL Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(49, 'Actin Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(50, 'Activated Clotting Time (ACT)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(51, 'Activated Coagulation Time', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(52, 'Activated Partial Thromboplastin Time (APTT)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(53, 'Activated Protein C Resistance', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(54, 'Acute Promyelocytic Leukemia panel', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(55, 'Acute Viral Hepatitis Panel', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(56, 'Acute Viral Hepatitis Serology Panel', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(57, 'Adenosine Deaminase (ADA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(58, 'Adreno Corticotrophic Hormone (ACTH)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(59, 'Aerobic Wound Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(60, 'AFB Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(61, 'AFB Smear and Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(62, 'AFB Stain (ZN Stain)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(63, 'Agglutinins', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(64, 'Aids Screen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(65, 'AIDS Test', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(66, 'Alanine Aminotransferase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(67, 'Alanine Transaminase (ALT/SGPT)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(68, 'Albert Stain (Diptheria Bacilli)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(69, 'Albumin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(70, 'Albumin/Creatinine Ratio', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(71, 'Albumin-To-Creatinine Ratio', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(72, 'Alcian Blue Stain', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(73, 'Alcohol', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(74, 'Aldolase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(75, 'Aldosterone', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(76, 'Aldosterone and Plasma Renin Activity', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(77, 'Aldosterone and Renin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(78, 'ALK (Anaplastic Lymphoma Receptor Tyrosine Kinase) Gene Rearrangement', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(79, 'ALK Gene Fusion', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(80, 'ALK Mutation (Gene Rearrangement)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(81, 'ALK Phos', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(82, 'Alkaline Phosphatase (ALP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(83, 'Alkaline Phosphatase Isoenzymes', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(84, 'Allergy Blood Testing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(85, 'Allergy Profile - Food Allergens', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(86, 'Allergy Screen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(87, 'Alloantibody Identification', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(88, 'Alpha Feto Protein (AFP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(89, 'Alpha Tryptase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(90, 'Alpha1 Antitrypsin (AAT)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(91, 'Alpha2-Antiplasmin Activity', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(92, 'Alpha-Amino Nitrogen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(93, 'Alpha-Fetoprotein (AFP) Tumor Marker', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(94, 'Aluminium', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(95, 'AMA, IFA', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(96, 'AMA-M2 Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(97, 'Amikacin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(98, 'Amino Acids, Urine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(99, 'Aminoglycoside', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(100, 'Aminolvulinic Acid (ALA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(101, 'Ammonia (NH3)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(102, 'Amniotic Fluid Analysis', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(103, 'Amphetamine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(104, 'Amylase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(105, 'Anaemia Profile', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(106, 'Anaerobic Blood Culture & Sensitivity', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(107, 'Anaerobic Culture & Sensitivity', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(108, 'ANCA - Myeloperoxidase (P-ANCA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(109, 'ANCA - Serine Proteinase 3 (C-ANCA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(110, 'ANCA (Anti Neutrophilic Cytoplasmic Antibodies) Titres - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(111, 'ANCA (Anti Neutrophilic Cytoplasmic Antibody) Qualitative - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(112, 'Androstenedione (A4)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(113, 'Angiography', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(114, 'Angiotensin Converting Enzyme (ACE)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(115, 'Anion Gap', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(116, 'Antenatal Screen USG', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(117, 'Anti Cardiolipin IgA Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(118, 'Anti Cardiolipin IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(119, 'Anti Cardiolipin IgM Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(120, 'Anti Centomere Protein B Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(121, 'Anti Cyclic Citrullinated Peptide Antibody (CCP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(122, 'Anti Cysticercosis (IgG) Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(123, 'Anti Deoxy Ribonuclease B', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(124, 'Anti ds-DNA Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(125, 'Anti ds-DNA Antibody Qualitative - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(126, 'Anti ds-DNA Antibody Titres - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(127, 'Anti Echinococcus IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(128, 'Anti F-Actin Antibodies', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(129, 'Anti Gliadin IgA Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(130, 'Anti Gliadin IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(131, 'Anti Hepatitis B Core Antigen (AHBC)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(132, 'Anti Jo-I Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(133, 'Anti LKM Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(134, 'Anti Microsomal /Anti Tpo Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(135, 'Anti Mitochondrial Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(136, 'Anti Mitochondrial Antibody Qualitative - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(137, 'Anti Mullerian Hormone(AMH)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(138, 'Anti Myelo per Oxidase Antibodies', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(139, 'Anti Neutrophilic Cytoplasmic Antibody (ANCA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(140, 'Anti nRNP/SM Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(141, 'Anti Nuclear Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(142, 'Anti Nuclear Antibody (ANA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(143, 'Anti Nuclear Antibody Qualitative - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(144, 'Anti Nuclear Antibody Titres - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(145, 'Anti PCNA Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(146, 'Anti Phospholipid IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(147, 'Anti Phospholipid IgM Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(148, 'Anti PM-SCL Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(149, 'Anti Rho52 Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(150, 'Anti Riboprotein', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(151, 'Anti SCL-70 Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(152, 'Anti SM - Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(153, 'Anti Smooth Muscle Antibody (ASMA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(154, 'Anti Smooth Muscle Antibody (ASMA) Titres - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(155, 'Anti Smooth Muscle Antibody Qualitative - IFA Method', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(156, 'Anti Sperm Antibody (ASAB)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(157, 'Anti SS -A IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(158, 'Anti SS- B IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(159, 'Anti SS-A Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(160, 'Anti SS-B Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(161, 'Anti Streptolysin (ASO) - Rapid', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(162, 'Anti Streptolysin O (ASO) Titre', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(163, 'Anti Thrombin Activity', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(164, 'Anti Thrombin III (Antigenic)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(165, 'Anti Thyroglobulin Antibody (ATG)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(166, 'Anti Thyroglobulin Antibody (ATG) - Titre', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(167, 'Anti Thyroperoxidase Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(168, 'Anti-DNase-B', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(169, 'Antigen Based Bivalent Rdt For Detection Of Malaria', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(170, 'Antigen Based Test for brucellosis', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(171, 'Antihistone Antibodies', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(172, 'Anti-Myelin Associated Glycoprotein Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(173, 'Anti-Ro (SS-A)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(174, 'Anti-Streptolysin O Quantitative', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(175, 'Apolipoprotein A1 (APO-A1)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(176, 'Apolipoprotein A1/B Ratio', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(177, 'Apolipoprotein B (APO-B)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(178, 'Appearance', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(179, 'Arsenic', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(180, 'Arterial Blood Gas Studies (Patient Breathing Room Air)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(181, 'Arterial Flow Single', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(182, 'Arthritis Screen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(183, 'Ascorbic Acid', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(184, 'ASO Titres (Anti Streptolysin O)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(185, 'Aspartate Aminotransferase (AST/SGOT)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(186, 'Aspergillus IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(187, 'Auramine Rhodamine Stain', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(188, 'B Vitamins', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(189, 'Bacteria', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(190, 'Bacterial and Fungal Susceptibility Testing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(191, 'Bacterial Culture, Respiratory', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(192, 'Bacterial Culture, Stool', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(193, 'Bacterial Sputum Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(194, 'Bacterial Wound Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(195, 'Barbiturates', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(196, 'Barium Enema', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(197, 'Barium Swallow', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(198, 'Basic Metabolic Panel (BMP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(199, 'Basic Metabolic Profile', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(200, 'Basophils', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(201, 'B-Cell Gene Clonality Molecular Genetic Tests', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(202, 'B-Cell Gene Rearrangement', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(203, 'B-Cell Immunoglobulin Gene Rearrangement', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(204, 'BCR-ABL', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(205, 'BCR-ABL Gene Translocation (Qualitative)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(206, 'BCR-ABL Gene Translocation (Quantitative)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(207, 'BCR-ABL1', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(208, 'BCR-ABL1 Fusion', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(209, 'Bence Jones Protein (BJ Protein)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(210, 'Benzodiazepines', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(211, 'Benzodiazepines Detection', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(212, 'Beta 2 Microglobulin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(213, 'Beta 2GP1 Ab', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(214, 'Beta Human Chorionic Gonodotropin Hormone', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(215, 'Beta Tryptase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(216, 'Beta2 Microglobulin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(217, 'Beta2 Microglobulin Kidney Disease', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(218, 'Beta2 Microglobulin Tumor Marker', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(219, 'Beta2 Microglobulin, Serum or Urine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(220, 'Beta2 Microglobulin, Serum, Urine, or CSF', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(221, 'Beta2-Glycoprotein I Antibodies IgG', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(222, 'Beta2-Glycoprotein I Antibodies IgM', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(223, 'Beta2-Microglobulin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(224, 'Beta-Hemolytic Strep Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(225, 'Beta-Human Chorionic Gonadotropin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(226, 'BetaHumanChorionicGonodotropinhormone', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(227, 'Beta-Hydroxybutyrate', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(228, 'Beta-Hydroxybutyric Acid', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(229, 'Bicarbonate (Calculated From CO2)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(230, 'Bicarbonate (Total CO2)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(231, 'Bile Pigments', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(232, 'Bile Salts', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(233, 'Bilirubin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(234, 'Bilirubin - Indirect', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(235, 'Bilirubin (Total + Direct)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(236, 'Bilirubin Direct', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(237, 'Bilirubin Total', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(238, 'Bioavailable Testosterone', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(239, 'Biopsy - Bone', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(240, 'Biopsy - Large Specimen (> 5Cm)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(241, 'Biopsy - Medium Specimen (Upto 5Cm)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(242, 'Biopsy - Small Specimen (', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(243, 'Biopsy - Uterus With Both Tubes & Ovaries', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(244, 'Biopsy - Uterus With One Tube & Ovary', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(245, 'Biopsy - Uterus Without Tubes & Ovaries', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(246, 'Biotin (B7)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(247, 'Bismuth Subsalicylate', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(248, 'Bleeding Time', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(249, 'BleedingTime', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(250, 'Blocks For Processing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(251, 'Blood', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(252, 'Blood Alcohol Content', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(253, 'Blood Alcohol Level', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(254, 'Blood Arsenic Level', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(255, 'Blood Cholesterol', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(256, 'Blood Clotting Factors', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(257, 'Blood Copper', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(258, 'Blood Creatinine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(259, 'Blood Cross Matching', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(260, 'Blood Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(261, 'Blood Culture (Bacterial, Fungal And/Or AFB)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(262, 'Blood Culture and Antimicrobial Sensitivity', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(263, 'Blood Culture, Aerobic', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(264, 'Blood Differential', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(265, 'Blood Film', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(266, 'Blood Gases Analysis', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(267, 'Blood Glucose', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(268, 'Blood Group', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(269, 'Blood Group & Rh Factor', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(270, 'Blood Grouping (A,B,O) and Rh Factor', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(271, 'Blood Grouping and Rh Typing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(272, 'Blood Ketones', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(273, 'Blood Lead', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(274, 'Blood Lead Level', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(275, 'Blood Lead Test', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(276, 'Blood Peripheral Smear Examination', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(277, 'Blood Picture - Peripheral Smear Examination', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(278, 'Blood Smear', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(279, 'Blood Sugar', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(280, 'Blood Typing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(281, 'Blood Urea', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(282, 'Blood Urea Nitrogen (BUN)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(283, 'Body Contrast (Extra)', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(284, 'Bone Formation Markers', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(285, 'Bone Health Profile', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(286, 'Bone Markers', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(287, 'Bone Marrow Aspiration', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(288, 'Bone Marrow Aspiration and Biopsy', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(289, 'Bone Marrow Examination', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(290, 'Bone Marrow Iron Stain', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(291, 'Bone Marrow Smear Examination', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(292, 'Bone Resorption Markers', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(293, 'Bone Specific', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(294, 'Bone Turnover Tests', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(295, 'Bone-Specific Alkaline Phosphatase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(296, 'Bony Pelvis', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(297, 'Brain (P+C)', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(298, 'Brain CT Scan', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(299, 'Brain Mri', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(300, 'Brain Natriuretic Peptide', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(301, 'Breast Cancer Gene Expression Profiling', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(302, 'Breast Cancer Multiparameter Gene Expression Tests', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(303, 'Breast Cancer Susceptibility Genes 1 and 2', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(304, 'Breath Tests', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(305, 'Brucella Antibody Screen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(306, 'Brucella DNA PCR - Qualitative', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(307, 'Brucella IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(308, 'Brucella IgM Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(309, 'B-Type Natriuretic Peptide', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(310, 'BUN To Creatinine Ratio', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(311, 'Butyrylcholinesterase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(312, 'C - Arm', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(313, 'C & S', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(314, 'C. Difficile (Culture, Toxin Gene NAAT or Antigen Test)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(315, 'C1', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(316, 'C1Q', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(317, 'C2', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(318, 'C3', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(319, 'C4', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(320, 'CA- 125', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(321, 'CA 125 - Ovarian Cancer Marker', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(322, 'CA 125 - Ovarian Cancer Marker - Titre', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(323, 'CA 125 Tumor Marker', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(324, 'CA 15.3 - Breast Cancer Marker', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(325, 'CA 15.3 - Breast Cancer Marker -Titre', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(326, 'CA 15-3', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(327, 'CA 19.9 - Pancreatic Cancer Marker', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(328, 'CA 19.9 - Pancreatic Cancer Marker - Titre', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(329, 'CA 72.4 - Cancer Marker', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(330, 'CA-Breast', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(331, 'Cadmium', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(332, 'CA-GI', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(333, 'Calcidiol (25-Hydroxy-Vitamin D)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(334, 'Calcifidiol (25-Hydroxy-Vitamin D)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(335, 'Calcitonin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(336, 'Calcitriol (1,25 Dihydroxy-Vitamin D)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(337, 'Calcium', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(338, 'Calcium - Spot', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(339, 'Calcium Creatinine Ratio', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(340, 'Calcium Ionized', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(341, 'Calcium/Serum', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(342, 'Calcofluor White Stain', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(343, 'Calculated Glomerular Filtration Rate (cGFR)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(344, 'Calprotectin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(345, 'CALR Gene Mutation Exon 9', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(346, 'CALR Mutation', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(347, 'Calreticulin Mutation Analysis (Myeloproliferative Neoplasm)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(348, 'Cannabinoid or Cannabis Testing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(349, 'Capillary- Based Nucleic Acid Amplification Test', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(350, 'Capillary Electrophoresis', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(351, 'Carbamazepine (Tegretol)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(352, 'Carbohydrate Antigens CA 19-9', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(353, 'Carbohydrate Antigens CA 27-29', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(354, 'Carbohydrate Antigens CA-125', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(355, 'Carbon Dioxide Content', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(356, 'Carboxyhemoglobin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(357, 'Carcino Embryonic Antigen (CEA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(358, 'Cardiac Biomarkers', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(359, 'Cardiac Fibrinogen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(360, 'Cardiac Markers', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(361, 'Cardiac Risk Assessment', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(362, 'Cardiac Risk Markers', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(363, 'Cardiac Risk Screening', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(364, 'Cardiac-Specific Troponin I and Troponin T', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(365, 'Cardiolipin IgA Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(366, 'Cardiolipin IgG Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(367, 'Cardiolipin IgM Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(368, 'Carotene', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(369, 'Carotid &Verterbral Study', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(370, 'Catecholamines', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(371, 'CBC With Differential', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(372, 'CD3 Absolute Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(373, 'CD3/CD4/CD8 Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(374, 'CD4 Absolute Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(375, 'CD4 T-Lymphocyte Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(376, 'CD4/CD8 Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(377, 'Celiac Disease Antibody Tests', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(378, 'Cell-free fetal DNA (cffDNA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(379, 'Centromere Antibody IgG', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(380, 'C-erbB-2', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(381, 'Cerebrospinal Fluid (CSF) Analysis', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(382, 'Ceruloplasmin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(383, 'Cervical Cytology', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(384, 'Cervical Smear', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(385, 'Cervical Spine', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(386, 'Cervical Spine Anatomy', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(387, 'CF DNA Analysis', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(388, 'CF Gene Mutation Panel', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(389, 'CF Molecular Genetic Testing', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(390, 'CFTR Mutation Analysis', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(391, 'Chem 12', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(392, 'Chem 7', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(393, 'Chemistry Panels', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(394, 'Chemistry Screen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(395, 'Chest', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(396, 'Chikungunya', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(397, 'Chikungunya IgM Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(398, 'Chikungunya Virus Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(399, 'Child Preventive Health Check Up', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(400, 'Chlamydia Culture', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(401, 'Chlamydia IgA Antibodies', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(402, 'Chlamydia Nucleic Acid Amplification Test (NAAT or NAT) or DNA Probe', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(403, 'Chlamydia/GC Std Panel', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(404, 'Chloride', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(405, 'Cholesterol High-Density Lipoprotein', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(406, 'Cholesterol Low-Density Lipoprotein', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(407, 'Cholesterol Total', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(408, 'Cholinesterase', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(409, 'Chromium - Serum', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(410, 'Chromium - Urine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(411, 'Chromium - Whole Blood', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(412, 'Chromosome Analysis, Amniotic Fluid', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(413, 'Chromosome Analysis, Blood', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(414, 'Chromosome Analysis, Bone Marrow', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(415, 'Chromosome Analysis, Cord Blood', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(416, 'Chromosome Analysis, Leukemic Blood', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(417, 'Chromosome Analysis, Products of conception', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(418, 'Chromosome Karyotype', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(419, 'Chromosome Studies', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(420, 'Chymotrypsin, Fecal', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(421, 'Circulating Immunocomplex (CIC)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(422, 'Circulating Tumor Cell (CTC) Count', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(423, 'Circulating Tumor DNA (ctDNA)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(424, 'Citrulline Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(425, 'CK MB', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(426, 'Clotting Time', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(427, 'CMV', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(428, 'CMV DNA Qualitative PCR', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(429, 'CMV DNA Quanitative PCR', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(430, 'Coagulation Factors', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(431, 'Cold Agglutinin Titer', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(432, 'Colour', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(433, 'Complement 3 (C3)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(434, 'Complement 4 (C4)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(435, 'Complement Components', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(436, 'Complete Abdomen', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(437, 'Complete Blood Count & ESR', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(438, 'Complete Blood Count (CBC)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(439, 'Complete Blood Picture (CBP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(440, 'Complete Stool Examination', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(441, 'Complete Urine Analysis (CUE)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(442, 'Comprehensive Health Check Up', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(443, 'Comprehensive Metabolic Panel (CMP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(444, 'Comprehensive Metabolic Profile', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(445, 'Comprehensive Ophthalmic Diagnostic Services', '', 0, 3, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(446, 'Consistency', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(447, 'Continuous Glucose Monitors (CGM)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(448, 'Control Value', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(449, 'Coombs Test - Direct', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(450, 'Coomb&#39;s Test - Direct', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(451, 'Coombs Test - Indirect', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(452, 'Coomb&#39;s Test - Indirect', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(453, 'Coomb&#39;s Test-Direct With Titre', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(454, 'Coomb&#39;s Test-Indirect With Titre', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(455, 'Copper - Serum', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(456, 'Copper - Urine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(457, 'Coproporphyrin', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(458, 'Cortisol', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(459, 'Cortisol Serum (3 to 5 PM)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(460, 'Cortisol Serum (7 to 9 AM)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(461, 'Cortisol Urine Total', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(462, 'Cotinine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(463, 'C-Peptide', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(464, 'C-Reactive Protein (CRP)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(465, 'C-Reactive Protein Quantitative', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(466, 'Creatine Kinase (CK)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(467, 'Creatine Kinase Mb (CK-MB)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(468, 'Creatine Kinase Mb Fraction (CK-MB)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(469, 'Creatine Phosphokinase (CPK)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(470, 'Creatinine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(471, 'Creatinine - Spot', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(472, 'Creatinine - Spot Urine', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(473, 'Creatinine Clearance Test (CCT)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(474, 'Creatinine Clearence Test', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(475, 'Creatinine Kinase (CPK)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(476, 'Cryptococcus Antigen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(477, 'Crystals', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(478, 'CSF Analysis (Sugar, Protein, Cell Count)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(479, 'CT Angiograms', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(480, 'CT Guided Biopsy', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(481, 'CT Renal Angiogram', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(482, 'CT Scan', '', 0, 2, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(483, 'C-Telopeptide', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(484, 'Culture and Sensitivity, Urine (22 Drugs)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(485, 'Culture, Aerobic, Blood', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(486, 'Culture, Aerobic, Body Fluids', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(487, 'Culture, Aerobic, Cervical Swab', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(488, 'Culture, Aerobic, CSF', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(489, 'Culture, Aerobic, Ear Swab', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(490, 'Culture, Aerobic, Eye Swab', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(491, 'Culture, Aerobic, Miscellaneous', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(492, 'Culture, Aerobic, Nasal Swab', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(493, 'Culture, Aerobic, OT Swabs', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(494, 'Culture, Aerobic, Pus', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(495, 'Culture, Aerobic, Semen', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(496, 'Culture, Aerobic, Sputum', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(497, 'Culture, Aerobic, Stool', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(498, 'Culture, Aerobic, Throat Swab', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(499, 'Culture, Aerobic, Vaginal Swab', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(500, 'Cyclic Citrullinated Peptide Antibody', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(501, 'Cyclosporine Level', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(502, 'CYFRA 21 (Lung Cancer Marker)', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00'),
(503, 'Cyp2C19', '', 0, 1, 0, 0, '', '', '', 1, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `tracking_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `appointment_place` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `tracking_id`, `name`, `mobile`, `appointment_date`, `appointment_place`, `status`, `address_id`, `created_by`, `created_date_time`) VALUES
(1, 'APD-ORD001', '', 0, '0000-00-00 00:00:00', 'House', 1, 1, 1, '2021-12-13 15:28:00'),
(2, 'APD-ORD002', '', 0, '0000-00-00 00:00:00', 'House', 1, 1, 1, '2021-12-14 12:15:13'),
(3, 'APD-ORD003', '', 0, '0000-00-00 00:00:00', 'House', 1, 1, 1, '2021-12-14 12:21:26'),
(4, 'APD-ORD004', '', 0, '0000-00-00 00:00:00', '', 0, 0, 1, '2021-12-14 12:22:13'),
(5, 'APD-ORD005', '', 0, '0000-00-00 00:00:00', 'House', 1, 1, 1, '2021-12-14 12:23:47'),
(6, 'APD-ORD006', '', 0, '0000-00-00 00:00:00', '', 0, 0, 2, '2021-12-14 17:33:33'),
(7, 'APD-ORD007', '', 0, '0000-00-00 00:00:00', 'House', 1, 1, 1, '2021-12-16 06:11:02'),
(8, 'APD-ORD008', '', 0, '0000-00-00 00:00:00', '', 0, 0, 1, '2021-12-24 10:40:24'),
(9, 'APD-ORD009', '', 0, '0000-00-00 00:00:00', '', 0, 0, 1, '2021-12-24 10:51:03'),
(10, 'APD-ORD0010', '', 0, '0000-00-00 00:00:00', 'House', 1, 1, 1, '2021-12-24 10:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `order_line_items`
--

CREATE TABLE `order_line_items` (
  `order_line_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `discount_unit` varchar(10) NOT NULL,
  `final` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `report_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_line_items`
--

INSERT INTO `order_line_items` (`order_line_item_id`, `order_id`, `product_id`, `price`, `discount`, `discount_unit`, `final`, `type`, `status`, `created_date_time`, `report_date_time`) VALUES
(1, 1, 1, 25000, 50, '%', 12500, 'Package', 0, '2021-12-13 15:28:00', '0000-00-00 00:00:00'),
(2, 1, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-13 15:28:00', '0000-00-00 00:00:00'),
(3, 2, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-14 12:15:13', '0000-00-00 00:00:00'),
(4, 3, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-14 12:21:26', '0000-00-00 00:00:00'),
(5, 4, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-14 12:22:13', '0000-00-00 00:00:00'),
(6, 5, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-14 12:23:47', '0000-00-00 00:00:00'),
(7, 6, 1, 25000, 50, '%', 12500, 'Package', 0, '2021-12-14 17:33:33', '0000-00-00 00:00:00'),
(8, 7, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-16 06:11:02', '0000-00-00 00:00:00'),
(9, 8, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-24 10:40:24', '0000-00-00 00:00:00'),
(10, 8, 1, 25000, 50, '%', 12500, 'Package', 0, '2021-12-24 10:40:24', '0000-00-00 00:00:00'),
(11, 9, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-24 10:51:03', '0000-00-00 00:00:00'),
(12, 9, 1, 25000, 50, '%', 12500, 'Package', 0, '2021-12-24 10:51:03', '0000-00-00 00:00:00'),
(13, 10, 2, 2000, 25, '%', 500, 'Investigation', 0, '2021-12-24 10:51:10', '0000-00-00 00:00:00'),
(14, 10, 1, 25000, 50, '%', 12500, 'Package', 0, '2021-12-24 10:51:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `popular` int(11) NOT NULL,
  `investigations` varchar(500) NOT NULL,
  `price` bigint(20) NOT NULL,
  `discount` int(11) NOT NULL,
  `discount_unit` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`package_id`, `package_name`, `popular`, `investigations`, `price`, `discount`, `discount_unit`, `description`, `image`, `status`, `created_by`, `created_date_time`) VALUES
(1, 'Health Packages', 1, '1,2', 25000, 50, '%', 'Health Package with 25% Off. Festival Offers', 'Cardiologyhospital1.png', 1, 1, '2021-11-24 11:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `policy_id` int(11) NOT NULL,
  `policy_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`policy_id`, `policy_name`, `description`, `created_date_time`) VALUES
(1, 'Seller Policy', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\\\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\'', '2021-11-02 22:45:14'),
(2, 'Buyer Policy', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\\\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\'', '2021-11-02 22:45:14'),
(3, 'Cancellation Policy', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\\\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\'', '2021-11-02 22:45:14'),
(4, 'Return Policy', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\\\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\'', '2021-11-02 22:45:14'),
(5, 'Shipping & Refund Policy', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\\\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\'', '2021-11-02 22:45:14'),
(6, 'Terms & Conditions', '\'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\\\\\\\\\\\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\'', '2021-09-30 12:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `description`, `image`, `created_at`) VALUES
(1, 'Privacy Policy', '<p><b>What is Lorem Ipsum?</b></p><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n</p><p>\r\n<b>Why do we use it?</b>\r\n</p><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n</p>', 'single-service-1.jpg', '2021-10-14 08:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `slider_id` int(11) NOT NULL,
  `slider_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `slider_image` varchar(255) NOT NULL,
  `created_date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`slider_id`, `slider_title`, `description`, `slider_image`, `created_date_time`) VALUES
(1, 'LittleHathee', 'Sample Description', 'slider1.png', '2021-11-04 09:15:54'),
(2, 'LittleHathee', 'Sample Description', 'slider2.png', '2021-11-04 10:09:59'),
(3, 'LittleHathee', 'Sample Description', 'slider3.jpg', '2021-11-04 10:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_id` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `email`, `mobile`, `email_verified_at`, `password`, `access`, `profile_id`, `remember_token`, `created_at`, `created_by`, `updated_at`, `status`) VALUES
(1, 'Administrator', 'Super Administrator', 'superadmin@pr.com', 1234567890, '2020-07-14 16:35:07', '827ccb0eea8a706c4c34a16891f84e7b', '', 1, NULL, '2020-07-14 16:38:12', 0, '2020-07-14 16:38:12', 1),
(21, 'Naveen Sriraj', '', 'snsriraj@gmail.com', 6302758875, '2021-06-01 11:28:35', '827ccb0eea8a706c4c34a16891f84e7b', '', 2, NULL, '2021-06-01 09:21:00', 1, '2021-06-01 11:28:35', 1),
(23, 'John Doe', '', 'johndoe@gmail.com', 9988998899, '2021-06-02 02:24:41', '827ccb0eea8a706c4c34a16891f84e7b', '', 3, NULL, '2021-06-02 02:24:23', 1, '2021-06-02 02:24:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `user_address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`user_address_id`, `user_id`, `name`, `mobile`, `address`, `city`, `state`, `pincode`) VALUES
(1, 1, 'Naveensriraj Kamireddy', 6302758875, 'Ashok Nagar, 67-1-33/D\n67-1-33/D', 'Kakinada', 'Andhra Pradesh', 533003),
(4, 1, 'Haripriya Neelam', 9121459672, 'Kukatpallyawsdasdasd', 'Hydera', 'Kukatpallyawsdasdasd', 500029),
(8, 1, 'Sunny', 9876543210, 'Punjagutta', 'Hyderabad', 'Punjagutta', 500008);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`cms_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `investigations`
--
ALTER TABLE `investigations`
  ADD PRIMARY KEY (`investigation_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_line_items`
--
ALTER TABLE `order_line_items`
  ADD PRIMARY KEY (`order_line_item_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`policy_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`user_address_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `cms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `investigations`
--
ALTER TABLE `investigations`
  MODIFY `investigation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_line_items`
--
ALTER TABLE `order_line_items`
  MODIFY `order_line_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `policy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `user_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
