CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `administrativestaff`
--

DROP TABLE IF EXISTS `administrativestaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativestaff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Role` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativestaff`
--

LOCK TABLES `administrativestaff` WRITE;
/*!40000 ALTER TABLE `administrativestaff` DISABLE KEYS */;
INSERT INTO `administrativestaff` VALUES (2,'Administrator','admin1@example.com','Administration','John Smith');
/*!40000 ALTER TABLE `administrativestaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admission`
--

DROP TABLE IF EXISTS `admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission` (
  `AdmissionID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `RoomID` int DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Reason` varchar(255) DEFAULT NULL,
  `DischargeDate` date DEFAULT NULL,
  `AdmissionDate` date DEFAULT NULL,
  PRIMARY KEY (`AdmissionID`),
  KEY `PatientID` (`PatientID`),
  KEY `RoomID` (`RoomID`),
  CONSTRAINT `admission_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `admission_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission`
--

LOCK TABLES `admission` WRITE;
/*!40000 ALTER TABLE `admission` DISABLE KEYS */;
INSERT INTO `admission` VALUES (1,1,1,'Admitted','Pneumonia.','2024-04-29','2024-04-24');
/*!40000 ALTER TABLE `admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `AppointmentDate` date DEFAULT NULL,
  `AppointmentTime` time DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (2,1,2,'2024-04-27','09:00:00','Scheduled'),(3,1,2,'2024-04-28','18:04:00','Scheduled'),(4,11,2,'2024-04-27','09:00:00','Scheduled'),(5,11,2,'2024-04-06','19:35:00','Cancelled'),(6,11,2,'2024-05-10','13:18:00','Scheduled'),(7,11,7,'2024-04-27','09:00:00','Scheduled');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmenttype`
--

DROP TABLE IF EXISTS `appointmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointmenttype` (
  `TypeID` int NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(100) DEFAULT NULL,
  `Dimensions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmenttype`
--

LOCK TABLES `appointmenttype` WRITE;
/*!40000 ALTER TABLE `appointmenttype` DISABLE KEYS */;
INSERT INTO `appointmenttype` VALUES (1,'Consultation.','Standard consultation for general health issues.');
/*!40000 ALTER TABLE `appointmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `BillID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` varchar(20) DEFAULT NULL,
  `BillDate` date DEFAULT NULL,
  PRIMARY KEY (`BillID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (2,4,150.00,'Paid','2024-04-01'),(3,4,2000.00,'unpaid','2024-04-28'),(4,11,2000.00,'paid','2024-04-21'),(5,11,1000.00,'Paid','2024-04-13'),(9,11,3000.00,'paid','2024-04-29');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentID` int NOT NULL AUTO_INCREMENT,
  `HeadDoctorID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `HeadDoctorID` (`HeadDoctorID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`HeadDoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (4,2,'Cardiology Department','Cardiology'),(6,3,'Neurology Department','Neurologyy');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Scheduling` varchar(255) DEFAULT NULL,
  `Role` varchar(50) DEFAULT 'pending',
  `Password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (2,'Dr. Sarah Lee','5551234567','sarah@example.com','Monday and Wednesday afternoons',NULL,NULL),(3,'Dr. Jansi Lee','5551234567','sarah@example.com','Monday and Friday afternoons',NULL,NULL),(7,'Dr. Jansi','5551234567','jansii@gmail.com','Monday and Friday afternoons','doctor','$2a$10$tmCUQ1jTLYSeepNc1zRgke9m9ViAR0V2ue0JzffxIxme575pmWALi'),(8,'sai krishna varma','08463904444','mrvarma85@gmail.com','Monday','pending','$2a$10$J0ZfDGWineA810XAQwgj1.x26iRxtLyPplYbuhL1fcyv3ZCtVEG8m'),(9,'sai krishna varma','08463904444','mrvarma85@gmail.com','Monday','pending','$2a$10$S7lqBAXI/lZ3PIcpEiF.Ee2/EHOJyinJKxGV8f21UPh6MSx5wFExa'),(10,'sai krishna varma','08463904444','var@gmail.com','monday','pending','$2a$10$ZRIzUhMVXK/65XeZkigrQumSaPBj9DHeQqbyRaXRqu5KpKLFyBhk2'),(11,'sai krishna varma','08463904444','varr@gmail.com','Monday and wednesday','pending','$2a$10$TR66hxbzt/LJ57zvSZvSjupRej/6KunagRheBPJ7dLRcecnHoJUW.'),(12,'Nanditha Admin','9898987676','admin@gmail.com','EveryDay','admin','$2a$10$YT2zVvH5yC4FYxegQwCw9OnBbsw28TFV.vottgNtK0cNOE8GspxQy');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventoryitem`
--

DROP TABLE IF EXISTS `inventoryitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventoryitem` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `SupplierID` (`SupplierID`),
  CONSTRAINT `inventoryitem_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `provider` (`ProviderID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventoryitem`
--

LOCK TABLES `inventoryitem` WRITE;
/*!40000 ALTER TABLE `inventoryitem` DISABLE KEYS */;
INSERT INTO `inventoryitem` VALUES (1,1,'Bandages','Sterile bandages for wound dressing and wrapping',100,'2025-06-29');
/*!40000 ALTER TABLE `inventoryitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventoryitem_prescription`
--

DROP TABLE IF EXISTS `inventoryitem_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventoryitem_prescription` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ItemID` int DEFAULT NULL,
  `PrescriptionID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ItemID` (`ItemID`),
  KEY `PrescriptionID` (`PrescriptionID`),
  CONSTRAINT `inventoryitem_prescription_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `inventoryitem` (`ItemID`),
  CONSTRAINT `inventoryitem_prescription_ibfk_2` FOREIGN KEY (`PrescriptionID`) REFERENCES `prescription` (`PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventoryitem_prescription`
--

LOCK TABLES `inventoryitem_prescription` WRITE;
/*!40000 ALTER TABLE `inventoryitem_prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventoryitem_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalrecord`
--

DROP TABLE IF EXISTS `medicalrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecord` (
  `RecordID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `TestResults` text,
  `Medication` text,
  `TreatmentPlan` text,
  `Diagnosis` text,
  PRIMARY KEY (`RecordID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `medicalrecord_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `medicalrecord_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecord`
--

LOCK TABLES `medicalrecord` WRITE;
/*!40000 ALTER TABLE `medicalrecord` DISABLE KEYS */;
INSERT INTO `medicalrecord` VALUES (2,1,2,'Normal','Paracetamol','Rest and plenty of fluids','Common cold');
/*!40000 ALTER TABLE `medicalrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `NurseID` int NOT NULL AUTO_INCREMENT,
  `Department` varchar(100) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Scheduling` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NurseID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (1,'Emergency','Emily Johnson','emily@example.com','Monday, Wednesday, Friday'),(2,'Pediatrics','Michael Smith','michael@example.com','Tuesday, Thursday, Saturday'),(3,'Administration','John Smith','admin@example.com',NULL),(4,'Emergency','Raghav','raghav@gmail.com','Monday and Friday'),(5,'Emergency','Rana','rana@gmail.com','Friday');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `InsuranceInformation` varchar(255) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Role` varchar(50) DEFAULT 'patient',
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Some user','Male','1989-12-31','1234567540','123 Main St, City','someone@example.com','Insurance XYZ',NULL,'patient'),(2,'Michael Smith','Male','1975-08-25','5559876543','789 Pine St, Village','michael@example.com','Insurance XYZ',NULL,'patient'),(4,'Kumari','Female','1987-03-12','9876543210','456 Maple St, Town','jane@example.com','Insurance ABC',NULL,'patient'),(6,'Nanditha','Female','1987-03-12','1234123456','456 Maple St, Town','jane@example.com','Insurance ABC','$2a$10$PFC4ouHGOlhxz80oRfRA3OnOZjs.hQhyv/qXynAgGZveTCtMKqhTa','patient'),(7,'Nanditha','Female','1987-03-12','1234123456','456 Maple St, Town','nanditha@example.com','Insurance ABC','$2a$10$FO/fR5WC4u5aNgyYKExJteBx/wEoaM.DiH0/rLobY5c16EfBj7JHW','patient'),(8,'sai krishna varma','male',NULL,'08463904444','door no 6/7, pattepuram\nap,west godavari','mrvarma85@gmail.com','wejkhgfweuihgfwi','$2a$10$fn13u9CebQxLyroBhYGne.Huuo51ZJsGgXxiN9oGdnCBzxjPzZr4i','patient'),(9,'Alia','female','2024-04-11','1111122222','kjwfhciewhuvielrhgunveoukhg','Alia@gmail.com','jkeshbuejgf','$2a$10$m4vDJsnTY2OvL66Qz6ZlQu306r0BbvMAGjCF.njsbIbaHm0vWT58C','patient'),(10,'Nan','Female','1987-03-12','1234123456','456 Maple St, Town','nandu@example.com','Insurance ABC','$2a$10$WgONfmiwM4dnpl9kjihJYeSD2L.muIqh6tutCAomOLFsbCor7b0q6','patient'),(11,'patient1','male','1996-06-04','9879639514','Street:  3, 3,sjprdblr-2, T P Lane, S J P Road\nCity:   Bangalore\nState/province/area:    Karnataka\nPhone number:  22233122\nZip code:  560002\nCountry calling code:  +91\nCountry:  India','patient1@gmail.com','XYZ insurance','$2a$10$mv3k96j0RrHIh3YsQPK8c.6yHwyJHYiJ/PZ8N5IJ6kLsI7ICQQEKu','patient');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `BillID` int DEFAULT NULL,
  `PaymentCode` varchar(20) DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `PaymentAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `BillID` (`BillID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BillID`) REFERENCES `billing` (`BillID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,2,'ABC123','Credit Card',1500.00),(2,4,'11467','Credit card',2000.00),(3,4,'11467','Credit card',2000.00),(4,4,'11467','Credit card',2000.00),(5,4,'CODE','Credit card',2000.00),(6,9,'CODE','Credit card',3000.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `PrescriptionID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Medication` varchar(255) DEFAULT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `Frequency` varchar(50) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,1,2,'2024-04-01','Aspirin','1 tablet','Once daily','7 days');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `ProviderID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProviderID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'ABCD Hospital','+1234567890','abc@example.com','123 Main Street, City, Country'),(2,'XYZ Clinic','+9876543210','xyz@example.com','456 Elm Street, City, Country');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomID` int NOT NULL AUTO_INCREMENT,
  `RoomNumber` varchar(20) DEFAULT NULL,
  `RoomType` varchar(50) DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RoomID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'101','Standard',1),(2,'102','Standard',1),(3,'103','Standard',1),(4,'104','Standard',1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgery`
--

DROP TABLE IF EXISTS `surgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surgery` (
  `SurgeryID` int NOT NULL AUTO_INCREMENT,
  `RoomID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `SurgeryDate` date DEFAULT NULL,
  `SurgeryType` varchar(100) DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  PRIMARY KEY (`SurgeryID`),
  KEY `RoomID` (`RoomID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `FK_PatientID` (`PatientID`),
  CONSTRAINT `FK_PatientID` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `surgery_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`),
  CONSTRAINT `surgery_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery`
--

LOCK TABLES `surgery` WRITE;
/*!40000 ALTER TABLE `surgery` DISABLE KEYS */;
INSERT INTO `surgery` VALUES (1,1,2,'Scheduled.','2024-04-30','Appendectomy',NULL),(4,2,7,'Scheduled','2024-05-01','Appendectomy',11);
/*!40000 ALTER TABLE `surgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `TestID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`TestID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'Blood Test',45.00,'A test to analyze blood samples for various parameters.'),(2,'X-Ray',100.00,'A test that uses electromagnetic radiation to produce images of the inside of the body.'),(4,'MRI Scan',300.00,'A medical imaging technique used to visualize internal structures of the body in detail.');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testresult`
--

DROP TABLE IF EXISTS `testresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testresult` (
  `ResultID` int NOT NULL AUTO_INCREMENT,
  `TestID` int DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `ResultDetails` text,
  `ResultDate` date DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  KEY `TestID` (`TestID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `testresult_ibfk_1` FOREIGN KEY (`TestID`) REFERENCES `test` (`TestID`),
  CONSTRAINT `testresult_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`),
  CONSTRAINT `testresult_ibfk_3` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testresult`
--

LOCK TABLES `testresult` WRITE;
/*!40000 ALTER TABLE `testresult` DISABLE KEYS */;
INSERT INTO `testresult` VALUES (1,1,1,2,'Blood test results are within normal range :).','2024-04-26'),(2,1,11,7,'Blood test results are not normal .','2024-04-27');
/*!40000 ALTER TABLE `testresult` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29  0:00:34
