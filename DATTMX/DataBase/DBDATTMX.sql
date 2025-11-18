-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dattmx
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tcolonies`
--

DROP TABLE IF EXISTS `tcolonies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcolonies` (
  `iIdColony` int NOT NULL AUTO_INCREMENT,
  `iIdZipCode` int NOT NULL,
  `sColony` varchar(150) NOT NULL,
  `bActive` tinyint(1) DEFAULT '1',
  `dDateCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dDateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdColony`),
  KEY `fk_colony_zipcode` (`iIdZipCode`),
  CONSTRAINT `fk_colony_zipcode` FOREIGN KEY (`iIdZipCode`) REFERENCES `tzipcodes` (`iIdZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcolonies`
--

LOCK TABLES `tcolonies` WRITE;
/*!40000 ALTER TABLE `tcolonies` DISABLE KEYS */;
INSERT INTO `tcolonies` VALUES (1,1,'Victoria de Durango Centro',1,'2025-11-17 00:18:28',NULL,NULL),(2,2,'Héctor Mayagoitia Domínguez',1,'2025-11-17 00:18:28',NULL,NULL),(3,3,'Doroteo Arango (Ciénega de Basoco)',1,'2025-11-17 00:18:28',NULL,NULL),(4,4,'Canelas',1,'2025-11-17 00:18:28',NULL,NULL),(5,5,'La Yerbabuena',1,'2025-11-17 00:18:28',NULL,NULL),(6,6,'El Saucito',1,'2025-11-17 00:18:28',NULL,NULL),(7,3,'El Molino Tercero',1,'2025-11-17 00:18:28',NULL,NULL),(8,4,'Los Fresnos',1,'2025-11-17 00:18:28',NULL,NULL),(9,5,'La Cañada del Macho',1,'2025-11-17 00:18:28',NULL,NULL),(10,6,'La Nopalera',1,'2025-11-17 00:18:28',NULL,NULL),(11,7,'Toluca de Lerdo Centro',1,'2025-11-17 00:18:53',NULL,NULL),(12,8,'Celanese',1,'2025-11-17 00:18:53',NULL,NULL),(13,9,'Los Nogales',1,'2025-11-17 00:18:53',NULL,NULL),(14,10,'El Salitre Bramador',1,'2025-11-17 00:18:53',NULL,NULL),(15,11,'Santa Barbara',1,'2025-11-17 00:18:53',NULL,NULL),(16,12,'Ampliacion Evolucion',1,'2025-11-17 00:18:53',NULL,NULL),(17,13,'General Jose Vicente Villada',1,'2025-11-17 00:18:53',NULL,NULL),(18,14,'Ampliacion Gral Jose Vicente Villada Oriente',1,'2025-11-17 00:18:53',NULL,NULL),(19,15,'Ampliacion Gral Jose Vicente Villada Poniente',1,'2025-11-17 00:18:53',NULL,NULL),(20,16,'Atlacomulco',1,'2025-11-17 00:18:53',NULL,NULL),(21,17,'Monterrey Centro',1,'2025-11-17 00:19:25',NULL,NULL),(22,18,'Obrera',1,'2025-11-17 00:19:25',NULL,NULL),(23,19,'Desarrollo Urbano Reforma',1,'2025-11-17 00:19:25',NULL,NULL),(24,20,'Condominios Constitucion',1,'2025-11-17 00:19:25',NULL,NULL),(25,21,'Ninos Heroes',1,'2025-11-17 00:19:25',NULL,NULL),(26,22,'Corinto Residencial',1,'2025-11-17 00:19:25',NULL,NULL),(27,23,'El Charco',1,'2025-11-17 00:19:25',NULL,NULL),(28,24,'Dulces Nombres (Santa Teresa)',1,'2025-11-17 00:19:25',NULL,NULL),(29,25,'San Josecito',1,'2025-11-17 00:19:25',NULL,NULL),(30,26,'La Joya del Zacate',1,'2025-11-17 00:19:25',NULL,NULL);
/*!40000 ALTER TABLE `tcolonies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcountries`
--

DROP TABLE IF EXISTS `tcountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcountries` (
  `iIdCountry` int NOT NULL AUTO_INCREMENT,
  `sCountry` varchar(100) NOT NULL,
  `bActive` tinyint(1) DEFAULT '1',
  `dDateCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dDateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcountries`
--

LOCK TABLES `tcountries` WRITE;
/*!40000 ALTER TABLE `tcountries` DISABLE KEYS */;
INSERT INTO `tcountries` VALUES (1,'Mexico',1,'2025-11-17 00:18:28',NULL,NULL);
/*!40000 ALTER TABLE `tcountries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcustomeraddresses`
--

DROP TABLE IF EXISTS `tcustomeraddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcustomeraddresses` (
  `iIdCustomerAddress` int NOT NULL AUTO_INCREMENT,
  `iIdCustomer` int NOT NULL,
  `iIdColony` int NOT NULL,
  `sStreet` varchar(150) NOT NULL,
  `sExteriorNumber` varchar(10) NOT NULL,
  `sInteriorNumber` varchar(10) DEFAULT NULL,
  `sReference` varchar(255) DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1',
  `dDateCreate` datetime DEFAULT NULL,
  `dDateUpdate` datetime DEFAULT NULL,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdCustomerAddress`),
  KEY `fk_caddr_colony` (`iIdColony`),
  CONSTRAINT `fk_caddr_colony` FOREIGN KEY (`iIdColony`) REFERENCES `tcolonies` (`iIdColony`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcustomeraddresses`
--

LOCK TABLES `tcustomeraddresses` WRITE;
/*!40000 ALTER TABLE `tcustomeraddresses` DISABLE KEYS */;
INSERT INTO `tcustomeraddresses` VALUES (1,1,7,'Av. Principal','120','B-12','Frente a la plaza',_binary '','2025-11-16 07:19:28',NULL,NULL),(2,2,7,'Av. Principal','120','B-12','Frente a la plaza',_binary '','2025-11-16 07:19:55',NULL,NULL),(3,2,8,'Av. jahskdjl','125','','Frente a la iglesia',_binary '\0','2025-11-16 07:20:21','2025-11-16 07:21:51','2025-11-16 07:22:20'),(4,4,7,'inteligencia','324','','',_binary '','2025-11-16 23:31:20',NULL,NULL);
/*!40000 ALTER TABLE `tcustomeraddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcustomers`
--

DROP TABLE IF EXISTS `tcustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcustomers` (
  `iIdCustomer` int NOT NULL AUTO_INCREMENT,
  `sCustomerName` varchar(150) NOT NULL,
  `sPhone` varchar(15) DEFAULT NULL,
  `sEmail` varchar(100) DEFAULT NULL,
  `sRFC` varchar(20) DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1',
  `dDateCreate` datetime DEFAULT NULL,
  `dDateUpdate` datetime DEFAULT NULL,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdCustomer`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcustomers`
--

LOCK TABLES `tcustomers` WRITE;
/*!40000 ALTER TABLE `tcustomers` DISABLE KEYS */;
INSERT INTO `tcustomers` VALUES (1,'Pedro Ramírez','8112009090','pedro.ramirez@example.com','RAMP800101ABC',_binary '','2025-11-16 05:45:00','2025-11-16 06:13:19',NULL),(2,'Pedro Ramírez','811200901','ramirez@example.com','RAMP800101ABt',_binary '\0','2025-11-16 05:46:21','2025-11-16 06:31:20','2025-11-16 06:32:32'),(3,'Edgar','1234567890','ebeltran@prueba.com','asdfghjklq',_binary '','2025-11-16 06:33:44',NULL,NULL),(4,'Ariel','8907654321','ariel@prueba.com','zxcvbnmlkj',_binary '','2025-11-16 23:31:20','2025-11-17 06:56:42',NULL);
/*!40000 ALTER TABLE `tcustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmunicipalities`
--

DROP TABLE IF EXISTS `tmunicipalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmunicipalities` (
  `iIdMunicipality` int NOT NULL AUTO_INCREMENT,
  `iIdState` int NOT NULL,
  `sMunicipality` varchar(150) NOT NULL,
  `bActive` tinyint(1) DEFAULT '1',
  `dDateCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dDateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdMunicipality`),
  KEY `fk_municipality_state` (`iIdState`),
  CONSTRAINT `fk_municipality_state` FOREIGN KEY (`iIdState`) REFERENCES `tstates` (`iIdState`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmunicipalities`
--

LOCK TABLES `tmunicipalities` WRITE;
/*!40000 ALTER TABLE `tmunicipalities` DISABLE KEYS */;
INSERT INTO `tmunicipalities` VALUES (1,1,'Durango',1,'2025-11-17 00:18:28',NULL,NULL),(2,1,'San Juan del Río',1,'2025-11-17 00:18:28',NULL,NULL),(3,1,'Canelas',1,'2025-11-17 00:18:28',NULL,NULL),(4,1,'San Dimas',1,'2025-11-17 00:18:28',NULL,NULL),(8,2,'Toluca',1,'2025-11-17 00:18:53',NULL,NULL),(9,2,'Santo Tomas',1,'2025-11-17 00:18:53',NULL,NULL),(10,2,'Nezahualcoyotl',1,'2025-11-17 00:18:53',NULL,NULL),(11,3,'Monterrey',1,'2025-11-17 00:19:25',NULL,NULL),(12,3,'General Escobedo',1,'2025-11-17 00:19:25',NULL,NULL),(13,3,'Apodaca',1,'2025-11-17 00:19:25',NULL,NULL),(14,3,'General Zaragoza',1,'2025-11-17 00:19:25',NULL,NULL),(15,3,'Mier y Noriega',1,'2025-11-17 00:19:25',NULL,NULL);
/*!40000 ALTER TABLE `tmunicipalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshipmentaddresses`
--

DROP TABLE IF EXISTS `tshipmentaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshipmentaddresses` (
  `iIdShipmentAddress` int NOT NULL AUTO_INCREMENT,
  `iIdShipment` int NOT NULL,
  `bIsOrigin` bit(1) NOT NULL,
  `iIdColony` int NOT NULL,
  `sStreet` varchar(150) NOT NULL,
  `sExteriorNumber` varchar(10) NOT NULL,
  `sInteriorNumber` varchar(10) DEFAULT NULL,
  `sReference` varchar(255) DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1',
  `dDateCreate` datetime DEFAULT NULL,
  `dDateUpdate` datetime DEFAULT NULL,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdShipmentAddress`),
  KEY `fk_addr_shipment` (`iIdShipment`),
  KEY `fk_addr_colony` (`iIdColony`),
  CONSTRAINT `fk_addr_colony` FOREIGN KEY (`iIdColony`) REFERENCES `tcolonies` (`iIdColony`),
  CONSTRAINT `fk_addr_shipment` FOREIGN KEY (`iIdShipment`) REFERENCES `tshipments` (`iIdShipment`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshipmentaddresses`
--

LOCK TABLES `tshipmentaddresses` WRITE;
/*!40000 ALTER TABLE `tshipmentaddresses` DISABLE KEYS */;
INSERT INTO `tshipmentaddresses` VALUES (1,6,_binary '',6,'pedro martinez','218','','',_binary '','2025-11-17 02:48:19',NULL,NULL),(2,6,_binary '\0',5,'palmas','453','','',_binary '','2025-11-17 02:48:21',NULL,NULL),(3,7,_binary '',11,'preuba fron','2344','','',_binary '','2025-11-17 06:52:42',NULL,NULL),(4,7,_binary '\0',25,'prueba mty','0987','','',_binary '','2025-11-17 06:52:42',NULL,NULL);
/*!40000 ALTER TABLE `tshipmentaddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshipments`
--

DROP TABLE IF EXISTS `tshipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshipments` (
  `iIdShipment` int NOT NULL AUTO_INCREMENT,
  `sGuideNumber` varchar(30) NOT NULL,
  `iIdCustomer` int NOT NULL,
  `fWeight` decimal(10,2) NOT NULL,
  `fCost` decimal(10,2) NOT NULL,
  `iIdStatus` int NOT NULL,
  `bActive` bit(1) DEFAULT b'1',
  `dDateCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dDateUpdate` datetime DEFAULT NULL,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdShipment`),
  UNIQUE KEY `sGuideNumber` (`sGuideNumber`),
  KEY `fk_ship_customer` (`iIdCustomer`),
  KEY `fk_ship_status` (`iIdStatus`),
  CONSTRAINT `fk_ship_customer` FOREIGN KEY (`iIdCustomer`) REFERENCES `tcustomers` (`iIdCustomer`),
  CONSTRAINT `fk_ship_status` FOREIGN KEY (`iIdStatus`) REFERENCES `tshipmentstatus` (`iIdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshipments`
--

LOCK TABLES `tshipments` WRITE;
/*!40000 ALTER TABLE `tshipments` DISABLE KEYS */;
INSERT INTO `tshipments` VALUES (1,'GUIA-000001',4,10.30,300.00,1,_binary '','2025-11-17 02:31:33',NULL,NULL),(2,'GUIA-000002',4,10.30,300.00,1,_binary '','2025-11-17 02:31:56','2025-11-17 06:09:43',NULL),(3,'GUIA-000003',4,10.30,300.00,1,_binary '','2025-11-17 02:38:51',NULL,NULL),(4,'GUIA-000004',4,10.30,300.00,10,_binary '','2025-11-17 02:39:17','2025-11-17 06:03:14',NULL),(5,'GUIA-000005',4,10.30,300.00,2,_binary '','2025-11-17 02:44:17','2025-11-17 05:16:03',NULL),(6,'GUIA-000006',4,10.30,300.00,2,_binary '','2025-11-17 02:47:38','2025-11-17 03:15:44',NULL),(7,'GUIA-000007',1,234.00,4545.00,1,_binary '','2025-11-17 06:52:42',NULL,NULL);
/*!40000 ALTER TABLE `tshipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tshipmentstatus`
--

DROP TABLE IF EXISTS `tshipmentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tshipmentstatus` (
  `iIdStatus` int NOT NULL AUTO_INCREMENT,
  `sStatus` varchar(50) NOT NULL,
  `bActive` bit(1) DEFAULT b'1',
  `dDateCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dDateUpdate` datetime DEFAULT NULL,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tshipmentstatus`
--

LOCK TABLES `tshipmentstatus` WRITE;
/*!40000 ALTER TABLE `tshipmentstatus` DISABLE KEYS */;
INSERT INTO `tshipmentstatus` VALUES (1,'Creado',_binary '','2025-11-16 08:23:25',NULL,NULL),(2,'Preparando envío',_binary '','2025-11-16 08:23:25',NULL,NULL),(3,'Recolectado',_binary '','2025-11-16 08:23:25',NULL,NULL),(4,'En tránsito',_binary '','2025-11-16 08:23:25',NULL,NULL),(5,'En centro de distribución',_binary '','2025-11-16 08:23:25',NULL,NULL),(6,'En ruta de entrega',_binary '','2025-11-16 08:23:25',NULL,NULL),(7,'Entregado',_binary '','2025-11-16 08:23:25',NULL,NULL),(8,'No pudo ser entregado',_binary '','2025-11-16 08:23:25',NULL,NULL),(9,'Cancelado',_binary '','2025-11-16 08:23:25',NULL,NULL),(10,'Devuelto al origen',_binary '','2025-11-16 08:23:25',NULL,NULL);
/*!40000 ALTER TABLE `tshipmentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tstates`
--

DROP TABLE IF EXISTS `tstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tstates` (
  `iIdState` int NOT NULL AUTO_INCREMENT,
  `iIdCountry` int NOT NULL,
  `sState` varchar(100) NOT NULL,
  `bActive` tinyint(1) DEFAULT '1',
  `dDateCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dDateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdState`),
  KEY `fk_state_country` (`iIdCountry`),
  CONSTRAINT `fk_state_country` FOREIGN KEY (`iIdCountry`) REFERENCES `tcountries` (`iIdCountry`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tstates`
--

LOCK TABLES `tstates` WRITE;
/*!40000 ALTER TABLE `tstates` DISABLE KEYS */;
INSERT INTO `tstates` VALUES (1,1,'Durango',1,'2025-11-17 00:18:28',NULL,NULL),(2,1,'Mexico',1,'2025-11-17 00:18:53',NULL,NULL),(3,1,'Nuevo Leon',1,'2025-11-17 00:19:25',NULL,NULL);
/*!40000 ALTER TABLE `tstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tzipcodes`
--

DROP TABLE IF EXISTS `tzipcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tzipcodes` (
  `iIdZipCode` int NOT NULL AUTO_INCREMENT,
  `iIdMunicipality` int NOT NULL,
  `sZipCode` varchar(10) NOT NULL,
  `bActive` tinyint(1) DEFAULT '1',
  `dDateCreate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dDateUpdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dDateDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`iIdZipCode`),
  KEY `fk_zipcode_municipality` (`iIdMunicipality`),
  CONSTRAINT `fk_zipcode_municipality` FOREIGN KEY (`iIdMunicipality`) REFERENCES `tmunicipalities` (`iIdMunicipality`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tzipcodes`
--

LOCK TABLES `tzipcodes` WRITE;
/*!40000 ALTER TABLE `tzipcodes` DISABLE KEYS */;
INSERT INTO `tzipcodes` VALUES (1,1,'34000',1,'2025-11-17 00:18:28',NULL,NULL),(2,1,'34010',1,'2025-11-17 00:18:28',NULL,NULL),(3,2,'34497',1,'2025-11-17 00:18:28',NULL,NULL),(4,3,'34500',1,'2025-11-17 00:18:28',NULL,NULL),(5,3,'34510',1,'2025-11-17 00:18:28',NULL,NULL),(6,4,'34696',1,'2025-11-17 00:18:28',NULL,NULL),(7,8,'50000',1,'2025-11-17 00:18:53',NULL,NULL),(8,8,'50010',1,'2025-11-17 00:18:53',NULL,NULL),(9,9,'51105',1,'2025-11-17 00:18:53',NULL,NULL),(10,9,'51106',1,'2025-11-17 00:18:53',NULL,NULL),(11,9,'51108',1,'2025-11-17 00:18:53',NULL,NULL),(12,10,'57709',1,'2025-11-17 00:18:53',NULL,NULL),(13,10,'57710',1,'2025-11-17 00:18:53',NULL,NULL),(14,10,'57718',1,'2025-11-17 00:18:53',NULL,NULL),(15,10,'57719',1,'2025-11-17 00:18:53',NULL,NULL),(16,10,'57720',1,'2025-11-17 00:18:53',NULL,NULL),(17,11,'64000',1,'2025-11-17 00:19:25',NULL,NULL),(18,11,'64010',1,'2025-11-17 00:19:25',NULL,NULL),(19,11,'64018',1,'2025-11-17 00:19:25',NULL,NULL),(20,11,'64019',1,'2025-11-17 00:19:25',NULL,NULL),(21,12,'66052',1,'2025-11-17 00:19:25',NULL,NULL),(22,13,'66630',1,'2025-11-17 00:19:25',NULL,NULL),(23,14,'67966',1,'2025-11-17 00:19:25',NULL,NULL),(24,14,'67967',1,'2025-11-17 00:19:25',NULL,NULL),(25,14,'67972',1,'2025-11-17 00:19:25',NULL,NULL),(26,15,'67980',1,'2025-11-17 00:19:25',NULL,NULL);
/*!40000 ALTER TABLE `tzipcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dattmx'
--
/*!50003 DROP PROCEDURE IF EXISTS `procCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustomer`(
    IN p_iIdCustomer INT
)
BEGIN

    SELECT
        tC.iIdCustomer,
        tC.sCustomerName,
        tC.sPhone,
        tC.sEmail,
        tC.sRFC,
        tS.sState,
        tM.sMunicipality,
        tZ.sZipCode,
        tCol.sColony,
        tCA.sStreet,
        tCA.sExteriorNumber,
        tCA.sInteriorNumber,
        tCA.sReference,
        tC.bActive
    FROM tCustomers AS tC
    INNER JOIN tCustomerAddresses AS tCA
        ON tCA.iIdCustomer = tC.iIdCustomer
    INNER JOIN tColonies AS tCol
        ON tCol.iIdColony = tCA.iIdColony
    INNER JOIN tZipCodes AS tZ
        ON tZ.iIdZipCode = tCol.iIdZipCode
    INNER JOIN tMunicipalities AS tM
        ON tM.iIdMunicipality = tZ.iIdMunicipality
    INNER JOIN tStates AS tS
        ON tS.iIdState = tM.iIdState
    WHERE tC.bActive = 1
      AND (p_iIdCustomer IS NULL OR p_iIdCustomer = 0 OR tC.iIdCustomer = p_iIdCustomer);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procCustomerABC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustomerABC`(
    IN p_iIdCustomer INT,
    IN p_sCustomerName VARCHAR(150),
    IN p_sPhone VARCHAR(15),
    IN p_sEmail VARCHAR(100),
    IN p_sRFC VARCHAR(20),
    IN p_bActive BIT,
    IN p_bDelete BIT
)
procCustomerABC:BEGIN
    DECLARE iAction INT DEFAULT 0;
    DECLARE iExists INT DEFAULT 0;

    -- ================================================
    -- Determinar acción (1=Insert, 2=Update, 3=Delete)
    -- ================================================
    IF (IFNULL(p_iIdCustomer,0) > 0 AND IFNULL(p_bDelete,0) = 1) THEN
        SET iAction = 3;   
    ELSEIF (IFNULL(p_iIdCustomer,0) > 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 2;   
    ELSEIF (IFNULL(p_iIdCustomer,0) = 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 1;   
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se enviaron parámetros válidos.';
    END IF;


    -- ================================================
    -- DELETE LÓGICO
    -- ================================================
    IF iAction = 3 THEN

        IF NOT EXISTS (SELECT 1 FROM tCustomers WHERE iIdCustomer = p_iIdCustomer AND bActive = 1) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cliente no existe o ya está inactivo.';
        END IF;

        UPDATE tCustomers
        SET bActive = 0,
            dDateDelete = NOW()
        WHERE iIdCustomer = p_iIdCustomer
          AND bActive = 1;

        SELECT 0 AS iError, 'Cliente eliminado correctamente.' AS sMessage, p_iIdCustomer AS iId;
        LEAVE procCustomerABC;
    END IF;


    -- ================================================
    -- VALIDACIONES GENERALES PARA INSERT / UPDATE
    -- ================================================
    IF IFNULL(p_sCustomerName,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre del cliente es obligatorio.';
    END IF;

    IF IFNULL(p_sPhone,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El teléfono es obligatorio.';
    END IF;

    IF IFNULL(p_sEmail,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correo es obligatorio.';
    END IF;

    IF IFNULL(p_sRFC,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El RFC es obligatorio.';
    END IF;


    -- ================================================
    -- Validación de duplicados
    -- ================================================
    SELECT COUNT(*) INTO iExists
    FROM tCustomers c
    WHERE (c.sPhone = p_sPhone OR c.sEmail = p_sEmail OR c.sRFC = p_sRFC)
      AND (iAction = 1 OR c.iIdCustomer <> p_iIdCustomer);

    IF iExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El teléfono, correo o RFC ya existen en otro cliente.';
    END IF;


    -- ================================================
    -- INSERT
    -- ================================================
    IF iAction = 1 THEN

        INSERT INTO tCustomers (
            sCustomerName, sPhone, sEmail, sRFC, bActive, dDateCreate
        ) VALUES (
            p_sCustomerName, p_sPhone, p_sEmail, p_sRFC, 1, NOW()
        );

        SELECT 0 AS iError, 'Cliente insertado correctamente.' AS sMessage, LAST_INSERT_ID() AS iId;
        LEAVE procCustomerABC;
    END IF;


    -- ================================================
    -- UPDATE
    -- ================================================
    IF iAction = 2 THEN

        IF p_iIdCustomer = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El Id del cliente es obligatorio para actualizar.';
        END IF;

        UPDATE tCustomers
        SET sCustomerName = p_sCustomerName,
            sPhone = p_sPhone,
            sEmail = p_sEmail,
            sRFC = p_sRFC,
            bActive = p_bActive,
            dDateUpdate = NOW()
        WHERE iIdCustomer = p_iIdCustomer;

        SELECT 0 AS iError, 'Cliente actualizado correctamente.' AS sMessage, p_iIdCustomer AS iId;
        LEAVE procCustomerABC;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procCustomerAddressesABC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procCustomerAddressesABC`(
    IN p_iIdCustomerAddress INT,
    IN p_iIdCustomer INT,
    IN p_iIdColony INT,
    IN p_sStreet VARCHAR(150),
    IN p_sExteriorNumber VARCHAR(10),
    IN p_sInteriorNumber VARCHAR(10),
    IN p_sReference VARCHAR(255),
    IN p_bDelete TINYINT
)
proc:BEGIN   -- <<<<<<<<<<<<<< Etiqueta agregada
    DECLARE iAction INT DEFAULT 0;
    DECLARE iExists INT DEFAULT 0;
    DECLARE iId INT DEFAULT IFNULL(p_iIdCustomerAddress,0);
    DECLARE iError INT DEFAULT 0;

    -- Determinar acción: 1=Insert, 2=Update, 3=Delete
    IF (iId > 0 AND IFNULL(p_bDelete,0) = 1) THEN
        SET iAction = 3;
    ELSEIF (iId > 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 2;
    ELSEIF (iId = 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 1;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Parámetros inválidos.';
    END IF;

    -- DELETE lógico
    IF iAction = 3 THEN
        
        IF NOT EXISTS (SELECT 1 FROM tCustomerAddresses WHERE iIdCustomerAddress = iId AND bActive = 1) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La dirección ya se encuentra eliminada o no existe.';
        END IF;

        UPDATE tCustomerAddresses
           SET bActive = 0,
               dDateDelete = NOW()
         WHERE iIdCustomerAddress = iId
           AND bActive = 1;

        SELECT iError AS iError, 'Dirección eliminada correctamente.' AS sMessage, iId AS iId;
        LEAVE proc;  -- <<<<<< Ya funciona
    END IF;

    -- INSERT / UPDATE COMPARTEN VALIDACIONES
    IF IFNULL(p_iIdCustomer,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe especificar el cliente.';
    END IF;

    IF IFNULL(p_iIdColony,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe especificar la colonia.';
    END IF;

    IF IFNULL(p_sStreet,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La calle es obligatoria.';
    END IF;

    IF IFNULL(p_sExteriorNumber,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El número exterior es obligatorio.';
    END IF;

    -- Validación de direcciones repetidas en el mismo cliente
    SELECT COUNT(*) INTO iExists
      FROM tCustomerAddresses
     WHERE iIdCustomer = p_iIdCustomer
       AND iIdColony   = p_iIdColony
       AND sStreet     = p_sStreet
       AND sExteriorNumber = p_sExteriorNumber
       AND bActive = 1
       AND (iAction = 1 OR iIdCustomerAddress <> iId);

    IF iExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente ya tiene registrada esta misma dirección.';
    END IF;

    -- INSERT
    IF iAction = 1 THEN
        INSERT INTO tCustomerAddresses (
            iIdCustomer,
            iIdColony,
            sStreet,
            sExteriorNumber,
            sInteriorNumber,
            sReference,
            dDateCreate
        )
        VALUES (
            p_iIdCustomer,
            p_iIdColony,
            p_sStreet,
            p_sExteriorNumber,
            p_sInteriorNumber,
            p_sReference,
            NOW()
        );

        SET iId = LAST_INSERT_ID();

        SELECT iError AS iError, 'Dirección insertada correctamente.' AS sMessage, iId AS iId;
        LEAVE proc;
    END IF;

    -- UPDATE
    IF iAction = 2 THEN
        UPDATE tCustomerAddresses
           SET iIdColony       = p_iIdColony,
               sStreet         = p_sStreet,
               sExteriorNumber = p_sExteriorNumber,
               sInteriorNumber = p_sInteriorNumber,
               sReference      = p_sReference,
               dDateUpdate     = NOW()
         WHERE iIdCustomerAddress = iId;

        IF ROW_COUNT() = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se encontró la dirección para actualizar.';
        END IF;

        SELECT iError AS iError, 'Dirección actualizada correctamente.' AS sMessage, iId AS iId;
    END IF;

END proc ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procGeneralList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGeneralList`(
    IN p_sCode VARCHAR(100),
    IN p_iId INT
)
procGeneralList: BEGIN

    DECLARE p_sState VARCHAR(255) DEFAULT 'States';
    DECLARE p_sMunicipalitiesByStates VARCHAR(255) DEFAULT 'MunicipalitiesByStates';
    DECLARE p_sZipCodesByMunicipalities VARCHAR(255) DEFAULT 'ZipCodesByMunicipalities';
    DECLARE p_sColoniesByZipCodes VARCHAR(255) DEFAULT 'ColoniesByZipCodes';
    DECLARE p_sCustomer VARCHAR(255) DEFAULT 'Customer';
    DECLARE p_sShipmentstatus VARCHAR(255) DEFAULT 'Shipmentstatus';

    IF (p_sState = p_sCode) THEN
        SELECT
            iIdState AS 'Label'
            ,sState AS 'Value'
            ,p_iId AS 'IdExtra'
        FROM tStates
        WHERE bActive = 1
			AND ( p_iId IS NULL
           OR iIdState = p_iId)
           ORDER BY sState ASC;
    END IF;
    
    IF (p_sMunicipalitiesByStates = p_sCode) THEN
        SELECT
            iIdMunicipality AS 'Label'
            ,sMunicipality AS 'Value'
            ,p_iId AS 'IdExtra'
        FROM tmunicipalities
        WHERE bActive = 1
			AND ( p_iId IS NULL
           OR iIdState = p_iId)
           ORDER BY sMunicipality ASC;
    END IF;
    
    IF (p_sZipCodesByMunicipalities = p_sCode) THEN
        SELECT
            iIdZipCode AS 'Label'
            ,sZipCode AS 'Value'
            ,p_iId AS 'IdExtra'
        FROM tzipcodes
        WHERE bActive = 1
			AND ( p_iId IS NULL
           OR iIdMunicipality = p_iId)
           ORDER BY sZipCode ASC;
    END IF;
    
    IF (p_sColoniesByZipCodes = p_sCode) THEN
        SELECT
            iIdColony AS 'Label'
            ,sColony AS 'Value'
            ,p_iId AS 'IdExtra'
        FROM tcolonies
        WHERE bActive = 1
			AND (p_iId IS NULL
           OR iIdZipCode = p_iId)
           ORDER BY sColony ASC;
    END IF;
    
    IF (p_sCustomer = p_sCode) THEN
        SELECT
            iIdCustomer AS 'Label'
            ,sCustomerName AS 'Value'
            ,p_iId AS 'IdExtra'
        FROM tcustomers
        WHERE bActive = 1
			AND (p_iId IS NULL
           OR iIdCustomer = p_iId)
           ORDER BY sCustomerName ASC;
    END IF;
    
    
    IF (p_sShipmentstatus = p_sCode) THEN
        SELECT
            iIdStatus AS 'Label'
            ,sStatus AS 'Value'
            ,p_iId AS 'IdExtra'
        FROM tshipmentstatus
        WHERE bActive = 1
			AND (p_iId IS NULL
           OR iIdStatus = p_iId)
           ORDER BY sStatus ASC;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procShipmentAddressesABC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procShipmentAddressesABC`(
    IN p_iIdShipmentAddress INT,
    IN p_iIdShipment INT,
    IN p_bIsOrigin BIT,
    IN p_iIdColony INT,
    IN p_sStreet VARCHAR(150),
    IN p_sExteriorNumber VARCHAR(10),
    IN p_sInteriorNumber VARCHAR(10),
    IN p_sReference VARCHAR(255),
    IN p_bActive BIT,
    IN p_bDelete BIT
)
procShipmentAddressesABC: BEGIN

    DECLARE iAction INT DEFAULT 0;
    DECLARE iId INT DEFAULT IFNULL(p_iIdShipmentAddress,0);
    DECLARE iExists INT DEFAULT 0;
    DECLARE iError INT DEFAULT 0;

    -- ------------------------------------------------------------
    -- Determinar acción
    -- ------------------------------------------------------------
    IF (iId > 0 AND IFNULL(p_bDelete,0) = 1) THEN
        SET iAction = 3; -- DELETE
    ELSEIF (iId > 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 2; -- UPDATE
    ELSEIF (iId = 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 1; -- INSERT
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Parámetros inválidos.';
    END IF;


    -- ------------------------------------------------------------
    -- DELETE LÓGICO
    -- ------------------------------------------------------------
    IF iAction = 3 THEN
        
        IF NOT EXISTS (SELECT 1 FROM tShipmentAddresses WHERE iIdShipmentAddress = iId AND bActive = 1) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La dirección no existe o ya está eliminada.';
        END IF;

        UPDATE tShipmentAddresses
           SET bActive    = 0,
               dDateDelete = NOW()
         WHERE iIdShipmentAddress = iId
           AND bActive = 1;

        SELECT iError AS iError,'Dirección de envío eliminada correctamente.' AS sMessage,
               iId AS iId;

        LEAVE procShipmentAddressesABC;
    END IF;


    -- ------------------------------------------------------------
    -- VALIDACIONES COMUNES
    -- ------------------------------------------------------------
    IF IFNULL(p_iIdShipment,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe proporcionar un envío válido.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tShipments WHERE iIdShipment = p_iIdShipment AND bActive = 1) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El envío no existe o está inactivo.';
    END IF;

    IF IFNULL(p_bIsOrigin,-1) NOT IN (0,1) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe especificar si es dirección de origen (1) o destino (0).';
    END IF;

    IF IFNULL(p_iIdColony,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe especificar la colonia.';
    END IF;

    IF IFNULL(p_sStreet,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La calle es obligatoria.';
    END IF;

    IF IFNULL(p_sExteriorNumber,'') = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El número exterior es obligatorio.';
    END IF;

	IF EXISTS(Select 1 from tShipmentAddresses where iIdShipment = p_iIdShipment AND bIsOrigin = p_bIsOrigin) THEN 
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe una direccion de este tipo.';
    END IF;

    -- ------------------------------------------------------------
    -- Validación de duplicados por envío (no repetir)
    -- ------------------------------------------------------------
    SELECT COUNT(*) INTO iExists
      FROM tShipmentAddresses
     WHERE iIdShipment     = p_iIdShipment
       AND iIdColony       = p_iIdColony
       AND sStreet         = p_sStreet
       AND sExteriorNumber = p_sExteriorNumber
       AND bActive = 1
       AND (iAction = 1 OR iIdShipmentAddress <> iId);

    IF iExists > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Este envío ya tiene registrada esta misma dirección.';
    END IF;


    -- ------------------------------------------------------------
    -- INSERT
    -- ------------------------------------------------------------
    IF iAction = 1 THEN
        INSERT INTO tShipmentAddresses (
            iIdShipment,
            bIsOrigin,
            iIdColony,
            sStreet,
            sExteriorNumber,
            sInteriorNumber,
            sReference,
            dDateCreate
        )
        VALUES (
            p_iIdShipment,
            p_bIsOrigin,
            p_iIdColony,
            p_sStreet,
            p_sExteriorNumber,
            p_sInteriorNumber,
            p_sReference,
            NOW()
        );

        SET iId = LAST_INSERT_ID();

        SELECT iError AS iError,'Dirección de envío registrada correctamente.' AS sMessage,
               iId AS iId;

        LEAVE procShipmentAddressesABC;
    END IF;


    -- ------------------------------------------------------------
    -- UPDATE
    -- ------------------------------------------------------------
    IF iAction = 2 THEN
        
        IF NOT EXISTS (SELECT 1 FROM tShipmentAddresses WHERE iIdShipmentAddress = iId AND bActive = 1) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La dirección no existe o está eliminada.';
        END IF;

        UPDATE tShipmentAddresses
           SET bIsOrigin      = p_bIsOrigin,
               iIdColony       = p_iIdColony,
               sStreet         = p_sStreet,
               sExteriorNumber = p_sExteriorNumber,
               sInteriorNumber = p_sInteriorNumber,
               sReference      = p_sReference,
               bActive         = p_bActive,
               dDateUpdate     = NOW()
         WHERE iIdShipmentAddress = iId;

        SELECT iError AS iError,'Dirección de envío actualizada correctamente.' AS sMessage,
               iId AS iId;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procShipmentsABC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procShipmentsABC`(
    IN p_iIdShipment INT,
    IN p_iIdCustomer INT,
    IN p_fWeight DECIMAL(10,2),
    IN p_fCost DECIMAL(10,2),
    IN p_iIdStatus INT,
    IN p_bActive BIT,
    IN p_bDelete BIT
)
procShipmentsABC: BEGIN
    DECLARE iAction INT DEFAULT 0;
    DECLARE iId INT DEFAULT IFNULL(p_iIdShipment,0);
    DECLARE sNewGuide VARCHAR(30);
    DECLARE nextFolio INT DEFAULT 0;
    DECLARE iError INT DEFAULT 0;

    -- Determinar acción: 1=Insert, 2=Update, 3=Delete
    IF (iId > 0 AND IFNULL(p_bDelete,0) = 1) THEN
        SET iAction = 3;
    ELSEIF (iId > 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 2;
    ELSEIF (iId = 0 AND IFNULL(p_bDelete,0) = 0) THEN
        SET iAction = 1;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Parámetros inválidos.';
    END IF;

    -- ===================================================
    -- DELETE LOGICO
    -- ===================================================
    IF iAction = 3 THEN
        
        IF NOT EXISTS (SELECT 1 FROM tShipments WHERE iIdShipment = iId AND bActive = 1) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El envío no existe o ya está eliminado.';
        END IF;

        UPDATE tShipments
           SET bActive = 0,
               dDateDelete = NOW()
         WHERE iIdShipment = iId
           AND bActive = 1;

        SELECT iError AS iError, 'Envío eliminado correctamente.' AS sMessage, iId AS iId;
        LEAVE procShipmentsABC;
    END IF;

    -- ===================================================
    -- VALIDACIONES GENERALES
    -- ===================================================
    IF IFNULL(p_iIdCustomer,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe especificar el cliente.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tCustomers WHERE iIdCustomer = p_iIdCustomer AND bActive = 1) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no existe o está inactivo.';
    END IF;

    IF IFNULL(p_iIdStatus,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe especificar el estatus.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM tShipmentStatus WHERE iIdStatus = p_iIdStatus AND bActive = 1) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El estatus no existe o está inactivo.';
    END IF;

    IF IFNULL(p_fWeight,0) <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El peso debe ser mayor a cero.';
    END IF;

    IF IFNULL(p_fCost,0) <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El costo debe ser mayor a cero.';
    END IF;

    -- ===================================================
    -- INSERT
    -- ===================================================
    IF iAction = 1 THEN
        
        SELECT COALESCE(MAX(iIdShipment), 0) + 1 INTO nextFolio
        FROM tShipments;

        SET sNewGuide = CONCAT('GUIA-', LPAD(nextFolio, 6, '0'));

        INSERT INTO tShipments (
            sGuideNumber,
            iIdCustomer,
            fWeight,
            fCost,
            iIdStatus,
            dDateCreate
        )
        VALUES (
            sNewGuide,
            p_iIdCustomer,
            p_fWeight,
            p_fCost,
            p_iIdStatus,
            NOW()
        );

        SET iId = LAST_INSERT_ID();

        SELECT iError AS iError,'Envío registrado correctamente.' AS sMessage,
               iId AS iId,
               sNewGuide AS sGuideNumber;

        LEAVE procShipmentsABC;
    END IF;

    -- ===================================================
    -- UPDATE
    -- ===================================================
    IF iAction = 2 THEN
        
        IF NOT EXISTS (SELECT 1 FROM tShipments WHERE iIdShipment = iId AND bActive = 1) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El envío no existe o está eliminado.';
        END IF;

        UPDATE tShipments
           SET iIdCustomer = p_iIdCustomer,
               fWeight     = p_fWeight,
               fCost       = p_fCost,
               iIdStatus   = p_iIdStatus,
               bActive     = p_bActive,
               dDateUpdate = NOW()
         WHERE iIdShipment = iId;

        SELECT iError AS iError, 'Envío actualizado correctamente.' AS sMessage,
               iId AS iId;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procShipmentsList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procShipmentsList`(
	IN p_iIdShipment INT,
    IN p_sGuideNumber VARCHAR(50),
    IN p_iIdCustomer INT,
    IN p_iIdStatus INT
)
BEGIN

    SELECT 
        s.iIdShipment,
        s.sGuideNumber,
        s.iIdCustomer,
        c.sCustomerName,
        s.fWeight,
        s.fCost,
        st.sStatus,

        -- DIRECCIÓN ORIGEN
        CONCAT(
            o.sStreet, ' #', o.sExteriorNumber,
            IF(o.sInteriorNumber IS NOT NULL AND o.sInteriorNumber <> '', CONCAT(' Int ', o.sInteriorNumber), ''),
            ', ', col_o.sColony,
            ', ', z_o.sZipCode,
            ', ', m_o.sMunicipality,
            ', ', stt_o.sState
        ) AS ShippingOriginAddress,

        -- DIRECCIÓN DESTINO
        CONCAT(
            d.sStreet, ' #', d.sExteriorNumber,
            IF(d.sInteriorNumber IS NOT NULL AND d.sInteriorNumber <> '', CONCAT(' Int ', d.sInteriorNumber), ''),
            ', ', col_d.sColony,
            ', ', z_d.sZipCode,
            ', ', m_d.sMunicipality,
            ', ', stt_d.sState
        ) AS ShippingDestinationAddress

    FROM tShipments s
    INNER JOIN tCustomers c         ON c.iIdCustomer = s.iIdCustomer
    INNER JOIN tShipmentStatus st   ON st.iIdStatus = s.iIdStatus

    -- JOIN ORIGEN
    LEFT JOIN tShipmentAddresses o       ON o.iIdShipment = s.iIdShipment AND o.bIsOrigin = 1 AND o.bActive = 1
    LEFT JOIN tColonies col_o            ON col_o.iIdColony = o.iIdColony
    LEFT JOIN tZipCodes z_o              ON z_o.iIdZipCode = col_o.iIdZipCode
    LEFT JOIN tMunicipalities m_o        ON m_o.iIdMunicipality = z_o.iIdMunicipality
    LEFT JOIN tStates stt_o              ON stt_o.iIdState = m_o.iIdState

    -- JOIN DESTINO
    LEFT JOIN tShipmentAddresses d       ON d.iIdShipment = s.iIdShipment AND d.bIsOrigin = 0 AND d.bActive = 1
    LEFT JOIN tColonies col_d            ON col_d.iIdColony = d.iIdColony
    LEFT JOIN tZipCodes z_d              ON z_d.iIdZipCode = col_d.iIdZipCode
    LEFT JOIN tMunicipalities m_d        ON m_d.iIdMunicipality = z_d.iIdMunicipality
    LEFT JOIN tStates stt_d              ON stt_d.iIdState = m_d.iIdState

    WHERE 
        s.bActive = 1
        AND (p_iIdShipment IS NULL OR p_iIdShipment = 0 OR s.iIdShipment = p_iIdShipment)
        AND (p_sGuideNumber IS NULL OR p_sGuideNumber = '' OR s.sGuideNumber LIKE CONCAT('%', p_sGuideNumber, '%'))
        AND (p_iIdCustomer IS NULL OR p_iIdCustomer = 0 OR s.iIdCustomer = p_iIdCustomer)
        AND (p_iIdStatus IS NULL OR p_iIdStatus = 0 OR s.iIdStatus = p_iIdStatus)

    ORDER BY s.iIdShipment DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procShipmentUpdateStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procShipmentUpdateStatus`(
    IN p_iIdShipment INT,
    IN p_iIdStatus   INT
)
proc:BEGIN

    DECLARE iExistsShipment INT DEFAULT 0;
    DECLARE iExistsStatus   INT DEFAULT 0;
    DECLARE iError          INT DEFAULT 0;

    -- ============================
    -- Validaciones iniciales
    -- ============================
    IF IFNULL(p_iIdShipment,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe proporcionar un envío válido (iIdShipment).';
    END IF;

    IF IFNULL(p_iIdStatus,0) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Debe proporcionar un estatus válido (iIdStatus).';
    END IF;

    -- ============================
    -- Validar existencia de envío
    -- ============================
    SELECT COUNT(*)
      INTO iExistsShipment
      FROM tShipments
     WHERE iIdShipment = p_iIdShipment
       AND bActive = 1
     LIMIT 1;

    IF iExistsShipment = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El envío proporcionado no existe o no está activo.';
    END IF;

    -- ============================
    -- Validar existencia de estatus
    -- ============================
    SELECT COUNT(*)
      INTO iExistsStatus
      FROM tShipmentStatus
     WHERE iIdStatus = p_iIdStatus
       AND bActive = 1
     LIMIT 1;

    IF iExistsStatus = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El estatus proporcionado no existe o no está activo.';
    END IF;


    -- ============================
    -- Actualización
    -- ============================
    UPDATE tShipments
       SET iIdStatus = p_iIdStatus,
           dDateUpdate = NOW()
     WHERE iIdShipment = p_iIdShipment;

    -- ============================
    -- Respuesta final
    -- ============================
    SELECT iError AS iError,
           CONCAT('Estatus actualizado correctamente a ', p_iIdStatus) AS sMessage,
           p_iIdShipment AS iId;

END proc ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17  7:15:43
