-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 24 nov. 2024 à 12:48
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE
= "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone
= "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--
CREATE DATABASE
IF NOT EXISTS `e-commerce` DEFAULT CHARACTER
SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;
USE `e-commerce`;

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

DROP TABLE IF EXISTS `adress`;
CREATE TABLE
IF NOT EXISTS `adress`
(
  `adress_id` int NOT NULL,
  `number_of_the_street` int DEFAULT NULL,
  `name_of_the_street` varchar
(50) CHARACTER
SET utf8mb4
COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar
(50) CHARACTER
SET utf8mb4
COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mailing_address` int NOT NULL,
  PRIMARY KEY
(`adress_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE
IF NOT EXISTS `cart`
(
  `cart_id` int NOT NULL,
  `id_command` int NOT NULL,
  `total price` int NOT NULL,
  PRIMARY KEY
(`cart_id`),
  KEY `fk_command`
(`id_command`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
CREATE TABLE
IF NOT EXISTS `cart_products`
(
  `cart_product_id` int NOT NULL,
  `id_cart` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY
(`cart_product_id`),
  KEY `fk_cart`
(`id_cart`),
  KEY `fk_product`
(`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE
IF NOT EXISTS `command`
(
  `command_id` int NOT NULL,
  `payment_with_card` varchar
(50) CHARACTER
SET utf8mb4
COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `delivery` varchar
(50) CHARACTER
SET utf8mb4
COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY
(`command_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE
IF NOT EXISTS `invoices`
(
  `invoices_id` int NOT NULL,
  `user_id` int NOT NULL,
  `command_id` int NOT NULL,
  PRIMARY KEY
(`invoices_id`),
  KEY `fk_user`
(`user_id`),
  KEY `fk_command`
(`command_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE
IF NOT EXISTS `product`
(
  `product_id` int NOT NULL,
  `name_of_product` varchar
(50) CHARACTER
SET utf8mb4
COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price_of_the_product` int NOT NULL,
  PRIMARY KEY
(`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE
IF NOT EXISTS `user` (
  `user_id` int NOT NULL,
  `name` varchar
(50) CHARACTER
SET utf8mb4
COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `age` int NOT NULL,
  `phone_number` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY
(`user_id`),
  KEY `fk_address`
(`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user`
  (`user_id`, `name
  `, `age`, `phone_number`, `address_id`) VALUES
(0, 'Mr. Ephraim Beier II', 38, 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
