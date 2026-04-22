-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_db
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing_transactions`
--

DROP TABLE IF EXISTS `billing_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `service_rate_id` int NOT NULL,
  `item_quantity` int DEFAULT '1',
  `unit_price_at_time` decimal(10,2) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `billed_to` enum('Patient','Insurance','Corporate') NOT NULL,
  `is_paid` tinyint(1) DEFAULT '0',
  `recorded_by_staff_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `service_rate_id` (`service_rate_id`),
  KEY `recorded_by_staff_id` (`recorded_by_staff_id`),
  CONSTRAINT `billing_transactions_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `billing_transactions_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `billing_transactions_ibfk_3` FOREIGN KEY (`service_rate_id`) REFERENCES `service_rates` (`rate_id`),
  CONSTRAINT `billing_transactions_ibfk_4` FOREIGN KEY (`recorded_by_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_transactions`
--

LOCK TABLES `billing_transactions` WRITE;
/*!40000 ALTER TABLE `billing_transactions` DISABLE KEYS */;
INSERT INTO `billing_transactions` VALUES (1,1,1,1,1,300.00,300.00,'2025-01-01 00:00:00','Patient',1,9),(2,2,2,1,1,400.00,400.00,'2025-01-02 00:00:00','Patient',1,9),(3,3,3,2,1,500.00,500.00,'2025-01-03 00:00:00','Patient',1,10),(4,1,1,5,2,50.00,100.00,'2025-01-01 00:00:00','Patient',1,10),(5,2,2,5,3,40.00,120.00,'2025-01-02 00:00:00','Patient',1,9),(6,4,4,3,1,800.00,800.00,'2025-01-04 00:00:00','Patient',1,10),(7,5,5,3,1,700.00,700.00,'2025-01-05 00:00:00','Patient',1,9),(8,31,31,4,3,2000.00,6000.00,'2025-02-01 00:00:00','Insurance',0,9),(9,32,32,4,2,2500.00,5000.00,'2025-02-02 00:00:00','Insurance',1,10),(10,33,33,4,5,5000.00,25000.00,'2025-02-03 00:00:00','Insurance',1,9),(11,33,33,6,1,50000.00,50000.00,'2025-02-03 00:00:00','Insurance',1,10),(12,34,34,4,4,2000.00,8000.00,'2025-02-04 00:00:00','Insurance',0,9),(13,35,35,4,3,2500.00,7500.00,'2025-02-05 00:00:00','Insurance',1,10),(14,44,44,6,1,70000.00,70000.00,'2025-02-06 00:00:00','Insurance',1,9),(15,40,40,4,2,1500.00,3000.00,'2025-02-07 00:00:00','Patient',1,10),(16,41,41,4,2,1200.00,2400.00,'2025-02-08 00:00:00','Patient',1,9),(17,53,53,7,1,100000.00,100000.00,'2025-02-09 00:00:00','Insurance',0,10),(18,54,54,7,1,120000.00,120000.00,'2025-02-10 00:00:00','Insurance',1,9),(19,45,45,4,4,3000.00,12000.00,'2025-02-11 00:00:00','Insurance',1,10),(20,46,46,4,2,2000.00,4000.00,'2025-02-12 00:00:00','Insurance',1,9),(21,47,47,1,1,500.00,500.00,'2025-02-13 00:00:00','Patient',1,10),(22,48,48,2,1,600.00,600.00,'2025-02-14 00:00:00','Patient',1,9),(23,49,49,4,3,2500.00,7500.00,'2025-02-15 00:00:00','Insurance',1,10),(24,50,50,4,2,2000.00,4000.00,'2025-02-16 00:00:00','Patient',1,9),(25,51,51,4,5,3000.00,15000.00,'2025-02-17 00:00:00','Insurance',0,10),(26,52,52,4,4,3500.00,14000.00,'2025-02-18 00:00:00','Insurance',1,9),(27,55,55,1,1,400.00,400.00,'2025-02-19 00:00:00','Patient',1,10),(28,56,56,2,1,700.00,700.00,'2025-02-20 00:00:00','Patient',1,9),(29,57,57,4,3,2500.00,7500.00,'2025-02-21 00:00:00','Insurance',1,10),(30,58,58,4,2,3000.00,6000.00,'2025-02-22 00:00:00','Insurance',0,9);
/*!40000 ALTER TABLE `billing_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_notes`
--

DROP TABLE IF EXISTS `clinical_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_notes` (
  `note_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `author_staff_id` int NOT NULL,
  `note_type` enum('Progress Note','H&P','Consult','Discharge Summary','Operative Note') NOT NULL,
  `note_content` text NOT NULL,
  `note_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_signed` tinyint(1) DEFAULT '0',
  `signed_by_staff_id` int DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `author_staff_id` (`author_staff_id`),
  CONSTRAINT `clinical_notes_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `clinical_notes_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `clinical_notes_ibfk_3` FOREIGN KEY (`author_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_notes`
--

LOCK TABLES `clinical_notes` WRITE;
/*!40000 ALTER TABLE `clinical_notes` DISABLE KEYS */;
INSERT INTO `clinical_notes` VALUES (1,1,1,2,'Consult','Patient reports fever and weakness','2025-01-01 10:00:00',1,2),(2,2,2,3,'Consult','Viral symptoms observed','2025-01-02 11:00:00',1,3),(3,3,3,4,'Consult','Loose motions and dehydration','2025-01-03 12:00:00',1,4),(4,4,4,2,'Progress Note','Patient responding to medication','2025-01-04 10:30:00',1,2),(5,5,5,3,'Progress Note','Fever reduced slightly','2025-01-05 11:30:00',1,3),(6,6,6,4,'Progress Note','Breathing improved','2025-01-06 09:45:00',1,4),(7,7,7,2,'H&P','Detailed history taken, mild infection','2025-01-07 14:00:00',1,2),(8,8,8,3,'H&P','Respiratory issue history noted','2025-01-08 15:00:00',1,3),(9,9,9,4,'Consult','Cold and cough symptoms','2025-01-09 10:10:00',1,4),(10,10,10,2,'Consult','Throat infection confirmed','2025-01-10 10:20:00',1,2),(11,11,11,3,'Progress Note','Gastritis symptoms stable','2025-01-11 11:00:00',1,3),(12,12,12,4,'Progress Note','Acidity reduced','2025-01-12 12:00:00',1,4),(13,13,13,2,'Consult','Asthma symptoms observed','2025-01-13 09:00:00',1,2),(14,14,14,3,'Consult','COPD case, needs monitoring','2025-01-14 09:30:00',1,3),(15,15,15,4,'H&P','Chronic bronchitis history','2025-01-15 13:00:00',1,4),(16,16,16,2,'H&P','Family history of diabetes','2025-01-16 13:30:00',1,2),(17,17,17,3,'Progress Note','Stable vitals','2025-01-17 10:00:00',1,3),(18,18,18,4,'Progress Note','Improvement in breathing','2025-01-18 10:30:00',1,4),(19,19,19,2,'Consult','Skin allergy case','2025-01-19 11:00:00',1,2),(20,20,20,3,'Consult','UTI suspected','2025-01-20 11:30:00',1,3),(21,21,21,4,'Discharge Summary','Patient discharged stable','2025-01-21 16:00:00',1,4),(22,22,22,2,'Discharge Summary','Condition improved, discharged','2025-01-22 16:30:00',1,2),(23,23,23,3,'Consult','Back pain complaint','2025-01-23 10:00:00',1,3),(24,24,24,4,'Consult','Kidney issue under evaluation','2025-01-24 10:30:00',1,4),(25,25,25,2,'Progress Note','Pain reduced after meds','2025-01-25 11:00:00',1,2),(26,26,26,3,'Progress Note','Stable condition','2025-01-26 11:30:00',1,3),(27,27,27,4,'Consult','Head injury case','2025-01-27 12:00:00',1,4),(28,28,28,2,'Consult','Fracture confirmed','2025-01-28 12:30:00',1,2),(29,29,29,3,'Operative Note','Surgery performed successfully','2025-01-29 14:00:00',1,3),(30,30,30,4,'Operative Note','Post-op stable','2025-01-30 15:00:00',1,4),(61,61,61,2,'Consult','Patient admitted with high fever','2025-02-01 10:00:00',1,2),(62,62,62,3,'Consult','Severe cough and chest congestion','2025-02-02 11:00:00',1,3),(63,63,63,4,'Consult','Gastritis symptoms worsening','2025-02-03 12:00:00',1,4),(64,64,64,2,'Progress Note','Vitals improving gradually','2025-02-04 10:30:00',1,2),(65,65,65,3,'Progress Note','Stable condition, continue meds','2025-02-05 11:30:00',1,3),(66,66,66,4,'Progress Note','Breathing stable','2025-02-06 09:45:00',1,4),(67,67,67,2,'H&P','History of hypertension noted','2025-02-07 14:00:00',1,2),(68,68,68,3,'H&P','Diabetes history recorded','2025-02-08 15:00:00',1,3),(69,69,69,4,'Consult','UTI confirmed','2025-02-09 10:10:00',1,4),(70,70,70,2,'Consult','Kidney function abnormal','2025-02-10 10:20:00',1,2),(71,71,71,3,'Consult','Accident trauma case','2025-03-01 09:00:00',1,3),(72,72,72,4,'Consult','Fracture in femur','2025-03-02 09:30:00',1,4),(73,73,73,2,'Progress Note','Pain managed with medication','2025-03-03 10:00:00',1,2),(74,74,74,3,'Progress Note','Swelling reduced','2025-03-04 10:30:00',1,3),(75,75,75,4,'Operative Note','Surgery completed successfully','2025-03-05 14:00:00',1,4),(76,76,76,2,'Consult','Head injury observation','2025-03-06 11:00:00',1,2),(77,77,77,3,'Consult','Multiple trauma injuries','2025-03-07 11:30:00',1,3),(78,78,78,4,'Progress Note','Patient stable post trauma','2025-03-08 12:00:00',1,4),(79,79,79,2,'Consult','Fracture healing monitored','2025-03-09 12:30:00',1,2),(80,80,80,3,'Consult','General injury case','2025-03-10 13:00:00',1,3),(81,81,81,4,'Consult','Cardiac emergency handled','2025-03-11 09:00:00',1,4),(82,82,82,2,'Consult','Heart failure symptoms','2025-03-12 09:30:00',1,2),(83,83,83,3,'Progress Note','BP stabilized','2025-03-13 10:00:00',1,3),(84,84,84,4,'Progress Note','Patient recovering','2025-03-14 10:30:00',1,4),(85,85,85,2,'Consult','Hypertension case','2025-03-15 11:00:00',1,2),(86,86,86,3,'Consult','Fever and viral symptoms','2025-03-16 11:30:00',1,3),(87,87,87,4,'Progress Note','Condition improving','2025-03-17 12:00:00',1,4),(88,88,88,2,'Progress Note','Vitals normal','2025-03-18 12:30:00',1,2),(89,89,89,3,'Discharge Summary','Patient discharged healthy','2025-03-19 16:00:00',1,3),(90,90,90,4,'Discharge Summary','Recovered fully','2025-03-20 16:30:00',1,4);
/*!40000 ALTER TABLE `clinical_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnoses` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `icd_code` varchar(10) NOT NULL,
  `diagnosis_type` enum('Admission','Primary','Secondary','Discharge') NOT NULL,
  `date_of_diagnosis` date DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `icd_code` (`icd_code`),
  CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `diagnoses_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `diagnoses_ibfk_3` FOREIGN KEY (`icd_code`) REFERENCES `icd_master` (`icd_code`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,1,1,'R50','Primary','2025-01-01'),(2,2,2,'B34','Primary','2025-01-02'),(3,3,3,'A09','Primary','2025-01-03'),(4,4,4,'J06','Primary','2025-01-04'),(5,5,5,'K52','Primary','2025-01-05'),(6,6,6,'J18','Primary','2025-01-06'),(7,7,7,'J20','Primary','2025-01-07'),(8,8,8,'J45','Primary','2025-01-08'),(9,9,9,'J00','Primary','2025-01-09'),(10,10,10,'J02','Primary','2025-01-10'),(11,11,11,'K21','Primary','2025-01-11'),(12,12,12,'K29','Primary','2025-01-12'),(13,13,13,'K30','Primary','2025-01-13'),(14,14,14,'K52','Primary','2025-01-14'),(15,15,15,'A09','Primary','2025-01-15'),(16,16,16,'I10','Primary','2025-01-16'),(17,17,17,'E11','Primary','2025-01-17'),(18,18,18,'E78','Primary','2025-01-18'),(19,19,19,'I20','Primary','2025-01-19'),(20,20,20,'I10','Primary','2025-01-20'),(21,21,21,'R51','Primary','2025-01-21'),(22,22,22,'M54','Primary','2025-01-22'),(23,23,23,'L20','Primary','2025-01-23'),(24,24,24,'H10','Primary','2025-01-24'),(25,25,25,'N39','Primary','2025-01-25'),(26,26,26,'J06','Primary','2025-01-26'),(27,27,27,'R50','Primary','2025-01-27'),(28,28,28,'K21','Primary','2025-01-28'),(29,29,29,'A09','Primary','2025-01-29'),(30,30,30,'J18','Primary','2025-01-30'),(31,31,31,'R50','Primary','2025-01-31'),(32,32,32,'J06','Primary','2025-02-01'),(33,33,33,'K52','Primary','2025-02-02'),(34,34,34,'J20','Primary','2025-02-03'),(35,35,35,'A09','Primary','2025-02-04'),(36,36,36,'J45','Primary','2025-02-05'),(37,37,37,'J18','Primary','2025-02-06'),(38,38,38,'K21','Primary','2025-02-07'),(39,39,39,'R51','Primary','2025-02-08'),(40,40,40,'M54','Primary','2025-02-09'),(41,41,41,'L20','Primary','2025-02-10'),(42,42,42,'H10','Primary','2025-02-11'),(43,43,43,'N39','Primary','2025-02-12'),(44,44,44,'J02','Primary','2025-02-13'),(45,45,45,'J00','Primary','2025-02-14'),(46,46,46,'K29','Primary','2025-02-15'),(47,47,47,'K30','Primary','2025-02-16'),(48,48,48,'R50','Primary','2025-02-17'),(49,49,49,'B34','Primary','2025-02-18'),(50,50,50,'A09','Primary','2025-02-19'),(51,51,51,'I21','Primary','2025-02-01'),(52,51,51,'E11','Secondary','2025-02-01'),(53,52,52,'E11','Primary','2025-02-02'),(54,52,52,'I10','Secondary','2025-02-02'),(55,53,53,'I50','Primary','2025-02-03'),(56,53,53,'E78','Secondary','2025-02-03'),(57,54,54,'N18','Primary','2025-02-04'),(58,55,55,'J18','Primary','2025-02-05'),(59,56,56,'I10','Primary','2025-02-06'),(60,57,57,'E78','Primary','2025-02-07'),(61,61,61,'R50','Primary','2025-02-10'),(62,62,62,'R51','Primary','2025-02-11'),(63,63,63,'B34','Primary','2025-02-12'),(64,64,64,'J06','Primary','2025-02-13'),(65,65,65,'J00','Primary','2025-02-14'),(66,66,66,'K21','Primary','2025-02-15'),(67,67,67,'K29','Primary','2025-02-16'),(68,68,68,'K30','Primary','2025-02-17'),(69,69,69,'K52','Primary','2025-02-18'),(70,70,70,'A09','Primary','2025-02-19'),(71,71,71,'I10','Primary','2025-02-20'),(72,72,72,'I20','Primary','2025-02-21'),(73,73,73,'I21','Primary','2025-02-22'),(74,74,74,'I50','Primary','2025-02-23'),(75,75,75,'E78','Primary','2025-02-24'),(76,76,76,'E11','Primary','2025-03-01'),(77,77,77,'H10','Primary','2025-03-02'),(78,78,78,'L20','Primary','2025-03-03'),(79,79,79,'M54','Primary','2025-03-04'),(80,80,80,'N39','Primary','2025-03-05'),(81,81,81,'S06','Primary','2025-03-06'),(82,82,82,'S72','Primary','2025-03-07'),(83,83,83,'S01','Primary','2025-03-08'),(84,84,84,'S52','Primary','2025-03-09'),(85,85,85,'T14','Primary','2025-03-10'),(86,86,86,'I21','Primary','2025-03-11'),(87,87,87,'I20','Primary','2025-03-12'),(88,88,88,'R50','Primary','2025-03-13'),(89,89,89,'J18','Primary','2025-03-14'),(90,90,90,'B34','Primary','2025-03-15');
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `staff_id` int NOT NULL,
  `license_number` varchar(50) NOT NULL,
  `specialization_id` int NOT NULL,
  `opd_consultation_fee` decimal(10,2) DEFAULT '0.00',
  `is_attending` tinyint(1) DEFAULT '1',
  `is_on_call` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `license_number` (`license_number`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (2,'DOC1001',1,500.00,1,1),(3,'DOC1002',2,600.00,1,0),(4,'DOC1003',3,700.00,1,1);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encounter` (
  `encounter_id` int NOT NULL AUTO_INCREMENT,
  `mpid` int NOT NULL,
  `encounter_type` enum('OPD','IPD','ICU','Emergency') NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `attending_doctor_id` int NOT NULL,
  `admitting_staff_id` int DEFAULT NULL,
  `primary_diagnosis_code` varchar(10) DEFAULT NULL,
  `billing_status` enum('Open','Pending Review','Closed','Cancelled') NOT NULL DEFAULT 'Open',
  `discharge_disposition` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `attending_doctor_id` (`attending_doctor_id`),
  CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `encounter_ibfk_2` FOREIGN KEY (`attending_doctor_id`) REFERENCES `doctors` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
INSERT INTO `encounter` VALUES (1,1,'OPD','2025-01-01 10:00:00','2025-01-01 11:00:00',2,9,'A09','Closed','Discharged'),(2,2,'OPD','2025-01-02 10:30:00','2025-01-02 11:15:00',2,9,'J06','Closed','Discharged'),(3,3,'OPD','2025-01-03 11:00:00','2025-01-03 12:00:00',3,10,'I10','Closed','Discharged'),(4,4,'OPD','2025-01-04 09:45:00','2025-01-04 10:30:00',2,9,'B34','Closed','Discharged'),(5,5,'OPD','2025-01-05 10:15:00','2025-01-05 11:00:00',3,10,'E11','Closed','Discharged'),(6,6,'OPD','2025-01-06 10:00:00','2025-01-06 10:45:00',2,9,'J00','Closed','Discharged'),(7,7,'OPD','2025-01-07 11:00:00','2025-01-07 12:00:00',3,10,'I20','Closed','Discharged'),(8,8,'OPD','2025-01-08 09:30:00','2025-01-08 10:15:00',2,9,'K21','Closed','Discharged'),(9,9,'OPD','2025-01-09 10:45:00','2025-01-09 11:30:00',3,10,'E78','Closed','Discharged'),(10,10,'OPD','2025-01-10 10:00:00','2025-01-10 10:40:00',2,9,'B34','Closed','Discharged'),(11,11,'OPD','2025-01-11 10:00:00','2025-01-11 11:00:00',3,10,'I25','Closed','Discharged'),(12,12,'OPD','2025-01-12 10:20:00','2025-01-12 11:10:00',2,9,'J02','Closed','Discharged'),(13,13,'OPD','2025-01-13 10:30:00','2025-01-13 11:30:00',3,10,'E11','Closed','Discharged'),(14,14,'OPD','2025-01-14 09:50:00','2025-01-14 10:30:00',3,10,'I50','Closed','Discharged'),(15,15,'OPD','2025-01-15 10:10:00','2025-01-15 11:00:00',2,9,'K29','Closed','Discharged'),(16,16,'OPD','2025-01-16 10:00:00','2025-01-16 10:45:00',2,9,'J01','Closed','Discharged'),(17,17,'OPD','2025-01-17 11:00:00','2025-01-17 11:45:00',2,9,'N39','Closed','Discharged'),(18,18,'OPD','2025-01-18 10:30:00','2025-01-18 11:30:00',3,10,'I10','Closed','Discharged'),(19,19,'OPD','2025-01-19 10:00:00','2025-01-19 10:40:00',2,9,'B34','Closed','Discharged'),(20,20,'OPD','2025-01-20 10:15:00','2025-01-20 11:00:00',3,10,'E11','Closed','Discharged'),(21,21,'OPD','2025-01-21 10:00:00','2025-01-21 10:45:00',2,9,'J06','Closed','Discharged'),(22,22,'OPD','2025-01-22 10:30:00','2025-01-22 11:15:00',2,9,'B34','Closed','Discharged'),(23,23,'OPD','2025-01-23 11:00:00','2025-01-23 12:00:00',3,10,'I20','Closed','Discharged'),(24,24,'OPD','2025-01-24 09:45:00','2025-01-24 10:30:00',2,9,'K21','Closed','Discharged'),(25,25,'OPD','2025-01-25 10:15:00','2025-01-25 11:00:00',3,10,'E11','Closed','Discharged'),(26,26,'OPD','2025-01-26 10:00:00','2025-01-26 10:40:00',3,10,'I10','Closed','Discharged'),(27,27,'OPD','2025-01-27 10:10:00','2025-01-27 11:00:00',2,9,'J02','Closed','Discharged'),(28,28,'OPD','2025-01-28 09:30:00','2025-01-28 10:15:00',2,9,'B34','Closed','Discharged'),(29,29,'OPD','2025-01-29 10:45:00','2025-01-29 11:30:00',3,10,'E78','Closed','Discharged'),(30,30,'OPD','2025-01-30 10:00:00','2025-01-30 10:45:00',3,10,'I10','Closed','Discharged'),(31,31,'OPD','2025-02-01 10:00:00','2025-02-01 10:40:00',2,9,'J06','Closed','Discharged'),(32,32,'OPD','2025-02-02 10:20:00','2025-02-02 11:00:00',2,9,'B34','Closed','Discharged'),(33,33,'OPD','2025-02-03 11:00:00','2025-02-03 12:00:00',3,10,'I10','Closed','Discharged'),(34,34,'OPD','2025-02-04 09:50:00','2025-02-04 10:30:00',2,9,'J02','Closed','Discharged'),(35,35,'OPD','2025-02-05 10:15:00','2025-02-05 11:00:00',3,10,'E11','Closed','Discharged'),(36,36,'OPD','2025-02-06 10:00:00','2025-02-06 10:45:00',3,10,'I10','Closed','Discharged'),(37,37,'OPD','2025-02-07 10:10:00','2025-02-07 11:00:00',2,9,'J06','Closed','Discharged'),(38,38,'OPD','2025-02-08 09:30:00','2025-02-08 10:15:00',2,9,'K21','Closed','Discharged'),(39,39,'OPD','2025-02-09 10:45:00','2025-02-09 11:30:00',3,10,'E78','Closed','Discharged'),(40,40,'OPD','2025-02-10 10:00:00','2025-02-10 10:45:00',3,10,'I10','Closed','Discharged'),(41,41,'OPD','2025-02-11 10:00:00','2025-02-11 10:40:00',2,9,'J06','Closed','Discharged'),(42,42,'OPD','2025-02-12 10:20:00','2025-02-12 11:00:00',2,9,'B34','Closed','Discharged'),(43,43,'OPD','2025-02-13 11:00:00','2025-02-13 12:00:00',3,10,'I20','Closed','Discharged'),(44,44,'OPD','2025-02-14 09:50:00','2025-02-14 10:30:00',2,9,'K21','Closed','Discharged'),(45,45,'OPD','2025-02-15 10:15:00','2025-02-15 11:00:00',3,10,'E11','Closed','Discharged'),(46,46,'OPD','2025-02-16 10:00:00','2025-02-16 10:45:00',2,9,'J01','Closed','Discharged'),(47,47,'OPD','2025-02-17 10:10:00','2025-02-17 11:00:00',3,10,'I10','Closed','Discharged'),(48,48,'OPD','2025-02-18 09:30:00','2025-02-18 10:15:00',2,9,'B34','Closed','Discharged'),(49,49,'OPD','2025-02-19 10:45:00','2025-02-19 11:30:00',2,9,'J06','Closed','Discharged'),(50,50,'OPD','2025-02-20 10:00:00','2025-02-20 10:45:00',2,9,'K29','Closed','Discharged'),(51,51,'IPD','2025-02-01 09:00:00','2025-02-05 11:00:00',3,10,'I21','Closed','Recovered'),(52,52,'IPD','2025-02-02 10:30:00','2025-02-06 12:00:00',3,10,'E11','Closed','Recovered'),(53,53,'IPD','2025-02-03 08:45:00','2025-02-08 10:00:00',3,10,'I50','Closed','Stable'),(54,54,'IPD','2025-02-04 09:30:00','2025-02-09 11:30:00',3,10,'N18','Closed','Stable'),(55,55,'IPD','2025-02-05 10:00:00','2025-02-10 12:00:00',3,10,'J18','Closed','Recovered'),(56,56,'IPD','2025-02-06 09:15:00','2025-02-12 11:00:00',4,10,'I10','Closed','Stable'),(57,57,'IPD','2025-02-07 10:00:00','2025-02-11 12:30:00',4,10,'E78','Closed','Recovered'),(58,58,'IPD','2025-02-08 08:30:00','2025-02-13 10:00:00',4,10,'K74','Closed','Stable'),(59,59,'IPD','2025-02-09 09:00:00','2025-02-15 11:00:00',4,10,'J44','Closed','Recovered'),(60,60,'IPD','2025-02-10 10:30:00','2025-02-16 12:00:00',4,10,'I63','Closed','Recovered'),(61,61,'IPD','2025-02-11 09:00:00','2025-02-18 11:00:00',2,10,'I20','Closed','Stable'),(62,62,'IPD','2025-02-12 10:30:00','2025-02-19 12:00:00',2,10,'E11','Closed','Recovered'),(63,63,'IPD','2025-02-13 08:45:00','2025-02-20 10:00:00',2,10,'J18','Closed','Recovered'),(64,64,'IPD','2025-02-14 09:30:00','2025-02-21 11:30:00',2,10,'I50','Closed','Stable'),(65,65,'IPD','2025-02-15 10:00:00','2025-02-22 12:00:00',2,10,'N18','Closed','Stable'),(66,66,'IPD','2025-02-16 09:15:00','2025-02-25 11:00:00',3,10,'K74','Closed','Stable'),(67,67,'IPD','2025-02-17 10:00:00','2025-02-24 12:30:00',4,10,'I10','Closed','Recovered'),(68,68,'IPD','2025-02-18 08:30:00','2025-02-26 10:00:00',2,10,'J44','Closed','Recovered'),(69,69,'IPD','2025-02-19 09:00:00','2025-02-27 11:00:00',3,10,'I21','Closed','Recovered'),(70,70,'IPD','2025-02-20 10:30:00','2025-02-28 12:00:00',4,10,'E11','Closed','Recovered'),(71,71,'IPD','2025-02-21 09:00:00','2025-03-01 11:00:00',2,10,'I63','Closed','Stable'),(72,72,'IPD','2025-02-22 10:30:00','2025-03-02 12:00:00',3,10,'J18','Closed','Recovered'),(73,73,'IPD','2025-02-23 08:45:00','2025-03-03 10:00:00',4,10,'I50','Closed','Stable'),(74,74,'IPD','2025-02-24 09:30:00','2025-03-04 11:30:00',2,10,'N18','Closed','Stable'),(75,75,'IPD','2025-02-25 10:00:00','2025-03-05 12:00:00',3,10,'I20','Closed','Recovered'),(76,76,'Emergency','2025-03-01 09:10:00','2025-03-01 11:00:00',4,9,'S06','Closed','Admitted'),(77,77,'Emergency','2025-03-02 10:30:00','2025-03-02 12:15:00',4,10,'S72','Closed','Admitted'),(78,78,'Emergency','2025-03-03 08:45:00','2025-03-03 10:00:00',4,9,'S01','Closed','Discharged'),(79,79,'Emergency','2025-03-04 09:20:00','2025-03-04 11:10:00',4,10,'S52','Closed','Admitted'),(80,80,'Emergency','2025-03-05 11:00:00','2025-03-05 13:30:00',4,9,'T14','Closed','Admitted'),(81,81,'Emergency','2025-03-06 10:00:00','2025-03-06 12:00:00',3,10,'I21','Closed','ICU'),(82,82,'Emergency','2025-03-07 09:15:00','2025-03-07 11:00:00',3,9,'I50','Closed','ICU'),(83,83,'Emergency','2025-03-08 10:40:00','2025-03-08 12:20:00',3,10,'I20','Closed','Stable'),(84,84,'Emergency','2025-03-09 08:30:00','2025-03-09 10:10:00',3,9,'I63','Closed','Admitted'),(85,85,'Emergency','2025-03-10 09:50:00','2025-03-10 11:30:00',3,10,'I10','Closed','Discharged'),(86,86,'Emergency','2025-03-11 10:00:00','2025-03-11 11:00:00',2,9,'R50','Closed','Discharged'),(87,87,'Emergency','2025-03-12 10:20:00','2025-03-12 11:40:00',2,10,'K52','Closed','Discharged'),(88,88,'Emergency','2025-03-13 09:30:00','2025-03-13 11:00:00',2,9,'J18','Closed','Admitted'),(89,89,'Emergency','2025-03-14 10:10:00','2025-03-14 11:30:00',2,10,'B34','Closed','Discharged'),(90,90,'Emergency','2025-03-15 09:00:00','2025-03-15 10:30:00',2,9,'A09','Closed','Discharged');
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_departments`
--

DROP TABLE IF EXISTS `hospital_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_departments` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  `dept_head_id` int DEFAULT NULL,
  `dept_type` enum('Clinical','Administrative','Ancillary') NOT NULL,
  `cost_center_code` varchar(10) DEFAULT NULL,
  `is_clinical` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  UNIQUE KEY `cost_center_code` (`cost_center_code`),
  KEY `dept_head_id` (`dept_head_id`),
  CONSTRAINT `hospital_departments_ibfk_1` FOREIGN KEY (`dept_head_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_departments`
--

LOCK TABLES `hospital_departments` WRITE;
/*!40000 ALTER TABLE `hospital_departments` DISABLE KEYS */;
INSERT INTO `hospital_departments` VALUES (1,'OPD',NULL,'Clinical',NULL,1),(2,'IPD',NULL,'Clinical',NULL,1),(3,'EMERGENCY',NULL,'Clinical',NULL,1),(4,'PHARMACY',NULL,'Clinical',NULL,1),(5,'LAB',NULL,'Clinical',NULL,1),(6,'General Medicine',2,'Clinical','CC101',1),(7,'Cardiology',3,'Clinical','CC102',1),(8,'ICU',4,'Clinical','CC103',1),(9,'Radiology',11,'Ancillary','CC104',1),(10,'Administration',1,'Administrative','CC105',0),(11,'Billing',NULL,'Administrative','CC106',0);
/*!40000 ALTER TABLE `hospital_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_rooms`
--

DROP TABLE IF EXISTS `hospital_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL,
  `room_type` enum('Single','Twin','General','ICU') NOT NULL,
  `unit_type` enum('Ward','ICU','HDU','Emergency') NOT NULL,
  `daily_charge` decimal(10,2) NOT NULL,
  `is_occupied` tinyint(1) DEFAULT '0',
  `isolation_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_number` (`room_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_rooms`
--

LOCK TABLES `hospital_rooms` WRITE;
/*!40000 ALTER TABLE `hospital_rooms` DISABLE KEYS */;
INSERT INTO `hospital_rooms` VALUES (1,'G101','General','Ward',1500.00,1,0),(2,'G102','General','Ward',1500.00,0,0),(3,'G103','General','Ward',1500.00,1,0),(4,'T201','Twin','Ward',2500.00,1,0),(5,'T202','Twin','Ward',2500.00,0,0),(6,'S301','Single','Ward',4000.00,1,0),(7,'S302','Single','Ward',4000.00,0,0),(8,'ICU1','ICU','ICU',10000.00,1,1),(9,'ICU2','ICU','ICU',10000.00,1,1),(10,'HDU1','Single','HDU',7000.00,1,0),(11,'HDU2','Single','HDU',7000.00,0,0),(12,'ER1','General','Emergency',2000.00,1,0),(13,'ER2','General','Emergency',2000.00,1,0);
/*!40000 ALTER TABLE `hospital_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icd_master`
--

DROP TABLE IF EXISTS `icd_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icd_master` (
  `icd_code` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`icd_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icd_master`
--

LOCK TABLES `icd_master` WRITE;
/*!40000 ALTER TABLE `icd_master` DISABLE KEYS */;
INSERT INTO `icd_master` VALUES ('A09','Gastroenteritis','Digestive'),('B34','Viral Infection','General'),('E11','Type 2 Diabetes','Endocrine'),('E78','Cholesterol Disorder','Cardiac'),('H10','Conjunctivitis','Eye'),('I10','Hypertension','Cardiac'),('I20','Angina','Cardiac'),('I21','Heart Attack','Cardiac'),('I50','Heart Failure','Cardiac'),('I63','Stroke','Neurology'),('J00','Common Cold','Respiratory'),('J02','Pharyngitis','Respiratory'),('J06','Upper Respiratory Infection','Respiratory'),('J18','Pneumonia','Respiratory'),('J20','Bronchitis','Respiratory'),('J44','COPD','Respiratory'),('J45','Asthma','Respiratory'),('K21','Acid Reflux','Digestive'),('K29','Gastritis Chronic','Digestive'),('K30','Indigestion','Digestive'),('K52','Gastritis','Digestive'),('L20','Dermatitis','Skin'),('M54','Back Pain','Orthopedic'),('N18','Kidney Disease','Renal'),('N39','UTI','Urinary'),('R50','Fever','General'),('R51','Headache','General'),('S01','Open wound of head','Trauma'),('S06','Head Injury','Trauma'),('S52','Fracture of forearm','Trauma'),('S72','Femur Fracture','Trauma'),('T14','Injury','Trauma');
/*!40000 ALTER TABLE `icd_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icu_stays`
--

DROP TABLE IF EXISTS `icu_stays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `icu_stays` (
  `icu_stay_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `icu_start_time` datetime NOT NULL,
  `icu_end_time` datetime DEFAULT NULL,
  `ventilator_status` enum('None','Invasive','Non-Invasive') DEFAULT NULL,
  `daily_score` decimal(5,2) DEFAULT NULL,
  `nurse_to_patient_ratio` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`icu_stay_id`),
  UNIQUE KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  CONSTRAINT `icu_stays_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `icu_stays_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icu_stays`
--

LOCK TABLES `icu_stays` WRITE;
/*!40000 ALTER TABLE `icu_stays` DISABLE KEYS */;
INSERT INTO `icu_stays` VALUES (1,76,76,'2025-03-01 10:00:00','2025-03-05 12:00:00','Invasive',8.50,1.0),(2,77,77,'2025-03-02 09:00:00','2025-03-06 11:00:00','Invasive',9.00,1.0),(3,78,78,'2025-03-03 08:30:00','2025-03-07 10:00:00','Non-Invasive',7.50,1.5),(4,79,79,'2025-03-04 11:00:00','2025-03-08 13:00:00','None',6.00,2.0),(5,81,81,'2025-03-11 09:00:00','2025-03-15 14:00:00','Invasive',9.50,1.0),(6,82,82,'2025-03-12 10:00:00','2025-03-16 12:00:00','Non-Invasive',8.00,1.5),(7,83,83,'2025-03-13 11:00:00','2025-03-17 13:00:00','None',6.50,2.0),(8,14,14,'2025-01-14 08:00:00','2025-01-18 10:00:00','Non-Invasive',7.00,1.5),(9,15,15,'2025-01-15 09:00:00','2025-01-19 11:00:00','Invasive',8.50,1.0),(10,5,5,'2025-01-05 07:30:00','2025-01-09 10:00:00','None',6.00,2.0),(11,24,24,'2025-01-24 10:00:00','2025-01-28 12:00:00','Non-Invasive',7.20,1.5),(12,70,70,'2025-02-10 09:00:00','2025-02-14 11:00:00','Invasive',8.80,1.0),(13,85,85,'2025-03-15 08:00:00','2025-03-18 10:00:00','None',6.50,2.0),(14,86,86,'2025-03-16 09:00:00','2025-03-19 11:00:00','Non-Invasive',7.30,1.5),(15,87,87,'2025-03-17 10:00:00','2025-03-20 12:00:00','None',6.80,2.0),(18,20,20,'2025-01-20 08:00:00','2025-01-21 10:00:00','None',5.50,2.0),(19,10,10,'2025-01-10 07:00:00','2025-01-11 09:00:00','None',5.00,2.0),(20,90,90,'2025-03-20 08:00:00','2025-03-22 12:00:00','Invasive',9.00,1.0);
/*!40000 ALTER TABLE `icu_stays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_claims`
--

DROP TABLE IF EXISTS `insurance_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_claims` (
  `claim_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `insurance_policy_no` varchar(50) DEFAULT NULL,
  `claim_submission_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `claim_status` enum('Submitted','Approved','Denied','Processing') NOT NULL,
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `denial_reason` text,
  PRIMARY KEY (`claim_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  CONSTRAINT `insurance_claims_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `insurance_claims_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_claims`
--

LOCK TABLES `insurance_claims` WRITE;
/*!40000 ALTER TABLE `insurance_claims` DISABLE KEYS */;
INSERT INTO `insurance_claims` VALUES (1,31,31,'POL1001','2025-02-01 00:00:00','Approved',45000.00,NULL),(2,33,33,'POL1002','2025-02-02 00:00:00','Approved',120000.00,NULL),(3,34,34,'POL1003','2025-02-03 00:00:00','Approved',35000.00,NULL),(4,35,35,'POL1004','2025-02-04 00:00:00','Approved',40000.00,NULL),(5,44,44,'POL1005','2025-02-05 00:00:00','Approved',90000.00,NULL),(6,36,36,'POL1006','2025-02-06 00:00:00','Approved',25000.00,NULL),(7,37,37,'POL1007','2025-02-07 00:00:00','Approved',15000.00,NULL),(8,45,45,'POL1008','2025-02-08 00:00:00','Approved',80000.00,NULL),(9,38,38,'POL1009','2025-02-09 00:00:00','Processing',0.00,NULL),(10,39,39,'POL1010','2025-02-10 00:00:00','Processing',0.00,NULL),(11,42,42,'POL1011','2025-02-11 00:00:00','Processing',0.00,NULL),(12,40,40,'POL1012','2025-02-12 00:00:00','Denied',0.00,'Not covered: viral fever'),(13,41,41,'POL1013','2025-02-13 00:00:00','Denied',0.00,'Waiting period not completed'),(14,47,47,'POL1014','2025-02-14 00:00:00','Denied',0.00,'Minor condition not eligible'),(15,46,46,'POL1015','2025-02-15 00:00:00','Approved',18000.00,NULL),(16,48,48,'POL1016','2025-02-16 00:00:00','Approved',22000.00,NULL),(17,49,49,'POL1017','2025-02-17 00:00:00','Approved',30000.00,NULL),(18,53,53,'POL1018','2025-02-18 00:00:00','Approved',150000.00,NULL),(19,54,54,'POL1019','2025-02-19 00:00:00','Approved',180000.00,NULL),(20,50,50,'POL1020','2025-02-20 00:00:00','Approved',12000.00,NULL),(21,51,51,'POL1021','2025-02-21 00:00:00','Processing',0.00,NULL),(22,52,52,'POL1022','2025-02-22 00:00:00','Approved',50000.00,NULL),(23,55,55,'POL1023','2025-02-23 00:00:00','Denied',0.00,'OPD not covered'),(24,56,56,'POL1024','2025-02-24 00:00:00','Approved',20000.00,NULL),(25,57,57,'POL1025','2025-02-25 00:00:00','Approved',30000.00,NULL),(26,58,58,'POL1026','2025-02-26 00:00:00','Processing',0.00,NULL),(27,59,59,'POL1027','2025-02-27 00:00:00','Approved',15000.00,NULL),(28,60,60,'POL1028','2025-02-28 00:00:00','Denied',0.00,'Insufficient documents'),(29,32,32,'POL1029','2025-03-01 00:00:00','Approved',25000.00,NULL),(30,43,43,'POL1030','2025-03-02 00:00:00','Approved',60000.00,NULL);
/*!40000 ALTER TABLE `insurance_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipd_admissions`
--

DROP TABLE IF EXISTS `ipd_admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipd_admissions` (
  `ipd_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `admission_reason` text NOT NULL,
  `admitting_dept_id` int NOT NULL,
  `assigned_room_id` int DEFAULT NULL,
  `bed_number` varchar(10) DEFAULT NULL,
  `expected_discharge_date` date DEFAULT NULL,
  PRIMARY KEY (`ipd_id`),
  UNIQUE KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  CONSTRAINT `ipd_admissions_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `ipd_admissions_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipd_admissions`
--

LOCK TABLES `ipd_admissions` WRITE;
/*!40000 ALTER TABLE `ipd_admissions` DISABLE KEYS */;
INSERT INTO `ipd_admissions` VALUES (1,31,31,'Chest pain observation',2,1,'B1','2025-02-05'),(2,32,32,'Hypertension monitoring',2,2,'B2','2025-02-06'),(3,33,33,'Heart attack recovery',2,3,'B3','2025-02-10'),(4,34,34,'Severe pneumonia',3,4,'B1','2025-02-08'),(5,35,35,'COPD exacerbation',3,5,'B2','2025-02-09'),(6,36,36,'Asthma attack',3,6,'B3','2025-02-07'),(7,37,37,'Severe gastritis',1,7,'B1','2025-02-06'),(8,38,38,'Acid reflux severe',1,8,'B2','2025-02-06'),(9,39,39,'Gastroenteritis dehydration',1,9,'B3','2025-02-05'),(10,40,40,'High fever observation',1,10,'B1','2025-02-04'),(11,41,41,'Viral infection severe',1,11,'B2','2025-02-05'),(12,42,42,'Fracture forearm',3,12,'B1','2025-02-15'),(13,43,43,'Head injury observation',3,13,'B2','2025-02-12'),(14,44,44,'Femur fracture',3,14,'B3','2025-02-20'),(15,45,45,'Stroke monitoring',2,15,'B1','2025-02-18'),(16,46,46,'Kidney infection',1,16,'B2','2025-02-10'),(17,47,47,'Severe cough & fever',1,17,'B3','2025-02-06'),(18,48,48,'Breathing difficulty',3,18,'B1','2025-02-07'),(19,49,49,'Chest tightness',2,19,'B2','2025-02-09'),(20,50,50,'Vomiting & dehydration',1,20,'B3','2025-02-05'),(21,51,51,'Chronic hypertension',2,1,'B4','2025-02-15'),(22,52,52,'Cardiac monitoring',2,2,'B5','2025-02-16'),(23,53,53,'Critical pneumonia',4,3,'ICU1','2025-02-12'),(24,54,54,'Severe trauma',4,4,'ICU2','2025-02-14'),(25,55,55,'Fever unknown origin',1,5,'B6','2025-02-07'),(26,56,56,'Infection monitoring',1,6,'B7','2025-02-08'),(27,57,57,'Asthma severe',3,7,'B8','2025-02-10'),(28,58,58,'Heart rhythm issue',2,8,'B9','2025-02-11'),(29,59,59,'Gastritis severe',1,9,'B10','2025-02-07'),(30,60,60,'High fever & weakness',1,10,'B11','2025-02-06');
/*!40000 ALTER TABLE `ipd_admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_orders`
--

DROP TABLE IF EXISTS `lab_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `ordering_staff_id` int NOT NULL,
  `order_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `test_code` varchar(20) NOT NULL,
  `status` enum('Ordered','Collected','Processing','Completed','Cancelled') NOT NULL,
  `priority` enum('STAT','Routine','Urgent') NOT NULL,
  `specimen_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `specimen_id` (`specimen_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `ordering_staff_id` (`ordering_staff_id`),
  CONSTRAINT `lab_orders_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `lab_orders_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `lab_orders_ibfk_3` FOREIGN KEY (`ordering_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_orders`
--

LOCK TABLES `lab_orders` WRITE;
/*!40000 ALTER TABLE `lab_orders` DISABLE KEYS */;
INSERT INTO `lab_orders` VALUES (1,1,1,2,'2025-01-01 10:00:00','CBC','Completed','Routine','BLD001'),(2,2,2,3,'2025-01-02 10:00:00','CRP','Completed','Routine','BLD002'),(3,3,3,4,'2025-01-03 10:00:00','DENGUE','Completed','Urgent','BLD003'),(4,4,4,2,'2025-01-04 10:00:00','MALARIA','Completed','Urgent','BLD004'),(5,5,5,3,'2025-01-05 10:00:00','CBC','Completed','Routine','BLD005'),(6,6,6,4,'2025-01-06 10:00:00','CRP','Completed','Routine','BLD006'),(7,7,7,2,'2025-01-07 10:00:00','CBC','Completed','Routine','BLD007'),(8,8,8,3,'2025-01-08 10:00:00','CRP','Completed','Routine','BLD008'),(9,9,9,4,'2025-01-09 10:00:00','CBC','Completed','Routine','BLD009'),(10,10,10,2,'2025-01-10 10:00:00','CRP','Completed','Routine','BLD010'),(11,11,11,3,'2025-01-11 11:00:00','CHEST_XRAY','Completed','Routine','IMG001'),(12,12,12,4,'2025-01-12 11:00:00','CBC','Completed','Routine','BLD011'),(13,13,13,2,'2025-01-13 11:00:00','OXY_TEST','Completed','Urgent','BLD012'),(14,14,14,3,'2025-01-14 11:00:00','CHEST_XRAY','Completed','Routine','IMG002'),(15,15,15,4,'2025-01-15 11:00:00','CBC','Completed','Routine','BLD013'),(16,16,16,2,'2025-01-16 11:00:00','CRP','Completed','Routine','BLD014'),(17,17,17,3,'2025-01-17 11:00:00','CHEST_XRAY','Completed','Routine','IMG003'),(18,18,18,4,'2025-01-18 11:00:00','CBC','Completed','Routine','BLD015'),(19,19,19,2,'2025-01-19 11:00:00','OXY_TEST','Completed','Urgent','BLD016'),(20,20,20,3,'2025-01-20 11:00:00','CHEST_XRAY','Completed','Routine','IMG004'),(21,21,21,4,'2025-01-21 12:00:00','ECG','Completed','Urgent','ECG001'),(22,22,22,2,'2025-01-22 12:00:00','TROPONIN','Completed','Urgent','BLD017'),(23,23,23,3,'2025-01-23 12:00:00','LIPID','Completed','Routine','BLD018'),(24,24,24,4,'2025-01-24 12:00:00','ECG','Completed','Urgent','ECG002'),(25,25,25,2,'2025-01-25 12:00:00','TROPONIN','Completed','Urgent','BLD019'),(26,26,26,3,'2025-01-26 12:00:00','LIPID','Completed','Routine','BLD020'),(27,27,27,4,'2025-01-27 12:00:00','ECG','Completed','Urgent','ECG003'),(28,28,28,2,'2025-01-28 12:00:00','TROPONIN','Completed','Urgent','BLD021'),(29,29,29,3,'2025-01-29 12:00:00','LIPID','Completed','Routine','BLD022'),(30,30,30,4,'2025-01-30 12:00:00','ECG','Completed','Urgent','ECG004'),(31,31,31,2,'2025-02-01 09:00:00','CBC','Completed','Routine','BLD031'),(32,32,32,3,'2025-02-02 09:00:00','LFT','Processing','Routine','BLD032'),(33,33,33,4,'2025-02-03 09:00:00','KFT','Completed','Routine','BLD033'),(34,34,34,2,'2025-02-04 09:00:00','CRP','Ordered','Routine','BLD034'),(35,35,35,3,'2025-02-05 09:00:00','CBC','Completed','Routine','BLD035'),(36,36,36,4,'2025-02-06 09:00:00','LFT','Processing','Routine','BLD036'),(37,37,37,2,'2025-02-07 09:00:00','KFT','Completed','Routine','BLD037'),(38,38,38,3,'2025-02-08 09:00:00','CRP','Ordered','Routine','BLD038'),(39,39,39,4,'2025-02-09 09:00:00','CBC','Completed','Routine','BLD039'),(40,40,40,2,'2025-02-10 09:00:00','LFT','Processing','Routine','BLD040'),(41,41,41,3,'2025-02-11 10:00:00','CHEST_XRAY','Completed','Routine','IMG005'),(42,42,42,4,'2025-02-12 10:00:00','CBC','Processing','Routine','BLD041'),(43,43,43,2,'2025-02-13 10:00:00','CRP','Completed','Routine','BLD042'),(44,44,44,3,'2025-02-14 10:00:00','CHEST_XRAY','Ordered','Routine','IMG006'),(45,45,45,4,'2025-02-15 10:00:00','CBC','Completed','Routine','BLD043'),(46,46,46,2,'2025-02-16 10:00:00','CRP','Processing','Routine','BLD044'),(47,47,47,3,'2025-02-17 10:00:00','CHEST_XRAY','Completed','Routine','IMG007'),(48,48,48,4,'2025-02-18 10:00:00','CBC','Ordered','Routine','BLD045'),(49,49,49,2,'2025-02-19 10:00:00','CRP','Completed','Routine','BLD046'),(50,50,50,3,'2025-02-20 10:00:00','CHEST_XRAY','Processing','Routine','IMG008'),(51,51,51,4,'2025-02-21 11:00:00','ECG','Completed','Urgent','ECG005'),(52,52,52,2,'2025-02-22 11:00:00','TROPONIN','Processing','Urgent','BLD047'),(53,53,53,3,'2025-02-23 11:00:00','LIPID','Completed','Routine','BLD048'),(54,54,54,4,'2025-02-24 11:00:00','ECG','Ordered','Urgent','ECG006'),(55,55,55,2,'2025-02-25 11:00:00','TROPONIN','Completed','Urgent','BLD049'),(56,56,56,3,'2025-02-26 11:00:00','LIPID','Processing','Routine','BLD050'),(57,57,57,4,'2025-02-27 11:00:00','ECG','Completed','Urgent','ECG007'),(58,58,58,2,'2025-02-28 11:00:00','TROPONIN','Ordered','Urgent','BLD051'),(59,59,59,3,'2025-03-01 11:00:00','LIPID','Completed','Routine','BLD052'),(60,60,60,4,'2025-03-02 11:00:00','ECG','Processing','Urgent','ECG008'),(61,61,61,2,'2025-03-01 08:30:00','CT_SCAN','Completed','STAT','IMG009'),(62,62,62,3,'2025-03-02 08:30:00','BLOOD_GROUP','Completed','STAT','BLD053'),(63,63,63,4,'2025-03-03 08:30:00','CBC','Processing','STAT','BLD054'),(64,64,64,2,'2025-03-04 08:30:00','CT_SCAN','Completed','STAT','IMG010'),(65,65,65,3,'2025-03-05 08:30:00','BLOOD_GROUP','Completed','STAT','BLD055'),(66,66,66,4,'2025-03-06 08:30:00','CBC','Processing','STAT','BLD056'),(67,67,67,2,'2025-03-07 08:30:00','CT_SCAN','Completed','STAT','IMG011'),(68,68,68,3,'2025-03-08 08:30:00','BLOOD_GROUP','Completed','STAT','BLD057'),(69,69,69,4,'2025-03-09 08:30:00','CBC','Processing','STAT','BLD058'),(70,70,70,2,'2025-03-10 08:30:00','CT_SCAN','Completed','STAT','IMG012'),(71,71,71,3,'2025-03-11 08:30:00','ECG','Completed','STAT','ECG009'),(72,72,72,4,'2025-03-12 08:30:00','TROPONIN','Processing','STAT','BLD059'),(73,73,73,2,'2025-03-13 08:30:00','ECG','Completed','STAT','ECG010'),(74,74,74,3,'2025-03-14 08:30:00','TROPONIN','Completed','STAT','BLD060'),(75,75,75,4,'2025-03-15 08:30:00','ECG','Processing','STAT','ECG011'),(76,76,76,2,'2025-03-16 08:30:00','TROPONIN','Completed','STAT','BLD061'),(77,77,77,3,'2025-03-17 08:30:00','ECG','Completed','STAT','ECG012'),(78,78,78,4,'2025-03-18 08:30:00','TROPONIN','Processing','STAT','BLD062'),(79,79,79,2,'2025-03-19 08:30:00','ECG','Completed','STAT','ECG013'),(80,80,80,3,'2025-03-20 08:30:00','TROPONIN','Completed','STAT','BLD063'),(81,81,81,4,'2025-03-21 08:30:00','CBC','Completed','STAT','BLD064'),(82,82,82,2,'2025-03-22 08:30:00','CRP','Processing','STAT','BLD065'),(83,83,83,3,'2025-03-23 08:30:00','BLOOD_CULTURE','Ordered','STAT','BLD066'),(84,84,84,4,'2025-03-24 08:30:00','CBC','Completed','STAT','BLD067'),(85,85,85,2,'2025-03-25 08:30:00','CRP','Completed','STAT','BLD068'),(86,86,86,3,'2025-03-26 08:30:00','BLOOD_CULTURE','Processing','STAT','BLD069'),(87,87,87,4,'2025-03-27 08:30:00','CBC','Completed','STAT','BLD070'),(88,88,88,2,'2025-03-28 08:30:00','CRP','Processing','STAT','BLD071'),(89,89,89,3,'2025-03-29 08:30:00','BLOOD_CULTURE','Completed','STAT','BLD072'),(90,90,90,4,'2025-03-30 08:30:00','CBC','Completed','STAT','BLD073');
/*!40000 ALTER TABLE `lab_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_results`
--

DROP TABLE IF EXISTS `lab_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `result_value` varchar(100) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `normal_range` varchar(100) DEFAULT NULL,
  `is_abnormal` tinyint(1) DEFAULT '0',
  `result_text` text,
  `verified_staff_id` int DEFAULT NULL,
  `result_file_path` varchar(255) DEFAULT NULL,
  `result_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `verified_staff_id` (`verified_staff_id`),
  CONSTRAINT `lab_results_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `lab_orders` (`order_id`),
  CONSTRAINT `lab_results_ibfk_2` FOREIGN KEY (`verified_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_results`
--

LOCK TABLES `lab_results` WRITE;
/*!40000 ALTER TABLE `lab_results` DISABLE KEYS */;
INSERT INTO `lab_results` VALUES (1,1,'13.2','g/dL','12-16',0,'Normal blood count',11,'/reports/cbc1.pdf','2025-01-01 14:00:00'),(2,2,'8.5','mg/L','0-10',0,'CRP within range',11,'/reports/crp2.pdf','2025-01-02 14:00:00'),(3,3,'Positive','-','Negative',1,'Dengue detected',11,'/reports/dengue3.pdf','2025-01-03 14:00:00'),(4,4,'Positive','-','Negative',1,'Malaria parasite detected',11,'/reports/malaria4.pdf','2025-01-04 14:00:00'),(5,5,'11.8','g/dL','12-16',1,'Slight anemia',11,'/reports/cbc5.pdf','2025-01-05 14:00:00'),(6,6,'12','mg/L','0-10',1,'Elevated CRP',11,'/reports/crp6.pdf','2025-01-06 14:00:00'),(7,7,'14.1','g/dL','12-16',0,'Normal',11,'/reports/cbc7.pdf','2025-01-07 14:00:00'),(8,8,'6','mg/L','0-10',0,'Normal',11,'/reports/crp8.pdf','2025-01-08 14:00:00'),(9,9,'15','g/dL','12-16',0,'Normal',11,'/reports/cbc9.pdf','2025-01-09 14:00:00'),(10,10,'7','mg/L','0-10',0,'Normal',11,'/reports/crp10.pdf','2025-01-10 14:00:00'),(11,11,'Clear','-','Clear',0,'No infection',11,'/reports/xray11.pdf','2025-01-11 15:00:00'),(12,12,'13','g/dL','12-16',0,'Normal CBC',11,'/reports/cbc12.pdf','2025-01-12 15:00:00'),(13,13,'Low','-','Normal',1,'Low oxygen level',11,'/reports/oxy13.pdf','2025-01-13 15:00:00'),(14,14,'Infection','-','Clear',1,'Mild lung infection',11,'/reports/xray14.pdf','2025-01-14 15:00:00'),(15,15,'12.5','g/dL','12-16',0,'Normal CBC',11,'/reports/cbc15.pdf','2025-01-15 15:00:00'),(16,16,'15','mg/L','0-10',1,'High CRP',11,'/reports/crp16.pdf','2025-01-16 15:00:00'),(17,17,'Clear','-','Clear',0,'Normal',11,'/reports/xray17.pdf','2025-01-17 15:00:00'),(18,18,'11.2','g/dL','12-16',1,'Low hemoglobin',11,'/reports/cbc18.pdf','2025-01-18 15:00:00'),(19,19,'Low','-','Normal',1,'Oxygen deficiency',11,'/reports/oxy19.pdf','2025-01-19 15:00:00'),(20,20,'Infection','-','Clear',1,'Bronchitis signs',11,'/reports/xray20.pdf','2025-01-20 15:00:00'),(21,21,'Abnormal','-','Normal',1,'ECG irregular',11,'/reports/ecg21.pdf','2025-01-21 16:00:00'),(22,22,'0.9','ng/mL','0-0.4',1,'High troponin',11,'/reports/trop22.pdf','2025-01-22 16:00:00'),(23,23,'210','mg/dL','<200',1,'High cholesterol',11,'/reports/lipid23.pdf','2025-01-23 16:00:00'),(24,24,'Normal','-','Normal',0,'ECG stable',11,'/reports/ecg24.pdf','2025-01-24 16:00:00'),(25,25,'0.3','ng/mL','0-0.4',0,'Normal troponin',11,'/reports/trop25.pdf','2025-01-25 16:00:00'),(26,26,'180','mg/dL','<200',0,'Normal lipid',11,'/reports/lipid26.pdf','2025-01-26 16:00:00'),(27,27,'Abnormal','-','Normal',1,'Arrhythmia detected',11,'/reports/ecg27.pdf','2025-01-27 16:00:00'),(28,28,'1.2','ng/mL','0-0.4',1,'Critical troponin',11,'/reports/trop28.pdf','2025-01-28 16:00:00'),(29,29,'230','mg/dL','<200',1,'Very high lipid',11,'/reports/lipid29.pdf','2025-01-29 16:00:00'),(30,30,'Normal','-','Normal',0,'Stable ECG',11,'/reports/ecg30.pdf','2025-01-30 16:00:00'),(31,31,'13.5','g/dL','12-16',0,'Normal CBC',11,'/reports/cbc31.pdf','2025-02-01 13:00:00'),(32,33,'1.1','mg/dL','0.6-1.2',0,'Normal kidney function',11,'/reports/kft33.pdf','2025-02-03 13:00:00'),(33,35,'12.2','g/dL','12-16',0,'Normal CBC',11,'/reports/cbc35.pdf','2025-02-05 13:00:00'),(34,37,'1.4','mg/dL','0.6-1.2',1,'Mild kidney issue',11,'/reports/kft37.pdf','2025-02-07 13:00:00'),(35,39,'14.0','g/dL','12-16',0,'Normal CBC',11,'/reports/cbc39.pdf','2025-02-09 13:00:00'),(36,41,'Clear','-','Clear',0,'No lung infection',11,'/reports/xray41.pdf','2025-02-11 14:00:00'),(37,43,'10','mg/L','0-10',0,'Borderline CRP',11,'/reports/crp43.pdf','2025-02-13 14:00:00'),(38,45,'11.5','g/dL','12-16',1,'Mild anemia',11,'/reports/cbc45.pdf','2025-02-15 14:00:00'),(39,47,'Infection','-','Clear',1,'Lung infection present',11,'/reports/xray47.pdf','2025-02-17 14:00:00'),(40,49,'9','mg/L','0-10',0,'Normal CRP',11,'/reports/crp49.pdf','2025-02-19 14:00:00'),(41,51,'Abnormal','-','Normal',1,'Irregular ECG pattern',11,'/reports/ecg51.pdf','2025-02-21 15:00:00'),(42,53,'205','mg/dL','<200',1,'Slightly high cholesterol',11,'/reports/lipid53.pdf','2025-02-23 15:00:00'),(43,55,'0.7','ng/mL','0-0.4',1,'Elevated troponin',11,'/reports/trop55.pdf','2025-02-25 15:00:00'),(44,57,'Normal','-','Normal',0,'ECG stable',11,'/reports/ecg57.pdf','2025-02-27 15:00:00'),(45,59,'190','mg/dL','<200',0,'Normal lipid profile',11,'/reports/lipid59.pdf','2025-03-01 15:00:00'),(61,61,'Normal','-','Normal',0,'No internal bleeding',11,'/reports/ct61.pdf','2025-03-01 18:00:00'),(62,62,'Fracture','-','None',1,'Forearm fracture confirmed',11,'/reports/xray62.pdf','2025-03-02 18:00:00'),(63,63,'Head Injury','-','None',1,'Minor head injury observed',11,'/reports/ct63.pdf','2025-03-03 18:00:00'),(64,64,'Severe Trauma','-','None',1,'Multiple injuries detected',11,'/reports/trauma64.pdf','2025-03-04 18:00:00'),(65,65,'Normal','-','Normal',0,'No fracture',11,'/reports/xray65.pdf','2025-03-05 18:00:00'),(66,66,'1.5','ng/mL','0-0.4',1,'Critical troponin level',11,'/reports/trop66.pdf','2025-03-06 19:00:00'),(67,67,'Abnormal','-','Normal',1,'Severe arrhythmia',11,'/reports/ecg67.pdf','2025-03-07 19:00:00'),(68,68,'260','mg/dL','<200',1,'Very high cholesterol',11,'/reports/lipid68.pdf','2025-03-08 19:00:00'),(69,69,'2.0','ng/mL','0-0.4',1,'Heart attack indicator',11,'/reports/trop69.pdf','2025-03-09 19:00:00'),(70,70,'Abnormal','-','Normal',1,'Critical ECG',11,'/reports/ecg70.pdf','2025-03-10 19:00:00'),(71,71,'104','mg/dL','70-110',0,'Normal glucose',11,'/reports/sugar71.pdf','2025-03-11 20:00:00'),(72,72,'180','mg/dL','70-110',1,'High glucose level',11,'/reports/sugar72.pdf','2025-03-12 20:00:00'),(73,73,'Positive','-','Negative',1,'Severe infection detected',11,'/reports/infect73.pdf','2025-03-13 20:00:00'),(74,74,'Negative','-','Negative',0,'No infection',11,'/reports/infect74.pdf','2025-03-14 20:00:00'),(75,75,'15','mg/L','0-10',1,'High inflammation',11,'/reports/crp75.pdf','2025-03-15 20:00:00'),(76,76,'11.5','g/dL','12-16',1,'Low hemoglobin',11,'/reports/cbc76.pdf','2025-03-16 21:00:00'),(77,77,'13.8','g/dL','12-16',0,'Normal CBC',11,'/reports/cbc77.pdf','2025-03-17 21:00:00'),(78,78,'Infection','-','Clear',1,'Severe lung infection',11,'/reports/xray78.pdf','2025-03-18 21:00:00'),(79,79,'Clear','-','Clear',0,'Normal lungs',11,'/reports/xray79.pdf','2025-03-19 21:00:00'),(80,80,'Low','-','Normal',1,'Low oxygen level',11,'/reports/oxy80.pdf','2025-03-20 21:00:00'),(81,81,'2.5','ng/mL','0-0.4',1,'Severe cardiac damage',11,'/reports/trop81.pdf','2025-03-21 22:00:00'),(82,82,'Abnormal','-','Normal',1,'Life-threatening ECG',11,'/reports/ecg82.pdf','2025-03-22 22:00:00'),(83,83,'300','mg/dL','<200',1,'Extremely high cholesterol',11,'/reports/lipid83.pdf','2025-03-23 22:00:00'),(84,84,'Infection','-','Clear',1,'Critical infection',11,'/reports/xray84.pdf','2025-03-24 22:00:00'),(85,85,'10','g/dL','12-16',1,'Severe anemia',11,'/reports/cbc85.pdf','2025-03-25 22:00:00'),(86,86,'Normal','-','Normal',0,'Stable condition',11,'/reports/gen86.pdf','2025-03-26 22:00:00'),(87,87,'12.5','g/dL','12-16',0,'Normal CBC',11,'/reports/cbc87.pdf','2025-03-27 22:00:00'),(88,88,'Positive','-','Negative',1,'Infection detected',11,'/reports/infect88.pdf','2025-03-28 22:00:00'),(89,89,'7','mg/L','0-10',0,'Normal CRP',11,'/reports/crp89.pdf','2025-03-29 22:00:00'),(90,90,'Abnormal','-','Normal',1,'Critical ECG',11,'/reports/ecg90.pdf','2025-03-30 22:00:00');
/*!40000 ALTER TABLE `lab_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `med_code` int NOT NULL AUTO_INCREMENT,
  `med_name` varchar(100) NOT NULL,
  `generic_name` varchar(100) DEFAULT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `stock_level` int DEFAULT NULL,
  `reorder_point` int DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`med_code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Paracetamol 500mg','Acetaminophen',2.50,500,100,'2027-12-31'),(2,'Ibuprofen 400mg','Ibuprofen',3.00,400,80,'2027-10-15'),(3,'Aspirin 75mg','Aspirin',1.50,300,60,'2028-01-01'),(4,'Diclofenac 50mg','Diclofenac',2.80,250,50,'2027-08-20'),(5,'Amoxicillin 500mg','Amoxicillin',6.00,350,70,'2027-09-10'),(6,'Azithromycin 250mg','Azithromycin',8.00,200,40,'2026-12-01'),(7,'Cefixime 200mg','Cefixime',10.00,180,30,'2026-11-15'),(8,'Ceftriaxone Injection','Ceftriaxone',45.00,120,20,'2026-06-30'),(9,'Metronidazole 400mg','Metronidazole',4.50,300,60,'2027-05-01'),(10,'Metformin 500mg','Metformin',3.50,400,80,'2028-02-10'),(11,'Glimepiride 2mg','Glimepiride',5.00,250,50,'2027-11-11'),(12,'Insulin Injection','Human Insulin',150.00,100,20,'2026-07-01'),(13,'Atorvastatin 10mg','Atorvastatin',7.00,300,60,'2027-09-09'),(14,'Clopidogrel 75mg','Clopidogrel',6.50,220,50,'2027-08-08'),(15,'Losartan 50mg','Losartan',5.50,280,60,'2027-06-06'),(16,'Amlodipine 5mg','Amlodipine',4.00,260,50,'2027-04-04'),(17,'Pantoprazole 40mg','Pantoprazole',6.00,300,70,'2027-12-12'),(18,'Omeprazole 20mg','Omeprazole',5.00,250,50,'2027-03-03'),(19,'Domperidone 10mg','Domperidone',4.50,200,40,'2026-10-10'),(20,'ORS Sachet','Oral Rehydration Salts',2.00,500,100,'2028-01-15'),(21,'Salbutamol Inhaler','Salbutamol',120.00,90,20,'2027-05-05'),(22,'Montelukast 10mg','Montelukast',7.50,180,40,'2027-07-07'),(23,'Adrenaline Injection','Epinephrine',50.00,70,15,'2026-06-01'),(24,'Dopamine Injection','Dopamine',80.00,60,10,'2026-05-01'),(25,'Heparin Injection','Heparin',90.00,50,10,'2026-04-01'),(26,'Enoxaparin Injection','Enoxaparin',120.00,40,8,'2026-03-01'),(27,'Tramadol 50mg','Tramadol',6.50,150,30,'2027-02-02'),(28,'Morphine Injection','Morphine',200.00,30,5,'2026-01-01'),(29,'Vitamin D3 Capsules','Cholecalciferol',10.00,300,60,'2028-03-01'),(30,'Calcium Tablets','Calcium Carbonate',8.00,280,60,'2027-11-01'),(31,'Iron Tablets','Ferrous Sulfate',5.00,250,50,'2027-09-01'),(32,'Normal Saline 500ml','Sodium Chloride',30.00,200,50,'2027-06-15'),(33,'Ringer Lactate','RL Solution',35.00,180,40,'2027-07-20'),(34,'Hydroxychloroquine 200mg','Hydroxychloroquine',12.00,100,20,'2027-05-05'),(35,'Ondansetron 4mg','Ondansetron',6.00,220,40,'2027-03-15'),(36,'Levocetirizine 5mg','Levocetirizine',3.50,300,60,'2027-08-18'),(37,'Cough Syrup','Dextromethorphan',60.00,150,30,'2027-12-01'),(38,'Antacid Syrup','Aluminium Hydroxide',50.00,160,30,'2027-10-10');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `staff_id` int NOT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `ward_assignment_id` int DEFAULT NULL,
  `certifications` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES (5,'Senior',1,'BSc Nursing'),(6,'Junior',2,'GNM'),(7,'Senior',3,'ICU Certified');
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opd_appointments`
--

DROP TABLE IF EXISTS `opd_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opd_appointments` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `scheduled_date` date NOT NULL,
  `time_slot` time NOT NULL,
  `status` enum('Scheduled','Checked-in','Completed','Cancelled') NOT NULL,
  `chief_complaint` text,
  `exam_room` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  CONSTRAINT `opd_appointments_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `opd_appointments_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opd_appointments`
--

LOCK TABLES `opd_appointments` WRITE;
/*!40000 ALTER TABLE `opd_appointments` DISABLE KEYS */;
INSERT INTO `opd_appointments` VALUES (1,1,1,'2025-01-01','09:00:00','Completed','Fever','OPD1'),(2,2,2,'2025-01-02','09:15:00','Completed','Cold','OPD1'),(3,3,3,'2025-01-03','09:30:00','Completed','Stomach pain','OPD2'),(4,4,4,'2025-01-04','09:45:00','Completed','Headache','OPD2'),(5,5,5,'2025-01-05','10:00:00','Completed','Cough','OPD3'),(6,6,6,'2025-01-06','10:15:00','Checked-in','Fever','OPD1'),(7,7,7,'2025-01-07','10:30:00','Completed','Chest pain','OPD2'),(8,8,8,'2025-01-08','10:45:00','Completed','Vomiting','OPD3'),(9,9,9,'2025-01-09','11:00:00','Completed','Cold','OPD1'),(10,10,10,'2025-01-10','11:15:00','Completed','Fever','OPD2'),(11,11,11,'2025-01-11','11:30:00','Completed','Breathing issue','OPD3'),(12,12,12,'2025-01-12','11:45:00','Completed','Cough','OPD1'),(13,13,13,'2025-01-13','12:00:00','Completed','Chest pain','OPD2'),(14,14,14,'2025-01-14','12:15:00','Completed','Cold','OPD3'),(15,15,15,'2025-01-15','12:30:00','Completed','Fever','OPD1'),(16,16,16,'2025-01-16','13:00:00','Completed','Headache','OPD2'),(17,17,17,'2025-01-17','13:15:00','Completed','Cough','OPD3'),(18,18,18,'2025-01-18','13:30:00','Completed','Fever','OPD1'),(19,19,19,'2025-01-19','13:45:00','Completed','Cold','OPD2'),(20,20,20,'2025-01-20','14:00:00','Completed','Chest pain','OPD3'),(21,21,21,'2025-01-21','14:15:00','Completed','Breathing issue','OPD1'),(22,22,22,'2025-01-22','14:30:00','Completed','Fever','OPD2'),(23,23,23,'2025-01-23','14:45:00','Completed','Vomiting','OPD3'),(24,24,24,'2025-01-24','15:00:00','Completed','Cold','OPD1'),(25,25,25,'2025-01-25','15:15:00','Completed','Cough','OPD2'),(26,26,26,'2025-01-26','15:30:00','Completed','Fever','OPD3'),(27,27,27,'2025-01-27','15:45:00','Completed','Chest pain','OPD1'),(28,28,28,'2025-01-28','16:00:00','Completed','Cold','OPD2'),(29,29,29,'2025-01-29','16:15:00','Completed','Headache','OPD3'),(30,30,30,'2025-01-30','16:30:00','Completed','Fever','OPD1'),(31,31,31,'2025-02-01','09:00:00','Completed','Fever','OPD2'),(32,32,32,'2025-02-02','09:15:00','Completed','Cold','OPD3'),(33,33,33,'2025-02-03','09:30:00','Completed','Stomach pain','OPD1'),(34,34,34,'2025-02-04','09:45:00','Completed','Headache','OPD2'),(35,35,35,'2025-02-05','10:00:00','Completed','Cough','OPD3'),(36,36,36,'2025-02-06','10:15:00','Checked-in','Fever','OPD1'),(37,37,37,'2025-02-07','10:30:00','Completed','Chest pain','OPD2'),(38,38,38,'2025-02-08','10:45:00','Completed','Vomiting','OPD3'),(39,39,39,'2025-02-09','11:00:00','Completed','Cold','OPD1'),(40,40,40,'2025-02-10','11:15:00','Completed','Fever','OPD2'),(41,41,41,'2025-02-11','11:30:00','Completed','Breathing issue','OPD3'),(42,42,42,'2025-02-12','11:45:00','Completed','Cough','OPD1'),(43,43,43,'2025-02-13','12:00:00','Completed','Chest pain','OPD2'),(44,44,44,'2025-02-14','12:15:00','Completed','Cold','OPD3'),(45,45,45,'2025-02-15','12:30:00','Completed','Fever','OPD1'),(46,46,46,'2025-02-16','13:00:00','Completed','Headache','OPD2'),(47,47,47,'2025-02-17','13:15:00','Completed','Cough','OPD3'),(48,48,48,'2025-02-18','13:30:00','Completed','Fever','OPD1'),(49,49,49,'2025-02-19','13:45:00','Completed','Cold','OPD2'),(50,50,50,'2025-02-20','14:00:00','Completed','Chest pain','OPD3'),(51,51,51,'2025-02-21','14:15:00','Completed','Breathing issue','OPD1'),(52,52,52,'2025-02-22','14:30:00','Completed','Fever','OPD2'),(53,53,53,'2025-02-23','14:45:00','Completed','Vomiting','OPD3'),(54,54,54,'2025-02-24','15:00:00','Completed','Cold','OPD1'),(55,55,55,'2025-02-25','15:15:00','Completed','Cough','OPD2'),(56,56,56,'2025-02-26','15:30:00','Completed','Fever','OPD3'),(57,57,57,'2025-02-27','15:45:00','Completed','Chest pain','OPD1'),(58,58,58,'2025-02-28','16:00:00','Completed','Cold','OPD2'),(59,59,59,'2025-03-01','16:15:00','Completed','Headache','OPD3'),(60,60,60,'2025-03-02','16:30:00','Completed','Fever','OPD1');
/*!40000 ALTER TABLE `opd_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `mpid` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female','Other','Unknown') DEFAULT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `primary_address` varchar(255) DEFAULT NULL,
  `insurance_policy_no` varchar(50) DEFAULT NULL,
  `pcp_doctor_id` int DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mpid`),
  UNIQUE KEY `national_id` (`national_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Amit','Sharma','1980-05-12','Male','9876500001','amit@gmail.com','ID1001','Pune','INS1001',2,'2026-04-22 16:45:24',NULL),(2,'Neha','Patil','1992-08-21','Female','9876500002','neha@gmail.com','ID1002','Mumbai','INS1002',2,'2026-04-22 16:45:24',NULL),(3,'Rajesh','Gupta','1975-03-15','Male','9876500003','rajesh@gmail.com','ID1003','Delhi','INS1003',3,'2026-04-22 16:45:24',NULL),(4,'Pooja','Verma','1995-11-10','Female','9876500004','pooja@gmail.com','ID1004','Nagpur','INS1004',2,'2026-04-22 16:45:24',NULL),(5,'Suresh','Yadav','1968-02-28','Male','9876500005','suresh@gmail.com','ID1005','Lucknow','INS1005',3,'2026-04-22 16:45:24',NULL),(6,'Ritika','Jain','2000-06-19','Female','9876500006','ritika@gmail.com','ID1006','Indore','INS1006',2,'2026-04-22 16:45:24',NULL),(7,'Karan','Singh','1988-09-05','Male','9876500007','karan@gmail.com','ID1007','Jaipur','INS1007',3,'2026-04-22 16:45:24',NULL),(8,'Anjali','Shah','1995-09-28','Female','9876500008','anjali@gmail.com','ID1008','Ahmedabad','INS1008',2,'2026-04-22 16:45:24',NULL),(9,'Vikas','Mishra','1972-04-14','Male','9876500009','vikas@gmail.com','ID1009','Kanpur','INS1009',3,'2026-04-22 16:45:24',NULL),(10,'Sneha','Kulkarni','1998-01-11','Female','9876500010','sneha@gmail.com','ID1010','Pune','INS1010',2,'2026-04-22 16:45:24',NULL),(11,'Arjun','Mehta','1985-07-22','Male','9876500011','arjun@gmail.com','ID1011','Surat','INS1011',3,'2026-04-22 16:45:24',NULL),(12,'Kavita','Joshi','1979-10-09','Female','9876500012','kavita@gmail.com','ID1012','Nashik','INS1012',2,'2026-04-22 16:45:24',NULL),(13,'Rohit','Agarwal','1993-03-18','Male','9876500013','rohit@gmail.com','ID1013','Delhi','INS1013',3,'2026-04-22 16:45:24',NULL),(14,'Meena','Iyer','1965-12-01','Female','9876500014','meena@gmail.com','ID1014','Chennai','INS1014',3,'2026-04-22 16:45:24',NULL),(15,'Deepak','Chopra','1982-05-30','Male','9876500015','deepak@gmail.com','ID1015','Mumbai','INS1015',2,'2026-04-22 16:45:24',NULL),(16,'Nikhil','Deshmukh','1997-07-07','Male','9876500016','nikhil@gmail.com','ID1016','Pune','INS1016',2,'2026-04-22 16:45:24',NULL),(17,'Swati','Reddy','1991-02-25','Female','9876500017','swati@gmail.com','ID1017','Hyderabad','INS1017',2,'2026-04-22 16:45:24',NULL),(18,'Manoj','Bansal','1970-08-11','Male','9876500018','manoj@gmail.com','ID1018','Delhi','INS1018',3,'2026-04-22 16:45:24',NULL),(19,'Priya','Nair','1994-06-14','Female','9876500019','priya@gmail.com','ID1019','Kochi','INS1019',2,'2026-04-22 16:45:24',NULL),(20,'Ashok','Pillai','1962-09-20','Male','9876500020','ashok@gmail.com','ID1020','Kerala','INS1020',3,'2026-04-22 16:45:24',NULL),(21,'Rahul','Verma','1991-01-19','Male','9876500021','rahul@gmail.com','ID1021','Noida','INS1021',2,'2026-04-22 16:45:24',NULL),(22,'Divya','Kapoor','1996-11-05','Female','9876500022','divya@gmail.com','ID1022','Delhi','INS1022',2,'2026-04-22 16:45:24',NULL),(23,'Harsh','Trivedi','1989-04-17','Male','9876500023','harsh@gmail.com','ID1023','Ahmedabad','INS1023',3,'2026-04-22 16:45:24',NULL),(24,'Pallavi','Ghosh','1987-03-29','Female','9876500024','pallavi@gmail.com','ID1024','Kolkata','INS1024',2,'2026-04-22 16:45:24',NULL),(25,'Sanjay','Yadav','1976-06-06','Male','9876500025','sanjay@gmail.com','ID1025','Patna','INS1025',3,'2026-04-22 16:45:24',NULL),(26,'Asha','Naidu','1969-10-10','Female','9876500026','asha@gmail.com','ID1026','Hyderabad','INS1026',3,'2026-04-22 16:45:24',NULL),(27,'Tarun','Malhotra','1990-08-18','Male','9876500027','tarun@gmail.com','ID1027','Delhi','INS1027',2,'2026-04-22 16:45:24',NULL),(28,'Komal','Chauhan','1999-05-22','Female','9876500028','komal@gmail.com','ID1028','Jaipur','INS1028',2,'2026-04-22 16:45:24',NULL),(29,'Anil','Dubey','1973-07-13','Male','9876500029','anil@gmail.com','ID1029','Bhopal','INS1029',3,'2026-04-22 16:45:24',NULL),(30,'Ramesh','Patel','1960-02-02','Male','9876500030','ramesh@gmail.com','ID1030','Surat','INS1030',3,'2026-04-22 16:45:24',NULL),(31,'Mahesh','Joshi','1978-03-12','Male','9876500031','mahesh@gmail.com','ID1031','Pune','INS1031',2,'2026-04-22 16:46:50',NULL),(32,'Seema','Joshi','1982-07-21','Female','9876500032','seema@gmail.com','ID1032','Pune','INS1032',2,'2026-04-22 16:46:50',NULL),(33,'Vivek','Sharma','1990-01-15','Male','9876500033','vivek@gmail.com','ID1033','Delhi','INS1033',3,'2026-04-22 16:46:50',NULL),(34,'Ritu','Sharma','1993-05-19','Female','9876500034','ritu@gmail.com','ID1034','Delhi','INS1034',2,'2026-04-22 16:46:50',NULL),(35,'Alok','Pandey','1971-09-09','Male','9876500035','alok@gmail.com','ID1035','Lucknow','INS1035',3,'2026-04-22 16:46:50',NULL),(36,'Kiran','Pandey','1975-11-11','Female','9876500036','kiran@gmail.com','ID1036','Lucknow','INS1036',3,'2026-04-22 16:46:50',NULL),(37,'Gaurav','Bhatia','1987-04-02','Male','9876500037','gaurav@gmail.com','ID1037','Chandigarh','INS1037',2,'2026-04-22 16:46:50',NULL),(38,'Nidhi','Bhatia','1991-08-14','Female','9876500038','nidhi@gmail.com','ID1038','Chandigarh','INS1038',2,'2026-04-22 16:46:50',NULL),(39,'Sunil','Yadav','1969-06-06','Male','9876500039','sunil@gmail.com','ID1039','Varanasi','INS1039',3,'2026-04-22 16:46:50',NULL),(40,'Rekha','Yadav','1972-12-12','Female','9876500040','rekha@gmail.com','ID1040','Varanasi','INS1040',3,'2026-04-22 16:46:50',NULL),(41,'Abhishek','Srivastava','1994-02-20','Male','9876500041','abhishek@gmail.com','ID1041','Lucknow','INS1041',2,'2026-04-22 16:46:50',NULL),(42,'Shalini','Srivastava','1996-10-05','Female','9876500042','shalini@gmail.com','ID1042','Lucknow','INS1042',2,'2026-04-22 16:46:50',NULL),(43,'Kunal','Mehra','1985-07-17','Male','9876500043','kunal@gmail.com','ID1043','Delhi','INS1043',3,'2026-04-22 16:46:50',NULL),(44,'Ankita','Mehra','1989-09-25','Female','9876500044','ankita@gmail.com','ID1044','Delhi','INS1044',2,'2026-04-22 16:46:50',NULL),(45,'Sandeep','Nair','1977-03-03','Male','9876500045','sandeep@gmail.com','ID1045','Kochi','INS1045',3,'2026-04-22 16:46:50',NULL),(46,'Lakshmi','Nair','1981-05-05','Female','9876500046','lakshmi@gmail.com','ID1046','Kochi','INS1046',2,'2026-04-22 16:46:50',NULL),(47,'Ravi','Reddy','1965-08-08','Male','9876500047','ravi@gmail.com','ID1047','Hyderabad','INS1047',3,'2026-04-22 16:46:50',NULL),(48,'Pooja','Reddy','1992-11-11','Female','9876500048','pooja.r@gmail.com','ID1048','Hyderabad','INS1048',2,'2026-04-22 16:46:50',NULL),(49,'Deepak','Chauhan','1988-06-18','Male','9876500049','deepak.c@gmail.com','ID1049','Jaipur','INS1049',2,'2026-04-22 16:46:50',NULL),(50,'Neetu','Chauhan','1993-01-01','Female','9876500050','neetu@gmail.com','ID1050','Jaipur','INS1050',2,'2026-04-22 16:46:50',NULL),(51,'Vinod','Gupta','1974-09-30','Male','9876500051','vinod@gmail.com','ID1051','Delhi','INS1051',3,'2026-04-22 16:46:50',NULL),(52,'Rashmi','Gupta','1978-02-22','Female','9876500052','rashmi@gmail.com','ID1052','Delhi','INS1052',2,'2026-04-22 16:46:50',NULL),(53,'Sahil','Kapoor','1995-12-12','Male','9876500053','sahil@gmail.com','ID1053','Delhi','INS1053',2,'2026-04-22 16:46:50',NULL),(54,'Tanvi','Kapoor','1997-04-04','Female','9876500054','tanvi@gmail.com','ID1054','Delhi','INS1054',2,'2026-04-22 16:46:50',NULL),(55,'Rakesh','Patel','1968-07-07','Male','9876500055','rakesh@gmail.com','ID1055','Ahmedabad','INS1055',3,'2026-04-22 16:46:50',NULL),(56,'Bhavna','Patel','1973-10-10','Female','9876500056','bhavna@gmail.com','ID1056','Ahmedabad','INS1056',2,'2026-04-22 16:46:50',NULL),(57,'Ajay','Singh','1984-03-27','Male','9876500057','ajay@gmail.com','ID1057','Bhopal','INS1057',2,'2026-04-22 16:46:50',NULL),(58,'Kusum','Singh','1986-06-06','Female','9876500058','kusum@gmail.com','ID1058','Bhopal','INS1058',2,'2026-04-22 16:46:50',NULL),(59,'Manish','Tiwari','1979-01-14','Male','9876500059','manish@gmail.com','ID1059','Allahabad','INS1059',3,'2026-04-22 16:46:50',NULL),(60,'Pallavi','Tiwari','1983-08-08','Female','9876500060','pallavi.t@gmail.com','ID1060','Allahabad','INS1060',2,'2026-04-22 16:46:50',NULL),(61,'Prakash','More','1967-04-10','Male','9876500061','prakash@gmail.com','ID1061','Pune','INS1061',3,'2026-04-22 16:49:55',NULL),(62,'Sunita','More','1972-09-21','Female','9876500062','sunita@gmail.com','ID1062','Pune','INS1062',2,'2026-04-22 16:49:55',NULL),(63,'Anand','Desai','1985-12-12','Male','9876500063','anand@gmail.com','ID1063','Mumbai','INS1063',2,'2026-04-22 16:49:55',NULL),(64,'Megha','Desai','1990-03-08','Female','9876500064','megha@gmail.com','ID1064','Mumbai','INS1064',2,'2026-04-22 16:49:55',NULL),(65,'Dinesh','Choudhary','1974-07-17','Male','9876500065','dinesh@gmail.com','ID1065','Jaipur','INS1065',3,'2026-04-22 16:49:55',NULL),(66,'Renu','Choudhary','1978-05-22','Female','9876500066','renu@gmail.com','ID1066','Jaipur','INS1066',2,'2026-04-22 16:49:55',NULL),(67,'Vijay','Saxena','1963-02-14','Male','9876500067','vijay@gmail.com','ID1067','Lucknow','INS1067',3,'2026-04-22 16:49:55',NULL),(68,'Kusum','Saxena','1968-11-09','Female','9876500068','kusum.s@gmail.com','ID1068','Lucknow','INS1068',3,'2026-04-22 16:49:55',NULL),(69,'Rohit','Shetty','1992-06-06','Male','9876500069','rohit.s@gmail.com','ID1069','Mangalore','INS1069',2,'2026-04-22 16:49:55',NULL),(70,'Aarti','Shetty','1995-08-18','Female','9876500070','aarti@gmail.com','ID1070','Mangalore','INS1070',2,'2026-04-22 16:49:55',NULL),(71,'Harish','Naik','1970-10-10','Male','9876500071','harish@gmail.com','ID1071','Goa','INS1071',3,'2026-04-22 16:49:55',NULL),(72,'Savita','Naik','1975-01-01','Female','9876500072','savita@gmail.com','ID1072','Goa','INS1072',2,'2026-04-22 16:49:55',NULL),(73,'Kishore','Patwardhan','1962-03-03','Male','9876500073','kishore@gmail.com','ID1073','Pune','INS1073',3,'2026-04-22 16:49:55',NULL),(74,'Vaishali','Patwardhan','1966-06-06','Female','9876500074','vaishali@gmail.com','ID1074','Pune','INS1074',3,'2026-04-22 16:49:55',NULL),(75,'Tejas','Gokhale','1989-09-09','Male','9876500075','tejas@gmail.com','ID1075','Nagpur','INS1075',2,'2026-04-22 16:49:55',NULL),(76,'Rucha','Gokhale','1993-12-12','Female','9876500076','rucha@gmail.com','ID1076','Nagpur','INS1076',2,'2026-04-22 16:49:55',NULL),(77,'Sanjay','Pawar','1976-04-04','Male','9876500077','sanjay.p@gmail.com','ID1077','Kolhapur','INS1077',3,'2026-04-22 16:49:55',NULL),(78,'Archana','Pawar','1980-07-07','Female','9876500078','archana@gmail.com','ID1078','Kolhapur','INS1078',2,'2026-04-22 16:49:55',NULL),(79,'Nitin','Bhosale','1983-05-05','Male','9876500079','nitin@gmail.com','ID1079','Satara','INS1079',2,'2026-04-22 16:49:55',NULL),(80,'Sangeeta','Bhosale','1987-08-08','Female','9876500080','sangeeta@gmail.com','ID1080','Satara','INS1080',2,'2026-04-22 16:49:55',NULL),(81,'Ganesh','Jadhav','1971-11-11','Male','9876500081','ganesh@gmail.com','ID1081','Solapur','INS1081',3,'2026-04-22 16:49:55',NULL),(82,'Manisha','Jadhav','1974-02-02','Female','9876500082','manisha@gmail.com','ID1082','Solapur','INS1082',2,'2026-04-22 16:49:55',NULL),(83,'Akash','Thakur','1998-01-15','Male','9876500083','akash@gmail.com','ID1083','Bhopal','INS1083',2,'2026-04-22 16:49:55',NULL),(84,'Nisha','Thakur','2001-03-20','Female','9876500084','nisha@gmail.com','ID1084','Bhopal','INS1084',2,'2026-04-22 16:49:55',NULL),(85,'Ravi','Kadam','1964-09-09','Male','9876500085','ravi.k@gmail.com','ID1085','Mumbai','INS1085',3,'2026-04-22 16:49:55',NULL),(86,'Usha','Kadam','1968-12-12','Female','9876500086','usha@gmail.com','ID1086','Mumbai','INS1086',3,'2026-04-22 16:49:55',NULL),(87,'Farhan','Ali','1986-06-06','Male','9876500087','farhan@gmail.com','ID1087','Hyderabad','INS1087',2,'2026-04-22 16:49:55',NULL),(88,'Shabana','Ali','1990-10-10','Female','9876500088','shabana@gmail.com','ID1088','Hyderabad','INS1088',2,'2026-04-22 16:49:55',NULL),(89,'Imran','Khan','1979-07-07','Male','9876500089','imran@gmail.com','ID1089','Delhi','INS1089',3,'2026-04-22 16:49:55',NULL),(90,'Saira','Khan','1983-11-11','Female','9876500090','saira@gmail.com','ID1090','Delhi','INS1090',2,'2026-04-22 16:49:55',NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_allergies`
--

DROP TABLE IF EXISTS `patient_allergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_allergies` (
  `allergy_id` int NOT NULL AUTO_INCREMENT,
  `mpid` int NOT NULL,
  `substance_name` varchar(100) NOT NULL,
  `allergy_code` varchar(20) DEFAULT NULL,
  `reaction` varchar(255) DEFAULT NULL,
  `severity` enum('Mild','Moderate','Severe') NOT NULL,
  `recorded_date` date NOT NULL,
  `recorded_by_staff_id` int NOT NULL,
  PRIMARY KEY (`allergy_id`),
  KEY `mpid` (`mpid`),
  KEY `recorded_by_staff_id` (`recorded_by_staff_id`),
  CONSTRAINT `patient_allergies_ibfk_1` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `patient_allergies_ibfk_2` FOREIGN KEY (`recorded_by_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_allergies`
--

LOCK TABLES `patient_allergies` WRITE;
/*!40000 ALTER TABLE `patient_allergies` DISABLE KEYS */;
INSERT INTO `patient_allergies` VALUES (1,2,'Penicillin','ALG001','Rash','Moderate','2022-01-01',2),(2,4,'Dust','ALG002','Sneezing','Mild','2021-06-10',5),(3,5,'Peanuts','ALG003','Swelling','Severe','2020-03-15',2),(4,7,'Pollen','ALG004','Runny nose','Mild','2021-04-04',6),(5,9,'Milk','ALG005','Stomach upset','Moderate','2022-02-02',5),(6,11,'Sulfa Drugs','ALG006','Skin rash','Moderate','2020-07-07',2),(7,13,'Dust','ALG002','Cough','Mild','2021-08-08',6),(8,15,'Egg','ALG007','Allergic reaction','Moderate','2022-05-05',5),(9,18,'Penicillin','ALG001','Severe rash','Severe','2019-09-09',2),(10,20,'Pollen','ALG004','Sneezing','Mild','2021-01-01',6),(11,22,'Seafood','ALG008','Vomiting','Severe','2020-10-10',2),(12,25,'Dust','ALG002','Breathing issue','Moderate','2022-03-03',5),(13,28,'Latex','ALG009','Skin irritation','Moderate','2021-11-11',6),(14,30,'Peanuts','ALG003','Anaphylaxis','Severe','2020-12-12',2),(15,32,'Milk','ALG005','Bloating','Mild','2022-06-06',5),(16,34,'Sulfa Drugs','ALG006','Rash','Moderate','2021-07-07',6),(17,36,'Dust','ALG002','Sneezing','Mild','2022-08-08',5),(18,38,'Pollen','ALG004','Runny nose','Mild','2021-09-09',6),(19,40,'Egg','ALG007','Swelling','Moderate','2020-02-02',2),(20,42,'Seafood','ALG008','Allergic reaction','Severe','2022-04-04',5),(21,45,'Penicillin','ALG001','Severe allergy','Severe','2019-03-03',2),(22,48,'Dust','ALG002','Cough','Mild','2021-12-12',6),(23,50,'Milk','ALG005','Stomach upset','Moderate','2022-01-15',5),(24,52,'Latex','ALG009','Skin irritation','Moderate','2020-05-05',6),(25,55,'Pollen','ALG004','Sneezing','Mild','2021-06-06',5),(26,58,'Peanuts','ALG003','Severe swelling','Severe','2022-02-20',2),(27,60,'Dust','ALG002','Breathing issue','Moderate','2021-03-03',6),(28,65,'Egg','ALG007','Allergic reaction','Moderate','2022-07-07',5),(29,70,'Seafood','ALG008','Vomiting','Severe','2020-08-08',2),(30,75,'Penicillin','ALG001','Rash','Moderate','2021-09-09',6);
/*!40000 ALTER TABLE `patient_allergies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_history`
--

DROP TABLE IF EXISTS `patient_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `mpid` int NOT NULL,
  `history_type` enum('Past Surgical','Chronic Condition','Family History','Social History') NOT NULL,
  `icd_code` varchar(10) DEFAULT NULL,
  `description` text NOT NULL,
  `recorded_date` date NOT NULL,
  PRIMARY KEY (`history_id`),
  KEY `mpid` (`mpid`),
  CONSTRAINT `patient_history_ibfk_1` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_history`
--

LOCK TABLES `patient_history` WRITE;
/*!40000 ALTER TABLE `patient_history` DISABLE KEYS */;
INSERT INTO `patient_history` VALUES (1,2,'Chronic Condition','E11','Type 2 Diabetes','2020-05-10'),(2,3,'Chronic Condition','I10','Hypertension','2019-08-15'),(3,5,'Chronic Condition','J45','Asthma since childhood','2015-03-20'),(4,7,'Chronic Condition','E78','High cholesterol','2021-01-12'),(5,9,'Chronic Condition','N18','Chronic kidney disease','2022-06-18'),(6,11,'Past Surgical','I21','Previous angioplasty','2021-09-10'),(7,13,'Chronic Condition','I50','Heart failure history','2020-11-22'),(8,15,'Family History','I20','Family history of angina','2018-04-01'),(9,17,'Chronic Condition','K21','Acid reflux long term','2019-07-19'),(10,18,'Chronic Condition','K29','Chronic gastritis','2021-02-25'),(11,20,'Chronic Condition','J44','COPD patient','2018-10-30'),(12,22,'Family History','J18','Family pneumonia cases','2017-05-14'),(13,25,'Social History',NULL,'Smoker for 10 years','2020-01-01'),(14,26,'Social History',NULL,'Alcohol consumption occasionally','2021-03-12'),(15,28,'Past Surgical','S52','Forearm fracture surgery','2016-08-20'),(16,30,'Past Surgical','S72','Femur surgery history','2017-09-10'),(17,32,'Chronic Condition','I63','Stroke history','2022-01-05'),(18,34,'Chronic Condition','I10','Hypertension','2020-02-02'),(19,36,'Chronic Condition','E11','Diabetes','2019-06-15'),(20,38,'Family History','E11','Family diabetes','2018-12-11'),(21,40,'Chronic Condition','L20','Dermatitis','2021-07-07'),(22,42,'Social History',NULL,'Non-smoker','2023-01-01'),(23,44,'Social History',NULL,'Occasional alcohol','2022-02-02'),(24,46,'Chronic Condition','I20','Angina','2020-10-10'),(25,48,'Chronic Condition','I10','Hypertension','2019-09-09'),(26,50,'Chronic Condition','K52','Gastritis','2021-05-05'),(27,52,'Chronic Condition','K30','Indigestion issues','2022-03-03'),(28,54,'Past Surgical','I21','Heart surgery','2018-08-08'),(29,56,'Chronic Condition','J45','Asthma','2020-04-04'),(30,58,'Family History','I50','Heart disease in family','2017-07-07'),(31,60,'Chronic Condition','E11','Diabetes type 2','2021-06-10'),(32,61,'Chronic Condition','I10','Hypertension','2020-03-15'),(33,62,'Chronic Condition','E78','High cholesterol','2022-01-20'),(34,63,'Chronic Condition','J45','Asthma','2018-09-09'),(35,64,'Chronic Condition','J44','COPD','2019-11-11'),(36,65,'Chronic Condition','K21','Acid reflux','2021-04-04'),(37,66,'Chronic Condition','K29','Chronic gastritis','2020-08-08'),(38,67,'Chronic Condition','I20','Angina','2019-12-12'),(39,68,'Past Surgical','I21','Angioplasty history','2022-02-02'),(40,69,'Chronic Condition','I63','Stroke history','2021-07-07'),(41,70,'Social History',NULL,'Smoker (15 years)','2019-01-01'),(42,71,'Social History',NULL,'Alcohol use weekly','2020-02-02'),(43,72,'Family History','E11','Family diabetes','2018-05-05'),(44,73,'Family History','I10','Family hypertension','2017-03-03'),(45,74,'Past Surgical','S06','Head injury surgery','2016-10-10');
/*!40000 ALTER TABLE `patient_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `payment_method` enum('Cash','Card','UPI','Insurance_Claim') NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `received_by_staff_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `received_by_staff_id` (`received_by_staff_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`received_by_staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,'Cash',300.00,'2025-01-01 00:00:00',9),(2,2,2,'UPI',400.00,'2025-01-02 00:00:00',10),(3,3,3,'UPI',500.00,'2025-01-03 00:00:00',9),(4,4,4,'Cash',800.00,'2025-01-04 00:00:00',10),(5,5,5,'UPI',700.00,'2025-01-05 00:00:00',9),(6,40,40,'UPI',3000.00,'2025-02-07 00:00:00',10),(7,41,41,'Cash',2400.00,'2025-02-08 00:00:00',9),(8,47,47,'Cash',500.00,'2025-02-13 00:00:00',10),(9,48,48,'UPI',600.00,'2025-02-14 00:00:00',9),(10,33,33,'Card',25000.00,'2025-02-03 00:00:00',10),(11,44,44,'Card',70000.00,'2025-02-06 00:00:00',9),(12,31,31,'Insurance_Claim',45000.00,'2025-02-01 00:00:00',10),(13,33,33,'Insurance_Claim',120000.00,'2025-02-03 00:00:00',9),(14,34,34,'Insurance_Claim',35000.00,'2025-02-04 00:00:00',10),(15,35,35,'Insurance_Claim',40000.00,'2025-02-05 00:00:00',9),(16,44,44,'Insurance_Claim',90000.00,'2025-02-06 00:00:00',10),(17,45,45,'Insurance_Claim',80000.00,'2025-02-11 00:00:00',9),(18,46,46,'Insurance_Claim',18000.00,'2025-02-12 00:00:00',10),(19,48,48,'Insurance_Claim',22000.00,'2025-02-14 00:00:00',9),(20,49,49,'Insurance_Claim',30000.00,'2025-02-15 00:00:00',10),(21,53,53,'Insurance_Claim',150000.00,'2025-02-09 00:00:00',9),(22,54,54,'Insurance_Claim',180000.00,'2025-02-10 00:00:00',10),(23,50,50,'UPI',4000.00,'2025-02-16 00:00:00',9),(24,52,52,'Insurance_Claim',50000.00,'2025-02-18 00:00:00',10),(25,56,56,'UPI',700.00,'2025-02-20 00:00:00',9),(26,57,57,'Insurance_Claim',30000.00,'2025-02-21 00:00:00',10),(27,58,58,'Card',6000.00,'2025-02-22 00:00:00',9),(28,59,59,'Insurance_Claim',15000.00,'2025-02-23 00:00:00',10),(29,32,32,'Insurance_Claim',25000.00,'2025-02-02 00:00:00',9),(30,43,43,'Insurance_Claim',60000.00,'2025-02-06 00:00:00',10),(31,61,61,'Cash',400.00,'2025-03-01 00:00:00',9),(32,62,62,'UPI',600.00,'2025-03-02 00:00:00',10),(33,63,63,'UPI',500.00,'2025-03-03 00:00:00',9),(34,64,64,'Cash',700.00,'2025-03-04 00:00:00',10),(35,65,65,'UPI',800.00,'2025-03-05 00:00:00',9),(36,66,66,'Card',5000.00,'2025-03-06 00:00:00',10),(37,67,67,'Card',8000.00,'2025-03-07 00:00:00',9),(38,68,68,'UPI',3000.00,'2025-03-08 00:00:00',10),(39,69,69,'Insurance_Claim',35000.00,'2025-03-09 00:00:00',9),(40,70,70,'Insurance_Claim',45000.00,'2025-03-10 00:00:00',10),(41,71,71,'Insurance_Claim',60000.00,'2025-03-11 00:00:00',9),(42,72,72,'Cash',500.00,'2025-03-12 00:00:00',10),(43,73,73,'UPI',700.00,'2025-03-13 00:00:00',9),(44,74,74,'Cash',600.00,'2025-03-14 00:00:00',10),(45,75,75,'Card',10000.00,'2025-03-15 00:00:00',9),(46,76,76,'Insurance_Claim',80000.00,'2025-03-16 00:00:00',10),(47,77,77,'Insurance_Claim',90000.00,'2025-03-17 00:00:00',9),(48,78,78,'UPI',4000.00,'2025-03-18 00:00:00',10),(49,79,79,'UPI',3500.00,'2025-03-19 00:00:00',9),(50,80,80,'Insurance_Claim',50000.00,'2025-03-20 00:00:00',10),(51,81,81,'Insurance_Claim',120000.00,'2025-03-21 00:00:00',9),(52,82,82,'Cash',800.00,'2025-03-22 00:00:00',10),(53,83,83,'UPI',900.00,'2025-03-23 00:00:00',9),(54,84,84,'Card',7000.00,'2025-03-24 00:00:00',10),(55,85,85,'Insurance_Claim',60000.00,'2025-03-25 00:00:00',9),(56,86,86,'Cash',400.00,'2025-03-26 00:00:00',10),(57,87,87,'UPI',600.00,'2025-03-27 00:00:00',9),(58,88,88,'Insurance_Claim',30000.00,'2025-03-28 00:00:00',10),(59,89,89,'UPI',500.00,'2025-03-29 00:00:00',9),(60,90,90,'Cash',300.00,'2025-03-30 00:00:00',10),(61,11,11,'Cash',300.00,'2025-01-11 00:00:00',9),(62,12,12,'UPI',500.00,'2025-01-12 00:00:00',10),(63,13,13,'UPI',400.00,'2025-01-13 00:00:00',9),(64,14,14,'Cash',600.00,'2025-01-14 00:00:00',10),(65,15,15,'UPI',700.00,'2025-01-15 00:00:00',9),(66,16,16,'Card',5000.00,'2025-01-16 00:00:00',10),(67,17,17,'Card',8000.00,'2025-01-17 00:00:00',9),(68,18,18,'UPI',3000.00,'2025-01-18 00:00:00',10),(69,19,19,'Insurance_Claim',35000.00,'2025-01-19 00:00:00',9),(70,20,20,'Insurance_Claim',45000.00,'2025-01-20 00:00:00',10),(71,21,21,'Cash',500.00,'2025-01-21 00:00:00',9),(72,22,22,'UPI',700.00,'2025-01-22 00:00:00',10),(73,23,23,'Cash',600.00,'2025-01-23 00:00:00',9),(74,24,24,'Card',10000.00,'2025-01-24 00:00:00',10),(75,25,25,'Insurance_Claim',80000.00,'2025-01-25 00:00:00',9),(76,26,26,'UPI',4000.00,'2025-01-26 00:00:00',10),(77,27,27,'UPI',3500.00,'2025-01-27 00:00:00',9),(78,28,28,'Insurance_Claim',50000.00,'2025-01-28 00:00:00',10),(79,29,29,'Cash',800.00,'2025-01-29 00:00:00',9),(80,30,30,'UPI',900.00,'2025-01-30 00:00:00',10),(81,6,6,'Cash',300.00,'2025-01-06 00:00:00',9),(82,7,7,'UPI',500.00,'2025-01-07 00:00:00',10),(83,8,8,'UPI',400.00,'2025-01-08 00:00:00',9),(84,9,9,'Cash',600.00,'2025-01-09 00:00:00',10),(85,10,10,'UPI',700.00,'2025-01-10 00:00:00',9),(86,26,26,'Card',6000.00,'2025-02-01 00:00:00',10),(87,27,27,'Insurance_Claim',30000.00,'2025-02-02 00:00:00',9),(88,28,28,'UPI',800.00,'2025-02-03 00:00:00',10),(89,29,29,'Cash',600.00,'2025-02-04 00:00:00',9),(90,30,30,'UPI',700.00,'2025-02-05 00:00:00',10);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `prescribing_staff_id` int NOT NULL,
  `med_code` int NOT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `route` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `dispensed_quantity` int DEFAULT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `prescribing_staff_id` (`prescribing_staff_id`),
  KEY `med_code` (`med_code`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`prescribing_staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `prescriptions_ibfk_4` FOREIGN KEY (`med_code`) REFERENCES `medications` (`med_code`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,1,1,2,1,'500mg','BD','Oral','2025-01-01','2025-01-05',10),(2,2,2,3,1,'500mg','TDS','Oral','2025-01-02','2025-01-06',15),(3,3,3,4,2,'250mg','BD','Oral','2025-01-03','2025-01-07',10),(4,4,4,2,1,'500mg','OD','Oral','2025-01-04','2025-01-06',6),(5,5,5,3,3,'10ml','BD','Oral','2025-01-05','2025-01-09',1),(6,6,6,4,4,'100mg','BD','Oral','2025-01-06','2025-01-10',10),(7,7,7,2,5,'5ml','TDS','Oral','2025-01-07','2025-01-11',1),(8,8,8,3,6,'2 puffs','BD','Inhalation','2025-01-08','2025-01-15',1),(9,9,9,4,4,'100mg','BD','Oral','2025-01-09','2025-01-13',10),(10,10,10,2,7,'250mg','TDS','Oral','2025-01-10','2025-01-14',15),(11,11,11,3,8,'20mg','OD','Oral','2025-01-11','2025-01-20',10),(12,12,12,4,9,'500mg','BD','Oral','2025-01-12','2025-01-18',10),(13,13,13,2,10,'5ml','BD','Oral','2025-01-13','2025-01-17',1),(14,14,14,3,8,'20mg','OD','Oral','2025-01-14','2025-01-22',10),(15,15,15,4,9,'500mg','TDS','Oral','2025-01-15','2025-01-20',15),(16,16,16,2,11,'5mg','OD','Oral','2025-01-16','2025-02-16',30),(17,17,17,3,12,'50mg','OD','Oral','2025-01-17','2025-02-17',30),(18,18,18,4,13,'75mg','OD','Oral','2025-01-18','2025-02-18',30),(19,19,19,2,14,'40mg','OD','Oral','2025-01-19','2025-02-19',30),(20,20,20,3,15,'10mg','OD','Oral','2025-01-20','2025-02-20',30),(21,21,21,4,16,'500mg','BD','Oral','2025-01-21','2025-01-30',10),(22,22,22,2,17,'1 drop','TDS','Eye','2025-01-22','2025-01-27',1),(23,23,23,3,18,'apply','BD','Topical','2025-01-23','2025-01-30',1),(24,24,24,4,19,'500mg','BD','Oral','2025-01-24','2025-01-30',10),(25,25,25,2,20,'500mg','BD','Oral','2025-01-25','2025-01-31',10),(26,26,26,3,1,'500mg','TDS','Oral','2025-01-26','2025-02-02',15),(27,27,27,4,21,'1 vial','OD','IV','2025-01-27','2025-02-01',5),(28,28,28,2,1,'500mg','BD','Oral','2025-01-28','2025-02-03',10),(29,29,29,3,1,'500mg','TDS','Oral','2025-01-29','2025-02-05',15),(30,30,30,4,22,'apply','BD','Topical','2025-01-30','2025-02-05',1),(31,31,31,2,1,'500mg','BD','Oral','2025-02-01','2025-02-05',10),(32,32,32,3,1,'500mg','TDS','Oral','2025-02-02','2025-02-06',15),(33,33,33,4,3,'10ml','BD','Oral','2025-02-03','2025-02-07',1),(34,34,34,2,2,'250mg','BD','Oral','2025-02-04','2025-02-08',10),(35,35,35,3,1,'500mg','OD','Oral','2025-02-05','2025-02-07',6),(36,36,36,4,4,'100mg','BD','Oral','2025-02-06','2025-02-10',10),(37,37,37,2,5,'5ml','TDS','Oral','2025-02-07','2025-02-11',1),(38,38,38,3,6,'2 puffs','BD','Inhalation','2025-02-08','2025-02-15',1),(39,39,39,4,7,'250mg','TDS','Oral','2025-02-09','2025-02-13',15),(40,40,40,2,4,'100mg','BD','Oral','2025-02-10','2025-02-14',10),(41,41,41,3,8,'20mg','OD','Oral','2025-02-11','2025-02-18',10),(42,42,42,4,9,'500mg','BD','Oral','2025-02-12','2025-02-17',10),(43,43,43,2,10,'5ml','BD','Oral','2025-02-13','2025-02-18',1),(44,44,44,3,8,'20mg','OD','Oral','2025-02-14','2025-02-21',10),(45,45,45,4,9,'500mg','TDS','Oral','2025-02-15','2025-02-20',15),(46,46,46,2,11,'5mg','OD','Oral','2025-02-16','2025-03-16',30),(47,47,47,3,12,'50mg','OD','Oral','2025-02-17','2025-03-17',30),(48,48,48,4,13,'75mg','OD','Oral','2025-02-18','2025-03-18',30),(49,49,49,2,14,'40mg','OD','Oral','2025-02-19','2025-03-19',30),(50,50,50,3,15,'10mg','OD','Oral','2025-02-20','2025-03-20',30),(51,51,51,4,16,'500mg','BD','Oral','2025-02-21','2025-02-28',10),(52,52,52,2,17,'1 drop','TDS','Eye','2025-02-22','2025-02-27',1),(53,53,53,3,18,'apply','BD','Topical','2025-02-23','2025-02-28',1),(54,54,54,4,19,'500mg','BD','Oral','2025-02-24','2025-03-01',10),(55,55,55,2,20,'500mg','BD','Oral','2025-02-25','2025-03-02',10),(56,56,56,3,1,'500mg','TDS','Oral','2025-02-26','2025-03-05',15),(57,57,57,4,21,'1 vial','OD','IV','2025-02-27','2025-03-03',5),(58,58,58,2,1,'500mg','BD','Oral','2025-02-28','2025-03-05',10),(59,59,59,3,1,'500mg','TDS','Oral','2025-03-01','2025-03-07',15),(60,60,60,4,22,'apply','BD','Topical','2025-03-02','2025-03-08',1),(61,61,61,2,1,'500mg','BD','Oral','2025-03-01','2025-03-05',10),(62,62,62,3,3,'10ml','TDS','Oral','2025-03-02','2025-03-06',1),(63,63,63,4,2,'250mg','BD','Oral','2025-03-03','2025-03-07',10),(64,64,64,2,1,'500mg','OD','Oral','2025-03-04','2025-03-06',6),(65,65,65,3,5,'5ml','BD','Oral','2025-03-05','2025-03-09',1),(66,66,66,4,8,'20mg','OD','Oral','2025-03-06','2025-03-15',10),(67,67,67,2,9,'500mg','BD','Oral','2025-03-07','2025-03-12',10),(68,68,68,3,10,'5ml','BD','Oral','2025-03-08','2025-03-13',1),(69,69,69,4,8,'20mg','OD','Oral','2025-03-09','2025-03-16',10),(70,70,70,2,9,'500mg','TDS','Oral','2025-03-10','2025-03-15',15),(71,71,71,3,13,'75mg','OD','Oral','2025-03-11','2025-04-11',30),(72,72,72,4,14,'40mg','OD','Oral','2025-03-12','2025-04-12',30),(73,73,73,2,12,'50mg','OD','Oral','2025-03-13','2025-04-13',30),(74,74,74,3,11,'5mg','OD','Oral','2025-03-14','2025-04-14',30),(75,75,75,4,15,'10mg','OD','Oral','2025-03-15','2025-04-15',30),(76,76,76,2,21,'1 vial','OD','IV','2025-03-16','2025-03-20',5),(77,77,77,3,21,'1 vial','BD','IV','2025-03-17','2025-03-22',6),(78,78,78,4,21,'1 vial','TDS','IV','2025-03-18','2025-03-23',9),(79,79,79,2,1,'1g','TDS','IV','2025-03-19','2025-03-25',15),(80,80,80,3,1,'1g','BD','IV','2025-03-20','2025-03-25',10),(81,81,81,4,1,'1g','TDS','IV','2025-03-21','2025-03-27',15),(82,82,82,2,22,'apply','BD','Topical','2025-03-22','2025-03-28',1),(83,83,83,3,1,'500mg','TDS','Oral','2025-03-23','2025-03-29',15),(84,84,84,4,21,'1 vial','OD','IV','2025-03-24','2025-03-29',5),(85,85,85,2,1,'500mg','BD','Oral','2025-03-25','2025-03-30',10),(86,86,86,3,1,'1g','TDS','IV','2025-03-26','2025-04-01',15),(87,87,87,4,5,'5ml','TDS','Oral','2025-03-27','2025-04-02',1),(88,88,88,2,4,'100mg','BD','Oral','2025-03-28','2025-04-03',10),(89,89,89,3,7,'250mg','TDS','Oral','2025-03-29','2025-04-04',15),(90,90,90,4,3,'10ml','BD','Oral','2025-03-30','2025-04-05',1);
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `access_level` int NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',100),(2,'Doctor',80),(3,'Nurse',60),(4,'Pharmacist',50),(5,'Clerk',40),(6,'Technician',45);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_rates`
--

DROP TABLE IF EXISTS `service_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_rates` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `service_code` varchar(50) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `standard_charge` decimal(10,2) NOT NULL,
  `insurance_group_charge` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  UNIQUE KEY `service_code` (`service_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_rates`
--

LOCK TABLES `service_rates` WRITE;
/*!40000 ALTER TABLE `service_rates` DISABLE KEYS */;
INSERT INTO `service_rates` VALUES (1,'CONS_OPD','OPD Consultation',500.00,400.00),(2,'CONS_EMR','Emergency Consultation',1000.00,800.00),(3,'ROOM_GEN','General Ward Bed',1500.00,1200.00),(4,'ROOM_TWIN','Twin Sharing Room',2500.00,2000.00),(5,'ROOM_SINGLE','Single Room',4000.00,3200.00),(6,'ROOM_ICU','ICU Bed',10000.00,8000.00),(7,'ROOM_HDU','HDU Bed',7000.00,5600.00),(8,'LAB_CBC','Complete Blood Count',300.00,250.00),(9,'LAB_KFT','Kidney Function Test',600.00,500.00),(10,'LAB_LFT','Liver Function Test',700.00,550.00),(11,'LAB_LIPID','Lipid Profile',800.00,650.00),(12,'LAB_SUGAR','Blood Sugar',200.00,150.00),(13,'RAD_XRAY','X-Ray',500.00,400.00),(14,'RAD_CT','CT Scan',3000.00,2500.00),(15,'RAD_MRI','MRI Scan',6000.00,5000.00),(16,'PROC_ECG','ECG',400.00,300.00),(17,'PROC_OXY','Oxygen Support',1000.00,800.00),(18,'PROC_INJ','Injection/IV',300.00,250.00),(19,'SERV_NURSE','Nursing Charges (per day)',800.00,600.00),(20,'SERV_EMR','Emergency Handling Charges',2000.00,1500.00);
/*!40000 ALTER TABLE `service_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `staff_type` enum('Admin','Doctor','Nurse','Pharmacist','Clerk','Technician') DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `dept_id` int NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `hospital_departments` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Kushal','Taparia','Admin','kbtaparia','admin',1,1,'9876500001','admin@ehr.com','2022-01-01',1),(2,'Sakshi','Shelake','Doctor','svshelake','ssdoc',2,1,'9876500002','sakshi@ehr.com','2021-02-10',1),(3,'Shivay','Wadhera','Doctor','srwadhera','swdoc',2,2,'9876500003','shivay@ehr.com','2021-03-12',1),(4,'Manashree','Shahapure','Doctor','mmshahapure','msdoc',2,3,'9876500004','manashree@ehr.com','2021-04-15',1),(5,'Priya','Joshi','Nurse','pjoshi','pjnurse',3,1,'9876500005','priya@ehr.com','2022-06-01',1),(6,'Neha','Agarwal','Nurse','nagarwal','nanurse',3,2,'9876500006','neha@ehr.com','2022-07-01',1),(7,'Ritu','Verma','Nurse','rverma','rvnurse',3,3,'9876500007','ritu@ehr.com','2022-08-01',1),(8,'Arjun','Mehta','Pharmacist','arjun_pharma','pass',4,1,'9876500008','arjun@ehr.com','2023-01-01',1),(9,'Vikas','Singh','Clerk','vikas.clerk','pass',5,1,'9876500009','vikas@ehr.com','2023-02-01',1),(10,'Pooja','Gupta','Clerk','pooja.clerk','pass',5,2,'9876500010','pooja@ehr.com','2023-02-10',1),(11,'Sanjay','Yadav','Technician','sanjay.tech','pass',6,1,'9876500011','sanjay@ehr.com','2023-03-01',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_schedule`
--

DROP TABLE IF EXISTS `staff_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `shift_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `duty_location` varchar(100) DEFAULT NULL,
  `is_leave` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `idx_staff_shift` (`staff_id`,`shift_date`,`start_time`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_schedule`
--

LOCK TABLES `staff_schedule` WRITE;
/*!40000 ALTER TABLE `staff_schedule` DISABLE KEYS */;
INSERT INTO `staff_schedule` VALUES (1,2,'2025-03-01','08:00:00','14:00:00','OPD',0),(2,3,'2025-03-01','14:00:00','20:00:00','IPD',0),(3,4,'2025-03-01','20:00:00','08:00:00','Emergency',0),(4,5,'2025-03-01','08:00:00','14:00:00','Ward',0),(5,6,'2025-03-01','14:00:00','20:00:00','ICU',0),(6,7,'2025-03-01','20:00:00','08:00:00','Ward',0),(7,2,'2025-03-02','14:00:00','20:00:00','OPD',0),(8,3,'2025-03-02','20:00:00','08:00:00','ICU',0),(9,4,'2025-03-02','08:00:00','14:00:00','Emergency',0),(10,5,'2025-03-02','14:00:00','20:00:00','Ward',0),(11,6,'2025-03-02','20:00:00','08:00:00','ICU',0),(12,7,'2025-03-02','08:00:00','14:00:00','Ward',0),(13,2,'2025-03-03','20:00:00','08:00:00','Emergency',0),(14,3,'2025-03-03','08:00:00','14:00:00','OPD',0),(15,4,'2025-03-03','14:00:00','20:00:00','IPD',0),(16,5,'2025-03-03','20:00:00','08:00:00','Ward',0),(17,6,'2025-03-03','08:00:00','14:00:00','ICU',0),(18,7,'2025-03-03','14:00:00','20:00:00','Ward',0),(19,2,'2025-03-04','08:00:00','14:00:00','OPD',0),(20,3,'2025-03-04','14:00:00','20:00:00','IPD',0),(21,4,'2025-03-04','20:00:00','08:00:00','Emergency',0),(22,5,'2025-03-04','08:00:00','14:00:00','Ward',0),(23,6,'2025-03-04','14:00:00','20:00:00','ICU',0),(24,7,'2025-03-04','20:00:00','08:00:00','Ward',0),(25,2,'2025-03-05','14:00:00','20:00:00','OPD',0),(26,3,'2025-03-05','20:00:00','08:00:00','ICU',0),(27,4,'2025-03-05','08:00:00','14:00:00','Emergency',0),(28,5,'2025-03-05','14:00:00','20:00:00','Ward',0),(29,6,'2025-03-05','20:00:00','08:00:00','ICU',0),(30,7,'2025-03-05','08:00:00','14:00:00','Ward',0);
/*!40000 ALTER TABLE `staff_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vital_signs`
--

DROP TABLE IF EXISTS `vital_signs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vital_signs` (
  `vitals_id` int NOT NULL AUTO_INCREMENT,
  `encounter_id` int NOT NULL,
  `mpid` int NOT NULL,
  `staff_id` int NOT NULL,
  `measurement_time` datetime NOT NULL,
  `temperature` double DEFAULT NULL,
  `heart_rate` int DEFAULT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `spo2` double DEFAULT NULL,
  `pain_score` int DEFAULT NULL,
  `gcs_score` int DEFAULT NULL,
  PRIMARY KEY (`vitals_id`),
  KEY `encounter_id` (`encounter_id`),
  KEY `mpid` (`mpid`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `vital_signs_ibfk_1` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `vital_signs_ibfk_2` FOREIGN KEY (`mpid`) REFERENCES `patient` (`mpid`),
  CONSTRAINT `vital_signs_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vital_signs`
--

LOCK TABLES `vital_signs` WRITE;
/*!40000 ALTER TABLE `vital_signs` DISABLE KEYS */;
INSERT INTO `vital_signs` VALUES (1,1,1,5,'2025-01-01 09:00:00',38.2,102,'120/80',97,3,15),(2,2,2,5,'2025-01-02 09:10:00',37.8,98,'118/78',98,2,15),(3,3,3,5,'2025-01-03 09:20:00',37.5,95,'120/80',98,2,15),(4,4,4,5,'2025-01-04 09:30:00',37.2,92,'118/76',99,1,15),(5,5,5,5,'2025-01-05 09:40:00',38,100,'122/82',97,3,15),(6,6,6,5,'2025-01-06 10:00:00',37.5,105,'125/85',94,4,15),(7,7,7,5,'2025-01-07 10:10:00',37.8,108,'126/84',93,4,15),(8,8,8,5,'2025-01-08 10:20:00',37.2,100,'122/80',95,3,15),(9,9,9,5,'2025-01-09 10:30:00',37.6,104,'124/82',94,3,15),(10,10,10,5,'2025-01-10 10:40:00',37.3,98,'120/78',96,2,15),(11,11,11,5,'2025-01-11 11:00:00',36.8,88,'118/76',99,2,15),(12,12,12,5,'2025-01-12 11:10:00',37,90,'120/78',98,2,15),(13,13,13,5,'2025-01-13 11:20:00',36.9,85,'118/75',99,1,15),(14,14,14,5,'2025-01-14 11:30:00',37.1,92,'120/80',98,2,15),(15,15,15,5,'2025-01-15 11:40:00',37.2,94,'122/82',97,2,15),(16,16,16,5,'2025-01-16 12:00:00',36.8,110,'140/90',96,3,15),(17,17,17,5,'2025-01-17 12:10:00',36.9,112,'145/92',95,3,15),(18,18,18,5,'2025-01-18 12:20:00',36.7,108,'138/88',96,2,15),(19,19,19,5,'2025-01-19 12:30:00',36.8,115,'150/95',95,3,15),(20,20,20,5,'2025-01-20 12:40:00',36.9,105,'135/85',96,2,15),(21,21,21,5,'2025-01-21 13:00:00',37,95,'120/80',98,2,15),(22,22,22,5,'2025-01-22 13:10:00',36.8,88,'118/78',99,1,15),(23,23,23,5,'2025-01-23 13:20:00',36.9,90,'120/80',98,1,15),(24,24,24,5,'2025-01-24 13:30:00',37.1,96,'122/82',97,2,15),(25,25,25,5,'2025-01-25 13:40:00',37.2,98,'124/84',97,2,15),(26,26,26,5,'2025-01-26 14:00:00',37,102,'125/85',97,5,15),(27,27,27,5,'2025-01-27 14:10:00',37.1,104,'126/86',96,5,15),(28,28,28,5,'2025-01-28 14:20:00',36.9,100,'122/82',97,4,15),(29,29,29,5,'2025-01-29 14:30:00',37,101,'124/84',97,4,15),(30,30,30,5,'2025-01-30 14:40:00',37.1,103,'126/85',96,5,15),(31,31,31,6,'2025-02-01 08:00:00',38.5,105,'130/85',96,4,15),(32,31,31,6,'2025-02-01 14:00:00',37.8,95,'122/80',98,2,15),(33,32,32,6,'2025-02-02 08:00:00',38.2,102,'128/84',96,3,15),(34,32,32,6,'2025-02-02 14:00:00',37.5,92,'120/78',98,2,15),(35,33,33,6,'2025-02-03 08:00:00',38,100,'126/82',97,3,15),(36,33,33,6,'2025-02-03 14:00:00',37.3,90,'118/76',99,1,15),(37,34,34,6,'2025-02-04 08:00:00',37.8,98,'124/80',97,3,15),(38,34,34,6,'2025-02-04 14:00:00',37.2,88,'118/76',99,1,15),(39,35,35,6,'2025-02-05 08:00:00',38.4,104,'130/86',96,4,15),(40,35,35,6,'2025-02-05 14:00:00',37.6,94,'122/80',98,2,15),(41,36,36,6,'2025-02-06 09:00:00',37.8,110,'135/88',92,4,15),(42,36,36,6,'2025-02-06 16:00:00',37.2,98,'125/82',95,2,15),(43,37,37,6,'2025-02-07 09:00:00',37.6,108,'132/86',91,4,15),(44,37,37,6,'2025-02-07 16:00:00',37.1,96,'124/80',95,2,15),(45,38,38,6,'2025-02-08 09:00:00',37.4,105,'130/84',93,3,15),(46,38,38,6,'2025-02-08 16:00:00',37,95,'122/80',96,2,15),(47,39,39,6,'2025-02-09 09:00:00',37.7,109,'134/87',92,4,15),(48,39,39,6,'2025-02-09 16:00:00',37.2,97,'124/82',95,2,15),(49,40,40,6,'2025-02-10 09:00:00',37.5,104,'130/85',93,3,15),(50,40,40,6,'2025-02-10 16:00:00',37,94,'122/80',96,2,15),(51,41,41,6,'2025-02-11 10:00:00',37.2,95,'125/82',98,3,15),(52,41,41,6,'2025-02-11 18:00:00',36.9,88,'118/78',99,1,15),(53,42,42,6,'2025-02-12 10:00:00',37.1,94,'124/80',98,3,15),(54,42,42,6,'2025-02-12 18:00:00',36.8,86,'118/76',99,1,15),(55,43,43,6,'2025-02-13 10:00:00',37,92,'122/78',99,2,15),(56,43,43,6,'2025-02-13 18:00:00',36.7,85,'116/75',99,1,15),(57,44,44,6,'2025-02-14 10:00:00',37.2,96,'125/82',98,3,15),(58,44,44,6,'2025-02-14 18:00:00',36.9,88,'118/78',99,1,15),(59,45,45,6,'2025-02-15 10:00:00',37.3,98,'126/84',97,3,15),(60,45,45,6,'2025-02-15 18:00:00',37,90,'120/80',98,1,15),(61,61,61,7,'2025-03-01 08:00:00',39.5,130,'90/60',85,8,13),(62,61,61,7,'2025-03-01 10:00:00',38.5,115,'105/70',90,6,14),(63,61,61,7,'2025-03-01 14:00:00',37.8,100,'115/75',94,4,15),(64,62,62,7,'2025-03-02 08:00:00',39.2,128,'88/58',84,8,13),(65,62,62,7,'2025-03-02 10:00:00',38.3,112,'102/68',90,6,14),(66,62,62,7,'2025-03-02 14:00:00',37.7,98,'112/72',94,4,15),(67,63,63,7,'2025-03-03 08:00:00',37.5,140,'150/95',88,7,14),(68,63,63,7,'2025-03-03 10:00:00',37.2,120,'135/88',92,5,15),(69,63,63,7,'2025-03-03 14:00:00',36.9,105,'125/82',95,3,15),(70,64,64,7,'2025-03-04 08:00:00',36.8,135,'160/100',87,7,14),(71,64,64,7,'2025-03-04 10:00:00',36.7,118,'145/92',91,5,15),(72,64,64,7,'2025-03-04 14:00:00',36.6,102,'130/85',95,3,15),(73,65,65,7,'2025-03-05 08:00:00',37.9,132,'85/55',83,8,12),(74,65,65,7,'2025-03-05 10:00:00',37.5,115,'98/65',89,6,13),(75,65,65,7,'2025-03-05 14:00:00',37,100,'110/70',93,4,15),(76,66,66,7,'2025-03-06 08:00:00',38,125,'90/60',86,7,13),(77,66,66,7,'2025-03-06 10:00:00',37.6,110,'102/68',90,5,14),(78,66,66,7,'2025-03-06 14:00:00',37.2,98,'112/74',94,3,15),(79,67,67,7,'2025-03-07 08:00:00',36.7,138,'155/98',87,7,14),(80,67,67,7,'2025-03-07 10:00:00',36.6,120,'140/90',91,5,15),(81,67,67,7,'2025-03-07 14:00:00',36.5,105,'128/84',95,3,15),(82,68,68,7,'2025-03-08 08:00:00',39,135,'88/60',84,8,13),(83,68,68,7,'2025-03-08 10:00:00',38.2,118,'100/70',90,6,14),(84,68,68,7,'2025-03-08 14:00:00',37.6,102,'112/74',94,4,15),(85,69,69,7,'2025-03-09 08:00:00',37.4,142,'150/95',88,7,14),(86,69,69,7,'2025-03-09 10:00:00',37.1,122,'138/88',92,5,15),(87,69,69,7,'2025-03-09 14:00:00',36.9,105,'126/82',95,3,15),(88,70,70,7,'2025-03-10 08:00:00',38.8,130,'90/60',85,8,13),(89,70,70,7,'2025-03-10 10:00:00',38,115,'105/70',90,6,14),(90,70,70,7,'2025-03-10 14:00:00',37.5,100,'115/75',94,4,15),(91,71,71,7,'2025-03-11 08:00:00',39.3,132,'92/60',85,8,13),(92,71,71,7,'2025-03-11 10:00:00',38.4,116,'104/70',90,6,14),(93,71,71,7,'2025-03-11 14:00:00',37.7,100,'115/75',94,4,15),(94,72,72,7,'2025-03-12 08:00:00',38.9,130,'88/58',84,8,13),(95,72,72,7,'2025-03-12 10:00:00',38.1,115,'102/68',90,6,14),(96,72,72,7,'2025-03-12 14:00:00',37.5,98,'112/72',94,4,15),(97,73,73,7,'2025-03-13 08:00:00',37.6,140,'155/98',88,7,14),(98,73,73,7,'2025-03-13 10:00:00',37.2,122,'140/90',92,5,15),(99,73,73,7,'2025-03-13 14:00:00',36.9,105,'128/84',95,3,15),(100,74,74,7,'2025-03-14 08:00:00',36.8,138,'160/100',87,7,14),(101,74,74,7,'2025-03-14 10:00:00',36.7,120,'145/92',91,5,15),(102,74,74,7,'2025-03-14 14:00:00',36.6,102,'130/85',95,3,15),(103,75,75,7,'2025-03-15 08:00:00',38.7,135,'90/60',85,8,13),(104,75,75,7,'2025-03-15 10:00:00',38,118,'105/70',90,6,14),(105,75,75,7,'2025-03-15 14:00:00',37.4,102,'115/75',94,4,15),(106,76,76,7,'2025-03-16 08:00:00',37.8,145,'165/105',86,8,13),(107,76,76,7,'2025-03-16 10:00:00',37.3,125,'150/95',90,6,14),(108,76,76,7,'2025-03-16 14:00:00',36.9,110,'135/88',94,4,15),(109,77,77,7,'2025-03-17 08:00:00',39.1,128,'90/60',84,8,13),(110,77,77,7,'2025-03-17 10:00:00',38.2,112,'102/68',89,6,14),(111,77,77,7,'2025-03-17 14:00:00',37.6,98,'112/72',94,4,15),(112,78,78,7,'2025-03-18 08:00:00',37.5,142,'150/95',88,7,14),(113,78,78,7,'2025-03-18 10:00:00',37.1,122,'138/88',92,5,15),(114,78,78,7,'2025-03-18 14:00:00',36.8,105,'126/82',95,3,15),(115,79,79,7,'2025-03-19 08:00:00',38.6,130,'92/60',85,8,13),(116,79,79,7,'2025-03-19 10:00:00',37.9,115,'105/70',90,6,14),(117,79,79,7,'2025-03-19 14:00:00',37.3,100,'115/75',94,4,15),(118,80,80,7,'2025-03-20 08:00:00',37.9,135,'165/100',87,8,13),(119,80,80,7,'2025-03-20 10:00:00',37.4,118,'150/92',91,6,14),(120,80,80,7,'2025-03-20 14:00:00',36.9,102,'135/85',95,4,15),(121,81,81,7,'2025-03-21 08:00:00',38.5,140,'170/105',85,9,12),(122,81,81,7,'2025-03-21 10:00:00',37.8,120,'155/95',90,7,13),(123,81,81,7,'2025-03-21 14:00:00',37.2,105,'140/85',94,5,14),(124,82,82,7,'2025-03-22 08:00:00',39,145,'88/55',82,9,12),(125,82,82,7,'2025-03-22 10:00:00',38.2,125,'100/65',88,7,13),(126,82,82,7,'2025-03-22 14:00:00',37.5,110,'110/72',93,5,14),(127,83,83,7,'2025-03-23 08:00:00',37.6,138,'150/95',88,7,14),(128,83,83,7,'2025-03-23 10:00:00',37.2,120,'138/88',92,5,15),(129,83,83,7,'2025-03-23 14:00:00',36.9,105,'126/82',95,3,15),(130,84,84,7,'2025-03-24 08:00:00',38.8,132,'90/60',85,8,13),(131,84,84,7,'2025-03-24 10:00:00',38,115,'105/70',90,6,14),(132,84,84,7,'2025-03-24 14:00:00',37.4,100,'115/75',94,4,15),(133,85,85,7,'2025-03-25 08:00:00',37.9,140,'165/105',86,8,13),(134,85,85,7,'2025-03-25 10:00:00',37.3,122,'150/95',90,6,14),(135,85,85,7,'2025-03-25 14:00:00',36.9,108,'135/88',94,4,15),(136,86,86,7,'2025-03-26 08:00:00',38.7,135,'92/60',85,8,13),(137,86,86,7,'2025-03-26 10:00:00',38,118,'105/70',90,6,14),(138,86,86,7,'2025-03-26 14:00:00',37.4,102,'115/75',94,4,15),(139,87,87,7,'2025-03-27 08:00:00',37.5,142,'150/95',88,7,14),(140,87,87,7,'2025-03-27 10:00:00',37.1,122,'138/88',92,5,15),(141,87,87,7,'2025-03-27 14:00:00',36.8,105,'126/82',95,3,15),(142,88,88,7,'2025-03-28 08:00:00',39.2,130,'88/58',84,8,13),(143,88,88,7,'2025-03-28 10:00:00',38.3,115,'102/68',90,6,14),(144,88,88,7,'2025-03-28 14:00:00',37.7,98,'112/72',94,4,15),(145,89,89,7,'2025-03-29 08:00:00',38.6,132,'90/60',85,8,13),(146,89,89,7,'2025-03-29 10:00:00',37.9,115,'105/70',90,6,14),(147,89,89,7,'2025-03-29 14:00:00',37.3,100,'115/75',94,4,15),(148,90,90,7,'2025-03-30 08:00:00',37.8,140,'165/105',86,8,13),(149,90,90,7,'2025-03-30 10:00:00',37.2,120,'150/95',90,6,14),(150,90,90,7,'2025-03-30 14:00:00',36.9,105,'135/88',94,4,15);
/*!40000 ALTER TABLE `vital_signs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-22 18:59:49
