-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: gs-test
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `gs-test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gs-test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gs-test`;

--
-- Table structure for table `achat_matieres`
--

DROP TABLE IF EXISTS `achat_matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achat_matieres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` float NOT NULL,
  `prixUnitaire` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `MatiereId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_achat_matieres_matieres` (`MatiereId`),
  CONSTRAINT `FK_achat_matieres_matieres` FOREIGN KEY (`MatiereId`) REFERENCES `matieres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achat_matieres`
--

LOCK TABLES `achat_matieres` WRITE;
/*!40000 ALTER TABLE `achat_matieres` DISABLE KEYS */;
INSERT INTO `achat_matieres` VALUES (1,10.5,20,'2022-04-03 23:03:57','2022-04-03 23:03:58',NULL,1),(2,20,25,'2022-04-03 23:35:36','2022-04-03 23:35:37',NULL,1),(3,5,30,'2022-04-04 16:09:49','2022-04-04 16:09:49',NULL,2),(4,10,45,'2022-04-04 21:33:35','2022-04-04 21:33:35',NULL,1),(5,500,50,'2022-04-12 00:06:01','2022-04-12 00:06:01',NULL,1),(6,600,25,'2022-04-12 00:06:01','2022-04-12 00:06:01',NULL,2),(7,100,50,'2022-04-13 09:49:28','2022-04-13 09:49:28',NULL,3),(8,52,10000,'2022-04-13 09:49:44','2022-04-13 09:49:44',NULL,3);
/*!40000 ALTER TABLE `achat_matieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ClientId` int(11) NOT NULL,
  `WilayaId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ClientId` (`ClientId`),
  KEY `WilayaId` (`WilayaId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adresses_ibfk_2` FOREIGN KEY (`WilayaId`) REFERENCES `wilayas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adresses_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorisations`
--

DROP TABLE IF EXISTS `autorisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorisations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorisations`
--

LOCK TABLES `autorisations` WRITE;
/*!40000 ALTER TABLE `autorisations` DISABLE KEYS */;
INSERT INTO `autorisations` VALUES (1,'add-client','ajouter un client','gestion des clients','2022-03-22 18:22:45','2022-03-22 18:22:45'),(2,'read-client','consulter une fiche client','gestion des clients','2022-03-22 18:22:45','2022-03-22 18:22:45'),(4,'delete-client','supprimer un client','gestion des clients','2022-03-22 18:22:45','2022-03-22 18:22:45'),(5,'update-client','modifier un client','gestion des clients','2022-03-24 10:44:02','2022-03-24 10:44:03'),(8,'add-produit','ajouter un produit','gestion des produits','2022-03-22 18:22:45','2022-03-22 18:22:45'),(9,'read-produit','consulter un produit','gestion des produits','2022-03-22 18:22:45','2022-03-22 18:22:45'),(10,'update-produit','modifier un produit','gestion des produits','2022-03-22 18:22:45','2022-03-22 18:22:45'),(11,'delete-produit','supprimer un produit','gestion des produits','2022-03-22 18:22:45','2022-03-22 18:22:45'),(15,'add-utilisateur','ajouter un utilisateur','gestion des utilisateurs','2022-03-22 18:22:45','2022-03-22 18:22:45'),(16,'read-utilisateur','consulter un utilisateur','gestion des utilisateurs','2022-03-22 18:22:45','2022-03-22 18:22:45'),(17,'update-utilisateur','modifier un utilisateur','gestion des utilisateurs','2022-03-22 18:22:45','2022-03-22 18:22:45'),(18,'delete-utilisateur','supprimer un utilisateur','gestion des utilisateurs','2022-03-22 18:22:45','2022-03-22 18:22:45'),(22,'add-vente','ajouter une vente','gestion des ventes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(23,'read-vente','consulter une ventes','gestion des ventes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(24,'update-vente','modifier une vente','gestion des ventes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(25,'delete-vente','supprimer une vente','gestion des ventes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(29,'add-formule','ajouter une formule','gestion des formules','2022-03-22 18:22:45','2022-03-22 18:22:45'),(30,'read-formule','consulter une formule','gestion des formules','2022-03-22 18:22:45','2022-03-22 18:22:45'),(31,'update-formule','modifier une formule','gestion des formules','2022-03-22 18:22:45','2022-03-22 18:22:45'),(32,'delete-formule','supprimer une formule','gestion des formules','2022-03-22 18:22:45','2022-03-22 18:22:45'),(36,'add-production','ajouter une production','gestion des productions','2022-03-22 18:22:45','2022-03-22 18:22:45'),(37,'read-production','consulter une production','gestion des productions','2022-03-22 18:22:45','2022-03-22 18:22:45'),(38,'update-production','modifier une production','gestion des productions','2022-03-22 18:22:45','2022-03-22 18:22:45'),(39,'delete-production','supprimer une production','gestion des productions','2022-03-22 18:22:45','2022-03-22 18:22:45'),(43,'add-commande','ajouter une commande','gestion des commandes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(44,'read-commande','voir une commande','gestion des commandes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(45,'update-commande','modifier une commande','gestion des commandes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(46,'delete-commande','supprimer une commande','gestion des commandes','2022-03-22 18:22:45','2022-03-22 18:22:45'),(47,'read-matiere','consulter les matieres','gestion des matieres','2022-04-12 13:54:53','2022-04-12 13:54:54'),(48,'add-matiere','ajouter une matiere','gestion des matieres','2022-04-12 13:55:44','2022-04-12 13:55:45'),(49,'update-matiere','modifier une matiere','gestion des matieres','2022-04-12 13:57:43','2022-04-12 13:57:43'),(50,'delete-matiere','archiver une matiere','gestion des matieres','2022-04-12 13:58:17','2022-04-12 13:58:17'),(52,'read-contactclient','consulter les message client','gestion contact client','2022-04-12 14:03:26','2022-04-12 14:03:27'),(53,'update-contactclient','modifier les messages clients','gestion contact client','2022-04-12 23:27:33','2022-04-12 23:27:34'),(54,'add-contactclient','ajouter un message','gestion contact client','2022-04-12 23:30:58','2022-04-12 23:30:58'),(55,'delete-contactclient','archiver un message','gestion contact client','2022-04-12 23:31:22','2022-04-12 23:31:22');
/*!40000 ALTER TABLE `autorisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorisations_fonctions`
--

DROP TABLE IF EXISTS `autorisations_fonctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorisations_fonctions` (
  `type` enum('own','all') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AutorisationId` int(11) NOT NULL,
  `ProfileId` int(11) NOT NULL,
  PRIMARY KEY (`AutorisationId`,`ProfileId`),
  KEY `ProfileId` (`ProfileId`),
  CONSTRAINT `autorisations_fonctions_ibfk_1` FOREIGN KEY (`AutorisationId`) REFERENCES `autorisations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `autorisations_fonctions_ibfk_2` FOREIGN KEY (`ProfileId`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorisations_fonctions`
--

LOCK TABLES `autorisations_fonctions` WRITE;
/*!40000 ALTER TABLE `autorisations_fonctions` DISABLE KEYS */;
INSERT INTO `autorisations_fonctions` VALUES ('all','2022-04-12 13:08:36','2022-04-12 13:08:36',1,1),('all','2022-04-12 21:49:13','2022-04-12 21:49:13',2,1),('all','2022-03-24 12:07:45','2022-03-24 12:07:45',2,2),('all','2022-04-12 21:28:30','2022-04-12 21:28:30',4,1),('all','2022-04-12 21:28:30','2022-04-12 21:28:30',5,1),('all','2022-04-12 13:32:27','2022-04-12 13:32:27',8,1),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',9,1),('all','2022-03-24 12:07:45','2022-03-24 12:07:45',9,2),('all','2022-04-12 22:17:50','2022-04-12 22:17:50',10,1),('all','2022-04-12 22:17:37','2022-04-12 22:17:37',11,1),('all','2022-04-12 13:25:38','2022-04-12 13:25:38',15,1),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',16,1),('all','2022-04-12 21:46:37','2022-04-12 21:46:37',17,1),('all','2022-04-12 21:46:17','2022-04-12 21:46:17',18,1),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',22,1),('all','2022-03-24 12:07:45','2022-03-24 12:07:45',22,2),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',23,1),('own','2022-03-24 12:07:45','2022-03-24 12:07:45',23,2),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',24,1),('own','2022-03-24 12:07:45','2022-03-24 12:52:34',24,2),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',25,1),('own','2022-03-24 12:07:45','2022-03-24 12:52:34',25,2),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',29,1),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',30,1),('all','2022-04-12 22:17:13','2022-04-12 22:17:13',31,1),('all','2022-04-12 22:16:55','2022-04-12 22:16:55',32,1),('all','2022-04-12 21:13:46','2022-04-12 21:13:46',36,1),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',37,1),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',38,1),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',39,1),('all','2022-04-12 14:51:49','2022-04-12 14:51:49',43,1),('all','2022-03-24 12:07:45','2022-03-24 12:07:45',43,2),('all','2022-03-24 12:47:31','2022-03-24 12:47:31',44,1),('own','2022-03-24 12:07:45','2022-03-24 12:52:34',44,2),('all','2022-04-12 22:25:16','2022-04-12 22:25:16',45,1),('own','2022-03-24 12:07:45','2022-03-24 12:52:34',45,2),('all','2022-04-12 22:25:16','2022-04-12 22:25:16',46,1),('own','2022-03-24 12:07:45','2022-03-24 12:52:34',46,2),('all','2022-04-12 12:58:41','2022-04-12 12:58:41',47,1),('all','2022-04-12 13:28:07','2022-04-12 13:28:07',48,1),('all','2022-04-12 22:08:56','2022-04-12 22:08:56',49,1),('all','2022-04-12 22:08:56','2022-04-12 22:08:56',50,1),('all','2022-04-12 13:03:50','2022-04-12 13:03:50',52,1),('all','2022-04-13 02:26:36','2022-04-13 02:26:36',53,1);
/*!40000 ALTER TABLE `autorisations_fonctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raisonSociale` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `numeroSecondaire` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `TypeClientId` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `raisonSociale` (`raisonSociale`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `numeroSecondaire` (`numeroSecondaire`),
  KEY `UserId` (`UserId`),
  KEY `TypeClientId` (`TypeClientId`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`TypeClientId`) REFERENCES `typeclients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Joséphine Charpen','0195403873','0729090289','2022-03-13 11:07:42','2022-03-29 08:12:09','2022-03-29 08:12:43',88,1,''),(2,'Dorine Vidal','0762434402','+33 780062874','2022-03-13 11:07:42','2022-04-13 02:21:47','2022-04-13 09:39:21',11,1,'admin'),(3,'Gwenaëlle Joly','0518097623','+33 207005284','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-04-13 09:39:35',61,1,''),(4,'Eugène Garnier','0730646589','0222452626','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-04-13 09:39:48',1,1,''),(5,'Acacie ','+33 355224976','0678232426','2022-03-13 11:07:42','2022-04-13 09:41:36',NULL,55,1,''),(6,'Anatole Collet','0356176249','+33 553327500','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-04-13 09:40:45',74,1,''),(7,'Barbe Dumas','+33 132137738','0215725752','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,100,1,''),(8,'Christophe Lefebvre','0428844496','+33 294339099','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,63,1,''),(9,'Barthélemy Morel','+33 414260776','0357179804','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,12,1,''),(10,'Antigone Barre','+33 102328174','0545104032','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,3,1,''),(11,'Dorian Joly','+33 580135691','+33 746989036','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,44,1,''),(12,'Théophile Jean','+33 609842961','+33 319288660','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,38,1,''),(13,'Silvère Caron','+33 220756558','0599259734','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,73,1,''),(14,'Adrastée Pons','0354557535','+33 221532212','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,67,1,''),(15,'Amande Garcia','+33 345759996','+33 680764107','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,30,1,''),(16,'Angèle Perez','0259499796','+33 548465826','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,46,1,''),(17,'Mylène Caron','+33 161411417','0228636089','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,76,1,''),(18,'Athina Masson','+33 555659398','+33 402336174','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,89,1,''),(19,'Roseline Simon','+33 259800216','0364679208','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,54,1,''),(20,'Évariste Mercier','0348444640','+33 506830394','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,35,1,''),(21,'Ernest Garcia','+33 562646258','+33 391225347','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,65,1,''),(22,'Fantine Rey','0480740366','+33 104861320','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,12,1,''),(23,'Fulcran Rey','0638304753','+33 744683153','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,28,1,''),(24,'Marius Francois','0537849035','+33 574169671','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,57,1,''),(25,'Juste Le roux','+33 475356021','+33 287136154','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,60,1,''),(26,'Xénophon Francois','0291164156','+33 507480868','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,''),(27,'Salomon Barbier','+33 402805999','0746054177','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,17,1,''),(28,'Jocelyn Nguyen','0740565515','0586931092','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,34,1,''),(29,'Gui Blanc','+33 326487524','+33 665012643','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,94,1,''),(30,'Alphée Robin','0654714003','+33 777508429','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,30,1,''),(31,'Alix Bourgeois','+33 620744061','0744120746','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,51,1,''),(32,'Esther Vincent','+33 458710152','+33 177055039','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,8,1,''),(33,'Vincent Da silva','0223448852','0544048352','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,40,1,''),(34,'Isabelle Picard','+33 278917853','0371262103','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,94,1,''),(35,'Armin Riviere','0484143252','+33 567453101','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,93,1,''),(36,'Pétronille Clement','0733217979','+33 590678329','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,45,1,''),(37,'Marcel Laurent','+33 522422972','+33 296586061','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,100,1,''),(38,'Matthieu Bonnet','0233855424','0135165100','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,61,1,''),(39,'Astarté Faure','+33 271647662','0535485385','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,31,1,''),(40,'Argine Fournier','0110783316','+33 754504491','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,66,1,''),(41,'Alcine Adam','0227062939','+33 278329570','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,14,1,''),(42,'Parfait Adam','0395177954','+33 623602975','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,40,1,''),(43,'Roselin Menard','0306405258','+33 177503742','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,19,1,''),(44,'Aliénor Menard','0230241597','+33 163051117','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,86,1,''),(45,'Archange Charles','0650112185','0338323090','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,63,1,''),(46,'Inès Rodriguez','+33 538591541','+33 750058410','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,18,1,''),(47,'Sébastien Renaud','0346660269','+33 183654936','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,79,1,''),(48,'Elsa Brun','+33 449428911','+33 534142567','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,53,1,''),(49,'Recusandae Nihil in','+1 (869) 687-1422','+1 (691) 811-1427','2022-03-28 17:17:31','2022-03-28 17:17:31',NULL,1,1,''),(50,'Dolore dolores fugia','+1 (717) 748-7709','+1 (177) 792-7289','2022-03-28 17:25:17','2022-03-28 17:25:17','2022-03-29 08:04:21',1,2,''),(51,'Voluptates in in quo','+1 (266) 975-5933','+1 (571) 977-1405','2022-03-29 08:03:21','2022-03-29 08:03:21',NULL,1,2,'');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etat` enum('en negiciation','valide admin','valide client','vendu') NOT NULL DEFAULT 'en negiciation',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ClientId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ClientId` (`ClientId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` VALUES (1,'en negiciation','2022-03-13 11:07:42','2022-04-03 15:18:16',NULL,24,1),(101,'en negiciation','2022-03-29 11:58:05','2022-04-03 12:26:09',NULL,14,1),(102,'en negiciation','2022-03-29 12:00:21','2022-03-29 12:00:21','2022-04-03 15:10:34',31,1),(103,'en negiciation','2022-03-29 12:01:24','2022-03-29 12:01:24','2022-04-03 15:08:49',14,1),(104,'en negiciation','2022-03-29 12:02:07','2022-03-29 12:02:07','2022-04-03 15:10:28',14,1),(105,'en negiciation','2022-03-29 12:02:48','2022-04-03 21:01:50',NULL,14,1),(106,'en negiciation','2022-03-29 12:04:02','2022-04-02 21:00:15','2022-04-02 21:00:15',5,1),(107,'en negiciation','2022-03-29 12:04:57','2022-04-02 21:01:48','2022-04-02 21:01:48',5,1),(108,'en negiciation','2022-03-29 12:04:58','2022-04-03 12:04:26',NULL,5,1),(111,'en negiciation','2022-03-29 14:02:48','2022-04-03 12:26:03',NULL,5,1),(116,'en negiciation','2022-04-12 14:44:59','2022-04-12 14:44:59',NULL,41,1),(117,'en negiciation','2022-04-12 14:45:27','2022-04-12 14:45:27',NULL,31,1),(118,'en negiciation','2022-04-13 09:45:03','2022-04-13 09:45:03',NULL,14,4);
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consomatieres`
--

DROP TABLE IF EXISTS `consomatieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consomatieres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  `raison` enum('achat','production') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProductionId` int(11) DEFAULT NULL,
  `MatiereId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductionId` (`ProductionId`),
  KEY `MatiereId` (`MatiereId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `consomatieres_ibfk_1` FOREIGN KEY (`ProductionId`) REFERENCES `productions` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `consomatieres_ibfk_2` FOREIGN KEY (`MatiereId`) REFERENCES `matieres` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `consomatieres_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consomatieres`
--

LOCK TABLES `consomatieres` WRITE;
/*!40000 ALTER TABLE `consomatieres` DISABLE KEYS */;
INSERT INTO `consomatieres` VALUES (12,160,'2022-04-11 22:33:35','production','2022-04-11 22:33:35','2022-04-11 22:33:35',1,1,1),(13,64,'2022-04-11 22:33:35','production','2022-04-11 22:33:35','2022-04-11 22:33:35',1,2,1);
/*!40000 ALTER TABLE `consomatieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couleurs`
--

DROP TABLE IF EXISTS `couleurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couleurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couleurs`
--

LOCK TABLES `couleurs` WRITE;
/*!40000 ALTER TABLE `couleurs` DISABLE KEYS */;
INSERT INTO `couleurs` VALUES (1,'blanc','#ffffff','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL);
/*!40000 ALTER TABLE `couleurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'Id ut aut hic dicta ','Repellendus Id dolo','bujezifytu@mailinator.com','Dolor nesciunt faci',0,'2022-04-12 17:23:32','2022-04-12 17:32:20',NULL),(2,'Quam quam maxime ill','Sit maiores soluta o','bozam@mailinator.com','In odio consectetur',0,'2022-04-13 04:05:33','2022-04-13 04:05:33',NULL),(3,'Obcaecati debitis mo','Saepe sed sapiente m','vaqo@mailinator.com','Expedita quasi nostr',0,'2022-04-13 04:09:04','2022-04-13 04:09:04',NULL);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formules`
--

DROP TABLE IF EXISTS `formules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formules` (
  `quantite` float unsigned NOT NULL,
  `MatiereId` int(11) NOT NULL,
  `ProduitId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`MatiereId`,`ProduitId`),
  UNIQUE KEY `Formules_ProduitId_MatiereId_unique` (`MatiereId`,`ProduitId`),
  KEY `ProduitId` (`ProduitId`),
  CONSTRAINT `formules_ibfk_1` FOREIGN KEY (`MatiereId`) REFERENCES `matieres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formules_ibfk_2` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formules`
--

LOCK TABLES `formules` WRITE;
/*!40000 ALTER TABLE `formules` DISABLE KEYS */;
INSERT INTO `formules` VALUES (5,1,101,'2022-04-08 00:14:14','2022-04-08 00:14:14'),(2,2,5,'2022-04-07 21:46:11','2022-04-07 21:46:11'),(2,2,101,'2022-04-08 00:14:19','2022-04-08 00:14:19'),(5,3,101,'2022-04-13 09:52:33','2022-04-13 09:52:33');
/*!40000 ALTER TABLE `formules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matieres`
--

DROP TABLE IF EXISTS `matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matieres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matieres`
--

LOCK TABLES `matieres` WRITE;
/*!40000 ALTER TABLE `matieres` DISABLE KEYS */;
INSERT INTO `matieres` VALUES (1,'essenc','2022-04-03 23:03:41','2022-04-13 09:51:06',NULL),(2,'salu','2022-04-04 14:43:44','2022-04-04 21:33:00','2022-04-13 09:51:10'),(3,'matieretest','2022-04-13 09:49:09','2022-04-13 09:49:09',NULL);
/*!40000 ALTER TABLE `matieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements`
--

DROP TABLE IF EXISTS `payements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `payements_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements`
--

LOCK TABLES `payements` WRITE;
/*!40000 ALTER TABLE `payements` DISABLE KEYS */;
/*!40000 ALTER TABLE `payements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements_commande`
--

DROP TABLE IF EXISTS `payements_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payements_commande` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PayementId` int(11) NOT NULL,
  `CommandeId` int(11) NOT NULL,
  PRIMARY KEY (`PayementId`,`CommandeId`),
  KEY `CommandeId` (`CommandeId`),
  CONSTRAINT `payements_commande_ibfk_1` FOREIGN KEY (`PayementId`) REFERENCES `payements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payements_commande_ibfk_2` FOREIGN KEY (`CommandeId`) REFERENCES `commandes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements_commande`
--

LOCK TABLES `payements_commande` WRITE;
/*!40000 ALTER TABLE `payements_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `payements_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements_vente`
--

DROP TABLE IF EXISTS `payements_vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payements_vente` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PayementId` int(11) NOT NULL,
  `VenteId` int(11) NOT NULL,
  PRIMARY KEY (`PayementId`,`VenteId`),
  KEY `VenteId` (`VenteId`),
  CONSTRAINT `payements_vente_ibfk_1` FOREIGN KEY (`PayementId`) REFERENCES `payements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payements_vente_ibfk_2` FOREIGN KEY (`VenteId`) REFERENCES `ventes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payements_vente`
--

LOCK TABLES `payements_vente` WRITE;
/*!40000 ALTER TABLE `payements_vente` DISABLE KEYS */;
/*!40000 ALTER TABLE `payements_vente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prixproduits`
--

DROP TABLE IF EXISTS `prixproduits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prixproduits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prix` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProduitId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ProduitId` (`ProduitId`),
  CONSTRAINT `prixproduits_ibfk_1` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prixproduits`
--

LOCK TABLES `prixproduits` WRITE;
/*!40000 ALTER TABLE `prixproduits` DISABLE KEYS */;
INSERT INTO `prixproduits` VALUES (1,20,'2022-04-12 00:05:16','2022-04-12 00:05:16',101),(2,50,'2022-04-12 00:05:49','2022-04-12 00:05:50',101),(3,47,'2022-04-12 21:24:35','2022-04-12 21:24:35',102),(4,450,'2022-04-13 00:13:52','2022-04-13 00:13:52',102),(5,45,'2022-04-13 09:51:57','2022-04-13 09:51:57',102);
/*!40000 ALTER TABLE `prixproduits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productions`
--

DROP TABLE IF EXISTS `productions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `lot` varchar(255) NOT NULL,
  `quantite` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProduitId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lot` (`lot`),
  KEY `ProduitId` (`ProduitId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `productions_ibfk_1` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productions_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productions`
--

LOCK TABLES `productions` WRITE;
/*!40000 ALTER TABLE `productions` DISABLE KEYS */;
INSERT INTO `productions` VALUES (1,'2022-04-11 00:00:00','50',32,'2022-04-11 22:33:35','2022-04-11 22:33:35',101,1);
/*!40000 ALTER TABLE `productions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `contenance` int(10) unsigned NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `TypeProduitId` int(11) NOT NULL,
  `CouleurId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`),
  KEY `TypeProduitId` (`TypeProduitId`),
  KEY `CouleurId` (`CouleurId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`TypeProduitId`) REFERENCES `typeproduits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`CouleurId`) REFERENCES `couleurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (1,'Practical Cotton Gloves',10,0,'Est mollitia error non quaerat officiis qui qui quia ut. Earum impedit quo facere. Saepe quidem sapiente quae. Velit asperiores distinctio.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(2,'Refined Steel Table',6,0,'<p>Sit rerum molestias. Rem veniam incidunt. Est voluptate sit aut quam totam.</p>','2022-03-13 11:07:42','2022-03-28 10:54:13','2022-03-28 11:13:31',1,1,NULL,'default.jpeg'),(3,'Fantastic Steel Chips',15,1,'Sunt illo sapiente impedit aut. Nemo et rem pariatur ea eum quis cupiditate earum rerum. Occaecati dolorem labore totam non quos voluptates. Possimus in quam asperiores labore. Qui totam accusamus maxime corrupti distinctio.','2022-03-13 11:07:42','2022-03-13 15:31:04',NULL,1,1,NULL,'default.jpeg'),(4,'Practical Concrete Chips',15,0,'Et quae temporibus et. Non officia distinctio sunt nihil non quaerat harum nisi. Perferendis perferendis nam cum quam. Laborum omnis perspiciatis. Ducimus aut qui omnis.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(5,'Gorgeous Plastic Bacon',5,1,'Adipisci et quam qui animi vitae. Aut suscipit accusantium. Non facilis deleniti soluta quam enim et odio ut. Quo consequatur rerum est sit fugit nobis. Suscipit voluptas voluptatem aut. Deserunt dolorum neque animi amet est est praesentium.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(6,'Tasty Wooden Gloves',10,1,'Non dolores molestiae qui aut velit. A velit qui sit earum et mollitia quia voluptatibus. Consectetur sit id soluta totam. Animi nihil vero veritatis voluptate voluptatum necessitatibus voluptatem. Earum inventore ut est. Consequatur vero eligendi sed.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(7,'Generic Cotton Pizza',15,0,'Temporibus fuga sit et sit saepe quia officiis enim molestias. Non ea a esse nam saepe quo iure laborum consequatur. Dolorem dolores officia impedit temporibus deserunt quidem iusto saepe. Recusandae aspernatur sit et assumenda voluptates ut voluptas. Blanditiis omnis tenetur ab veritatis.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(8,'Generic Fresh Shoes',10,0,'Quae delectus exercitationem debitis ea illo impedit veniam. Maxime tempora ad. Omnis corporis sed aut fugiat. Ea vel ut quibusdam cum ullam voluptatem sit sed.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(9,'Handcrafted Cotton Gloves',15,0,'Quia rerum natus tempore maxime non. Et cumque neque natus id et. Deleniti possimus optio quis quis laborum.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(10,'Generic Wooden Table',15,1,'Saepe aliquid maiores occaecati quo sed possimus quaerat optio et. Et quidem ipsam ut qui dolorem quo dolorem necessitatibus repellat. Placeat ratione amet eos.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(11,'Practical Granite Sausages',5,0,'Voluptatibus qui aliquid et quasi consequatur quo totam. Exercitationem rerum quam tenetur in nesciunt saepe. Id voluptatem eveniet eligendi enim temporibus minima. Facilis dicta dolores aut possimus nisi neque quo asperiores perspiciatis. Excepturi cumque qui animi.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(12,'Fantastic Granite Pants',5,1,'Recusandae provident quasi. Eos repudiandae ea totam sunt laborum. Consequuntur autem veniam quia est quod sed quia eos harum. Eius nobis vitae ipsa.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(13,'Fantastic Plastic Pants',15,1,'Sit rem voluptatem deserunt ratione. Praesentium vitae unde sint deserunt deleniti et. Assumenda voluptatibus soluta. Ducimus ipsam dolores aut quia distinctio sed. Amet eos in pariatur perspiciatis eum sit sapiente.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(14,'Fantastic Wooden Pants',10,1,'Quo eius quia autem. Magnam fugiat vel. Qui voluptatibus sit aperiam tenetur voluptates minus eius. Sint dolore et quibusdam qui et. Cum voluptatem ut ad odio corrupti. Pariatur quisquam omnis dolores.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(15,'Handmade Steel Gloves',5,0,'Sequi qui libero nam sit nemo tempora quibusdam qui veniam. Aliquam illum deleniti odio ea quisquam. Et doloremque hic harum. Nesciunt est quibusdam voluptatum autem. Provident porro sapiente maiores id. Sit eius quia delectus tempora suscipit quam quae.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(16,'Licensed Metal Bike',5,1,'Ut praesentium neque placeat praesentium omnis aut. Quia libero atque beatae sed ut molestiae. Alias consequatur impedit est ad reprehenderit qui dolor error. Et minima ea dolore autem natus soluta commodi. Quia aut alias. Laborum similique asperiores facere suscipit deserunt dolor architecto.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(17,'Handmade Fresh Gloves',5,0,'Nesciunt consequuntur atque ullam quibusdam nobis qui nihil quos a. Placeat aut perferendis nihil consequatur deserunt dicta. Optio et nihil sint qui reiciendis magnam debitis. Voluptatem molestiae et. Commodi eaque possimus. Amet laudantium consequatur et in sequi.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(18,'Generic Concrete Keyboard',5,0,'Unde autem qui iste beatae adipisci alias est magnam. Iure et temporibus voluptate dolorem aut sunt repellendus molestiae. Illum nostrum blanditiis reprehenderit molestiae accusantium aut voluptatem. Fugiat quia quasi iure consequatur error est. Ad expedita quos nobis eos culpa omnis a id repellat.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(19,'Small Rubber Pizza',5,1,'Eveniet ut eos dolor saepe et sit. Cum harum quis reiciendis porro. Praesentium explicabo ex excepturi illo.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(20,'Licensed Rubber Shirt',15,1,'Suscipit error veritatis asperiores alias odit in. Velit voluptatibus assumenda nam. Et vero fuga earum quaerat iusto maiores. Perspiciatis fuga eos.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(21,'Handcrafted Plastic Gloves',10,1,'Nihil ut quibusdam assumenda in odit soluta. Dicta vel placeat. Beatae in maxime consequatur.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(22,'Fantastic Steel Keyboard',15,1,'Delectus ut id dolor. Quis quisquam sequi alias sed ducimus. Beatae in doloribus ut tenetur reiciendis at. Doloremque perspiciatis rerum odio. Placeat enim asperiores. Saepe facere sed.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(23,'Rustic Concrete Salad',5,1,'Eos expedita omnis omnis in natus alias deleniti dolores. Blanditiis iure provident magni. Veniam distinctio nulla aliquam laboriosam quos.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(24,'Rustic Rubber Chicken',10,1,'Reiciendis debitis et veritatis consequatur velit. Qui ab voluptatem iusto voluptatem. Sapiente ullam dolorum eaque rem necessitatibus. Et inventore eos quasi animi et velit.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(25,'Licensed Fresh Tuna',5,0,'Ea et voluptatibus aut maxime quasi porro rerum facilis. Nam et excepturi fugit neque minus ut rerum voluptatem neque. Esse est est voluptatem vel aut maiores.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(26,'Ergonomic Rubber Bacon',15,1,'Veritatis et non qui eos voluptatem. Qui laudantium et aspernatur nesciunt. Quod reiciendis quod dolor qui. Natus odio voluptates non eos. Eum numquam consequatur quisquam. Id vel at vitae omnis illum consequuntur soluta occaecati nam.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(27,'Unbranded Rubber Pants',5,1,'Unde facilis veritatis maiores quo quibusdam qui omnis. Molestiae explicabo eaque harum ut. Sit voluptatem esse libero quam aliquam ipsam asperiores. Velit est accusamus voluptatem et doloremque vitae autem. Quia qui molestias ut amet illum consequatur consequatur.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(28,'Gorgeous Concrete Fish',10,1,'Veniam quasi optio et velit inventore enim dolores. Est et vel quidem unde quia saepe excepturi nam. Vel commodi enim minima veniam reprehenderit. Tempora placeat quisquam aut non ab vero aspernatur dolorem modi.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(29,'Unbranded Metal Mouse',10,1,'Pariatur temporibus alias aut ducimus assumenda facilis. Qui aspernatur illum voluptatibus et animi est. Ad eos optio. Voluptatem et iste velit dolores et unde rerum quo mollitia. Ab modi accusamus a.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(30,'Generic Concrete Salad',10,0,'Impedit neque est omnis qui velit est porro accusamus sed. Id quam optio repellat. Nulla quidem quibusdam quas.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(31,'Practical Steel Sausages',5,0,'Sed corrupti velit et et sint nesciunt. Aut pariatur numquam qui omnis earum sint consequatur. Esse autem iste aut modi. Delectus vitae nostrum. In sint aspernatur alias est temporibus suscipit architecto consequuntur quo. Ab vel explicabo est voluptate maxime sed eos nemo.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(32,'Fantastic Fresh Chair',10,0,'Quisquam velit quos ducimus aut adipisci voluptas excepturi. Eius nobis voluptatibus hic harum. Consequatur quo laboriosam totam asperiores id placeat porro tempore. Sed est quidem adipisci nam aperiam deleniti qui veniam repellendus. Dicta quibusdam debitis voluptas minus eos voluptatum nam accusantium quia. Sequi illum pariatur aut fugiat voluptate qui.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(33,'Awesome Rubber Towels',10,0,'Ducimus et excepturi et quisquam. Vel sunt optio velit. Et quam sed rerum facilis voluptas ab. In enim facere aut eligendi non ut ut reiciendis mollitia.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(34,'Small Metal Cheese',5,0,'Nihil placeat dolorem et et. Nulla id modi accusamus aut autem velit. Mollitia minima aliquam aut tempora praesentium. Ipsa libero consequatur doloremque necessitatibus cumque necessitatibus.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(35,'Fantastic Cotton Keyboard',10,0,'In impedit minima repellat molestiae velit exercitationem ut nam sint. Nesciunt sit molestiae aspernatur voluptates consectetur. Ut ab nostrum earum laboriosam consequatur vitae rerum iste earum. Quidem quasi corrupti tempore explicabo omnis hic inventore minus deleniti. Odit eius vitae ut itaque nesciunt eligendi est.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(36,'Generic Concrete Tuna',10,0,'Qui non laborum maiores ut earum. Consequuntur porro quasi molestias modi amet in. Amet labore deleniti qui nostrum iste vel suscipit veritatis autem. At aut enim aut cumque. Reiciendis cum similique provident nihil architecto commodi corporis.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(37,'Sleek Fresh Cheese',5,1,'Libero molestiae minima accusantium aliquid vero exercitationem. Blanditiis fugit quasi culpa eos fugiat corrupti at. Laboriosam odio quasi cum corrupti id voluptatem. Ipsa asperiores quae impedit quis perferendis.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(38,'Gorgeous Metal Keyboard',10,0,'Dignissimos sint consequatur nihil hic ut deserunt. At ex autem asperiores molestiae libero nam eos occaecati non. Harum possimus soluta impedit et nostrum rerum vitae dolor.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(39,'Small Cotton Cheese',5,0,'Magnam occaecati incidunt sapiente ea iste. Ratione veniam laborum voluptatem. Voluptatem cum quos hic repellendus in et quas voluptatem deserunt. Aut voluptatem soluta totam nobis. Est vero quam laudantium. Sint aut voluptas corporis veniam rem quos maiores et.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(40,'Sleek Granite Hat',15,1,'Veritatis ut qui explicabo quae iusto delectus labore asperiores quia. Sequi voluptas sit ex eos animi. Illo ex odit. Enim iusto dignissimos nihil nemo non consequatur.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(41,'Fantastic Plastic Ball',10,0,'Praesentium quia nulla distinctio corporis quisquam. Culpa blanditiis exercitationem fugit sint ipsam et fuga. Delectus blanditiis earum reiciendis. Inventore est animi nulla delectus dolores ullam quaerat omnis. Praesentium ut ut et. Dolores quo deserunt.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(42,'Rustic Concrete Pants',5,0,'Dolores minus qui ullam ea vitae quam nesciunt numquam tempore. Sunt quia et dolorum ratione. Et molestiae quisquam non ea praesentium ullam ut dolore. Voluptatibus harum rem maxime. Omnis ea aut distinctio tempora commodi iste. Explicabo nemo error placeat sint nemo iusto ex.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(43,'Refined Steel Computer',5,0,'Tempora nesciunt necessitatibus minima reprehenderit magnam ut tempore saepe provident. Aut et dolorum odit quos consectetur dolore provident beatae autem. Deserunt perferendis qui voluptas ratione recusandae totam. Doloremque rerum earum quas doloremque atque temporibus. Optio dolorem qui aperiam rem et. Alias cupiditate in.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(44,'Small Wooden Chair',5,1,'Non est illo libero quia consequuntur alias nihil quia. Ratione nam sunt cumque sapiente tempore voluptatum sequi ab. Minus ut quasi ut velit necessitatibus dolorum delectus. Eum aut corrupti molestiae hic omnis et. Est at eveniet consectetur hic autem quia ad.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(45,'Ergonomic Plastic Fish',5,1,'Porro hic velit animi et. Placeat enim vel assumenda aut id vero et. Iure omnis commodi minima ea. Eaque aliquid nam alias ipsam fugiat. Et corporis fugiat.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(46,'Unbranded Cotton Sausages',15,1,'Voluptatem nihil autem ea voluptate omnis facilis. Sint eos voluptas sit tempora atque aut dolorem soluta tempore. Odio animi unde iure nemo. Eum et beatae. Nam suscipit aspernatur et placeat consectetur.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(47,'Practical Concrete Ball',10,0,'Ut nesciunt est rem molestiae veritatis numquam ut delectus provident. Consequatur vero mollitia dolorem possimus. Voluptas et dolores veritatis quia eveniet non.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(48,'Tasty Soft Hat',15,0,'Officiis qui autem cum. Eaque quasi qui aperiam officia quo vel quaerat. Dolorem mollitia et quisquam exercitationem enim.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(49,'Practical Cotton Shoes',5,1,'Odit totam quasi consequatur ut ut. Itaque occaecati et inventore incidunt velit dolore ut dolorem. Ipsa exercitationem modi facilis nihil cumque ullam aut aut. Assumenda assumenda itaque ut maiores optio tenetur deleniti consequatur.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(50,'Unbranded Cotton Hat',10,1,'Ratione nisi praesentium aspernatur voluptas odio aut praesentium ut quo. Incidunt error itaque ipsa nesciunt voluptate et et nesciunt. Eum assumenda placeat. Animi dolor qui. Illo beatae beatae.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(51,'Awesome Frozen Computer',10,1,'Consectetur dolorem aut nihil nemo officia a consequatur. Sit ducimus repellat beatae. Voluptas odio exercitationem voluptate exercitationem expedita perferendis et est. Asperiores est odio aut sequi assumenda accusantium esse voluptatibus cupiditate. Molestiae nulla a debitis ipsum nam.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(52,'Incredible Frozen Chips',15,0,'Animi iste optio quae iure dolorem error quod facere. Sint itaque eaque laborum velit voluptatem. Explicabo quibusdam quia inventore quis necessitatibus dolorem odit voluptatem. Iusto deleniti eligendi enim consequatur vel qui facere odio. Cumque perferendis laboriosam quaerat quo velit et saepe ipsam voluptatem. Quia quia officia nam.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(53,'Sleek Granite Ball',5,1,'Error sit doloribus. Voluptatem quis magni impedit. Quam quidem quis amet et repudiandae eos omnis voluptate.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(54,'Intelligent Wooden Ball',15,1,'Quo reprehenderit veniam vel veritatis officiis rerum. Quidem non doloribus sint sequi doloremque fuga nemo autem deleniti. Pariatur expedita voluptatem assumenda unde vero quo nobis ratione. Dicta similique ipsam ad autem porro nesciunt quisquam. Debitis omnis sed beatae delectus aut aut eos libero dolor.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(55,'Practical Steel Gloves',5,0,'Ut expedita eum et nesciunt nihil quidem natus aliquam. Illum voluptas omnis neque eum ducimus atque. Id nostrum saepe odit neque vero. Modi eos aperiam doloribus repellendus dolor ut deserunt et rerum.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(56,'Sleek Steel Hat',5,0,'Non hic sunt. Fugiat sunt id unde. Et debitis libero voluptatem corporis earum dolorem pariatur. Ut quidem recusandae eius consequatur sunt explicabo laudantium.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(57,'Sleek Rubber Shirt',10,1,'Repudiandae id enim sit accusantium in dicta. Consequatur porro libero sapiente dolor. Est a libero explicabo. Assumenda ex officia qui ut ea.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(58,'Fantastic Cotton Keyboard',10,0,'Laudantium odio esse fugiat laboriosam mollitia consequatur dolores quia suscipit. Est totam velit. Repellat illo et eaque nam aut repellendus.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(59,'Incredible Metal Computer',5,0,'Aut sunt occaecati illum accusantium laborum amet. Animi exercitationem nulla sunt fugiat facilis rem ad qui non. Iusto quia saepe fuga qui laborum qui ut. In blanditiis quia.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(60,'Intelligent Metal Cheese',10,0,'Magnam porro quae porro. Id sint est nobis autem. Qui culpa iusto. Laborum sed aliquid. Nemo perspiciatis itaque.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(61,'Handmade Wooden Chair',15,1,'Repudiandae odit odit. Vitae earum consectetur. Natus quas fugit assumenda. Qui hic qui neque nemo natus quasi dolore sit.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(62,'Awesome Plastic Sausages',10,0,'Fugit inventore blanditiis in distinctio. Eos et quia et ut ea dignissimos sit. Iusto a fugiat quo tempore voluptate. Tenetur veritatis voluptatum. Enim expedita quos vel rerum nobis consectetur magni.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(63,'Small Wooden Car',15,1,'Ab totam laudantium qui blanditiis sed cupiditate. Cum quos dignissimos. Odit sed quia facilis dolor architecto. Est maxime dolores distinctio ut nihil exercitationem sapiente quasi. Laborum sit est et provident porro. Voluptatem unde nam ea.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(64,'Fantastic Metal Cheese',15,1,'Consequatur eligendi eligendi eligendi ut sunt. Et consequatur et quia quis sit magnam et rem consequatur. Quas iusto eveniet distinctio recusandae odio dolor ut. Ullam iure consequatur unde et. Cumque necessitatibus dolorem sequi nam quis id ut quae. Facilis expedita voluptatibus architecto inventore est possimus dolorem exercitationem.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(65,'Unbranded Concrete Computer',5,0,'Ut quas modi nisi sed facere quia esse quod necessitatibus. Placeat tempora dignissimos libero eaque maxime nisi. Perspiciatis ipsam eius at nulla. Dolor ipsum rerum nobis voluptatibus aliquid aliquam. Mollitia iusto expedita dolorem nostrum. Sint nobis mollitia velit eum.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(66,'Rustic Wooden Pizza',10,0,'In enim et velit eum. Optio veritatis eos repudiandae dolor velit perspiciatis eligendi. Accusamus iusto atque. Magnam vel minus voluptate. Nulla aut quidem praesentium molestiae dolorem.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(67,'Awesome Soft Bacon',10,1,'Consequuntur suscipit et omnis impedit aut ut maxime laborum. Quia ullam doloribus labore sapiente officiis dolor. Eos sequi quam. Cupiditate voluptas est ex eligendi quo et et consectetur. Sint sunt eos non omnis recusandae quisquam voluptatem at. Delectus quia necessitatibus.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(68,'Intelligent Wooden Towels',5,0,'Consequatur hic minus dolorem non quisquam est quo ut distinctio. Fuga exercitationem cum. Corrupti voluptatem voluptatem voluptatibus vero iure. Laudantium quod distinctio ipsum laborum nihil. Dolores quas aliquid.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(69,'Refined Metal Soap',10,1,'Consequatur perspiciatis eos omnis delectus qui nam ex. Et sed non harum qui exercitationem dignissimos. Voluptas sit unde. Et labore facere voluptatum voluptatibus praesentium laboriosam repellat est tempore. In voluptatem accusamus delectus expedita harum laboriosam eius.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(70,'Handmade Concrete Cheese',5,0,'Officia voluptatibus necessitatibus officia temporibus accusamus rerum. Consequatur sint corporis repellat et perferendis sed. Blanditiis sint explicabo accusamus esse. Quibusdam nemo blanditiis. Laboriosam et hic nostrum esse sed autem a possimus repudiandae. Itaque quisquam nam aut architecto officia voluptatum.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(71,'Unbranded Fresh Chips',15,1,'Aspernatur eius et ad. Dolorem ut ipsam. Magni enim corrupti repellendus est ut et.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(72,'Incredible Granite Ball',15,0,'Asperiores sunt repellendus quia et totam voluptas. Eveniet rerum placeat. Voluptatem consequatur voluptatem est recusandae sit qui minima sit earum. Ab suscipit minima ut consequatur ut. Consequatur et corporis quo suscipit et vitae.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(73,'Incredible Concrete Gloves',5,0,'Quasi enim autem nam architecto incidunt. Fugit unde minus fugit esse quis molestiae ab qui. Nobis fugit voluptatem omnis est minima omnis voluptate dolores incidunt. Et est in earum quos incidunt molestiae consequuntur sed modi. Mollitia ut quisquam laudantium odit cum magnam. Et optio est.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(74,'Awesome Steel Sausages',10,0,'Inventore id harum assumenda eius tempore itaque dolorem. Magnam aut eveniet possimus sed praesentium cupiditate. Ut exercitationem occaecati sequi veniam reprehenderit nemo aspernatur est. Fugit non pariatur dolorum ab voluptatem hic. Iste et eius delectus id.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(75,'Refined Wooden Chips',10,1,'Tenetur praesentium voluptatem possimus enim doloremque asperiores provident expedita ut. Qui sapiente at ullam in. Libero in inventore architecto quis cumque dolorem sed qui consequatur. Reprehenderit veritatis in esse deserunt ut esse blanditiis necessitatibus. Et modi eveniet molestiae animi id. Consequatur libero labore cupiditate laborum quo nemo.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(76,'Refined Frozen Shirt',5,0,'Molestiae omnis aperiam. Veniam corporis iure accusamus explicabo rerum. Magnam aut dolores fugiat reiciendis porro maiores. Voluptas est est consequuntur. Fugiat cum voluptatum sunt error.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(77,'Licensed Soft Gloves',10,0,'Adipisci nihil voluptates dicta et cupiditate tenetur in ducimus. Ex itaque numquam eos earum. Corrupti cum laborum blanditiis et quae. Fugit sit qui doloribus nemo dicta. Adipisci quia necessitatibus at accusantium consectetur quia.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(78,'Intelligent Rubber Soap',10,0,'Et voluptatem veniam nesciunt eum repellat ut illum rerum aut. Quia sed unde sit non praesentium. Et vel ea cumque esse sunt ipsum laborum fugit. Et ullam saepe et necessitatibus. Voluptatum quia vel nisi qui ut non ipsum sequi. Ipsam consectetur hic.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(79,'Tasty Concrete Bacon',15,1,'Non facere molestiae in qui rerum ipsum illo et nulla. Deserunt corporis ut voluptas eveniet ut delectus. Ut sunt repudiandae et architecto tempora rerum.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(80,'Practical Wooden Salad',10,0,'Recusandae laudantium ut aspernatur dolores. Ut et veritatis nostrum. Ut assumenda ipsam sit aut et ea ut. Ut distinctio est nihil veniam veniam dicta delectus reprehenderit aliquid.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(81,'Generic Concrete Soap',10,1,'Maiores in beatae autem sit ut excepturi itaque tempora quaerat. Quibusdam omnis quod id officiis minima. Labore vel voluptatem quis consequatur mollitia autem sit modi.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(82,'Incredible Granite Car',15,0,'Sint dicta enim voluptas sit. Accusantium voluptates a dolores sequi omnis itaque dolorem inventore officiis. Et dolores numquam perspiciatis optio distinctio dolorum porro fugiat. Expedita asperiores possimus recusandae consequatur. Officiis dolorum voluptatem impedit nisi ut dolores culpa aut.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(83,'Awesome Plastic Fish',10,1,'Temporibus eaque sint alias. Vero sit veniam ipsam. Odit dicta itaque veritatis autem illo nulla aperiam.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(84,'Licensed Cotton Mouse',15,0,'Quidem hic voluptate accusamus non ratione eligendi. Soluta voluptas quisquam dolore dolores fuga. Beatae est omnis velit corporis iste odit ipsam. Facilis dolore reprehenderit molestiae ducimus et. Rem quia aspernatur natus amet. Neque doloremque incidunt vel.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(85,'Tasty Rubber Pizza',5,0,'Sed dolorum impedit dolorem voluptatibus ad in. Nam perspiciatis incidunt ad quasi. Consequuntur adipisci ut quibusdam. Eius distinctio sequi odit ut sint magni ut eveniet autem. Et ut nisi magni et fuga ab. Officia minima aut maxime est.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(86,'Sleek Soft Table',10,1,'Ut delectus ea fugit. Dignissimos incidunt consectetur repellendus commodi facere distinctio in itaque. Sapiente deleniti unde id aut ut enim et. Quia nihil ipsum dolorem.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(87,'Incredible Metal Cheese',10,1,'Sapiente esse quaerat a illo omnis est est enim et. Quibusdam labore odio ea dignissimos debitis sunt deleniti cum eos. Omnis dicta sint doloremque.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(88,'Awesome Fresh Computer',10,1,'Cum corrupti eveniet. Dolores consequuntur aut debitis optio. Molestiae cupiditate accusamus laborum necessitatibus et. Dicta iure qui rerum qui laborum doloremque aperiam. Cum quibusdam ratione deleniti id corrupti itaque aliquam voluptate. Illum error facilis omnis recusandae eligendi enim.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(89,'Sleek Rubber Car',15,0,'Qui dolorem voluptatem culpa. Cupiditate possimus expedita sit est voluptatem reprehenderit. Ea quo et aliquam et animi iste deleniti quae. Dignissimos et nihil et consequuntur. Debitis laudantium molestiae odio provident voluptatibus non qui corrupti. Itaque ut repellendus quae quae doloremque.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(90,'Licensed Soft Chair',10,0,'Mollitia dolore ipsa. Consequuntur iusto et voluptas incidunt debitis quod eum. Repudiandae officia quae autem laborum adipisci qui aut voluptatem. Quibusdam ut et voluptates quia magnam.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(91,'Ergonomic Metal Chair',5,1,'Excepturi voluptates praesentium autem reiciendis et aliquid animi. Fuga saepe aliquam velit est deleniti. Autem quia nihil. Perferendis quisquam cum dolorem qui expedita quia qui aut est. Sed dolor temporibus soluta eaque molestiae. Cupiditate quas omnis tenetur veniam.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(92,'Unbranded Plastic Chicken',5,1,'Et ullam dolores est. Iste assumenda qui porro aut laboriosam harum consectetur. Perspiciatis atque velit.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(93,'Tasty Granite Chicken',15,1,'Nisi rerum suscipit. Sunt nesciunt doloribus ea iure non praesentium unde et. Quas maxime nulla nam consequatur. Voluptas et et nihil ut non.','2022-03-13 11:07:42','2022-03-15 16:20:55',NULL,1,1,NULL,'default.jpeg'),(94,'Tasty Soft Chair',10,1,'Molestias eos quia. Commodi ratione pariatur molestias quos cumque. Quis dolore sequi ut dolorem omnis dicta. Quis ut similique ea voluptatibus expedita. Labore et impedit libero sunt explicabo labore.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(95,'Generic Granite Soap',5,1,'Soluta dolore impedit sed architecto dolorem fugit ullam quia saepe. Nulla unde laudantium cum maxime. Magni aut repellendus id vitae qui ut provident. Adipisci neque dolorem dicta ea. Incidunt laboriosam enim voluptas. Qui quia non molestiae.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(96,'Incredible Wooden Car',15,1,'Culpa sunt accusantium soluta est eum qui. Laboriosam quo optio nostrum quia omnis id numquam non itaque. Minus in veniam tempore vero et. Magnam impedit similique quis esse voluptas. Unde quo minus deleniti labore. Provident est perferendis.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(97,'Ergonomic Steel Pizza',5,0,'Aperiam ea esse dolor aut nam architecto dolor velit. Deserunt consequatur quisquam et quod omnis voluptatum sed. Est est consequatur hic est architecto vel iusto cupiditate.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(98,'Intelligent Concrete Bike',15,0,'Qui aut sed vero necessitatibus esse nostrum. Est debitis et et aut et ipsum eos esse modi. Sed cumque et et aut odio. Deserunt nihil aut. Laborum magnam dolor. Itaque aut autem recusandae ut voluptatem ea quos sint.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(99,'Tasty Fresh Sausages',15,0,'Voluptatibus optio animi est qui sunt hic eum qui. Eos vero eum impedit. Sit voluptatibus saepe quo non ab quidem ut. Soluta aut quo facilis. Aliquam nihil eos similique eum rerum est. Nobis cupiditate est fugit tenetur minus.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1,1,NULL,'default.jpeg'),(100,'Handmade Granite Mouse',15,1,'Et voluptatem aut. Id omnis doloribus aliquam totam quia ut. Et rerum enim quia. Modi eum similique. Possimus iste consequatur magnam.','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,2,1,NULL,'default.jpeg'),(101,'Quam dolor et ab seq',59,0,'<p>Sit eiusmod totam er.</p>','2022-03-28 11:25:24','2022-03-28 11:25:24',NULL,2,1,1,'default.jpeg'),(102,'Vero sapiente harum ',93,1,'<p>Eum ut et dolorib</p>','2022-04-12 21:24:35','2022-04-13 09:51:57','2022-04-13 09:52:14',1,1,1,'default.jpeg');
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits_commandes`
--

DROP TABLE IF EXISTS `produits_commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits_commandes` (
  `quantite` int(10) unsigned NOT NULL,
  `prix` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CommandeId` int(11) NOT NULL,
  `ProduitId` int(11) NOT NULL,
  PRIMARY KEY (`CommandeId`,`ProduitId`),
  KEY `ProduitId` (`ProduitId`),
  CONSTRAINT `produits_commandes_ibfk_1` FOREIGN KEY (`CommandeId`) REFERENCES `commandes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_commandes_ibfk_2` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits_commandes`
--

LOCK TABLES `produits_commandes` WRITE;
/*!40000 ALTER TABLE `produits_commandes` DISABLE KEYS */;
INSERT INTO `produits_commandes` VALUES (1,50,'2022-03-14 08:06:59','2022-03-14 08:06:59',1,2),(2,5,'2022-03-30 11:17:32','2022-03-30 11:17:32',1,7),(20,5,'2022-03-31 13:53:54','2022-03-31 13:53:54',106,5),(5,50,'2022-04-12 14:45:51','2022-04-12 14:45:51',117,18),(6,20,'2022-04-13 09:46:33','2022-04-13 09:46:33',118,101);
/*!40000 ALTER TABLE `produits_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits_ventes`
--

DROP TABLE IF EXISTS `produits_ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits_ventes` (
  `quantite` int(10) unsigned NOT NULL,
  `prix` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProduitId` int(11) NOT NULL,
  `VenteId` int(11) NOT NULL,
  PRIMARY KEY (`ProduitId`,`VenteId`),
  KEY `VenteId` (`VenteId`),
  CONSTRAINT `produits_ventes_ibfk_1` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produits_ventes_ibfk_2` FOREIGN KEY (`VenteId`) REFERENCES `ventes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits_ventes`
--

LOCK TABLES `produits_ventes` WRITE;
/*!40000 ALTER TABLE `produits_ventes` DISABLE KEYS */;
INSERT INTO `produits_ventes` VALUES (2,5,'2022-04-03 15:18:16','2022-04-03 15:18:16',7,33),(6,20,'2022-04-13 09:48:02','2022-04-13 09:48:02',101,35),(6,20,'2022-04-13 09:48:25','2022-04-13 09:48:25',101,36);
/*!40000 ALTER TABLE `produits_ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'admin','admin','#12607e','icon-park-outline:file-protection-one','2022-03-13 11:07:42','2022-04-13 02:26:36',NULL),(2,'Manager','Alias doloribus nam et.','#5a142b','ph:test-tube','2022-03-13 11:07:42','2022-03-24 12:52:34',NULL),(3,'Architecte','Qui ut sit doloremque doloribus aliquid.','#4f6943','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(4,'Developpeur','Perferendis sed praesentium hic ipsa voluptatem.','#231b52','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(7,'Consultant','Itaque officia expedita ut.','#623c30','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(8,'Designer','Nihil exercitationem eos placeat alias dignissimos.','#1f592f','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(9,'Directeur','Totam iste reiciendis dolores rerum omnis quia similique.','#0d4039','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(10,'Technicien','Sunt necessitatibus sed necessitatibus hic autem enim harum recusandae.','#7a052a','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(11,'Specialiste','Incidunt temporibus ipsa id.','#0b2b0c','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(12,'Technicien','Cupiditate rerum et ut omnis earum quia voluptas.','#16162b','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL),(13,'Ingenieur','Id consequatur quas quia voluptas vitae est velit ab.','#4d1e4e','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-03-28 10:53:39'),(14,'Executif','Et aut officiis provident vel quia.','#5e5908','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-03-28 10:53:14'),(15,'Agent','Quis at rerum.','#12607e','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-03-28 10:20:46'),(16,'Analyste','Cumque quis nostrum consequatur dolorem velit necessitatibus exercitationem quasi.','#310442','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-03-28 10:20:12'),(17,'yasmine','kech haja tiri berk','#2e89ff','icon-park-outline:file-protection-one','2022-03-28 10:02:15','2022-03-28 10:02:15','2022-03-28 10:18:38');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeclients`
--

DROP TABLE IF EXISTS `typeclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeclients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeclients`
--

LOCK TABLES `typeclients` WRITE;
/*!40000 ALTER TABLE `typeclients` DISABLE KEYS */;
INSERT INTO `typeclients` VALUES (1,'grossiste','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42'),(2,'detaillant','ph:test-tube','2022-03-13 11:07:42','2022-03-13 11:07:42');
/*!40000 ALTER TABLE `typeclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeproduits`
--

DROP TABLE IF EXISTS `typeproduits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeproduits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeproduits`
--

LOCK TABLES `typeproduits` WRITE;
/*!40000 ALTER TABLE `typeproduits` DISABLE KEYS */;
INSERT INTO `typeproduits` VALUES (1,'satiné','2022-03-13 11:07:42','2022-03-13 11:07:42'),(2,'special plafond','2022-03-13 11:07:42','2022-03-13 11:07:42');
/*!40000 ALTER TABLE `typeproduits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ProfileId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `ProfileId` (`ProfileId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ProfileId`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0698151348','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(2,'Abigaelle','Gauthier','Abdonie.Gaillard66','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0193561245','2022-03-13 11:07:42','2022-03-13 11:07:42','2022-03-28 10:05:30',1),(3,'Coren','Gu','manager','123456','+33 747737368','2022-03-13 11:07:42','2022-04-13 00:29:05','2022-04-13 09:40:37',2),(4,'Denise','Baron','Marius.Legrand','123456','+33 245331254','2022-03-13 11:07:42','2022-04-13 09:43:58',NULL,2),(5,'Constance','Lucas','Adalbéron_Lacroix87','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0683893916','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(6,'Florestan','Philippe','Débora.Thomas','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0488037192','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(7,'Gabrielle','Bonnet','Arsinoé_Bonnet11','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 357166737','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(8,'Félix','Gonzalez','Alexis_Blanchard','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 675045617','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(9,'Boniface','Colin','Adalsinde.Blanc6','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 639733838','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(10,'Fortuné','Charles','Angèle_Rey','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 519219453','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(11,'Benoît','Paris','Octave.Gautier25','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0744030488','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(12,'Merlin','Rolland','Innocent72','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0605393475','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(13,'Jacques','Leclercq','Albane_Barre','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0437444791','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(14,'Noémie','Masson','Timothée_Lucas58','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 221146976','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(15,'Jade','Chevalier','Althée.Maillard80','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 181203842','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(16,'Philomène','Faure','Coline_Morel40','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0226346547','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(17,'Eugène','Gerard','Sandra.Louis','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 636804242','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(18,'Artémis','Meyer','Arnaud.Morin','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0667371820','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(19,'Agathange','Barre','Gonzague.Rodriguez60','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0184064906','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(20,'Léonie','Faure','Naudet95','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 716493918','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(21,'Grégoire','Lecomte','Zacharie77','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 529099555','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(22,'Alizé','Vidal','Sylviane.Guillot73','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 715717959','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(23,'Mylène','Gautier','Anatole1','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 514304102','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(24,'Roger','Noel','Adalric.Dasilva','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0543551250','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(25,'Matthieu','Duval','Cyriaque2','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0297661813','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(26,'Isabeau','Robert','Hardouin.Menard65','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 379874305','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(27,'Charlaine','Legrand','Rebecca.Schmitt','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 114067715','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(28,'Abeline','Roy','Arielle_Poirier','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 775172411','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(29,'Agrippin','Hubert','Normand_Guillot15','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0732335721','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(30,'Eustache','Moreau','Amalric.Renaud','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 646895317','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(31,'Matthias','Leroy','Roland28','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0702019531','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(32,'Émeric','Garcia','Ambroisie_Lucas76','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 103936679','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(33,'Didier','Vasseur','Bon6','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 221441536','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(34,'Améthyste','Carre','Joël90','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 641463056','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(35,'Ernest','Berger','Gontran.Robin','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 484454650','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(36,'Serge','Simon','Pétronille.Meunier45','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 748140838','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(37,'Christiane','Moreau','Jonathan.Poirier60','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 466363848','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(38,'Archambaud','Collet','Marceline.Marchand70','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 598813102','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(39,'Claude','Bourgeois','Guilhemine_Renaud','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0438733854','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(40,'Isidore','Morin','David_Bourgeois94','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0269101509','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(41,'Morgan','Moreau','Euphrasie_Renard','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 123228397','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(42,'Loup','Meunier','Annette58','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0538320091','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(43,'Maxime','Garnier','François_Guillaume99','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 279257500','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(44,'Astérie','Leclerc','Sidoine_Blanc92','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0191451355','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(45,'Mérovée','Robert','Gerbert.Rodriguez15','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0774764081','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(46,'Adegrin','Vincent','Flodoard79','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0146663908','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(47,'Henriette','Simon','Mélisande_Rey42','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 323158707','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(48,'Brice','Bonnet','Nathanaël_Robert51','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0657652494','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(49,'Adjutor','Martinez','Mallaury.Riviere','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 669398608','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(50,'Guy','Vincent','Charles19','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0420025400','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(51,'Silvère','Blanchard','Gabin_Julien62','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 150974957','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(52,'Alix','Perrot','Henriette_Muller63','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0396407265','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(53,'Armand','Bernard','Geneviève98','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 753132868','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(54,'Caroline','Martin','Sigismond_Dupuy16','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 311469413','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(55,'Gaspard','Garcia','Yvette96','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 275394952','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(56,'Briac','Andre','Pierrick_Dumont64','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 298032156','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(57,'Judith','Roche','Jules.Carre49','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0214288338','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(58,'Blaise','Mathieu','Blandine97','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 525620870','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(59,'Amarande','Lemaire','Alix83','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0421966819','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(60,'Hildebert','Henry','Noëlle_Nicolas59','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0664145794','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(61,'Enguerrand','Lemaire','Odon.Faure44','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0130335650','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(62,'Jehanne','Giraud','Paulette.Meunier56','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0442253873','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(63,'Diane','Berger','Trajan_Bonnet27','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0483889104','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(64,'Guérin','Lacroix','Jeannot_Caron','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0250627792','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(65,'Aimé','Laurent','Melchior_Blanc','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 398824215','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(66,'Oriane','Bonnet','Léandre57','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0792160448','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(67,'Falba','Louis','Garnier.Thomas5','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0221476658','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(68,'Hélier','Nguyen','Eustache86','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 199234222','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(69,'Estelle','Barbier','Juste_Hubert16','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0338870337','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(70,'Alix','Vidal','Sauveur_Charles81','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 196992656','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(71,'Astérie','Bernard','Albert13','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0621412566','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(72,'Aricie','Henry','Xavier_Roux64','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0366110755','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(73,'Frédéric','Barbier','Vigile.Philippe','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0582253126','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(74,'Arian','Schmitt','Audrey26','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 671190196','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(75,'Ella','Vasseur','Aleth_Giraud48','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0757702275','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(76,'Isidore','Lefebvre','Brunehaut.Leroux82','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0409623256','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(77,'Florie','Louis','Ancelin.Boyer83','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0243571638','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(78,'Beuve','Olivier','Alliaume.Roussel58','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0770059624','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(79,'Aimé','Gauthier','Lothaire_Faure26','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0435265485','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(80,'Noël','Caron','Jeannot62','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 443518556','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(81,'Dieudonné','Vasseur','Dominique19','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0580075268','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(82,'Rachel','Nguyen','Sauveur97','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 103656096','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(83,'Gabrielle','Le roux','Théodose15','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0161735439','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(84,'Apollinaire','Rolland','Briac35','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0352663948','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(85,'Simon','Colin','Théodose93','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0168243175','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(86,'Augustine','Guerin','Lorraine_Bertrand63','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0339149767','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(87,'Savinien','Breton','Laurence.Clement59','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0643686444','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(88,'Audouin','Maillard','Bernadette_Lefevre','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0747879850','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(89,'Libère','Olivier','Clélie.Chevalier45','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 177777201','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(90,'Axeline','Joly','Émilie.Robin77','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0525408864','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(91,'Aleaume','Nicolas','Arsène_Dumont','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 556478705','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(92,'Agrippin','Jacquet','Pélagie20','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0653419557','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(93,'Margot','Riviere','Timothée_Menard','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 477874307','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(94,'Mamert','Marchand','Jason61','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0413373814','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(95,'Denise','David','Berthe.Rodriguez','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 198867337','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(96,'Louis','Francois','Eudoxie_Lambert','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0606243792','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(97,'Avigaëlle','Lemoine','Anthelmette.Giraud49','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0337173582','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(98,'Prosper','Duval','Adalbaude.Martin97','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0464996681','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(99,'Léopold','Fleury','Jérôme69','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 320107657','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(100,'Elsa','Leclerc','Émile.Leroy','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0700310813','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(101,'Amalthée','Menard','Azeline.Leroy57','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0501129378','2022-03-13 11:07:42','2022-03-13 11:07:42',NULL,1),(102,'Quod magnam ipsam te','Esse amet voluptat','nanir','$2a$10$N0UApvH8B133zDhoKwb8ceAJz/KpgxbckGdV3coUEgvNtOLxFU3Aa','+1 (596) 905-9448','2022-03-28 09:59:31','2022-03-28 09:59:31',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `etat` enum('en attente','en cours de livraison','livre') NOT NULL DEFAULT 'en attente',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `ClientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `ClientId` (`ClientId`),
  CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` VALUES (22,'2022-04-03 11:58:44','en attente','2022-04-03 11:58:44','2022-04-03 11:58:44',NULL,1,5),(23,'2022-04-03 11:59:10','en attente','2022-04-03 11:59:10','2022-04-03 11:59:10',NULL,1,5),(24,'2022-04-03 11:59:32','en attente','2022-04-03 11:59:32','2022-04-03 11:59:32',NULL,1,5),(25,'2022-04-03 11:59:32','en attente','2022-04-03 11:59:32','2022-04-03 11:59:32',NULL,1,5),(26,'2022-04-03 11:59:45','en attente','2022-04-03 11:59:45','2022-04-03 11:59:45',NULL,1,5),(27,'2022-04-03 12:02:02','en attente','2022-04-03 12:02:02','2022-04-03 12:02:02',NULL,1,5),(28,'2022-04-03 12:02:36','en attente','2022-04-03 12:02:36','2022-04-03 12:02:36',NULL,1,5),(29,'2022-04-03 12:03:47','en attente','2022-04-03 12:03:47','2022-04-03 12:03:47',NULL,1,5),(30,'2022-04-03 12:04:26','en attente','2022-04-03 12:04:26','2022-04-03 12:04:26',NULL,1,5),(31,'2022-04-03 12:26:03','en attente','2022-04-03 12:26:03','2022-04-03 12:26:03',NULL,1,5),(32,'2022-04-03 12:26:09','en attente','2022-04-03 12:26:09','2022-04-03 12:26:09',NULL,1,14),(33,'2022-04-03 15:18:16','en attente','2022-04-03 15:18:16','2022-04-03 15:18:16',NULL,1,24),(34,'2022-04-03 21:01:50','en attente','2022-04-03 21:01:50','2022-04-03 21:01:50',NULL,1,14),(35,'2022-04-13 09:48:01','en attente','2022-04-13 09:48:01','2022-04-13 09:48:01',NULL,4,14),(36,'2022-04-13 09:48:25','en attente','2022-04-13 09:48:25','2022-04-13 09:48:25',NULL,4,14);
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wilayas`
--

DROP TABLE IF EXISTS `wilayas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wilaya` varchar(255) NOT NULL,
  `latitude` decimal(12,10) NOT NULL,
  `longitude` decimal(12,10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wilaya` (`wilaya`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wilayas`
--

LOCK TABLES `wilayas` WRITE;
/*!40000 ALTER TABLE `wilayas` DISABLE KEYS */;
/*!40000 ALTER TABLE `wilayas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-13 10:54:43
