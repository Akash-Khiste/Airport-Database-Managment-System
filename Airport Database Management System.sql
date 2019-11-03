-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: fall2018dbshubham.cutrzcvjwnrd.us-east-2.rds.amazonaws.com    Database: ADBMS
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `emp_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `Account_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (5,1,'OCEAN123','DSDS2323'),(6,2,'cleo222','dsdf355'),(8,3,'axel8756','hjmgnm474'),(12,4,'Noml5534','fcndfnj434'),(18,5,'Serena','ldmfldlskfi34');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmpFlight`
--

DROP TABLE IF EXISTS `EmpFlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmpFlight` (
  `flight_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `row_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`flight_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `EmpFlight_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`),
  CONSTRAINT `EmpFlight_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpFlight`
--

LOCK TABLES `EmpFlight` WRITE;
/*!40000 ALTER TABLE `EmpFlight` DISABLE KEYS */;
INSERT INTO `EmpFlight` VALUES (1,11,'2018-11-24 14:46:50',1),(2,20,'2018-11-24 14:46:50',1),(3,11,'2018-11-24 14:46:50',1),(5,9,'2018-11-24 14:46:50',1),(7,9,'2018-11-24 14:46:50',1),(9,11,'2018-11-24 14:46:50',1),(10,20,'2018-11-24 14:46:50',1),(12,9,'2018-11-24 14:46:50',1),(13,9,'2018-12-01 19:08:44',4),(13,10,'2018-12-01 19:06:07',3),(14,9,'2018-11-26 05:52:29',1),(15,11,'2018-11-24 14:46:50',1),(15,20,'2018-11-24 14:46:50',1),(16,9,'2018-11-24 14:46:50',1),(21,9,'2018-12-01 19:18:04',1),(21,20,'2018-11-24 14:46:50',1);
/*!40000 ALTER TABLE `EmpFlight` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sgupta37`@`%`*/ /*!50003 TRIGGER before_empflight_insert
BEFORE INSERT ON EmpFlight
FOR EACH ROW
BEGIN
SET new.last_modified_at = now(), new.row_version=new.row_version+1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EmpLounge`
--

DROP TABLE IF EXISTS `EmpLounge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmpLounge` (
  `lounge_terminal_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `row_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lounge_terminal_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `EmpLounge_ibfk_1` FOREIGN KEY (`lounge_terminal_id`) REFERENCES `Lounge` (`lounge_terminal_id`),
  CONSTRAINT `EmpLounge_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpLounge`
--

LOCK TABLES `EmpLounge` WRITE;
/*!40000 ALTER TABLE `EmpLounge` DISABLE KEYS */;
INSERT INTO `EmpLounge` VALUES (1,10,'2018-11-24 14:49:10',1),(2,13,'2018-11-24 14:49:10',1),(3,1,'2018-11-24 14:49:10',1),(4,17,'2018-11-24 14:49:10',1),(5,1,'2018-12-01 01:21:34',2),(5,17,'2018-11-24 14:49:10',1),(6,1,'2018-12-01 01:22:10',2),(6,10,'2018-11-24 14:49:10',1),(7,10,'2018-11-24 14:49:10',1),(7,13,'2018-11-24 14:49:10',1),(8,13,'2018-11-24 14:49:10',1),(8,17,'2018-11-24 14:49:10',1);
/*!40000 ALTER TABLE `EmpLounge` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sgupta37`@`%`*/ /*!50003 trigger before_emplounge_insert
  before insert on EmpLounge
  for each row
begin
  SET new.last_modified_at = now(), new.row_version=new.row_version+1;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EmpParking`
--

DROP TABLE IF EXISTS `EmpParking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmpParking` (
  `lot_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `row_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lot_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `EmpParking_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `Parking` (`lot_id`),
  CONSTRAINT `EmpParking_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpParking`
--

LOCK TABLES `EmpParking` WRITE;
/*!40000 ALTER TABLE `EmpParking` DISABLE KEYS */;
INSERT INTO `EmpParking` VALUES (1,10,'2018-11-24 14:50:28',1),(2,13,'2018-11-24 14:50:28',1),(3,1,'2018-11-24 14:50:28',1),(4,17,'2018-11-24 14:50:28',1),(5,1,'2018-11-24 14:50:28',1),(5,17,'2018-11-24 14:50:28',1),(6,1,'2018-11-24 14:50:28',1),(6,10,'2018-12-01 01:27:31',2),(7,13,'2018-11-24 14:50:28',1),(8,10,'2018-11-27 17:35:06',1),(8,17,'2018-11-24 14:50:28',1),(9,10,'2018-11-24 14:50:28',1),(10,10,'2018-11-27 17:34:02',2),(10,13,'2018-11-24 14:50:28',1),(10,17,'2018-11-27 16:58:08',1);
/*!40000 ALTER TABLE `EmpParking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sgupta37`@`%`*/ /*!50003 trigger before_empparking_insert
  before insert on EmpParking
  for each row
begin
  SET new.last_modified_at = now(), new.row_version=new.row_version+1;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EmpShopRest`
--

DROP TABLE IF EXISTS `EmpShopRest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmpShopRest` (
  `shop_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `row_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shop_id`,`employee_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `EmpShopRest_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `ShopRestCat` (`shop_id`),
  CONSTRAINT `EmpShopRest_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpShopRest`
--

LOCK TABLES `EmpShopRest` WRITE;
/*!40000 ALTER TABLE `EmpShopRest` DISABLE KEYS */;
INSERT INTO `EmpShopRest` VALUES (1,10,'2018-11-24 14:51:13',1),(2,13,'2018-11-24 14:51:13',1),(3,1,'2018-11-24 14:51:13',1),(3,10,'2018-11-24 14:51:13',1),(4,17,'2018-11-24 14:51:13',1),(5,1,'2018-11-24 14:51:13',1),(6,1,'2018-11-24 14:51:13',1),(6,10,'2018-11-24 14:51:13',1),(7,13,'2018-11-24 14:51:13',1),(8,13,'2018-11-24 14:51:13',1),(8,17,'2018-11-24 14:51:13',1),(9,10,'2018-11-24 14:51:13',1),(9,13,'2018-11-24 14:51:13',1),(9,17,'2018-11-24 14:51:13',1),(10,13,'2018-11-24 14:51:13',1),(15,1,'2018-11-28 15:37:56',1),(16,13,'2018-12-01 01:17:53',3),(17,1,'2018-12-01 16:49:19',1),(18,1,'2018-12-01 16:53:57',1),(19,1,'2018-12-01 17:38:28',2),(20,13,'2018-12-01 18:59:31',1);
/*!40000 ALTER TABLE `EmpShopRest` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sgupta37`@`%`*/ /*!50003 TRIGGER before_empshoprest_insert
BEFORE INSERT ON EmpShopRest
FOR EACH ROW
BEGIN
SET new.last_modified_at = now(), new.row_version=new.row_version+1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `EmpTrans`
--

DROP TABLE IF EXISTS `EmpTrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmpTrans` (
  `vehicle_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `last_modified_at` timestamp NULL DEFAULT NULL,
  `row_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`employee_id`,`vehicle_id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `EmpTrans_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `Transportation` (`vehicle_id`),
  CONSTRAINT `EmpTrans_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpTrans`
--

LOCK TABLES `EmpTrans` WRITE;
/*!40000 ALTER TABLE `EmpTrans` DISABLE KEYS */;
INSERT INTO `EmpTrans` VALUES (1,7,'2018-11-24 14:52:22',1),(2,7,'2018-11-24 14:52:22',1),(3,7,'2018-11-24 14:52:22',1),(7,7,'2018-11-24 14:52:22',1),(8,7,'2018-11-24 14:52:22',1),(4,15,'2018-11-24 14:52:22',1),(5,15,'2018-11-24 14:52:22',1),(6,15,'2018-11-24 14:52:22',1),(9,15,'2018-11-24 14:52:22',1);
/*!40000 ALTER TABLE `EmpTrans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sgupta37`@`%`*/ /*!50003 TRIGGER before_emptrans_insert
BEFORE INSERT ON EmpTrans
FOR EACH ROW
BEGIN
SET new.last_modified_at = now(), new.row_version=new.row_version+1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(5) NOT NULL DEFAULT 'GEN',
  `emp_firstname` varchar(255) NOT NULL,
  `emp_lastname` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  FULLTEXT KEY `idx_designation` (`designation`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'FM','Phelan','Logan','257 Ligula. Ave','Gavle','Gävleborgs län','Honduras','9464 EC','sed.orci.lobortis@arcuiaculis.ca','1-778-840-4196',634546),(2,'AM','Lani','Rivas','Ap #614-6265 Sed, St.','Coevorden','Dr','Ecuador','171453','dictum@ullamcorper.org','1-452-491-1042',772656),(3,'AM','Sonya','Giles','P.O. Box 969, 3410 Et Rd.','Vienna','Vienna','Macao','761891','Donec@maurisut.edu','1-644-825-9839',662796),(4,'GEN','John','Shields','2016 Aenean Street','Lagos','Lagos','Bhutan','90-063','habitant@adipiscinglacus.org','1-432-741-5867',366189),(5,'RP','Ocean','Blevins','8470 Non, St.','Auckland','North Island','Cuba','8671','Integer.eu@euismodestarcu.ca','1-877-864-0308',676768),(6,'AAS','Cleo','Black','6344 Ac Avenue','Annapolis','MD','Bahamas','09164','malesuada@nibhDonecest.ca','1-378-871-7333',922546),(7,'GS','Cameron','Savage','943-1891 Tortor, Street','Avesta','W','Heard Island and Mcdonald Islands','38938','nunc.ac.mattis@Nullafacilisis.edu','1-458-229-2485',694186),(8,'AAS','Axel','Kent','169-3867 Cras Avenue','Galmaarden','VB','Madagascar','44703','dui.Fusce.aliquam@vitaeodiosagittis.edu','1-635-554-6560',418884),(9,'ATC','Delilah','Rogers','775-5487 Adipiscing Av.','Shreveport','LA','Switzerland','4775','euismod.ac.fermentum@nullaat.edu','1-403-847-4925',926944),(10,'FM','Ursa','Pace','P.O. Box 445, 9972 Nunc Ave','Heredia','H','Marshall Islands','460255','mauris.aliquam@netuset.co.uk','1-452-923-5510',885434),(11,'ATC','Ulric','Wilkins','Ap #947-1275 Egestas. Ave','Göteborg','Västra Götalands län','Iran','68439','volutpat.nunc@sed.edu','1-202-620-4046',100059),(12,'AAS','Nomlanga','Valencia','Ap #266-9983 Interdum. Ave','Radicofani','TOS','Suriname','9742','lorem@metusurna.org','1-240-834-6216',952442),(13,'FM','Darrel','Merrill','P.O. Box 886, 1937 Erat St.','Noragugume','Sardegna','French Guiana','699981','feugiat.placerat@orciconsectetuer.org','1-322-257-5050',166849),(14,'AM','Hermione','Harding','358-5030 In Rd.','Hofors','Gävleborgs län','Korea, South','9256','pharetra.sed.hendrerit@liberoDonecconsectetuer.net','1-843-908-4802',291276),(15,'GS','Blair','Horton','P.O. Box 374, 4164 Orci, Ave','Siedlce','MA','Samoa','9851','nec.tellus.Nunc@magnisdisparturient.edu','1-398-549-1891',474792),(16,'AM','Channing','Fitzgerald','Ap #896-2369 Ligula. Street','Palencia','CL','Kyrgyzstan','33009-682','adipiscing@etmagnaPraesent.org','1-934-549-5972',527070),(17,'FM','Brody','Mitchell','Ap #896-6735 Interdum Av.','Montebello','QC','Italy','10507','molestie.Sed@at.ca','1-316-156-2026',978089),(18,'RP','Serena','Maynard','Ap #436-7221 Neque. Rd.','Zamosc','LU','Turkmenistan','V6S 9YI','nibh.Quisque.nonummy@vehiculaaliquetlibero.edu','1-115-316-5877',214410),(19,'GEN','Caryn','Benjamin','P.O. Box 524, 7544 Facilisi. St.','Timaru','South Island','Estonia','8734','tortor.dictum@mattisvelitjusto.edu','1-701-172-9456',604687),(20,'ATC','Igor','Norman','P.O. Box 998, 7457 Tortor, Street','Cinco Esquinas','SJ','Montenegro','24503-907','ipsum.primis.in@egestasnuncsed.edu','1-898-751-3504',794041);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flight` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `airline_no` varchar(255) NOT NULL,
  `airline_name` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  FULLTEXT KEY `idx_airline_no` (`airline_no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight`
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES (1,'JB-123','Jet Blue','San Antonio, TX','Charlotte, NC'),(2,'DA-543','Delta Air lines','Charlotte, NC','New York City, NY'),(3,'AA-334','American Airlines','Seattle, WA','Charlotte, NC'),(4,'JB-987','Jet Blue','Charlotte, NC','Dallas, TX'),(5,'JB-65','Jet Blue','Dallas, TX','Charlotte, NC'),(6,'JB-77','Jet Blue','San Antonio, TX','Charlotte, NC'),(7,'JB-387','Jet Blue','Charlotte, NC','Memphis, TN'),(8,'AA-776','American Airlines','Philadelphia, PA','Charlotte, NC'),(9,'SA-678','Southwest Airlines','Charlotte, NC','Chicago, IL'),(10,'SA-621','Southwest Airlines','Charlotte, NC','Boston, MA'),(11,'AA-76','American Airlines','Chicago, IL','Charlotte, NC'),(12,'DA-53','Delta Air lines','Charlotte, NC','Chicago, IL'),(13,'SA-21','Southwest Airlines','Charlotte, NC','Philadelphia, PA'),(14,'AA-276','American Airlines','Charlotte, NC','Memphis, TN'),(15,'DA-543','Delta Air lines','Charlotte, NC','Boston, MA'),(16,'AA-676','American Airlines','New York City, NY','Charlotte, NC'),(17,'JB-327','Jet Blue','Charlotte, NC','Seattle, WA'),(18,'JB-887','Jet Blue','Memphis, TN','Charlotte, NC'),(19,'AA-996','American Airlines','Charlotte, NC','Seattle, WA'),(20,'SA-241','Southwest Airlines','Charlotte, NC','San Antonio, TX'),(21,'JB-242','Jet Blues','Charlotte, NC','Chicago, IL'),(22,'AA-742','American Airlines','Charlotte, NC','San Antonio, TX'),(23,'DA-777','Delta','Charlotte, NC','Memphis, TNC'),(24,'AA-111','American Airlines','Charlotte, NC','New York, NY'),(25,'AA-457','American Airlines','Charlotte, NC','Memphis, TNC');
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightDetails`
--

DROP TABLE IF EXISTS `FlightDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FlightDetails` (
  `flight_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `terminal_no` int(11) DEFAULT NULL,
  `gate_no` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`flight_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightDetails`
--

LOCK TABLES `FlightDetails` WRITE;
/*!40000 ALTER TABLE `FlightDetails` DISABLE KEYS */;
INSERT INTO `FlightDetails` VALUES (1,'2018-09-24','13:52:58','02:14:44',5,'A5'),(2,'2018-10-04','21:15:26','04:35:07',5,'M1'),(3,'2018-08-05','12:21:43','16:11:36',8,'M2'),(3,'2018-11-28','09:30:00','15:15:00',5,'H5'),(4,'2018-04-12','22:22:42','12:24:03',9,'P1'),(4,'2019-11-23','10:00:00','15:00:00',5,'D2'),(5,'2018-01-15','07:24:21','01:00:00',4,'C5'),(5,'2018-12-03','05:00:00','09:00:00',NULL,NULL),(6,'2018-07-27','14:08:25','22:24:41',3,'C7'),(7,'2018-03-09','13:32:13','04:35:01',2,'B1'),(7,'2018-11-28','15:00:00','18:00:25',8,'B2'),(8,'2018-02-06','05:31:04','06:27:41',9,'B2'),(8,'2018-11-25','14:00:00','16:30:00',5,'A5'),(8,'2018-12-03','08:00:00','10:30:00',NULL,NULL),(9,'2018-09-17','02:24:41','01:33:02',7,'E1'),(10,'2018-11-26','20:56:39','19:27:45',4,'F2'),(11,'2018-01-27','07:31:51','09:04:16',5,'G4'),(12,'2018-01-30','15:53:00','05:18:50',7,'G5'),(13,'2018-07-24','17:27:01','03:30:49',9,'H1'),(13,'2018-11-29','10:00:00','12:30:00',8,'G1'),(13,'2018-12-01','10:15:00','12:45:00',8,'D8'),(14,'2018-02-08','16:45:22','03:54:49',5,'G1'),(14,'2018-11-26','17:00:00','19:30:00',9,'D8'),(14,'2018-11-28','14:00:00','16:30:00',4,'D1'),(15,'2018-11-24','01:00:00','05:00:00',2,'H1'),(15,'2018-12-03','15:00:00','16:00:00',2,'B2'),(16,'2018-11-28','12:31:09','02:51:53',1,'J9'),(17,'2018-10-30','00:04:55','12:38:59',4,'I8'),(18,'2018-09-16','10:30:48','11:00:00',6,'M9'),(18,'2018-12-01','01:00:00','05:00:00',1,'A1'),(18,'2018-12-03','07:00:00','09:30:00',5,'F5'),(19,'2018-01-05','07:19:25','19:19:27',9,'P7'),(20,'2018-10-22','04:23:54','00:03:23',8,'D5'),(21,'2018-10-25','22:00:00','01:00:00',1,'D4'),(21,'2018-11-28','01:00:00','05:00:00',1,'G5'),(21,'2018-12-01','01:00:00','05:00:00',5,'M5'),(21,'2018-12-03','10:00:00','12:00:00',2,'F5');
/*!40000 ALTER TABLE `FlightDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lounge`
--

DROP TABLE IF EXISTS `Lounge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lounge` (
  `lounge_terminal_id` int(11) NOT NULL AUTO_INCREMENT,
  `lounge_id` int(11) NOT NULL,
  `terminal_no` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  PRIMARY KEY (`lounge_id`,`terminal_no`,`lounge_terminal_id`),
  KEY `lounge_terminal_id` (`lounge_terminal_id`),
  CONSTRAINT `Lounge_ibfk_1` FOREIGN KEY (`lounge_id`) REFERENCES `LoungeCat` (`lounge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lounge`
--

LOCK TABLES `Lounge` WRITE;
/*!40000 ALTER TABLE `Lounge` DISABLE KEYS */;
INSERT INTO `Lounge` VALUES (2,1,1,12,6),(5,1,5,6,4),(3,1,7,6,1),(7,2,1,6,0),(1,2,3,6,3),(8,2,4,6,0),(6,2,7,12,4),(4,2,9,6,5);
/*!40000 ALTER TABLE `Lounge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoungeCat`
--

DROP TABLE IF EXISTS `LoungeCat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoungeCat` (
  `lounge_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`lounge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoungeCat`
--

LOCK TABLES `LoungeCat` WRITE;
/*!40000 ALTER TABLE `LoungeCat` DISABLE KEYS */;
INSERT INTO `LoungeCat` VALUES (1,'Business'),(2,'First Class');
/*!40000 ALTER TABLE `LoungeCat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parking`
--

DROP TABLE IF EXISTS `Parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parking` (
  `lot_id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_no` int(11) DEFAULT NULL,
  `capacity` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  PRIMARY KEY (`lot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parking`
--

LOCK TABLES `Parking` WRITE;
/*!40000 ALTER TABLE `Parking` DISABLE KEYS */;
INSERT INTO `Parking` VALUES (1,1,100,25),(2,1,100,45),(3,7,300,14),(4,5,300,58),(5,6,50,10),(6,3,50,45),(7,3,250,127),(8,3,300,250),(9,3,300,0),(10,10,100,10);
/*!40000 ALTER TABLE `Parking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Passenger` (
  `passenger_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `passenger_type` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES (1,'Britanni','Newman','Adult ','auctor@velquamdignissim.co.uk','1-340-304-7191'),(2,'Mark','Hurst','Adult ','nibh@Proin.ca','1-564-921-3514'),(3,'Steel','Spencer','Adult ','dis.parturient.montes@Vestibulumuteros.org','1-511-183-3258'),(4,'Mallory','Lowe','Adult ','Donec@Nullasempertellus.co.uk','1-896-567-3069'),(5,'Maxwell','Savage',' Child','quam@tinciduntnunc.ca','1-167-351-5067'),(6,'Kasper','Golden','Adult ','nonummy.Fusce@ProinmiAliquam.ca','1-572-589-3195'),(7,'Jael','Watts',' Child','eget.varius.ultrices@ullamcorpernisl.org','1-248-925-1718'),(8,'Jordan','Mccarthy',' Child','gravida.sit@sedtortor.edu','1-808-997-4567'),(9,'Illana','Christian',' Child','semper.et.lacinia@nislelementum.org','1-191-284-3419'),(10,'Hashim','Mccarthy',' Child','sapien@habitant.net','1-140-155-7403'),(11,'Allistair','Holmes','Adult ','purus.sapien@malesuada.com','1-507-449-8791'),(12,'Octavia','Skinner','Adult ','eros.Nam.consequat@fringillaeuismodenim.co.uk','1-531-953-1724'),(13,'Tucker','Pruitt',' Child','nunc@nunc.net','1-450-621-5874'),(14,'Hyacinth','Stanton','Adult ','erat@amalesuadaid.edu','1-176-878-4246'),(15,'Marsden','Parker',' Child','ligula.consectetuer.rhoncus@Utsemper.net','1-129-178-4022'),(16,'Leah','Harmon','Adult ','orci.Donec@Mauris.edu','1-435-626-2187'),(17,'Aristotle','Wright','Adult ','nibh.sit@Donec.com','1-468-815-6842'),(18,'Jane','Marks','Adult ','porta@temporbibendum.ca','1-212-381-3923'),(19,'Lacey','Cannon','Adult ','eros.nec@senectuset.co.uk','1-725-419-0174'),(20,'Emma','Chan','Adult ','mauris.sagittis.placerat@magnaa.ca','1-842-311-8962');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PassengerFlight`
--

DROP TABLE IF EXISTS `PassengerFlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PassengerFlight` (
  `flight_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `pnr_no` int(11) NOT NULL,
  `ticket_no` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `seat_no` varchar(5) NOT NULL,
  `meal_type` enum('veg','non-veg') NOT NULL,
  PRIMARY KEY (`flight_id`,`passenger_id`,`pnr_no`),
  KEY `passenger_id` (`passenger_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `PassengerFlight_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `Flight` (`flight_id`),
  CONSTRAINT `PassengerFlight_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `Passenger` (`passenger_id`),
  CONSTRAINT `PassengerFlight_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `TicketClass` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PassengerFlight`
--

LOCK TABLES `PassengerFlight` WRITE;
/*!40000 ALTER TABLE `PassengerFlight` DISABLE KEYS */;
INSERT INTO `PassengerFlight` VALUES (1,15,772054,2147483647,1,'12F','non-veg'),(3,7,639174,2147383677,2,'15B','non-veg'),(4,8,626900,2147483646,2,'16B','veg'),(4,10,458755,1458455554,2,'14A','veg'),(5,1,517833,2147483645,1,'28C','non-veg'),(5,4,508527,2147483647,3,'12E','non-veg'),(5,14,477363,2147483647,1,'19F','veg'),(5,16,433845,2147483647,2,'15D','veg'),(6,9,415897,2147483644,2,'8C','veg'),(7,14,384272,2147483615,1,'7D','veg'),(8,2,357249,2147483610,1,'1A','veg'),(8,3,276013,2147483623,2,'2B','veg'),(8,14,955854,1258999654,3,'10F','non-veg'),(10,10,823986,2136456647,3,'11D','veg'),(10,15,207011,2147483622,1,'2B','non-veg'),(12,6,203514,2147483615,2,'5C','veg'),(13,13,202747,2147483619,2,'4C','non-veg'),(14,17,157111,2147483629,2,'6C','veg'),(15,5,125605,2147483633,1,'8F','veg'),(15,15,145878,1252333365,1,'18C','non-veg'),(15,17,125705,2147483647,3,'9F','veg'),(16,10,158989,2147483647,1,'8D','veg'),(17,12,125805,2147483613,2,'18D','veg'),(18,9,125905,2147483647,3,'9A','veg'),(19,11,125405,2147473647,2,'8D','veg'),(19,18,225505,2147483647,1,'15D','veg'),(20,18,258985,1058978445,2,'20D','veg'),(20,19,256999,2145483647,2,'12B','veg'),(21,5,828885,2112483647,3,'13F','veg'),(21,17,823987,2119483647,2,'14C','veg'),(21,18,823988,1233155647,2,'15F','veg'),(21,20,823989,2147483647,2,'7A','non-veg');
/*!40000 ALTER TABLE `PassengerFlight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShopCategory`
--

DROP TABLE IF EXISTS `ShopCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShopCategory` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShopCategory`
--

LOCK TABLES `ShopCategory` WRITE;
/*!40000 ALTER TABLE `ShopCategory` DISABLE KEYS */;
INSERT INTO `ShopCategory` VALUES (1,'Restaurant'),(2,'Shop'),(3,'Store'),(4,'Spa'),(5,'Foreign Exchange');
/*!40000 ALTER TABLE `ShopCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShopRestCat`
--

DROP TABLE IF EXISTS `ShopRestCat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShopRestCat` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `ShopRestCat_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `ShopCategory` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShopRestCat`
--

LOCK TABLES `ShopRestCat` WRITE;
/*!40000 ALTER TABLE `ShopRestCat` DISABLE KEYS */;
INSERT INTO `ShopRestCat` VALUES (1,'Panda Express',1),(2,'Moe\'s Southwest Grill',1),(3,'Papa John',1),(4,'Krispy Kreme',1),(5,'Sbarro',1),(6,'Tom\'s Souvenir Shop',2),(7,'Cinnabon',1),(8,'Subway',1),(9,'Bojangles',1),(10,'Dukin Donuts',1),(11,'Best Buy Express',3),(12,'Da Milano',3),(13,'Heritage Booksellers',3),(14,'Pandora',3),(15,'Chick-Fill-A',1),(16,'Accessorize',3),(17,'Be Relax',4),(18,'Imagine Spa',4),(19,'Travelex',5),(20,'Credentia',5);
/*!40000 ALTER TABLE `ShopRestCat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShopsRestaurants`
--

DROP TABLE IF EXISTS `ShopsRestaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShopsRestaurants` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `terminal_no` int(11) NOT NULL,
  `area` varchar(255) NOT NULL,
  PRIMARY KEY (`shop_id`,`terminal_no`),
  CONSTRAINT `ShopsRestaurants_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `ShopRestCat` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShopsRestaurants`
--

LOCK TABLES `ShopsRestaurants` WRITE;
/*!40000 ALTER TABLE `ShopsRestaurants` DISABLE KEYS */;
INSERT INTO `ShopsRestaurants` VALUES (1,10,'C'),(2,3,'A'),(3,4,'C'),(4,3,'A'),(4,7,'A'),(5,8,'C'),(6,1,'B'),(7,9,'D'),(8,6,'B'),(9,5,'D'),(10,8,'A'),(11,5,'A'),(11,8,'C'),(12,8,'B'),(13,1,'D'),(13,7,'D'),(14,6,'F'),(15,5,'D'),(16,8,'D'),(17,10,'D'),(18,4,'A'),(19,10,'A'),(20,4,'B');
/*!40000 ALTER TABLE `ShopsRestaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketClass`
--

DROP TABLE IF EXISTS `TicketClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketClass` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_class` varchar(50) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketClass`
--

LOCK TABLES `TicketClass` WRITE;
/*!40000 ALTER TABLE `TicketClass` DISABLE KEYS */;
INSERT INTO `TicketClass` VALUES (1,'Business'),(2,'Economy'),(3,'First-Class');
/*!40000 ALTER TABLE `TicketClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transportation`
--

DROP TABLE IF EXISTS `Transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transportation` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type_id` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `source_terminal_no` int(11) NOT NULL,
  `destination_terminal_no` int(11) NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  CONSTRAINT `Transportation_ibfk_1` FOREIGN KEY (`vehicle_type_id`) REFERENCES `VehicleType` (`vehicle_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transportation`
--

LOCK TABLES `Transportation` WRITE;
/*!40000 ALTER TABLE `Transportation` DISABLE KEYS */;
INSERT INTO `Transportation` VALUES (1,1,36,12,5,8),(2,1,32,32,8,4),(3,1,24,12,1,2),(4,3,2,2,1,2),(5,3,4,3,5,6),(6,2,48,10,5,9),(7,2,48,36,8,4),(8,1,48,48,3,9),(9,1,24,24,5,7);
/*!40000 ALTER TABLE `Transportation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleType`
--

DROP TABLE IF EXISTS `VehicleType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleType` (
  `vehicle_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_type` varchar(50) NOT NULL,
  PRIMARY KEY (`vehicle_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleType`
--

LOCK TABLES `VehicleType` WRITE;
/*!40000 ALTER TABLE `VehicleType` DISABLE KEYS */;
INSERT INTO `VehicleType` VALUES (1,'Normal'),(2,'Emergency'),(3,'Medical');
/*!40000 ALTER TABLE `VehicleType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `available_lounge`
--

DROP TABLE IF EXISTS `available_lounge`;
/*!50001 DROP VIEW IF EXISTS `available_lounge`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `available_lounge` AS SELECT 
 1 AS `Lounge Type`,
 1 AS `Terminal`,
 1 AS `AVAILABLE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `available_slots`
--

DROP TABLE IF EXISTS `available_slots`;
/*!50001 DROP VIEW IF EXISTS `available_slots`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `available_slots` AS SELECT 
 1 AS `Terminal`,
 1 AS `Available Parking Slots`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `parking_availability`
--

DROP TABLE IF EXISTS `parking_availability`;
/*!50001 DROP VIEW IF EXISTS `parking_availability`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `parking_availability` AS SELECT 
 1 AS `Terminal`,
 1 AS `Lot Number`,
 1 AS `Available`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `passenger_shops`
--

DROP TABLE IF EXISTS `passenger_shops`;
/*!50001 DROP VIEW IF EXISTS `passenger_shops`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `passenger_shops` AS SELECT 
 1 AS `Name`,
 1 AS `Category`,
 1 AS `Terminal`,
 1 AS `Area`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `today_flights`
--

DROP TABLE IF EXISTS `today_flights`;
/*!50001 DROP VIEW IF EXISTS `today_flights`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `today_flights` AS SELECT 
 1 AS `Flight Number`,
 1 AS `Airline`,
 1 AS `Source`,
 1 AS `Destination`,
 1 AS `Departs`,
 1 AS `Arrives`,
 1 AS `Terminal`,
 1 AS `Gate`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'ADBMS'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `update_empflight_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`sgupta37`@`%`*/ /*!50106 EVENT `update_empflight_event` ON SCHEDULE AT '2018-11-24 14:46:50' ON COMPLETION PRESERVE DISABLE DO UPDATE EmpFlight set last_modified_at =NOW() , row_version=1 */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_emplounge_event` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`sgupta37`@`%`*/ /*!50106 EVENT `update_emplounge_event` ON SCHEDULE AT '2018-11-24 14:49:10' ON COMPLETION PRESERVE DISABLE DO UPDATE EmpLounge set last_modified_at =NOW() , row_version=1 */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_empparking_event` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`sgupta37`@`%`*/ /*!50106 EVENT `update_empparking_event` ON SCHEDULE AT '2018-11-24 14:50:28' ON COMPLETION PRESERVE DISABLE DO UPDATE EmpParking set last_modified_at =NOW() , row_version=1 */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_empshoprest_event` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`sgupta37`@`%`*/ /*!50106 EVENT `update_empshoprest_event` ON SCHEDULE AT '2018-11-24 14:51:13' ON COMPLETION PRESERVE DISABLE DO UPDATE EmpShopRest set last_modified_at =NOW() , row_version=1 */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `update_emptrans_event` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'UTC' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`sgupta37`@`%`*/ /*!50106 EVENT `update_emptrans_event` ON SCHEDULE AT '2018-11-24 14:52:22' ON COMPLETION PRESERVE DISABLE DO UPDATE EmpTrans set last_modified_at =NOW() , row_version=1 */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'ADBMS'
--
/*!50003 DROP FUNCTION IF EXISTS `Availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` FUNCTION `Availability`(a int) RETURNS varchar(10) CHARSET latin1
    DETERMINISTIC
BEGIN
    DECLARE available varchar(10);
 
    IF a > 0 THEN
		SET available = 'Yes';
    ELSE
		SET available = 'No';
	END IF;
 RETURN (available);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_shop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `add_shop`(
in emp int(11),
in shop_name varchar(225),
in cat varchar(225),
in terminal int(11),
in area varchar(225)
)
begin
Declare id int;
Declare category int;
case when exists(select category_id from ShopCategory where name=cat)
then 
	select category_id into @category from ShopCategory where name=cat;
else 
	begin
	insert into ShopCategory(name) values(cat);
	select category_id into @category from ShopCategory where name = cat;
    end;
end case;

insert into ShopRestCat(name,category_id) values (shop_name,@category);
select shop_id into @id from ShopRestCat where name=shop_name;
insert into ShopsRestaurants(shop_id,terminal_no,area) values (@id,terminal,area);
CASE 
	WHEN NOT EXISTS (
		SELECT shop_id, employee_id
        FROM EmpShopRest
		WHERE shop_id = @id
        AND employee_id =emp
            )
            THEN
                INSERT INTO EmpShopRest      
				(shop_id, employee_id)
				values (@id,emp);
			ELSE
				BEGIN
                DECLARE row int;
                Select row_version into @row from EmpShopRest where shop_id=@id and employee_id=emp;
                Update EmpShopRest set last_modified_at = now(), row_version=@row+1 
                where shop_id=@id and employee_id=emp ;
				END;
                
            END CASE;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_passenger_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `get_passenger_details`(IN f_name varchar(255), l_name varchar(255), airline varchar(255), flight_date date)
BEGIN
 select concat_ws(' ', p.first_name,p.last_name) as 'Passenger Name', f.airline_no as 'Flight Number', 
f.airline_name as 'Airline', f.source as 'Source', f.destination as 'Destination',
fd. departure_time 'Departure Time' , fd.arrival_time as 'Arrival Time',
ifnull(fd.terminal_no, 'TBA') as 'Terminal', ifnull(fd.gate_no, 'TBA') as 'Gate', pf.seat_no as 'Seat'
from Passenger p
inner join PassengerFlight pf using(passenger_id)
inner join FlightDetails fd using(flight_id)
inner join Flight f using(flight_id)
where p.first_name = f_name and p.last_name = l_name and f.airline_no = airline and fd.date = flight_date ;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_flight_ramp_planner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `insert_flight_ramp_planner`(IN id int, flight_date date, d_time time, a_time time)
BEGIN
 Insert into FlightDetails(flight_id,date,departure_time,arrival_time) values
 (id,flight_date,d_time,a_time);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_new_flight` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `insert_new_flight`(IN airline_number varchar(255), name varchar(255), source_city varchar(255), destination_city varchar(255) )
