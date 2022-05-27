-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: spryrr1myu6oalwl.chr7pe7iynqr.eu-west-1.rds.amazonaws.com    Database: fyjnhjj19icklpl9
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Current Database: `fyjnhjj19icklpl9`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fyjnhjj19icklpl9` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `fyjnhjj19icklpl9`;

--
-- Table structure for table `achat_matieres`
--

DROP TABLE IF EXISTS `achat_matieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achat_matieres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantite` float NOT NULL,
  `prixUnitaire` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `MatiereId` int NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ClientId` int NOT NULL,
  `WilayaId` int NOT NULL,
  `UserId` int DEFAULT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
  `AutorisationId` int NOT NULL,
  `ProfileId` int NOT NULL,
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
-- Table structure for table `clientpaniers`
--

DROP TABLE IF EXISTS `clientpaniers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientpaniers` (
  `quantite` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ClientId` int NOT NULL,
  `ProduitId` int NOT NULL,
  PRIMARY KEY (`ClientId`,`ProduitId`),
  KEY `ProduitId` (`ProduitId`),
  CONSTRAINT `clientpaniers_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clientpaniers_ibfk_2` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientpaniers`
--

LOCK TABLES `clientpaniers` WRITE;
/*!40000 ALTER TABLE `clientpaniers` DISABLE KEYS */;
INSERT INTO `clientpaniers` VALUES (1,'2022-05-18 20:30:11','2022-05-18 20:30:11',49,101);
/*!40000 ALTER TABLE `clientpaniers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `raisonSociale` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `numeroSecondaire` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int NOT NULL,
  `TypeClientId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `raisonSociale` (`raisonSociale`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `numeroSecondaire` (`numeroSecondaire`),
  KEY `UserId` (`UserId`),
  KEY `TypeClientId` (`TypeClientId`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`TypeClientId`) REFERENCES `typeclients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (49,'Norbert Laurent','0493735556','0716551255','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Athanasie_Barbier34','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,13,1),(50,'Jeannot Cousin','+33 782549667','0264580060','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Aymardine_Royer71','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,30,1),(51,'Clémentine Noel','0130654064','0450037695','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Sophie_Paul','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,48,1),(52,'Théodore Bernard','0472352350','0278989664','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Edmée_Lopez69','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,80,1),(53,'Anaïs Bernard','0653480433','0445161813','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Jonathan.Cousin61','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,44,1),(54,'Gontran Olivier','0641130827','+33 360693276','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Anceline38','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,72,1),(55,'Aricie Remy','+33 302968524','+33 496855252','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Daniel.Muller64','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,89,1),(56,'Renée Olivier','+33 369129934','+33 232892655','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Abélard.Dumont','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,76,1),(57,'Irène Breton','0145139065','0449336200','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Perceval_Schneider','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,52,1),(58,'Aglaé Renaud','+33 602289893','0591023068','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Félicité.Fernandez4','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,36,1),(59,'Longin Henry','0146575330','0286603378','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Honoré_Roussel','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,11,1),(60,'Colin Blanc','+33 227759274','+33 135041306','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Améliane18','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,72,1),(61,'Astride Hubert','0113260210','+33 348225464','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Corentine64','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,39,1),(62,'Honorine Masson','0671119009','+33 733903859','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Constance.Noel56','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,30,1),(63,'Ysaline Arnaud','0520286773','+33 434803318','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Alcide36','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,6,1),(64,'Aliette Leroux','0631757822','0378588367','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Margot_Rolland30','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,83,1),(65,'Isabeau Blanchard','+33 193648993','+33 400820877','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Salomé.Girard','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,4,1),(66,'Émérencie Lefebvre','+33 714101796','+33 215146540','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Aldonce87','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,100,1),(67,'Richard Rodriguez','+33 605614732','+33 342270245','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Ombline.Fournier20','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,80,1),(68,'Cyrille Guillaume','0215926502','+33 329072915','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Évelyne89','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,34,1),(69,'Anatolie Maillard','0231440055','+33 731811736','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Brunehaut22','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,35,1),(70,'Odilon Durand','0580807396','+33 266066828','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Ernestine.Moreau','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,90,1),(71,'Aaron Perrot','+33 301773609','+33 793508921','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Absalon94','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,34,1),(72,'Guy Lecomte','0788174209','0504061598','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Mathilde.Giraud','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,58,1),(73,'Guillemette Lemaire','0495230366','+33 772246442','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Tancrède13','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,73,1),(74,'Aleth Renard','0444711048','0259479971','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Arabelle72','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,70,1),(75,'Paul Roger','0497254935','0597371756','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Daphné.Royer18','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,5,1),(76,'Zaché Barbier','0289606058','+33 697379253','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Mence_Barbier','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,72,1),(77,'Agnan Arnaud','+33 174182917','+33 522250479','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Alcidie_Charpentier21','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,17,1),(78,'Gwenaëlle Guillot','0269302796','0253585117','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Flore99','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,73,1),(79,'Stéphane Gaillard','+33 537154446','+33 745522176','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Nadine.Legrand67','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,94,1),(80,'Clélie Huet','0462373601','+33 787580009','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Andoche71','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,14,1),(81,'Adalbert Guerin','0591748821','+33 402248858','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Laureline_Richard65','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,97,1),(82,'Boniface Louis','+33 289185969','0284242676','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Léa.Schneider99','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,65,1),(83,'Agnan Muller','0301165876','0548344711','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Constantin_Riviere','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,8,1),(84,'Fulbert Noel','0428992550','0232501185','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Pécine.Carre56','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,51,1),(85,'Gatien Moreau','0161451925','+33 773368100','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Benoît_Huet','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,55,1),(86,'Odette Joly','+33 691111392','+33 647432437','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Arsinoé47','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,37,1),(87,'Angèle Andre','0676141930','0353125211','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Asceline_Brun91','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,65,1),(88,'Émile Michel','0193436796','0627624569','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Éloïse.Dumas91','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,2,1),(89,'Aristide Jacquet','0420706905','+33 283136660','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Geneviève.Lacroix98','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,18,1),(90,'Jason Fontaine','+33 333397386','0655747090','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Frédéric10','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,75,1),(91,'Falba Perez','+33 344380602','+33 576427751','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Girart31','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,19,1),(92,'Rodolphe Caron','0120795472','+33 412392407','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Aline7','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,78,1),(93,'Rita Le gall','0402453936','0497143426','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Jude.Roy64','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,20,1),(94,'Blanche Roussel','+33 782573779','0330956057','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Quintia_Roussel','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,79,1),(95,'Marceau Joly','+33 683144638','0790035423','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Armande_Barbier','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,5,1),(96,'Fabrice Fournier','+33 219789559','0694580206','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','Josse.Laurent','2022-04-17 17:02:10','2022-04-17 17:02:10',NULL,66,1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commandes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etat` enum('en negiciation','valide admin','valide client','vendu') NOT NULL DEFAULT 'en negiciation',
  `validationClient` tinyint(1) NOT NULL DEFAULT '0',
  `validationAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ClientId` int NOT NULL,
  `UserId` int NOT NULL,
  `bonDecommande` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ClientId` (`ClientId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` VALUES (1,'en negiciation',1,1,'2022-05-04 19:41:20','2022-05-12 12:41:58','2022-05-20 16:02:45',49,1,'private\\bon-de-commande\\58f0396e273b09e163e39d1eb054a43e.pdf'),(2,'en negiciation',0,0,'2022-05-11 15:00:57','2022-05-11 17:33:47','2022-05-11 17:33:47',49,13,NULL),(3,'en negiciation',0,0,'2022-05-11 15:10:39','2022-05-11 17:36:08','2022-05-11 17:36:08',49,13,NULL),(4,'en negiciation',0,0,'2022-05-11 15:12:26','2022-05-11 17:36:10','2022-05-11 17:36:10',49,13,NULL),(5,'en negiciation',0,0,'2022-05-11 15:14:07','2022-05-11 17:36:10','2022-05-11 17:36:10',49,13,NULL),(6,'en negiciation',0,0,'2022-05-11 15:14:08','2022-05-11 17:36:11','2022-05-11 17:36:11',49,13,NULL),(7,'en negiciation',0,0,'2022-05-11 15:14:08','2022-05-11 17:36:12','2022-05-11 17:36:12',49,13,NULL),(8,'en negiciation',0,0,'2022-05-11 17:09:10','2022-05-11 17:36:13','2022-05-11 17:36:13',49,13,NULL),(9,'en negiciation',0,0,'2022-05-11 17:10:12','2022-05-11 17:36:14','2022-05-11 17:36:14',49,13,NULL),(10,'en negiciation',0,0,'2022-05-11 17:14:27','2022-05-11 17:36:16','2022-05-11 17:36:16',49,13,NULL),(11,'en negiciation',0,0,'2022-05-11 17:14:53','2022-05-11 17:36:17','2022-05-11 17:36:17',49,13,NULL),(12,'en negiciation',0,0,'2022-05-11 17:16:17','2022-05-11 17:36:18','2022-05-11 17:36:18',49,13,NULL),(24,'en negiciation',1,1,'2022-05-11 17:30:43','2022-05-12 12:35:38','2022-05-20 16:02:51',49,13,'private\\bon-de-commande\\4b7e57fc1ddb569effd43549355994bb.pdf'),(25,'en negiciation',1,1,'2022-05-11 21:02:27','2022-05-11 21:06:10',NULL,49,13,NULL),(26,'en negiciation',0,0,'2022-05-18 11:45:22','2022-05-18 11:45:22',NULL,49,13,NULL);
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consomatieres`
--

DROP TABLE IF EXISTS `consomatieres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consomatieres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantite` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  `raison` enum('achat','production') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProductionId` int DEFAULT NULL,
  `MatiereId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductionId` (`ProductionId`),
  KEY `MatiereId` (`MatiereId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `consomatieres_ibfk_1` FOREIGN KEY (`ProductionId`) REFERENCES `productions` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `consomatieres_ibfk_2` FOREIGN KEY (`MatiereId`) REFERENCES `matieres` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `consomatieres_ibfk_3` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consomatieres`
--

LOCK TABLES `consomatieres` WRITE;
/*!40000 ALTER TABLE `consomatieres` DISABLE KEYS */;
INSERT INTO `consomatieres` VALUES (12,160,'2022-04-11 22:33:35','production','2022-04-11 22:33:35','2022-04-11 22:33:35',1,1,1),(13,64,'2022-04-11 22:33:35','production','2022-04-11 22:33:35','2022-04-11 22:33:35',1,2,1),(14,25,'2022-04-17 03:32:44','production','2022-04-17 03:32:44','2022-04-17 03:32:44',5,1,1),(15,25,'2022-04-17 03:32:44','production','2022-04-17 03:32:44','2022-04-17 03:32:44',5,3,1);
/*!40000 ALTER TABLE `consomatieres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couleurs`
--

DROP TABLE IF EXISTS `couleurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couleurs` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `lu` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'Id ut aut hic dicta ','Repellendus Id dolo','bujezifytu@mailinator.com','Dolor nesciunt faci',1,'2022-04-12 17:23:32','2022-04-13 09:58:31',NULL),(2,'Quam quam maxime ill','Sit maiores soluta o','bozam@mailinator.com','In odio consectetur',0,'2022-04-13 04:05:33','2022-04-13 04:05:33',NULL),(3,'Obcaecati debitis mo','Saepe sed sapiente m','vaqo@mailinator.com','Expedita quasi nostr',0,'2022-04-13 04:09:04','2022-04-13 04:09:04',NULL),(4,'test','test','test@test.fr','bonjour',0,'2022-04-13 10:00:04','2022-04-13 10:00:04',NULL);
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
  `MatiereId` int NOT NULL,
  `ProduitId` int NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `paniers`
--

DROP TABLE IF EXISTS `paniers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paniers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paniers`
--

LOCK TABLES `paniers` WRITE;
/*!40000 ALTER TABLE `paniers` DISABLE KEYS */;
/*!40000 ALTER TABLE `paniers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payements`
--

DROP TABLE IF EXISTS `payements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `montant` decimal(10,0) NOT NULL,
  `date` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int DEFAULT NULL,
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
  `PayementId` int NOT NULL,
  `CommandeId` int NOT NULL,
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
  `PayementId` int NOT NULL,
  `VenteId` int NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `prix` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProduitId` int NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `lot` varchar(255) NOT NULL,
  `quantite` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProduitId` int NOT NULL,
  `UserId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lot` (`lot`),
  KEY `ProduitId` (`ProduitId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `productions_ibfk_1` FOREIGN KEY (`ProduitId`) REFERENCES `produits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `productions_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productions`
--

LOCK TABLES `productions` WRITE;
/*!40000 ALTER TABLE `productions` DISABLE KEYS */;
INSERT INTO `productions` VALUES (1,'2022-04-11 00:00:00','50',32,'2022-04-11 22:33:35','2022-04-11 22:33:35',101,1),(2,'2022-04-13 00:00:00','25',50,'2022-04-13 09:55:38','2022-04-13 09:55:38',5,1),(5,'2022-04-17 03:32:44','35',5,'2022-04-17 03:32:44','2022-04-17 03:32:44',101,1);
/*!40000 ALTER TABLE `productions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `contenance` int unsigned NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `TypeProduitId` int NOT NULL,
  `CouleurId` int NOT NULL,
  `UserId` int DEFAULT NULL,
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
  `quantite` int unsigned NOT NULL,
  `prix` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CommandeId` int NOT NULL,
  `ProduitId` int NOT NULL,
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
INSERT INTO `produits_commandes` VALUES (5,100,'2022-05-08 16:26:52','2022-05-08 17:28:07',1,3),(10,100,'2022-05-08 16:26:01','2022-05-08 17:28:07',1,9),(6,500,'2022-05-08 13:06:27','2022-05-08 17:28:07',1,10),(2,100,'2022-05-08 16:33:22','2022-05-08 17:28:07',1,21),(5,100,'2022-05-08 16:33:35','2022-05-08 17:28:07',1,50),(6,20,'2022-05-11 17:30:50','2022-05-11 18:33:18',24,3),(4,478,'2022-05-11 17:30:53','2022-05-11 18:33:18',24,5),(8,75,'2022-05-11 17:30:55','2022-05-11 18:33:18',24,101),(50,40,'2022-05-11 21:02:27','2022-05-11 21:05:20',25,3),(5,20,'2022-05-11 21:02:27','2022-05-11 21:05:20',25,5),(16,10,'2022-05-11 21:02:27','2022-05-11 21:05:20',25,7),(1,10,'2022-05-11 21:02:27','2022-05-11 21:05:20',25,101),(5,NULL,'2022-05-18 11:45:22','2022-05-18 11:45:22',26,101);
/*!40000 ALTER TABLE `produits_commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits_ventes`
--

DROP TABLE IF EXISTS `produits_ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits_ventes` (
  `quantite` int unsigned NOT NULL,
  `prix` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `ProduitId` int NOT NULL,
  `VenteId` int NOT NULL,
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
INSERT INTO `produits_ventes` VALUES (5,10,'2022-05-08 17:16:01','2022-05-08 17:16:01',3,41),(5,10,'2022-05-08 17:16:34','2022-05-08 17:16:34',3,42),(5,10,'2022-05-08 17:17:54','2022-05-08 17:17:54',3,43),(5,100,'2022-05-08 17:35:41','2022-05-08 17:35:41',3,44),(5,100,'2022-05-08 17:38:11','2022-05-08 17:38:11',3,45),(5,100,'2022-05-08 17:39:03','2022-05-08 17:39:03',3,46),(5,100,'2022-05-08 17:40:41','2022-05-08 17:40:41',3,47),(6,20,'2022-05-11 18:12:23','2022-05-11 18:12:23',3,48),(6,20,'2022-05-11 18:14:10','2022-05-11 18:14:10',3,49),(6,20,'2022-05-11 18:17:25','2022-05-11 18:17:25',3,50),(6,20,'2022-05-11 18:34:59','2022-05-11 18:34:59',3,51),(50,40,'2022-05-11 21:05:38','2022-05-11 21:05:38',3,52),(4,450,'2022-05-11 18:12:23','2022-05-11 18:12:23',5,48),(4,500,'2022-05-11 18:14:10','2022-05-11 18:14:10',5,49),(4,480,'2022-05-11 18:17:25','2022-05-11 18:17:25',5,50),(4,478,'2022-05-11 18:34:59','2022-05-11 18:34:59',5,51),(5,20,'2022-05-11 21:05:38','2022-05-11 21:05:38',5,52),(2,5,'2022-04-03 15:18:16','2022-04-03 15:18:16',7,33),(2,5,'2022-04-13 10:02:44','2022-04-13 10:02:44',7,37),(16,10,'2022-05-11 21:05:38','2022-05-11 21:05:38',7,52),(10,10,'2022-05-08 17:16:02','2022-05-08 17:16:02',9,41),(10,10,'2022-05-08 17:16:34','2022-05-08 17:16:34',9,42),(10,10,'2022-05-08 17:17:55','2022-05-08 17:17:55',9,43),(10,100,'2022-05-08 17:35:41','2022-05-08 17:35:41',9,44),(10,100,'2022-05-08 17:38:11','2022-05-08 17:38:11',9,45),(10,100,'2022-05-08 17:39:03','2022-05-08 17:39:03',9,46),(10,100,'2022-05-08 17:40:41','2022-05-08 17:40:41',9,47),(6,5,'2022-05-08 17:16:02','2022-05-08 17:16:02',10,41),(6,5,'2022-05-08 17:16:34','2022-05-08 17:16:34',10,42),(6,5,'2022-05-08 17:17:56','2022-05-08 17:17:56',10,43),(6,500,'2022-05-08 17:35:41','2022-05-08 17:35:41',10,44),(6,500,'2022-05-08 17:38:11','2022-05-08 17:38:11',10,45),(6,500,'2022-05-08 17:39:03','2022-05-08 17:39:03',10,46),(6,500,'2022-05-08 17:40:41','2022-05-08 17:40:41',10,47),(2,10,'2022-05-08 17:16:02','2022-05-08 17:16:02',21,41),(2,10,'2022-05-08 17:16:34','2022-05-08 17:16:34',21,42),(2,10,'2022-05-08 17:17:57','2022-05-08 17:17:57',21,43),(2,100,'2022-05-08 17:35:41','2022-05-08 17:35:41',21,44),(2,100,'2022-05-08 17:38:11','2022-05-08 17:38:11',21,45),(2,100,'2022-05-08 17:39:03','2022-05-08 17:39:03',21,46),(2,100,'2022-05-08 17:40:41','2022-05-08 17:40:41',21,47),(5,10,'2022-05-08 17:16:02','2022-05-08 17:16:02',50,41),(5,10,'2022-05-08 17:16:34','2022-05-08 17:16:34',50,42),(5,10,'2022-05-08 17:17:58','2022-05-08 17:17:58',50,43),(5,100,'2022-05-08 17:35:41','2022-05-08 17:35:41',50,44),(5,100,'2022-05-08 17:38:11','2022-05-08 17:38:11',50,45),(5,100,'2022-05-08 17:39:03','2022-05-08 17:39:03',50,46),(5,100,'2022-05-08 17:40:41','2022-05-08 17:40:41',50,47),(6,20,'2022-04-13 09:48:02','2022-04-13 09:48:02',101,35),(6,20,'2022-04-13 09:48:25','2022-04-13 09:48:25',101,36),(8,75,'2022-05-11 18:12:23','2022-05-11 18:12:23',101,48),(8,75,'2022-05-11 18:14:10','2022-05-11 18:14:10',101,49),(8,75,'2022-05-11 18:17:25','2022-05-11 18:17:25',101,50),(8,75,'2022-05-11 18:34:59','2022-05-11 18:34:59',101,51),(1,10,'2022-05-11 21:05:38','2022-05-11 21:05:38',101,52);
/*!40000 ALTER TABLE `produits_ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` int NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `userbases`
--

DROP TABLE IF EXISTS `userbases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('user','client') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbases`
--

LOCK TABLES `userbases` WRITE;
/*!40000 ALTER TABLE `userbases` DISABLE KEYS */;
/*!40000 ALTER TABLE `userbases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `ProfileId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `ProfileId` (`ProfileId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ProfileId`) REFERENCES `profiles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0698151348','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(2,'Fidèle','Guerin','Pépin_Huet','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0521558052','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(3,'Côme','Sanchez','Joachim.Guerin2','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 490676659','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(4,'Gabin','Bonnet','Agilberte.Legall58','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0750222431','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(5,'Brieuc','Rey','Anatole98','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0356232886','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(6,'Florian','Riviere','Odette9','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0652952243','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(7,'Silvère','Charpentier','Joséphine.Dumas48','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0675185875','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(8,'Rita','Clement','Émilie_Garnier80','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 720941323','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(9,'Armel','Aubry','Valérie.Dupont86','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 524144289','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(10,'Adolphe','Robin','Marine_Prevost84','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 532229308','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(11,'Trajan','Dumont','Ursule_Dumont47','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0170498466','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(12,'Claude','Meunier','Inès.Bonnet','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 437001094','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(13,'Aubry','Schmitt','Zéphirin_Andre35','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0746626753','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(14,'Silvère','Denis','Sigebert_Breton96','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0288201498','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(15,'Victorien','Moreau','Adam70','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0234778339','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(16,'Ronan','Caron','Bruno_Roux','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 516537764','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(17,'Bon','Durand','Rebecca.Dumont','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0687671179','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(18,'Gédéon','Dupuis','Jeannel_Paul','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0373591116','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(19,'Dominique','Gautier','Stéphanie.Arnaud','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0748651674','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(20,'Rachid','Dumont','Héloïse31','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0730451391','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(21,'Christophe','Dupuy','Adalbéron48','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 417524379','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(22,'Gaston','Roche','Amiel.Baron66','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 513126203','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(23,'Aglaé','Muller','Azélie.Olivier68','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 552161281','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(24,'Yvette','David','Marius81','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 215765749','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(25,'Serge','Baron','Girart43','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 612388934','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(26,'Armand','Boyer','Antonin_Mathieu','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0622134860','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(27,'Brieuc','Leroux','Denis37','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 399808307','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(28,'Bon','Maillard','Alpinien57','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0540825946','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(29,'Valérie','Julien','Ameline.Brun51','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0728470486','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(30,'Bastien','Andre','Jules5','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 617166369','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(31,'Valéry','Bourgeois','Barthélemy95','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 538025988','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(32,'Ameline','Maillard','Léopoldine89','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0332530916','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(33,'Stéphane','Guerin','Guillaume94','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0412129728','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(34,'Martine','Joly','Clio_Faure86','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 793171380','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(35,'Serge','Renault','Salomon.Jacquet19','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 561595926','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(36,'César','Riviere','Florian.Benoit79','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0179213139','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(37,'Matthias','Schmitt','Adegrine_Deschamps55','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 391451530','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(38,'Florian','Sanchez','Claude30','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0231753643','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(39,'Eusèbe','Paul','Gaston_Duval','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 271515931','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(40,'Adalbéron','Picard','Émérance_Guerin48','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 150936539','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(41,'Honorine','Aubry','Marcelin_Sanchez','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 733552558','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(42,'Aricie','Richard','Annabelle_Denis','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 685218406','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(43,'Hippolyte','Robin','Rodolphe49','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 589820711','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(44,'Lionel','Roussel','Anicée.Vidal30','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 512367994','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(45,'Réjeanne','Marty','Acanthe22','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0359430156','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(46,'Azélie','Leroy','Blandine81','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0375013300','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(47,'Astride','Lacroix','Gui64','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0641984299','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(48,'Arnaude','Martin','Aldric_Mathieu','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0411388088','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(49,'Béranger','Marie','Coralie_Rousseau','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0195006224','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(50,'Adalard','Robert','Adalsinde64','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 463389998','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(51,'Florent','Bourgeois','Janine.Vincent','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0556740338','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(52,'Lorraine','Laine','Justine73','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0280654686','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(53,'Julia','Roche','Muriel.Hubert39','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 240487392','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(54,'Élie','Martin','Théodora_Fleury','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 182580561','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(55,'Swassane','Marty','Charline17','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0704581991','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(56,'Azélie','Louis','Athalie.Huet','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0671696701','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(57,'Bénédicte','Picard','Tatiana.Dupuis57','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0242604845','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(58,'Charles','Morin','Daniel_Dubois87','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0252580985','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(59,'Frédéric','Rodriguez','Bérard.Lefebvre7','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 244811932','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(60,'Amant','Lemoine','Frédérique34','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 698235271','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(61,'Camélien','Maillard','Sixte.Roy52','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 181975034','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(62,'Mence','Rolland','Boniface72','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0213541317','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(63,'Axel','Rey','Agilbert57','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 314248899','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(64,'Florie','Menard','Mélodie82','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0561801102','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(65,'Claire','Carpentier','Gonzague_Lemoine69','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0215997000','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(66,'Béranger','Guyot','Adélie84','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 165060399','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(67,'Christelle','Picard','Philibert.Roger','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 236741526','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(68,'Dorian','Olivier','Sauveur61','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0631761145','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(69,'Apolline','Leroy','Zéphirin58','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 288438626','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(70,'Manon','Duval','Eudes_Richard','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 592426938','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(71,'Hélier','Denis','Césaire_Roux24','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 491482083','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(72,'Patrice','Perrin','Antigone58','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 399457422','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(73,'Hector','Leroy','Jourdain77','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0113039636','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(74,'Annabelle','Berger','Xénophon.Nguyen','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0577365205','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(75,'Ariel','Joly','Enguerrand.Rolland64','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0614562726','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(76,'Maxence','Andre','Gautier_Vidal34','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0663186984','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(77,'Acace','Legrand','Joachim_Guillaume','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 524945871','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(78,'Gaël','Pierre','Maureen_Vidal93','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0264480622','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(79,'Épiphane','Laine','Loup_Leroy','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0164010129','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(80,'Venceslas','Renard','Bernadette_Schmitt','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0653489722','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(81,'Damien','Fleury','Laurence.Michel17','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0493802699','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(82,'Dieudonnée','Aubert','Quentin_Benoit20','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0498803999','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(83,'Priscille','Leclercq','Maxime_Barre','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0421064827','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(84,'Oriane','Bernard','Athalie16','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0275105590','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(85,'Martial','Caron','Adam26','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 581952734','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(86,'Mireille','Marchand','Pénélope.Gaillard','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0229961461','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(87,'Mayeul','Andre','Athina_Blanc46','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0333730039','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(88,'Clotilde','Lacroix','Ronan_David54','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0356574094','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(89,'Angilran','Gaillard','Monique_Brunet','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0132931056','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(90,'Agilbert','Aubry','Hélène_Vincent37','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0754208042','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(91,'Noémie','Gauthier','Lorrain_Masson','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0229077852','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(92,'Vigile','Pierre','Alcine_Brunet69','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 765666402','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(93,'Noé','Durand','Amélie91','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 328982581','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(94,'Lorraine','Faure','Mamert.Dupuy','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0315516080','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(95,'Amandine','Robin','Fantin_Deschamps','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0730908322','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(96,'Hippolyte','Vincent','Scholastique17','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 633327802','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(97,'Sidoine','Guerin','Armin25','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 730608996','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(98,'Julie','Martin','Gislebert73','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0516033899','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(99,'Gerbert','Girard','Athanasie32','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 379908502','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(100,'Fantin','Fabre','Renée.Moulin','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','0752957233','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1),(101,'Virginie','Renaud','Isabeau.Hubert','$2a$10$vlrSwogWdc4eVU6sMxrU3OHYL2.vaodDigbvR8jPWMXwh1D677Lfm','+33 588147470','2022-04-17 17:02:02','2022-04-17 17:02:02',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `etat` enum('en attente','en cours de livraison','livre') NOT NULL DEFAULT 'en attente',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `ClientId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `ClientId` (`ClientId`),
  CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
INSERT INTO `ventes` VALUES (22,'2022-04-03 11:58:44','en attente','2022-04-03 11:58:44','2022-04-03 11:58:44',NULL,1,5),(23,'2022-04-03 11:59:10','en attente','2022-04-03 11:59:10','2022-04-03 11:59:10',NULL,1,5),(24,'2022-04-03 11:59:32','en attente','2022-04-03 11:59:32','2022-04-03 11:59:32',NULL,1,5),(25,'2022-04-03 11:59:32','en attente','2022-04-03 11:59:32','2022-04-03 11:59:32',NULL,1,5),(26,'2022-04-03 11:59:45','en attente','2022-04-03 11:59:45','2022-04-03 11:59:45',NULL,1,5),(27,'2022-04-03 12:02:02','en attente','2022-04-03 12:02:02','2022-04-03 12:02:02',NULL,1,5),(28,'2022-04-03 12:02:36','en attente','2022-04-03 12:02:36','2022-04-03 12:02:36',NULL,1,5),(29,'2022-04-03 12:03:47','en attente','2022-04-03 12:03:47','2022-04-03 12:03:47',NULL,1,5),(30,'2022-04-03 12:04:26','en attente','2022-04-03 12:04:26','2022-04-03 12:04:26',NULL,1,5),(31,'2022-04-03 12:26:03','en attente','2022-04-03 12:26:03','2022-04-03 12:26:03',NULL,1,5),(32,'2022-04-03 12:26:09','en attente','2022-04-03 12:26:09','2022-04-03 12:26:09',NULL,1,14),(33,'2022-04-03 15:18:16','en attente','2022-04-03 15:18:16','2022-04-03 15:18:16',NULL,1,24),(34,'2022-04-03 21:01:50','en attente','2022-04-03 21:01:50','2022-04-03 21:01:50',NULL,1,14),(35,'2022-04-13 09:48:01','en attente','2022-04-13 09:48:01','2022-04-13 09:48:01',NULL,4,14),(36,'2022-04-13 09:48:25','en attente','2022-04-13 09:48:25','2022-04-13 09:48:25',NULL,4,14),(37,'2022-04-13 10:02:44','en attente','2022-04-13 10:02:44','2022-04-13 10:02:44',NULL,1,24),(38,'2022-05-08 16:42:48','en attente','2022-05-08 16:42:48','2022-05-08 16:42:48',NULL,NULL,49),(39,'2022-05-08 16:45:45','en attente','2022-05-08 16:45:45','2022-05-08 16:45:45',NULL,NULL,49),(40,'2022-05-08 16:47:41','en attente','2022-05-08 16:47:41','2022-05-08 16:47:41',NULL,NULL,49),(41,'2022-05-08 17:16:01','en attente','2022-05-08 17:16:01','2022-05-08 17:16:01',NULL,NULL,49),(42,'2022-05-08 17:16:34','en attente','2022-05-08 17:16:34','2022-05-08 17:16:34',NULL,NULL,49),(43,'2022-05-08 17:17:51','en attente','2022-05-08 17:17:51','2022-05-08 17:17:51',NULL,NULL,49),(44,'2022-05-08 17:35:40','en attente','2022-05-08 17:35:40','2022-05-08 17:35:40',NULL,NULL,49),(45,'2022-05-08 17:38:11','en attente','2022-05-08 17:38:11','2022-05-08 17:38:11',NULL,NULL,49),(46,'2022-05-08 17:39:03','en attente','2022-05-08 17:39:03','2022-05-08 17:39:03',NULL,NULL,49),(47,'2022-05-08 17:40:41','en attente','2022-05-08 17:40:41','2022-05-08 17:40:41',NULL,NULL,49),(48,'2022-05-11 18:12:23','en attente','2022-05-11 18:12:23','2022-05-11 18:12:23',NULL,NULL,49),(49,'2022-05-11 18:14:10','en attente','2022-05-11 18:14:10','2022-05-11 18:14:10',NULL,NULL,49),(50,'2022-05-11 18:17:25','en attente','2022-05-11 18:17:25','2022-05-11 18:17:25',NULL,NULL,49),(51,'2022-05-11 18:34:59','en attente','2022-05-11 18:34:59','2022-05-11 18:34:59',NULL,NULL,49),(52,'2022-05-11 21:05:38','en attente','2022-05-11 21:05:38','2022-05-11 21:05:38',NULL,NULL,49);
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wilayas`
--

DROP TABLE IF EXISTS `wilayas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wilayas` (
  `id` int NOT NULL AUTO_INCREMENT,
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
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-21  0:00:34
