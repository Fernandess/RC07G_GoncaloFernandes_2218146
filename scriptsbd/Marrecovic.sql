-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2021 at 12:48 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `natal`
--

-- --------------------------------------------------------

--
-- Table structure for table `comportamento`
--

CREATE TABLE `comportamento` (
  `id_comportamento` int(11) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL,
  `Merece_presente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comportamento`
--

INSERT INTO `comportamento` (`id_comportamento`, `descricao`, `Merece_presente`) VALUES
(1, 'Mau', 0),
(2, 'Bom', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crianca`
--

CREATE TABLE `crianca` (
  `id_crianca` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `comportamento` int(11) DEFAULT NULL,
  `presente` int(11) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `presentes`
--

CREATE TABLE `presentes` (
  `id_presente` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `presentes`
--

INSERT INTO `presentes` (`id_presente`, `nome`, `quantidade`) VALUES
(4, 'motorizada', 10),
(5, 'carrinho', 5),
(6, 'iphone', 2),
(7, 'monitor', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comportamento`
--
ALTER TABLE `comportamento`
  ADD PRIMARY KEY (`id_comportamento`);

--
-- Indexes for table `crianca`
--
ALTER TABLE `crianca`
  ADD PRIMARY KEY (`id_crianca`),
  ADD KEY `crianca_FK_1` (`presente`),
  ADD KEY `crianca_FK` (`comportamento`);

--
-- Indexes for table `presentes`
--
ALTER TABLE `presentes`
  ADD PRIMARY KEY (`id_presente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comportamento`
--
ALTER TABLE `comportamento`
  MODIFY `id_comportamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crianca`
--
ALTER TABLE `crianca`
  MODIFY `id_crianca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `presentes`
--
ALTER TABLE `presentes`
  MODIFY `id_presente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `crianca`
--
ALTER TABLE `crianca`
  ADD CONSTRAINT `crianca_FK` FOREIGN KEY (`comportamento`) REFERENCES `comportamento` (`id_comportamento`),
  ADD CONSTRAINT `crianca_FK_1` FOREIGN KEY (`presente`) REFERENCES `presentes` (`id_presente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