BEGIN
 Insert into Flight(airline_no,airline_name,source,destination) values
 (airline_number,name, source_city, destination_city);
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `login`(IN user varchar(255), passwd varchar(20), out Status varchar(255))
BEGIN
 case
 when exists(select * from Account where username = user and password = passwd)
 then set Status = 'Login Successful';
 else set Status= 'Invalid Username or Password !!';
 end case; 
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_flight_atc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `update_flight_atc`(IN id int, emp int, terminal int, gate varchar(10), flight_date date)
BEGIN
 Update FlightDetails set terminal_no=terminal, gate_no=gate where flight_id = id and date = flight_date;
 CASE 
	WHEN NOT EXISTS (
		SELECT flight_id, employee_id
        FROM EmpFlight
		WHERE `flight_id` = `id`
        AND `employee_id` =`emp`
            )
            THEN
                INSERT INTO EmpFlight      
				(flight_id, employee_id)
				values (id,emp);
			ELSE
				BEGIN
                DECLARE row int;
                Select row_version into @row from EmpFlight where flight_id=id and employee_id=emp;
                Update EmpFlight set last_modified_at = now(), row_version=@row+1 
                where flight_id=id and employee_id=emp ;
				END;
                
            END CASE;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_flight_timings_atc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `update_flight_timings_atc`(IN id int, emp int,flight_date date, d_time time, a_time time)
