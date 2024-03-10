-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: student_record_keeper
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `course_information`
--

DROP TABLE IF EXISTS `course_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_information` (
  `Course_ID` varchar(5) NOT NULL,
  `Course_name` varchar(25) NOT NULL,
  `Instructor` varchar(25) NOT NULL,
  `Classroom` varchar(15) NOT NULL,
  `Credit` decimal(10,2) NOT NULL,
  `Online` int NOT NULL,
  `Textbook` int NOT NULL,
  PRIMARY KEY (`Course_ID`),
  CONSTRAINT `course_information_chk_1` CHECK ((`Credit` >= 0)),
  CONSTRAINT `course_information_chk_2` CHECK ((`Online` in (0,1))),
  CONSTRAINT `course_information_chk_3` CHECK ((`Textbook` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_information`
--

LOCK TABLES `course_information` WRITE;
/*!40000 ALTER TABLE `course_information` DISABLE KEYS */;
INSERT INTO `course_information` VALUES ('AR104','Archaeology and Greece','Dr. Gao','None',0.50,1,1),('CH110','Intro to Chemistry I','Dr. Gao','BA100',0.50,0,1),('CH111','Intro to Chemistry II','Dr. Gao','LH3061',0.50,0,1),('CH456','Medicinal Chemistry','Dr. Gao','BA111',0.50,0,1),('CP104','Intro to Programming','Dr. Gao','BA101',0.50,0,0),('CP164','Data Structures','Dr. Gao','NC1000',0.50,0,1),('CP212','Intro to Windows Pr.','Dr. Gao','BA130',0.50,0,0),('CP213','Object Oriented Pr.','Dr. Gao','NC1002',0.50,0,0),('CP214','Discrete Structures','Dr. Gao','LZ100',0.50,0,1),('CP216','Microprocessors I','Dr. Gao','LH1000',0.50,0,1),('CP220','Digital Electronics I','Dr. Gao','BA111',0.50,0,1),('CP264','Data Structures II','Dr. Fatima','PB100',0.50,0,0),('CP312','Analyzing Algorithms I','Dr. Gao','LH1000',0.50,0,1),('CP317','Software Engineering','Dr. Gao','LH2003',0.50,0,1),('CP363','Database I','Dr. Gao','BA130',0.50,0,0),('CP373','Ethics and Practice CS','Dr. Gao','LH3060',0.50,0,1),('CP386','Operating Systems I','Dr. Gao','NC1002',0.50,0,1),('MA102','Advanced Functions','Dr. Gao','LZ100',0.50,1,1),('MA103','Intro to Calculus I','Dr. Gao','BA102',0.50,1,1),('MA104','Intro to Calculus II','Dr. Gao','LZ101',0.50,0,1),('MA121','Intro to Math Proofs','Dr. Gao','NC1001',0.50,0,1),('MA122','Linear Algebra','Dr. Gao','LH3060',0.50,0,1),('OL100','Leadership Foundations','Dr. Gao','None',0.50,1,1),('PC131','Intro to Physics II','Dr. Gao','BA201',0.50,0,1),('PC132','Intro to Physics I','Dr. Gao','BA202',0.50,0,1),('PC301','Electricity and Magnetism','Dr. Gao','BA203',0.50,0,1),('PC310','Optics','Dr. Gao','NC2010',0.50,0,1);
/*!40000 ALTER TABLE `course_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `Student_ID` int NOT NULL,
  `Course_ID` varchar(5) NOT NULL,
  `Midterm_1` decimal(10,2) DEFAULT NULL,
  `Midterm_2` decimal(10,2) DEFAULT NULL,
  `Project_Presentation` decimal(10,2) DEFAULT NULL,
  `Project_Report` decimal(10,2) DEFAULT NULL,
  `Final_Exam` decimal(10,2) DEFAULT NULL,
  `Completion_Status` int NOT NULL,
  `Final_Grade` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Student_ID`,`Course_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course_information` (`Course_ID`),
  CONSTRAINT `courses_chk_1` CHECK ((`Midterm_1` >= 0)),
  CONSTRAINT `courses_chk_2` CHECK ((`Midterm_2` >= 0)),
  CONSTRAINT `courses_chk_3` CHECK ((`Project_Presentation` >= 0)),
  CONSTRAINT `courses_chk_4` CHECK ((`Project_Report` >= 0)),
  CONSTRAINT `courses_chk_5` CHECK ((`Final_Exam` >= 0)),
  CONSTRAINT `courses_chk_6` CHECK ((`Completion_Status` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (210570000,'AR104',90.00,85.00,90.00,83.47,78.00,1,83.47),(210570000,'MA103',70.00,65.00,80.00,73.24,75.00,1,73.24),(210570000,'MA104',85.00,60.00,70.00,74.65,78.00,1,74.65),(210570000,'MA121',75.00,85.00,78.00,85.29,92.00,1,85.29),(210570000,'MA122',72.00,68.00,88.00,78.82,82.00,1,78.82),(210570123,'CP212',95.00,100.00,90.00,88.00,90.00,1,91.95),(210570123,'CP213',90.00,85.00,90.00,75.00,97.00,1,89.80),(210570123,'CP216',50.00,81.00,45.00,60.00,78.00,1,66.60),(210570123,'CP220',75.00,70.00,78.00,100.00,76.00,1,78.85),(210570123,'CP264',50.00,65.00,60.00,85.00,65.00,1,65.00),(210570668,'CH456',92.00,81.00,40.00,100.00,75.00,1,76.95),(210570668,'MA121',78.00,100.00,90.00,88.00,76.00,1,83.80),(210570668,'MA122',90.00,90.00,90.00,90.00,90.00,1,90.00),(210570668,'PC301',75.00,75.00,100.00,100.00,81.00,1,84.90),(210570668,'PC310',62.00,100.00,60.00,60.00,70.00,1,70.30),(210570767,'CP212',78.00,75.00,76.00,77.00,72.00,1,74.70),(210570767,'MA122',80.00,80.00,80.00,80.00,80.00,1,80.00),(210570767,'OL100',92.00,100.00,90.00,100.00,80.00,1,89.30),(210570767,'PC301',55.00,35.00,45.00,66.00,50.00,1,50.15),(210570767,'PC310',62.00,70.00,88.00,60.00,70.00,1,70.00),(210571111,'AR104',100.00,100.00,100.00,92.00,90.00,1,94.80),(210571111,'MA102',83.00,72.00,94.00,0.00,68.00,1,64.55),(210571111,'OL100',100.00,90.00,90.00,83.00,84.00,1,88.05),(210571111,'PC131',92.00,90.00,90.00,85.00,80.00,1,85.55),(210571111,'PC132',80.00,76.00,76.00,55.00,80.00,1,75.05),(210571234,'CP363',52.00,80.00,68.25,100.00,80.00,1,77.04),(210571234,'CP386',65.00,76.00,90.00,82.00,80.00,1,78.95),(210573333,'CP104',20.00,30.00,20.25,30.00,40.00,0,31.04),(210576545,'CP312',40.00,50.00,60.25,30.00,20.00,0,35.04),(210576545,'CP386',85.00,56.00,90.00,92.00,88.00,1,83.65),(210576850,'CP312',100.00,100.00,100.00,100.00,100.00,1,100.00),(210576850,'CP317',100.00,100.00,100.00,100.00,100.00,1,100.00),(210576850,'CP363',100.00,100.00,100.00,100.00,100.00,1,100.00),(210576850,'CP373',100.00,100.00,100.00,100.00,100.00,1,100.00),(210576850,'CP386',100.00,100.00,100.00,100.00,100.00,1,100.00),(210579999,'AR104',98.00,61.00,88.00,100.00,83.00,1,85.25),(210579999,'CP220',75.00,85.00,78.00,70.00,92.00,1,83.00),(210579999,'CP264',50.00,0.00,55.00,25.00,70.00,0,47.50),(210579999,'PC301',70.00,81.00,90.00,30.00,64.00,1,66.25),(210579999,'PC310',81.00,62.00,0.00,88.65,78.00,1,65.95);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` varchar(10) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Province` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('ADR001','Milton','Ontario','Canada'),('ADR002','Markham','Ontario','Canada'),('ADR003','Toronto','Ontario','Canada'),('ADR004','Waterloo','Ontario','Canada'),('ADR005','Vancouver','British Columbia','Canada'),('ADR006','Mississauga','Ontario','Canada'),('ADR009','Oshawa','Ontario','Canada');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_ID` int NOT NULL,
  `Lastname` varchar(20) NOT NULL,
  `Firstname` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Domestic` int NOT NULL,
  `Age` int DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `location_id` varchar(10) DEFAULT NULL,
  `Emergency_Contact` varchar(20) NOT NULL,
  `Phone_number` varchar(15) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Major` varchar(25) NOT NULL,
  `Minor` varchar(25) NOT NULL,
  `Degree` varchar(35) NOT NULL,
  `Admission_year` year NOT NULL,
  `GPA` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Student_ID` (`Student_ID`),
  KEY `student_ibfk_1` (`location_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `student_chk_1` CHECK ((`Domestic` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (210570000,'Johnson','Robert','Female',1,18,'789 Elm St','ADR004','Sister','555-123-4567','robert.johnson@example.ca','Mathematics','None','Bachelors',2023,9.00),(210570123,'Doe','John','Female',1,19,'123 Markham St','ADR002','Brother','127-456-7891','john.doe@example.ca','Computer Science','Mathematics','Bachelors',2022,5.00),(210570668,'Dory','Bory','Female',1,19,'123 Something St','ADR006','Brother','127-999-7891','bory.dory@example.ca','Chemistry','Mathematics','Bachelors',2022,6.50),(210570767,'Smith','Rock','Male',0,20,'457 IDK St','ADR006','Mother','987-999-3210','rock.smith@example.ca','Physics','None','Bachelors',2021,9.00),(210571111,'Sean','Paul','Male',1,18,'789 Rock St','ADR006','Sister','989-123-4567','paul.sean@example.ca','Physics','None','Bachelors',2023,4.50),(210571234,'Wang','Sophia','Female',0,20,'234 Pine St','ADR005','Aunt','333-987-6543','sophia.wang@example.ca','Computer Science','Statistics','Bachelors',2021,11.00),(210573333,'Justin','Bieber','Female',0,19,'367 Baby Rd','ADR004','Sister','435-666-7077','bieber.justin@example.ca','Computer Science','Physics','Bachelors',2023,0.50),(210576545,'Wang','Jamaica','Female',0,20,'234 Johnson St','ADR003','Aunt','723-987-8765','jamaica.wang@example.ca','Computer Science','None','Bachelors',2021,8.00),(210576850,'Danial','Usman','Male',0,20,'123 Main Rd','ADR001','Father','123-456-7890','danialusman@example.ca','Computer Science','None','Bachelors',2021,8.50),(210579999,'Smith','Bob','Male',0,20,'456 Oak St','ADR003','Mother','987-654-3210','jane.smith@example.ca','Physics','Chemistry','Bachelor',2021,10.50);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-09 21:59:57
