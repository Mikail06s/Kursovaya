-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sporttrainingdb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `athletes`
--

DROP TABLE IF EXISTS `athletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athletes` (
  `athlete_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `club_id` int DEFAULT NULL,
  `total_trainings` int DEFAULT '0',
  PRIMARY KEY (`athlete_id`),
  UNIQUE KEY `email` (`email`),
  KEY `club_id` (`club_id`),
  KEY `idx_athlete_lastname` (`last_name`),
  CONSTRAINT `athletes_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletes`
--

LOCK TABLES `athletes` WRITE;
/*!40000 ALTER TABLE `athletes` DISABLE KEYS */;
INSERT INTO `athletes` VALUES (1,'Иван','Петров','2000-05-15','Male','+7-999-123-45-67','ivan.petrov@email.com',1,1),(2,'Мария','Сидорова','2001-08-22','Female','+7-999-234-56-78','maria.sidorova@email.com',2,0),(3,'Алексей','Иванов','1999-11-10','Male','+7-999-345-67-89','alexey.ivanov@email.com',1,0),(4,'Екатерина','Смирнова','2002-03-05','Female','+7-999-456-78-90','ekaterina.smirnova@email.com',3,0);
/*!40000 ALTER TABLE `athletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `club_id` int NOT NULL AUTO_INCREMENT,
  `club_name` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `foundation_year` year DEFAULT NULL,
  PRIMARY KEY (`club_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Динамо','Москва',1923),(2,'Спартак','Санкт-Петербург',1935),(3,'Локомотив','Екатеринбург',1936);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`coach_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Сергей','Васильев','Легкая атлетика','+7-999-567-89-01','sergey.vasiliev@email.com'),(2,'Ольга','Козлова','Плавание','+7-999-678-90-12','olga.kozlova@email.com'),(3,'Дмитрий','Морозов','Тяжелая атлетика','+7-999-789-01-23','dmitry.morozov@email.com');
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competitions` (
  `competition_id` int NOT NULL AUTO_INCREMENT,
  `competition_name` varchar(100) NOT NULL,
  `sport_id` int NOT NULL,
  `competition_date` date NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`competition_id`),
  KEY `sport_id` (`sport_id`),
  KEY `idx_competition_date` (`competition_date`),
  CONSTRAINT `competitions_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`sport_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
INSERT INTO `competitions` VALUES (1,'Чемпионат Москвы по бегу',1,'2026-07-10','Москва, стадион \"Лужники\"'),(2,'Кубок Санкт-Петербурга по плаванию',3,'2026-07-15','Санкт-Петербург, бассейн \"Динамо\"');
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `athlete_id` int NOT NULL,
  `competition_id` int NOT NULL,
  `place` int DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `unique_athlete_competition` (`athlete_id`,`competition_id`),
  KEY `idx_results_athlete` (`athlete_id`),
  KEY `idx_results_competition` (`competition_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`) ON DELETE CASCADE,
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON DELETE CASCADE,
  CONSTRAINT `results_chk_1` CHECK ((`place` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,1,1,10.50,'Личный рекорд'),(2,2,2,2,58.30,NULL),(3,3,1,3,11.20,NULL);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports` (
  `sport_id` int NOT NULL AUTO_INCREMENT,
  `sport_name` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sport_id`),
  UNIQUE KEY `sport_name` (`sport_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES (1,'Бег 100м','Легкая атлетика'),(2,'Марафон','Легкая атлетика'),(3,'Кроль 100м','Плавание'),(4,'Толкание ядра','Тяжелая атлетика');
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_deletions_log`
--

DROP TABLE IF EXISTS `training_deletions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_deletions_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `session_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_deletions_log`
--

LOCK TABLES `training_deletions_log` WRITE;
/*!40000 ALTER TABLE `training_deletions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_deletions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_sessions`
--

DROP TABLE IF EXISTS `training_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `athlete_id` int NOT NULL,
  `coach_id` int NOT NULL,
  `sport_id` int NOT NULL,
  `session_date` date NOT NULL,
  `duration_minutes` int DEFAULT NULL,
  `intensity_level` enum('Low','Medium','High') DEFAULT 'Medium',
  `notes` text,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  KEY `idx_session_date` (`session_date`),
  KEY `idx_sessions_athlete` (`athlete_id`),
  KEY `idx_sessions_coach` (`coach_id`),
  KEY `idx_sessions_sport` (`sport_id`),
  CONSTRAINT `training_sessions_ibfk_1` FOREIGN KEY (`athlete_id`) REFERENCES `athletes` (`athlete_id`) ON DELETE CASCADE,
  CONSTRAINT `training_sessions_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`) ON DELETE CASCADE,
  CONSTRAINT `training_sessions_ibfk_3` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`sport_id`) ON DELETE CASCADE,
  CONSTRAINT `training_sessions_chk_1` CHECK ((`duration_minutes` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_sessions`
--

LOCK TABLES `training_sessions` WRITE;
/*!40000 ALTER TABLE `training_sessions` DISABLE KEYS */;
INSERT INTO `training_sessions` VALUES (1,1,1,1,'2026-06-20',90,'High','Спринтерская тренировка','2026-06-25 11:56:40'),(2,2,2,3,'2026-06-21',60,'Medium','Техника плавания','2026-06-25 11:56:40'),(3,3,3,4,'2026-06-22',75,'High','Силовая подготовка','2026-06-25 11:56:40'),(4,4,1,2,'2026-06-23',120,'Low','Длительный кросс','2026-06-25 11:56:40'),(5,1,2,1,'2026-06-25',45,'Medium','Тестовая тренировка','2026-06-25 11:56:40');
/*!40000 ALTER TABLE `training_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_check_duration` BEFORE INSERT ON `training_sessions` FOR EACH ROW BEGIN
    IF NEW.duration_minutes > 240 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Длительность тренировки не может превышать 240 минут';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_trainings_count` AFTER INSERT ON `training_sessions` FOR EACH ROW BEGIN
    UPDATE athletes 
    SET total_trainings = total_trainings + 1
    WHERE athlete_id = NEW.athlete_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_log_training_delete` AFTER DELETE ON `training_sessions` FOR EACH ROW BEGIN
    INSERT INTO training_deletions_log (session_id, deleted_by)
    VALUES (OLD.session_id, USER());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_athlete_training_details`
--

DROP TABLE IF EXISTS `vw_athlete_training_details`;
/*!50001 DROP VIEW IF EXISTS `vw_athlete_training_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_athlete_training_details` AS SELECT 
 1 AS `athlete_id`,
 1 AS `athlete_name`,
 1 AS `sport_name`,
 1 AS `coach_name`,
 1 AS `session_date`,
 1 AS `duration_minutes`,
 1 AS `intensity_level`,
 1 AS `notes`,
 1 AS `club_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_coach_load`
--

DROP TABLE IF EXISTS `vw_coach_load`;
/*!50001 DROP VIEW IF EXISTS `vw_coach_load`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_coach_load` AS SELECT 
 1 AS `coach_name`,
 1 AS `specialty`,
 1 AS `total_sessions`,
 1 AS `total_minutes`,
 1 AS `avg_session_duration`,
 1 AS `unique_athletes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_competition_results`
--

DROP TABLE IF EXISTS `vw_competition_results`;
/*!50001 DROP VIEW IF EXISTS `vw_competition_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_competition_results` AS SELECT 
 1 AS `competition_name`,
 1 AS `competition_date`,
 1 AS `location`,
 1 AS `sport_name`,
 1 AS `athlete_name`,
 1 AS `place`,
 1 AS `score`,
 1 AS `notes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sporttrainingdb'
--

--
-- Dumping routines for database 'sporttrainingdb'
--
/*!50003 DROP FUNCTION IF EXISTS `GetAverageIntensity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetAverageIntensity`(p_athlete_id INT) RETURNS decimal(3,2)
    DETERMINISTIC
BEGIN
    DECLARE avg_intensity DECIMAL(3,2) DEFAULT 0;
    DECLARE total_sessions INT DEFAULT 0;
    DECLARE intensity_sum INT DEFAULT 0;
    
    -- Преобразуем ENUM в числа: Low=1, Medium=2, High=3
    SELECT 
        COUNT(*),
        SUM(CASE intensity_level
            WHEN 'Low' THEN 1
            WHEN 'Medium' THEN 2
            WHEN 'High' THEN 3
            ELSE 0
        END)
    INTO total_sessions, intensity_sum
    FROM training_sessions
    WHERE athlete_id = p_athlete_id;
    
    IF total_sessions > 0 THEN
        SET avg_intensity = intensity_sum / total_sessions;
    END IF;
    
    RETURN ROUND(avg_intensity, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetBestResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetBestResult`(
    p_athlete_id INT,
    p_sport_id INT
) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE best_place INT DEFAULT NULL;
    
    SELECT MIN(r.place) INTO best_place
    FROM results r
    JOIN competitions c ON r.competition_id = c.competition_id
    WHERE r.athlete_id = p_athlete_id 
      AND c.sport_id = p_sport_id;
    
    RETURN best_place;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetTotalTrainingTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetTotalTrainingTime`(p_athlete_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT DEFAULT 0;
    
    SELECT IFNULL(SUM(duration_minutes), 0) INTO total
    FROM training_sessions
    WHERE athlete_id = p_athlete_id;
    
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddTraining` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTraining`(
    IN p_athlete_id INT,
    IN p_coach_id INT,
    IN p_sport_id INT,
    IN p_session_date DATE,
    IN p_duration_minutes INT,
    IN p_intensity_level VARCHAR(10),
    IN p_notes TEXT
)
BEGIN
    INSERT INTO training_sessions (
        athlete_id, 
        coach_id, 
        sport_id, 
        session_date, 
        duration_minutes, 
        intensity_level, 
        notes
    ) VALUES (
        p_athlete_id,
        p_coach_id,
        p_sport_id,
        p_session_date,
        p_duration_minutes,
        p_intensity_level,
        p_notes
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAthleteSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAthleteSummary`(IN p_athlete_id INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_sport_name VARCHAR(50);
    DECLARE v_sessions_count INT;
    DECLARE v_total_duration INT;
    
    DECLARE cur CURSOR FOR
        SELECT 
            s.sport_name,
            COUNT(ts.session_id) AS sessions_count,
            SUM(ts.duration_minutes) AS total_duration
        FROM training_sessions ts
        JOIN sports s ON ts.sport_id = s.sport_id
        WHERE ts.athlete_id = p_athlete_id
        GROUP BY s.sport_name;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Создаём временную таблицу для результатов
    DROP TEMPORARY TABLE IF EXISTS temp_summary;
    CREATE TEMPORARY TABLE temp_summary (
        sport_name VARCHAR(50),
        sessions_count INT,
        total_duration INT
    );
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_sport_name, v_sessions_count, v_total_duration;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        INSERT INTO temp_summary (sport_name, sessions_count, total_duration)
        VALUES (v_sport_name, v_sessions_count, v_total_duration);
    END LOOP;
    
    CLOSE cur;
    
    -- Возвращаем результат
    SELECT * FROM temp_summary;
    
    DROP TEMPORARY TABLE temp_summary;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterResult`(
    IN p_athlete_id INT,
    IN p_competition_id INT,
    IN p_place INT,
    IN p_score DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
    
    INSERT INTO results (athlete_id, competition_id, place, score)
    VALUES (p_athlete_id, p_competition_id, p_place, p_score);
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_athlete_training_details`
--

/*!50001 DROP VIEW IF EXISTS `vw_athlete_training_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_athlete_training_details` AS select `a`.`athlete_id` AS `athlete_id`,concat(`a`.`first_name`,' ',`a`.`last_name`) AS `athlete_name`,`s`.`sport_name` AS `sport_name`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `coach_name`,`ts`.`session_date` AS `session_date`,`ts`.`duration_minutes` AS `duration_minutes`,`ts`.`intensity_level` AS `intensity_level`,`ts`.`notes` AS `notes`,`cl`.`club_name` AS `club_name` from ((((`training_sessions` `ts` join `athletes` `a` on((`ts`.`athlete_id` = `a`.`athlete_id`))) join `coaches` `c` on((`ts`.`coach_id` = `c`.`coach_id`))) join `sports` `s` on((`ts`.`sport_id` = `s`.`sport_id`))) left join `clubs` `cl` on((`a`.`club_id` = `cl`.`club_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_coach_load`
--

/*!50001 DROP VIEW IF EXISTS `vw_coach_load`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_coach_load` AS select concat(`c`.`first_name`,' ',`c`.`last_name`) AS `coach_name`,`c`.`specialty` AS `specialty`,count(`ts`.`session_id`) AS `total_sessions`,sum(`ts`.`duration_minutes`) AS `total_minutes`,round(avg(`ts`.`duration_minutes`),0) AS `avg_session_duration`,count(distinct `ts`.`athlete_id`) AS `unique_athletes` from (`coaches` `c` left join `training_sessions` `ts` on((`c`.`coach_id` = `ts`.`coach_id`))) group by `c`.`coach_id` order by `total_sessions` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_competition_results`
--

/*!50001 DROP VIEW IF EXISTS `vw_competition_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_competition_results` AS select `c`.`competition_name` AS `competition_name`,`c`.`competition_date` AS `competition_date`,`c`.`location` AS `location`,`s`.`sport_name` AS `sport_name`,concat(`a`.`first_name`,' ',`a`.`last_name`) AS `athlete_name`,`r`.`place` AS `place`,`r`.`score` AS `score`,`r`.`notes` AS `notes` from (((`results` `r` join `athletes` `a` on((`r`.`athlete_id` = `a`.`athlete_id`))) join `competitions` `c` on((`r`.`competition_id` = `c`.`competition_id`))) join `sports` `s` on((`c`.`sport_id` = `s`.`sport_id`))) order by `c`.`competition_date` desc,`r`.`place` */;
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

-- Dump completed on 2026-06-25 15:07:53