BEGIN
  Update FlightDetails set departure_time=d_time, arrival_time=a_time 
  where flight_id = id and date = flight_date;
 CASE 
	WHEN NOT EXISTS (
		SELECT flight_id, employee_id
        FROM EmpFlight
		WHERE `flight_id` = `id`
        AND `employee_id` =`emp`
            )
            THEN
                INSERT INTO EmpFlight      
				(flight_id, employee_id)
				values (id,emp);
			ELSE
				BEGIN
				DECLARE row int;
                Select row_version into @row from EmpFlight where flight_id=id and employee_id=emp;
                Update EmpFlight set last_modified_at = now(), row_version=@row+1 
                where flight_id=id and employee_id=emp ;
				END;
                
            END CASE;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lounge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `update_lounge`( 
in id int(11),
in emp int,
in var_availability int(11)
)
BEGIN
update Lounge
set availability = var_availability
where lounge_terminal_id = id;
CASE 
	WHEN NOT EXISTS (
		SELECT lounge_terminal_id, employee_id
        FROM EmpLounge
		WHERE lounge_terminal_id = id
        AND employee_id =emp
            )
            THEN
                INSERT INTO EmpLounge      
				(lounge_terminal_id, employee_id)
				values (id,emp);
			ELSE
				BEGIN
                DECLARE row int;
                Select row_version into @row from EmpLounge where lounge_terminal_id=id and employee_id=emp;
                Update EmpLounge set last_modified_at = now(), row_version=@row+1 
                where lounge_terminal_id=id and employee_id=emp ;
				END;
                
            END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_parking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `update_parking`(IN id int, emp int, available int)
