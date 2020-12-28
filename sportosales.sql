-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020 m. Grd 28 d. 09:05
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sportosales`
--

-- --------------------------------------------------------

--
-- Tik struktūra rodiniui `rezultatas`
-- (See below for the actual view)
--
CREATE TABLE `rezultatas` (
);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `sporto_klubai`
--

CREATE TABLE `sporto_klubai` (
  `id` int(2) UNSIGNED NOT NULL,
  `pav` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `adresas` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `menesinis_ikainis` int(2) NOT NULL,
  `papildomos_paslaugos` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `sporto_klubai`
--

INSERT INTO `sporto_klubai` (`id`, `pav`, `adresas`, `menesinis_ikainis`, `papildomos_paslaugos`) VALUES
(1, 'GYM+', 'V.Kreves pr. 13, Kaunas 49488', 29, 'Soliarumai+Grupines treniruotes'),
(2, 'Lemon Gym', 'Savanoriu pr. 168, Kaunas 44149', 27, 'Hydromassage lovos+Grupines treniruotes'),
(3, 'FitClub', 'Savanoriu pr. 168, Kaunas 44149', 31, 'Grupines treniruotes'),
(4, 'CityGym', 'Pramones pr. 4A, Kaunas 51329', 35, 'Kineziterapeutas+Grupines treniruotes'),
(5, 'DiamondGym', 'Partizanu g. 27, Kaunas 49456', 38, 'Pirtis+Grupines treniruotes');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `treneriai`
--

CREATE TABLE `treneriai` (
  `id` int(2) UNSIGNED NOT NULL,
  `sporto_klubas` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `treneris` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Sukurta duomenų kopija lentelei `treneriai`
--

INSERT INTO `treneriai` (`id`, `sporto_klubas`, `treneris`) VALUES
(1, 'GYM+', 'Modestas Kungys'),
(2, 'Lemon Gym', 'Zanas Stankevicius'),
(3, 'FitClub', 'Marius Vasiliauskas'),
(4, 'CityGym', 'Vilius Sosnovskis'),
(5, 'DiamondGym', 'Gedvydas Norkevicius'),
(6, 'Lemon Gym', 'Vilius Sosnovskis');

-- --------------------------------------------------------

--
-- Struktūra peržiūrėjimui `rezultatas`
--
DROP TABLE IF EXISTS `rezultatas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rezultatas`  AS SELECT `treneriai`.`id` AS `id`, `treneriai`.`sporto_klubas` AS `sporto_klubas`, `treneriai`.`treneris` AS `treneris`, count(`sporto klubai`.`id`) AS `rezultatas` FROM (`treneriai` left join `sporto klubai` on(`sporto klubai`.`pav` = `treneriai`.`sporto_klubas`)) WHERE 1 GROUP BY `treneriai`.`sporto_klubas` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sporto_klubai`
--
ALTER TABLE `sporto_klubai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treneriai`
--
ALTER TABLE `treneriai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sporto_klubai`
--
ALTER TABLE `sporto_klubai`
  MODIFY `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `treneriai`
--
ALTER TABLE `treneriai`
  MODIFY `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
