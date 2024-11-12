-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: project_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `exercise_muscle_groups`
--

DROP TABLE IF EXISTS `exercise_muscle_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_muscle_groups` (
  `exercise_id` int NOT NULL,
  `muscle_id` int NOT NULL,
  PRIMARY KEY (`exercise_id`,`muscle_id`),
  KEY `muscle_id` (`muscle_id`),
  CONSTRAINT `exercise_muscle_groups_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `workout_exercise` (`id`),
  CONSTRAINT `exercise_muscle_groups_ibfk_2` FOREIGN KEY (`muscle_id`) REFERENCES `muscle_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_muscle_groups`
--

LOCK TABLES `exercise_muscle_groups` WRITE;
/*!40000 ALTER TABLE `exercise_muscle_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_muscle_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_required_equipment`
--

DROP TABLE IF EXISTS `exercise_required_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_required_equipment` (
  `exercise_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`exercise_id`,`equipment_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `exercise_required_equipment_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `workout_exercise` (`id`),
  CONSTRAINT `exercise_required_equipment_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `workout_equipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_required_equipment`
--

LOCK TABLES `exercise_required_equipment` WRITE;
/*!40000 ALTER TABLE `exercise_required_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_required_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muscle_group`
--

DROP TABLE IF EXISTS `muscle_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muscle_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(99) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muscle_group`
--

LOCK TABLES `muscle_group` WRITE;
/*!40000 ALTER TABLE `muscle_group` DISABLE KEYS */;
INSERT INTO `muscle_group` VALUES (1,'Quadriceps'),(2,'Hamstrings'),(3,'Glutes'),(4,'Calves'),(5,'Core'),(6,'Chest'),(7,'Back'),(8,'Shoulders'),(9,'Biceps'),(10,'Triceps'),(11,'Forearms');
/*!40000 ALTER TABLE `muscle_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(99) NOT NULL,
  `m_initial` char(1) DEFAULT NULL,
  `l_name` varchar(99) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','nonbinary') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Victor','T','Vu','2003-05-18','male');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_equipment`
--

DROP TABLE IF EXISTS `workout_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(99) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_equipment`
--

LOCK TABLES `workout_equipment` WRITE;
/*!40000 ALTER TABLE `workout_equipment` DISABLE KEYS */;
INSERT INTO `workout_equipment` VALUES (1,'Bodyweight'),(2,'Dumbbells'),(3,'Barbells'),(4,'Kettlebells'),(5,'Weight Machines'),(6,'Cable Machines'),(7,'Smith Machine'),(8,'Cardio Equipment'),(9,'Resistance Bands'),(10,'Calisthenics Station');
/*!40000 ALTER TABLE `workout_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_exercise`
--

DROP TABLE IF EXISTS `workout_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_exercise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(99) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_exercise`
--

LOCK TABLES `workout_exercise` WRITE;
/*!40000 ALTER TABLE `workout_exercise` DISABLE KEYS */;
INSERT INTO `workout_exercise` VALUES (19,'Barbell Squat'),(20,'Hack Squat'),(21,'Single Leg Extension'),(22,'Lying Leg Curl'),(23,'Seated Calf Raise'),(24,'Seated Machine Row'),(25,'Seated Cable Row'),(26,'Lat Pulldown'),(27,'Bicep Curl'),(28,'Back Extension'),(29,'Hammer Curl'),(30,'Barbell Bench Press'),(31,'Dumbbell Bench Press'),(32,'Dumbbell Shoulder Press'),(33,'Single Arm Tricep Extension'),(34,'Incline Dumnbell Bench Press'),(35,'Dumbbell Lateral Raise'),(36,'Tricep Rope Pushdown');
/*!40000 ALTER TABLE `workout_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_session`
--

DROP TABLE IF EXISTS `workout_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(99) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `duration_minutes` int DEFAULT NULL,
  `location` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `workout_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_session`
--

LOCK TABLES `workout_session` WRITE;
/*!40000 ALTER TABLE `workout_session` DISABLE KEYS */;
INSERT INTO `workout_session` VALUES (1,1,'Legs','2024-10-31',71,'SRAC');
/*!40000 ALTER TABLE `workout_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_session_exercise`
--

DROP TABLE IF EXISTS `workout_session_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_session_exercise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` int DEFAULT NULL,
  `exercise_id` int DEFAULT NULL,
  `exercise_order_no` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `exercise_id` (`exercise_id`),
  CONSTRAINT `workout_session_exercise_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `workout_session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `workout_session_exercise_ibfk_2` FOREIGN KEY (`exercise_id`) REFERENCES `workout_exercise` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_session_exercise`
--

LOCK TABLES `workout_session_exercise` WRITE;
/*!40000 ALTER TABLE `workout_session_exercise` DISABLE KEYS */;
INSERT INTO `workout_session_exercise` VALUES (1,1,19,1),(2,1,20,2),(3,1,21,3),(4,1,22,4),(5,1,23,5);
/*!40000 ALTER TABLE `workout_session_exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_set`
--

DROP TABLE IF EXISTS `workout_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_exercise_id` int DEFAULT NULL,
  `rep_count` int DEFAULT NULL,
  `rep_weight` int DEFAULT NULL,
  `set_order_no` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_exercise_id` (`session_exercise_id`),
  CONSTRAINT `workout_set_ibfk_1` FOREIGN KEY (`session_exercise_id`) REFERENCES `workout_session_exercise` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_set`
--

LOCK TABLES `workout_set` WRITE;
/*!40000 ALTER TABLE `workout_set` DISABLE KEYS */;
INSERT INTO `workout_set` VALUES (19,1,10,45,1),(20,1,10,75,2),(21,1,10,75,3),(22,1,10,75,4),(23,2,10,110,1),(24,2,10,120,2),(25,2,10,120,3),(26,3,10,50,1),(27,3,10,70,2),(28,3,10,70,3),(29,3,10,70,4),(30,4,10,40,1),(31,4,10,40,2),(32,4,10,40,3),(33,5,10,40,1),(34,5,10,50,2),(35,5,10,50,3);
/*!40000 ALTER TABLE `workout_set` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 13:12:21