BEGIN
 Update Parking set availability=available where lot_id = id;
 CASE 
	WHEN NOT EXISTS (
		SELECT *
        FROM EmpParking
		WHERE lot_id = id
        AND employee_id =emp
            )
            THEN
                INSERT INTO EmpParking      
				(lot_id, employee_id)
				values (id,emp);
			ELSE
				BEGIN
                DECLARE row int;
                Select row_version into @row from EmpParking where lot_id=id and employee_id=emp;
                Update EmpParking set last_modified_at = now(), row_version=@row+1 
                where lot_id=id and employee_id=emp ;
				END;
                
            END CASE;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_shop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `update_shop`(
In id int(11),
in emp int,
in shop_name varchar(225),
in cat varchar(225)
)
begin
update ShopRestCat
set name = shop_name, category_id  = (select category_id from ShopCategory where name=cat)
where shop_id = id;
CASE 
	WHEN NOT EXISTS (
		SELECT shop_id, employee_id
        FROM EmpShopRest
		WHERE shop_id = id
        AND employee_id =emp
            )
            THEN
                INSERT INTO EmpShopRest      
				(shop_id, employee_id)
				values (id,emp);
			ELSE
				BEGIN
                DECLARE row int;
                Select row_version into @row from EmpShopRest where shop_id=id and employee_id=emp;
                Update EmpShopRest set last_modified_at = now(), row_version=@row+1 
                where shop_id=id and employee_id=emp ;
				END;
                
            END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_transportation_availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sgupta37`@`%` PROCEDURE `update_transportation_availability`(IN id int, IN emp int, IN set_availability int, OUT available int)
BEGIN
Update Transportation set availability = set_availability
where vehicle_id = id;
select availability into @available from Transportation;
CASE 
	WHEN NOT EXISTS (
		SELECT vehicle_id, employee_id
        FROM EmpTrans
		WHERE vehicle_id = id
        AND employee_id =emp
            )
            THEN
                INSERT INTO EmpTrans      
				(vehicle_id, employee_id)
				values (id,emp);
			ELSE
				BEGIN
                DECLARE row int;
                Select row_version into @row from EmpTrans where vehicle_id=id and employee_id=emp;
                Update EmpTrans set last_modified_at = now(), row_version=@row+1 
                where vehicle_id=id and employee_id=emp ;
				END;
                
            END CASE;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `available_lounge`
--

/*!50001 DROP VIEW IF EXISTS `available_lounge`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgupta37`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `available_lounge` AS select `lc`.`type` AS `Lounge Type`,`l`.`terminal_no` AS `Terminal`,`Availability`(`l`.`availability`) AS `AVAILABLE` from (`Lounge` `l` join `LoungeCat` `lc` on((`l`.`lounge_id` = `lc`.`lounge_id`))) order by `l`.`terminal_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `available_slots`
--

/*!50001 DROP VIEW IF EXISTS `available_slots`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgupta37`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `available_slots` AS select `Parking`.`terminal_no` AS `Terminal`,sum(`Parking`.`availability`) AS `Available Parking Slots` from `Parking` group by `Parking`.`terminal_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `parking_availability`
--

/*!50001 DROP VIEW IF EXISTS `parking_availability`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgupta37`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `parking_availability` AS select `Parking`.`terminal_no` AS `Terminal`,`Parking`.`lot_id` AS `Lot Number`,`Availability`(`Parking`.`availability`) AS `Available` from `Parking` order by `Parking`.`terminal_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passenger_shops`
--

