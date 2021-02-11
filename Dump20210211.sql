-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: privateschool
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `submission_date` date NOT NULL,
  `total_mark` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'CRUD','using express','2021-06-08',100),(2,'Calculator','vanilla js','2021-05-04',60),(3,'Dropdown','React','2021-08-07',80),(4,'Video Player','Angular','2021-07-18',90),(5,'e-shop','Spring Boot','2021-07-20',100);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `count_of_enrolled_courses_view`
--

DROP TABLE IF EXISTS `count_of_enrolled_courses_view`;
/*!50001 DROP VIEW IF EXISTS `count_of_enrolled_courses_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `count_of_enrolled_courses_view` AS SELECT 
 1 AS `StudentFirstName`,
 1 AS `StudentLastName`,
 1 AS `NumberOfEnrolledCourses`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_assignment`
--

DROP TABLE IF EXISTS `course_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `assignment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_assignment_id__assignments_id` (`assignment_id`),
  KEY `fk_course_id__courses3_id` (`course_id`),
  CONSTRAINT `fk_assignment_id__assignments_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `fk_course_id__courses3_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_assignment`
--

LOCK TABLES `course_assignment` WRITE;
/*!40000 ALTER TABLE `course_assignment` DISABLE KEYS */;
INSERT INTO `course_assignment` VALUES (1,1,1);
/*!40000 ALTER TABLE `course_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_students`
--

DROP TABLE IF EXISTS `course_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `student_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_id__students_id` (`student_id`),
  KEY `fk_course_id__courses_id` (`course_id`),
  CONSTRAINT `fk_course_id__courses_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_student_id__students_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_students`
--

LOCK TABLES `course_students` WRITE;
/*!40000 ALTER TABLE `course_students` DISABLE KEYS */;
INSERT INTO `course_students` VALUES (1,1,1);
/*!40000 ALTER TABLE `course_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_trainers`
--

DROP TABLE IF EXISTS `course_trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_trainers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trainer_id__trainers_id` (`trainer_id`),
  KEY `fk_course_id__courses2_id` (`course_id`),
  CONSTRAINT `fk_course_id__courses2_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_trainer_id__trainers_id` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_trainers`
--

LOCK TABLES `course_trainers` WRITE;
/*!40000 ALTER TABLE `course_trainers` DISABLE KEYS */;
INSERT INTO `course_trainers` VALUES (1,1,1);
/*!40000 ALTER TABLE `course_trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `stream` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'A Title','Javascript','Full-Time','2021-02-28','2021-05-10'),(2,'A Tilte','Java','Full-Time','2021-02-28','2021-05-10'),(3,'A Tilte','C#','Full-Time','2021-02-28','2021-05-10'),(4,'A Tilte','Python','Full-Time','2021-02-28','2021-05-10'),(6,'A Tilte','Java','Part-Time','2021-02-28','2021-08-10'),(7,'A Tilte','Javascript','Part-Time','2021-02-28','2021-08-10'),(8,'A Tilte','C#','Part-Time','2021-02-28','2021-08-10'),(9,'A Tilte','Python','Part-Time','2021-02-28','2021-08-10');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_assignments`
--

DROP TABLE IF EXISTS `student_course_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_assignments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `assignment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_id__students2_id` (`student_id`),
  KEY `fk_assignment_id__assignments2_id` (`assignment_id`),
  KEY `fk_course_id__courses4_id` (`course_id`),
  CONSTRAINT `fk_assignment_id__assignments2_id` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`),
  CONSTRAINT `fk_course_id__courses4_id` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `fk_student_id__students2_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_assignments`
--

LOCK TABLES `student_course_assignments` WRITE;
/*!40000 ALTER TABLE `student_course_assignments` DISABLE KEYS */;
INSERT INTO `student_course_assignments` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `student_course_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `tuition_fees` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Rosio','Brazee','1995-07-31',1000.00),(2,'David','Russel','2001-12-13',2000.00),(3,'Audria','Mitchel','2001-12-14',2000.00),(4,'Jeannette','Dodge','1996-03-28',2000.00),(5,'Tasha ','Fern','1987-06-26',2000.00),(6,'Josh','Morain','1980-03-04',2000.00),(7,'Blythe','Foxx','1994-05-24',2000.00),(8,'Marquita','Kriz','1993-11-01',2000.00),(9,'Brittani','Hite','1990-12-13',2000.00),(10,'Alise','Mcquaig','1988-03-19',2000.00),(11,'Anastasia','Kounoupi','2001-12-06',2000.00),(12,'Anastasia','Kounoupi','2001-12-01',2000.00);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (1,'Jules','Pabon','Front-ReactJs'),(2,'John','Doe','Front-ReactJs'),(3,'Jennifer','Lopez','Back-NodeJs'),(4,'Marcelo','Stalmann','Front-HTML-CSS-JS'),(5,'Racheal','Theere','Front-ReactJs'),(6,'Tisa','Farner','Back-Java'),(7,'Tana','Purtell','Back-NodeJs'),(8,'Cristobal','Marth','Front-ReactJs'),(9,'Jackson','Scholes','Back-Java'),(10,'Martina','Davis','Front-HTML-CSS-JS'),(11,'Ross','Geller','Back-NodeJs');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `count_of_enrolled_courses_view`
--

/*!50001 DROP VIEW IF EXISTS `count_of_enrolled_courses_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `count_of_enrolled_courses_view` AS select `students`.`first_name` AS `StudentFirstName`,`students`.`last_name` AS `StudentLastName`,count(`course_students`.`student_id`) AS `NumberOfEnrolledCourses` from (`students` join `course_students` on((`students`.`id` = `course_students`.`student_id`))) group by `course_students`.`student_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-11 14:32:34
