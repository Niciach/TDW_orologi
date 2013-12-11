/*
 Navicat Premium Data Transfer

 Source Server         : DBMS vari
 Source Server Type    : MySQL
 Source Server Version : 50533
 Source Host           : localhost
 Source Database       : TDW

 Target Server Type    : MySQL
 Target Server Version : 50533
 File Encoding         : utf-8

 Date: 12/10/2013 11:21:15 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `Acquisti`
-- ----------------------------
DROP TABLE IF EXISTS `Acquisti`;
CREATE TABLE `Acquisti` (
  `fk_utente` int(11) NOT NULL,
  `fk_prodotto` int(11) NOT NULL,
  `quantita` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`fk_utente`,`fk_prodotto`),
  KEY `fk_prodotto` (`fk_prodotto`),
  CONSTRAINT `fk_acq_prod` FOREIGN KEY (`fk_prodotto`) REFERENCES `Prodotti` (`id_prodotto`),
  CONSTRAINT `fk_acq_ute` FOREIGN KEY (`fk_utente`) REFERENCES `Utenti` (`id_utente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Colori`
-- ----------------------------
DROP TABLE IF EXISTS `Colori`;
CREATE TABLE `Colori` (
  `id_colore` int(11) NOT NULL,
  PRIMARY KEY (`id_colore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Marche`
-- ----------------------------
DROP TABLE IF EXISTS `Marche`;
CREATE TABLE `Marche` (
  `nome_marca` varchar(20) NOT NULL,
  PRIMARY KEY (`nome_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Newsletter`
-- ----------------------------
DROP TABLE IF EXISTS `Newsletter`;
CREATE TABLE `Newsletter` (
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Nuovi_arrivi`
-- ----------------------------
DROP TABLE IF EXISTS `Nuovi_arrivi`;
CREATE TABLE `Nuovi_arrivi` (
  `id_prodotto` int(11) NOT NULL DEFAULT '0',
  `quantita` int(10) NOT NULL,
  `descrizione` varchar(200) NOT NULL,
  `prezzo` decimal(10,3) NOT NULL,
  `fk_marche` varchar(255) NOT NULL,
  `fk_colore` int(11) NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `foto2` varchar(255) NOT NULL,
  `foto3` varchar(255) NOT NULL,
  `data_inserimento` date NOT NULL,
  PRIMARY KEY (`id_prodotto`),
  KEY `fk_marche` (`fk_marche`),
  KEY `fk_colore` (`fk_colore`),
  CONSTRAINT `fk_nuov_mar` FOREIGN KEY (`fk_marche`) REFERENCES `Marche` (`nome_marca`),
  CONSTRAINT `fk_nuov_col` FOREIGN KEY (`fk_colore`) REFERENCES `Colori` (`id_colore`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Prodotti`
-- ----------------------------
DROP TABLE IF EXISTS `Prodotti`;
CREATE TABLE `Prodotti` (
  `id_prodotto` int(11) NOT NULL AUTO_INCREMENT,
  `quantita` int(10) NOT NULL,
  `descrizione` varchar(200) NOT NULL,
  `prezzo` decimal(10,3) NOT NULL,
  `fk_marche` varchar(255) NOT NULL,
  `fk_colore` int(11) NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `foto2` varchar(255) NOT NULL,
  `foto3` varchar(255) NOT NULL,
  PRIMARY KEY (`id_prodotto`),
  KEY `fk_colore` (`fk_colore`),
  KEY `fk_marche` (`fk_marche`),
  CONSTRAINT `fk_prod_col` FOREIGN KEY (`fk_colore`) REFERENCES `Colori` (`id_colore`),
  CONSTRAINT `fk_prod_marc` FOREIGN KEY (`fk_marche`) REFERENCES `Marche` (`nome_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Provincie`
-- ----------------------------
DROP TABLE IF EXISTS `Provincie`;
CREATE TABLE `Provincie` (
  `nome_provincia` varchar(20) NOT NULL,
  `fk_regione` varchar(255) NOT NULL,
  PRIMARY KEY (`nome_provincia`),
  KEY `fk_regione` (`fk_regione`),
  CONSTRAINT `fk_prov_reg` FOREIGN KEY (`fk_regione`) REFERENCES `Regioni` (`nome_regione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Regioni`
-- ----------------------------
DROP TABLE IF EXISTS `Regioni`;
CREATE TABLE `Regioni` (
  `nome_regione` varchar(20) NOT NULL,
  PRIMARY KEY (`nome_regione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Saldi`
-- ----------------------------
DROP TABLE IF EXISTS `Saldi`;
CREATE TABLE `Saldi` (
  `fk_prodotto` int(11) NOT NULL,
  `prezzo_scontato` decimal(10,3) NOT NULL,
  `percentuale` int(11) NOT NULL,
  PRIMARY KEY (`fk_prodotto`),
  CONSTRAINT `fk_saldi_prod` FOREIGN KEY (`fk_prodotto`) REFERENCES `Prodotti` (`id_prodotto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Slideshow`
-- ----------------------------
DROP TABLE IF EXISTS `Slideshow`;
CREATE TABLE `Slideshow` (
  `id_slide` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_slide`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `TabLink`
-- ----------------------------
DROP TABLE IF EXISTS `TabLink`;
CREATE TABLE `TabLink` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `TabText`
-- ----------------------------
DROP TABLE IF EXISTS `TabText`;
CREATE TABLE `TabText` (
  `id` int(5) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Utenti`
-- ----------------------------
DROP TABLE IF EXISTS `Utenti`;
CREATE TABLE `Utenti` (
  `id_utente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `data_nascita` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` int(20) NOT NULL,
  `indirizzo1` varchar(30) NOT NULL,
  `indirizzo2` varchar(30) NOT NULL,
  `cap` int(10) NOT NULL,
  `citta` varchar(30) NOT NULL,
  `paese` varchar(20) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `fk_regione` varchar(255) NOT NULL,
  `fk_provincia` varchar(255) NOT NULL,
  PRIMARY KEY (`id_utente`),
  KEY `fk_regione` (`fk_regione`),
  KEY `fk_provincia` (`fk_provincia`),
  CONSTRAINT `fk_ute_prov` FOREIGN KEY (`fk_provincia`) REFERENCES `Provincie` (`nome_provincia`),
  CONSTRAINT `fk_ute_reg` FOREIGN KEY (`fk_regione`) REFERENCES `Regioni` (`nome_regione`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `Wishlist`
-- ----------------------------
DROP TABLE IF EXISTS `Wishlist`;
CREATE TABLE `Wishlist` (
  `fk_utente` int(11) NOT NULL,
  `fk_prodotto` int(11) NOT NULL,
  PRIMARY KEY (`fk_utente`,`fk_prodotto`),
  KEY `fk_prodotto` (`fk_prodotto`),
  CONSTRAINT `fk_wish_ute` FOREIGN KEY (`fk_utente`) REFERENCES `Utenti` (`id_utente`),
  CONSTRAINT `fk_wish_prod` FOREIGN KEY (`fk_prodotto`) REFERENCES `Prodotti` (`id_prodotto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