/*!50001 DROP VIEW IF EXISTS `passenger_shops`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgupta37`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `passenger_shops` AS select `s`.`name` AS `Name`,`sc`.`name` AS `Category`,`sr`.`terminal_no` AS `Terminal`,`sr`.`area` AS `Area` from ((`ShopRestCat` `s` join `ShopsRestaurants` `sr` on((`s`.`shop_id` = `sr`.`shop_id`))) join `ShopCategory` `sc` on((`s`.`category_id` = `sc`.`category_id`))) order by `sr`.`terminal_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `today_flights`
--

/*!50001 DROP VIEW IF EXISTS `today_flights`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sgupta37`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `today_flights` AS select `f`.`airline_no` AS `Flight Number`,`f`.`airline_name` AS `Airline`,`f`.`source` AS `Source`,`f`.`destination` AS `Destination`,`fd`.`departure_time` AS `Departs`,`fd`.`arrival_time` AS `Arrives`,ifnull(`fd`.`terminal_no`,'TBA') AS `Terminal`,ifnull(`fd`.`gate_no`,'TBA') AS `Gate` from (`Flight` `f` join `FlightDetails` `fd` on((`f`.`flight_id` = `fd`.`flight_id`))) where (`fd`.`date` = curdate()) order by `f`.`source`,`fd`.`departure_time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-01 14:41:39
