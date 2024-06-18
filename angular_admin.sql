-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 18 juin 2024 à 14:35
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `angular_admin`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE IF NOT EXISTS `absence` (
  `id_absence` int NOT NULL AUTO_INCREMENT,
  `justifie` varchar(50) DEFAULT NULL,
  `absence_date` datetime DEFAULT NULL,
  `posseder` int DEFAULT NULL,
  `valider` int NOT NULL,
  PRIMARY KEY (`id_absence`),
  KEY `id_user` (`posseder`),
  KEY `id_user_1` (`valider`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `justificatif`
--

DROP TABLE IF EXISTS `justificatif`;
CREATE TABLE IF NOT EXISTS `justificatif` (
  `id_justificatif` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `lien` varchar(50) DEFAULT NULL,
  `id_retard` int NOT NULL,
  PRIMARY KEY (`id_justificatif`),
  KEY `id_retard` (`id_retard`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `name`) VALUES
(1, 'Admin'),
(2, 'Eleve');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_role` (`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `email`, `password`, `firstname`, `lastname`, `id_role`) VALUES
(1, 'a@a', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'admin', 'admin', 1),
(2, 'e@e', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'eleve', 'eleve', 2),
(3, 't@t', '$2y$10$xDX5eeYt7ZyEEu12K5ReO.W6BzTFCS6Jw1hr4x4q9V5eQ1y6ReQbC', 't', 't', 2),
(20, 'm@m', '$2y$10$UZXXFdwKLYFZQo/re7IZF.jmDGmQ4EOu2mYZGYQN0XBrSzlssF/VC', 'g', 'g', 2),
(6, 'user3@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Alice', 'Johnson', 2),
(8, 'user5@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Charlie', 'Brown', 2),
(9, 'user6@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'David', 'Jones', 2),
(10, 'user7@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Eve', 'Garcia', 2),
(11, 'user8@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Frank', 'Martinez', 2),
(12, 'user9@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Grace', 'Hernandez', 2),
(13, 'user10@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Hank', 'Lopez', 2),
(14, 'user11@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Ivy', 'Gonzalez', 2),
(15, 'user12@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Jack', 'Wilson', 2),
(16, 'user13@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Kathy', 'Anderson', 2),
(17, 'user14@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Leo', 'Thomas', 2),
(18, 'user15@example.com', '$2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq', 'Mia', 'Taylor', 2),
(19, 'o@o', '$2y$10$vZzgknOhg/U7NeXmtaURbeyAteMdWlbNjC4yEddkRU4L46e2UabGK', 't', 't', 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
