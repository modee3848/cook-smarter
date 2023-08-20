CREATE DATABASE  IF NOT EXISTS `dbp2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `dbp3`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: database-project-pwrmysqldatabaseazurecom.mysql.database.azure.com    Database: dbp3
-- ------------------------------------------------------
-- Server version	5.7.39-log

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
-- Table structure for table `gramatura`
--

DROP TABLE IF EXISTS `gramatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gramatura` (
  `id_gramatura` int(11) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ilosc_w_jednosce` int(11) NOT NULL,
  `SI_unit` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_gramatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gramatura`
--

LOCK TABLES `gramatura` WRITE;
/*!40000 ALTER TABLE `gramatura` DISABLE KEYS */;
INSERT INTO `gramatura` VALUES (1,'szklanka',250,'ml'),(2,'łyżka',10,'gram'),(3,'ml',1,'ml'),(4,'sztuki',1,'sztuki'),(5,'gram',1,'gram'),(6,'litr',1000,'ml'),(7,'kilogram',1000,'gram'),(8,'łyżeczka',5,'gram'),(9,'szczypta',1,'gram');
/*!40000 ALTER TABLE `gramatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `oceny_wszystkich_przepisów_i_opinie`
--

DROP TABLE IF EXISTS `oceny_wszystkich_przepisów_i_opinie`;
/*!50001 DROP VIEW IF EXISTS `oceny_wszystkich_przepisów_i_opinie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `oceny_wszystkich_przepisów_i_opinie` AS SELECT 
 1 AS `nazwa`,
 1 AS `ocena_user`,
 1 AS `recenzja`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `przepisy`
--

DROP TABLE IF EXISTS `przepisy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przepisy` (
  `id_przepis` int(11) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instrukcja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rozmiar_porcji` int(11) NOT NULL,
  `ocena` float DEFAULT NULL,
  `ilosc_skladnikow` int(11) NOT NULL,
  PRIMARY KEY (`id_przepis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przepisy`
--

LOCK TABLES `przepisy` WRITE;
/*!40000 ALTER TABLE `przepisy` DISABLE KEYS */;
INSERT INTO `przepisy` VALUES (1,'Rolada z kurczaka z serem i szpinakiem','https://www.przyslijprzepis.pl/przepis/rolada-serowa-z-kurczakiem-i-szpinakiem',4,3.6,4),(2,'Tosty z awokado i jajkiem','https://aniastarmach.pl/przepis/tosty-z-awokado-i-jajkiem/',2,2.5,4),(3,'Spaghetti carbonara','https://aniagotuje.pl/przepis/carbonara',4,3,5),(4,'Sałatka z grillowanym tofu','https://www.zajadam.pl/salatki/salatka-z-grillowanym-tofu',4,3,4),(5,'Pizza wiejska z kiełbasą i cebulą','https://smacznapyza.blogspot.com/2012/02/pizza-wiejska-z-kiebasa.html',4,3.5,10),(6,'Nalesniki','https://www.kwestiaprzepisu.pl/przepis/nalesniki/',2,3.7,3),(7,'Makaron domowy','https://aniagotuje.pl/przepis/makaron-domowy',4,1.5,2),(8,'Zapiekanki z serem i pieczarkami','https://www.kwestiasmaku.com/przepis/zapiekanki',2,4.5,4),(9,'Jajecznica z boczkiem i cebulą','https://www.winiary.pl/przepisy/jajecznica-na-masle-z-boczkiem-i-cebula/',2,2,4),(10,'Tofucznica','https://www.olgasmile.com/tofucznica.html',2,3.7,4),(11,'Woda z ogórkiem i cytryną','https://gotujmy.pl/woda-z-ogorkiem-i-cytryna,przepisy-szybkie-i-smaczne-przepis,267607.html',4,5,3),(12,'Makaron pesto z parmezanem','https://aniagotuje.pl/przepis/makaron-z-zielonym-pesto-i-mozzarella',4,3,4),(13,'Smażony boczek','https://www.doradcasmaku.pl/przepis-swiezy-boczek-smazony-z-cebula-247733',2,3,3),(14,'Lemoniada Detoks','https://smacznyblog.pl/lemoniada-na-detoks-ogorek-i-limonka/',4,4.5,6),(15,'Shot odpornościowy','https://www.kuchniamagdaleny.pl/2020/03/shot-z-kurkuma-na-odpornosc.html',6,3,8),(16,'Makaron ze szpinakiem','https://aniagotuje.pl/przepis/makaron-ze-szpinakiem',4,4,7),(17,'Placki ziemniaczane','https://www.przepisy.pl/przepis/chrupiace-placki-ziemniaczane',4,3.5,4),(18,'Kurczak pieczony na butelce ','https://www.przepisy.pl/przepis/kurczak-pieczony-na-butelce-2',5,3,3),(19,'Ciasto na pierogi bez jajka','https://www.przepisy.pl/przepis/ciasto-na-pierogi-bez-jajka',2,3,3),(20,'Mięso na burgery','https://www.przepisy.pl/przepis/mieso-na-burgery',4,2.5,3),(21,'Lody waniliowe z espresso','https://www.przepisy.pl/przepis/lody-waniliowe-z-espresso',1,5,2),(22,'Kawa Americano','https://www.starbucksathome.com/pl/przepisy/caffe-americano',1,5,2),(23,'Herbata czarna po hiszpańsku','https://www.czajnikowy.com.pl/sposob-na-nudna-zwykla-czarna-herbate-z-cytryna-jak-zrobic-efektowna-herbate/',1,2.5,3),(24,'Zielona herbata Hiszpańska Sangria','https://eczajnik.pl/zielona-herbata-z-dodatkami/289-herbata-zielona-hiszpa%C5%84ska-sangria.html',1,3.5,2),(25,'Oliwa czosnkowa','https://www.winiary.pl/przepisy/oliwa-smakowa-czosnkowa/',25,3,2),(26,'Sos cebulowy','https://www.przepisy.pl/przepis/sos-cebulowy',1,2,3),(27,'Herbata malinowa','https://www.przepisy.pl/przepis/herbata-malinowa',1,3,4),(28,'Rogaliki kruche','https://kurkanielotka.pl/przepis/rogaliki-kruche/',20,3,6),(29,'Tortille','https://aniagotuje.pl/przepis/domowe-tortille-pszenne',12,4,4),(30,'Woda z malinami','https://www.mniammniam.com/woda-z-malinami',4,3.5,3),(31,'Sos pieczarkowy','https://www.kwestiasmaku.com/przepis/sos-pieczarkowy-ii',3,3,6),(32,'Pralinki z mascarpone','https://www.przepisy.pl/przepis/pralinki-z-mascarpone',3,1,3),(33,'Polewa lukrowa do pączków','https://www.przepisy.pl/przepis/polewa-lukrowa-do-paczkow',1,4,3),(34,'Soczysty kurczak z patelni','https://www.przepisy.pl/przepis/soczysty-kurczak-z-patelni',2,2,3),(35,'Soczysty kurczak w majonezie','https://www.przepisy.pl/przepis/soczysty-kurczak-w-majonezie',2,1,3),(36,'Lukier z białkiem','https://www.przepisy.pl/przepis/lukier-z-bialkiem-11965',1,5,3),(37,'Lukier cytrynowy','https://www.przepisy.pl/przepis/lukier-cytrynowy',1,3.5,3),(38,'Marchewki w plastrach boczku','https://www.przepisy.pl/przepis/marchewki-w-plastrach-boczku',2,1,4),(39,'Dip do grillowanych warzyw ','https://www.przepisy.pl/przepis/dip-do-grillowanych-warzyw',2,3.5,3),(40,'Kotlety mielone ','https://www.przepisy.pl/przepis/kotlety-mielone',2,2,4),(41,'Domowy kisiel truskawkowy','https://www.przepisy.pl/przepis/domowy-kisiel-truskawkowy',1,3,4),(42,'Koktajl owocowy z kefirem','https://www.przepisy.pl/przepis/koktajl-owocowy-z-kefirem',3,2,3),(43,'Galaretka z owocami','https://www.przepisy.pl/przepis/galaretka-z-owocami-2',2,1.5,2),(44,'Kefir z otrębami i ziarnami słonecznika','https://www.przepisy.pl/przepis/kefir-z-otrebami-i-ziarnami-slonecznika',1,1.5,3),(45,'Kawa zbożowa z mlekiem','https://www.przepisy.pl/przepis/kawa-zbozowa-z-mlekiem',2,2.5,3),(46,'Masło rakowe','https://www.przepisy.pl/przepis/maslo-rakowe',4,2.5,3),(47,'Syrop miodowo-cytrynowy','https://www.przepisy.pl/przepis/syrop-miodowo-cytrynowy',1,4,3),(48,'Zupa mleczna z zacierkami','https://www.przepisy.pl/przepis/zupa-mleczna-z-zacierkami',3,3.3,3),(49,'Kwas chlebowy ','https://www.przepisy.pl/przepis/kwas-chlebowy',3,5,3),(50,'Rosół z żółtkiem ','https://www.przepisy.pl/przepis/rosol-z-zoltkiem',2,3.5,3),(51,'Sok z kalarepy','https://www.przepisy.pl/przepis/sok-z-kalarepy',2,4.5,2);
/*!40000 ALTER TABLE `przepisy` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `dbp3` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`project0admindb`@`%`*/ /*!50003 TRIGGER check_przepis_insert
BEFORE INSERT ON przepisy
FOR EACH ROW
BEGIN
IF NEW.rozmiar_porcji <= 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Niepoprawny rozmiar porcji';
END IF;
IF NEW.ocena < 0 OR NEW.ocena > 5 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Niepoprawna ocena';
END IF;
IF NEW.ilosc_skladnikow <= 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Niepoprawna ilość składników';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `dbp3` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

--
-- Table structure for table `przepisy_has_skladniki`
--

DROP TABLE IF EXISTS `przepisy_has_skladniki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przepisy_has_skladniki` (
  `przepisy_id_przepis` int(11) NOT NULL,
  `skladniki_id_skladniki` int(11) NOT NULL,
  `ilosc` float NOT NULL,
  PRIMARY KEY (`przepisy_id_przepis`,`skladniki_id_skladniki`),
  KEY `fk_przepisy_has_składniki_składniki1_idx` (`skladniki_id_skladniki`),
  KEY `fk_przepisy_has_składniki_przepisy1_idx` (`przepisy_id_przepis`),
  CONSTRAINT `fk_przepisy_has_składniki_przepisy1` FOREIGN KEY (`przepisy_id_przepis`) REFERENCES `przepisy` (`id_przepis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_przepisy_has_składniki_składniki1` FOREIGN KEY (`skladniki_id_skladniki`) REFERENCES `skladniki` (`id_skladniki`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przepisy_has_skladniki`
--

LOCK TABLES `przepisy_has_skladniki` WRITE;
/*!40000 ALTER TABLE `przepisy_has_skladniki` DISABLE KEYS */;
INSERT INTO `przepisy_has_skladniki` VALUES (1,5,4),(1,6,400),(1,7,70),(1,17,200),(2,3,2),(2,8,4),(2,9,1),(2,10,1),(3,3,4),(3,5,1),(3,11,400),(3,12,200),(3,13,100),(4,10,2),(4,14,400),(4,15,1),(4,16,1),(5,1,250),(5,7,160),(5,10,2),(5,18,1),(5,19,1),(5,20,5),(5,21,1),(5,22,150),(5,23,1),(5,24,250),(6,1,300),(6,2,200),(6,3,2),(7,1,200),(7,18,2),(8,5,3),(8,7,80),(8,8,4),(8,28,5),(9,3,4),(9,5,3),(9,12,100),(9,23,2),(10,10,2),(10,14,180),(10,23,1),(10,25,3),(11,18,4),(11,30,150),(11,31,1),(12,10,5),(12,11,400),(12,13,150),(12,29,100),(13,10,4),(13,12,300),(13,23,2),(14,16,5),(14,18,6),(14,19,6),(14,30,1),(14,32,1),(14,33,10),(15,16,2),(15,34,1),(15,35,15),(15,36,1),(15,37,2),(15,38,1),(15,39,1),(15,40,1),(16,10,2),(16,11,200),(16,13,100),(16,17,250),(16,23,1),(16,25,3),(16,31,1),(17,3,1),(17,18,2.5),(17,41,1),(17,48,150),(18,41,1),(18,42,1),(18,43,1),(19,1,250),(19,18,0.7),(19,21,0.5),(20,41,1),(20,44,700),(20,45,100),(21,46,60),(21,47,300),(22,18,2),(22,46,120),(23,18,1),(23,31,1),(23,51,10),(24,18,1),(24,50,10),(25,10,30),(25,25,4),(26,23,1),(26,41,1),(26,48,50),(27,18,1),(27,51,10),(27,52,40),(27,53,6),(28,1,750),(28,3,4),(28,5,20),(28,19,12),(28,54,1),(28,55,200),(29,1,400),(29,5,2),(29,18,1),(29,21,1),(30,18,4),(30,52,10),(30,53,1000),(31,5,1),(31,15,1),(31,23,1),(31,25,1),(31,28,30),(31,54,100),(32,5,3),(32,56,250),(32,57,400),(33,18,0.2),(33,34,1),(33,58,200),(34,6,400),(34,10,3),(34,41,1),(35,6,400),(35,41,1),(35,59,4),(36,3,1),(36,58,300),(36,60,1),(37,18,0.1),(37,31,1),(37,58,250),(38,12,300),(38,18,2),(38,26,6),(38,41,1),(39,31,0.5),(39,59,6),(39,61,1),(40,18,0.5),(40,41,1),(40,44,500),(40,48,15),(41,18,0.5),(41,31,1),(41,62,200),(41,63,1),(42,64,0.5),(42,65,1),(42,66,1),(43,67,150),(43,68,70),(44,64,4),(44,69,4),(44,70,8),(45,2,750),(45,19,10),(45,71,3),(46,5,10),(46,41,2),(46,72,2),(47,31,4),(47,73,500),(47,74,10),(48,1,100),(48,2,1000),(48,3,1),(49,19,50),(49,75,10),(49,76,1),(50,3,1),(50,77,2),(50,78,0.5),(51,18,0.2),(51,79,2000);
/*!40000 ALTER TABLE `przepisy_has_skladniki` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `dbp3` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`project0admindb`@`%`*/ /*!50003 TRIGGER przeliczenie_ilosci_skladnikow_insert
AFTER INSERT ON przepisy_has_skladniki
FOR EACH ROW
BEGIN
  UPDATE przepisy
  SET ilosc_skladnikow = (SELECT COUNT(*) FROM przepisy_has_skladniki WHERE przepisy_id_przepis = NEW.przepisy_id_przepis)
  WHERE id_przepis = NEW.przepisy_id_przepis;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `dbp3` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
ALTER DATABASE `dbp3` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`project0admindb`@`%`*/ /*!50003 TRIGGER przeliczenie_ilosci_skladnikow_delete
AFTER DELETE ON przepisy_has_skladniki
FOR EACH ROW
BEGIN
    UPDATE przepisy SET ilosc_skladnikow = (SELECT COUNT(*) FROM przepisy_has_skladniki WHERE przepisy_id_przepis = OLD.przepisy_id_przepis) WHERE id_przepis = OLD.przepisy_id_przepis;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `dbp3` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

--
-- Table structure for table `przepisy_has_tagi`
--

DROP TABLE IF EXISTS `przepisy_has_tagi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `przepisy_has_tagi` (
  `przepisy_id_przepis` int(11) NOT NULL,
  `tagi_id_tag` int(11) NOT NULL,
  PRIMARY KEY (`przepisy_id_przepis`,`tagi_id_tag`),
  KEY `fk_przepisy_has_tagi_tagi1_idx` (`tagi_id_tag`),
  KEY `fk_przepisy_has_tagi_przepisy1_idx` (`przepisy_id_przepis`),
  CONSTRAINT `fk_przepisy_has_tagi_przepisy1` FOREIGN KEY (`przepisy_id_przepis`) REFERENCES `przepisy` (`id_przepis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_przepisy_has_tagi_tagi1` FOREIGN KEY (`tagi_id_tag`) REFERENCES `tagi` (`id_tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przepisy_has_tagi`
--

LOCK TABLES `przepisy_has_tagi` WRITE;
/*!40000 ALTER TABLE `przepisy_has_tagi` DISABLE KEYS */;
INSERT INTO `przepisy_has_tagi` VALUES (2,1),(6,1),(8,1),(9,1),(10,1),(13,1),(14,1),(15,1),(17,1),(22,1),(1,2),(3,2),(5,2),(7,2),(12,2),(16,2),(18,2),(31,2),(34,2),(35,2),(38,2),(39,2),(40,2),(46,2),(50,2),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(12,3),(16,3),(17,3),(18,3),(31,3),(48,3),(2,4),(4,4),(6,4),(8,4),(10,4),(11,4),(12,4),(14,4),(15,4),(16,4),(17,4),(19,4),(21,4),(22,4),(23,4),(24,4),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(31,4),(32,4),(33,4),(36,4),(37,4),(41,4),(42,4),(43,4),(44,4),(45,4),(47,4),(48,4),(49,4),(51,4),(4,5),(7,5),(10,5),(11,5),(14,5),(15,5),(17,5),(19,5),(22,5),(23,5),(24,5),(25,5),(26,5),(27,5),(29,5),(30,5),(49,5),(51,5),(21,6),(22,6),(23,6),(24,6),(27,6),(28,6),(30,6),(32,6),(33,6),(36,6),(37,6),(41,6),(42,6),(43,6),(44,6),(45,6),(47,6),(3,7),(12,7),(25,7),(20,9),(29,9),(2,10),(4,10),(11,10),(13,10),(14,10),(15,10);
/*!40000 ALTER TABLE `przepisy_has_tagi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recenzje`
--

DROP TABLE IF EXISTS `recenzje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recenzje` (
  `przepisy_id_przepis` int(11) NOT NULL,
  `user_id_user` DOUBLE NOT NULL,
  `recenzja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ocena_user` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ilosc_zglaszen` int(11) NOT NULL,
  PRIMARY KEY (`przepisy_id_przepis`,`user_id_user`),
  KEY `fk_przepisy_has_user_user1_idx` (`user_id_user`),
  KEY `fk_przepisy_has_user_przepisy1_idx` (`przepisy_id_przepis`),
  CONSTRAINT `fk_przepisy_has_user_przepisy1` FOREIGN KEY (`przepisy_id_przepis`) REFERENCES `przepisy` (`id_przepis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_przepisy_has_user_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recenzje_ibfk_1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recenzje`
--

LOCK TABLES `recenzje` WRITE;
/*!40000 ALTER TABLE `recenzje` DISABLE KEYS */;
INSERT INTO `recenzje` VALUES (1,0,'Super smakowite, ale mało','4',0),(1,1,'Pyszności, niemiec płakał jak gotował','5',0),(1,3,'nie warto takiego przepisu robić, fujka','2',0),(1,5,'ala ma kota','2',0),(1,9,'ale smakuwa','5',0),(2,0,'dla mnie git, ale nudne','3',0),(2,1,'Elegancko','2',1),(3,1,'Spoko','4',0),(3,3,'super, ale wole z krewetkami','3',0),(3,5,'nienawidze uzytkownika 0','1',7),(3,10,'tata poszedł po mleko do tego dania i wyszło super','4,5',0),(4,0,'Świetne danie i proste w przygotowaniu!','4,5',0),(4,2,'Niedobre i trudne, nie róbcie!!!!','2',1),(5,0,'Brzuszek pełny i zadowolony, pizzunia pyszności','5',0),(5,1,'Super pizza, dobra polska, dużo keczapu i jest pycha!','5',0),(5,3,'Zwróciłem dzień po, nie jeccie!','1',0),(5,4,'zatrułem się jadem kiełbasianym przez to...','1',0),(5,7,'Świetne, ciasto na pizzę idealne, takie jak u mamy, a wychowywałem się w Mediolanie to ja coś wiem o super pizzy hehe polaki robaki','5',2),(5,8,'Za dużo kiełbasy, a tak to super, jadłem przed meczem i potem dużo siły miałem żeby biegać i stzeliłem 3 gole','4',0),(6,1,'Supcio smakuwa','5',0),(6,2,'Essunia danie','5',0),(6,3,'Nie polecanko','1',0),(7,1,'','2',1),(7,5,'ble, fujka','1',0),(8,1,'taka se','3',0),(8,7,'Koks zapieksy','5',0),(8,8,'Polecam, jem codziennie','5',0),(8,9,'Super łatwe śniadanie','5',0),(9,0,'nie da sie tego jesc','2',0),(9,1,'obrzydliwe','1',0),(9,2,'ujdzie','3',0),(10,1,'','1',0),(10,3,'Pyszności','5',0),(10,5,'Wigilia uratowana','5',0),(11,0,'Gut','5',0),(11,1,'Git','5',0),(12,1,'good food','5',0),(12,2,'Nie git','1',0),(13,2,'bad food','1',0),(13,3,'Supcio','5',0),(14,3,'tasty','5',0),(14,4,'OK','4',0),(15,4,'Cytując Lamberta: \"całkiem, całkiem\"','4',0),(15,5,'Nie ok','2',0),(16,5,'Na wigilii smakowało','5',0),(16,6,'Całkiem całkiem','3',0),(17,6,'zrobiłem na sylwestra i git','5',0),(17,7,'Sandacz lepszy','2',0),(18,7,'kit','1',0),(18,8,'fajen','5',0),(19,8,'wchodzi elegancko','5',0),(19,9,'nie fajen','1',0),(20,0,'Morze być','3',0),(20,9,'zbyt smaczne i przytyłam','2',0),(21,0,'niesmaczne i schudłam','5',0),(21,1,'Dla mnie smaczne','5',0),(22,1,'łatwe i smaczne','5',0),(22,2,'Z sosem TSAZIKI whodzi elegancko!!!!!!!','5',0),(23,2,'niesmaczne i trudne','1',0),(23,3,'trochę Kaczapuri i jest supcio ','4',0),(24,3,'zatrułem się','2',0),(24,4,'eleganckie danie','5',0),(25,4,'jadłem gorsze','3',0),(25,5,'Ujdzie ','3',0),(26,5,'jadłem lepsze','2',0),(26,6,'Eh...','2',0),(27,6,'nie jadłem takiego ','4',0),(27,7,'Meh...','2',0),(28,7,'oryginalne','5',0),(28,8,'Tragedia','1',0),(29,8,'Zjadłem w niedziele z rodzinom i było pyszne','5',0),(29,9,'Spoczko loczko','3',0),(30,0,'Za trudne ','2',0),(30,9,'Kwintesenscja idealnej potrawy!! polecam karzdemu!','5',0),(31,3,'Git smak','5',0),(31,10,'fuj','1',0),(32,8,'niedobre','1',0),(32,9,'niesmaczne','1',0),(33,4,'smaczne','4',0),(33,5,'dobre','4',0),(34,2,'mehuwa','2',0),(34,3,'nie polecam','2',0),(35,1,'rzyguwa','1',0),(35,10,'obrzydliwuwa','1',0),(36,8,'smakowituwa','5',0),(36,9,'pysznuwa','5',0),(37,6,'cotojestuwa','2',0),(37,7,'mniammniamuwa','5',0),(38,4,'wymiotuwa','1',0),(38,5,'rzyg','1',0),(39,2,'ok','5',0),(39,3,'niepolecamuwa','2',0),(40,0,'moze byc','3',0),(40,1,'nie ok','1',0),(41,9,'jadlem lepsze i gorsze','3',0),(41,10,'takie o','3',0),(42,7,'Kwintesencja obrzydlistwa','1',0),(42,8,'Omnomnonm','3',0),(43,5,'ohydne','2',0),(43,6,'to ma byc deser? chyba nie','1',0),(44,3,'ostro niesmaczne','2',0),(44,4,'ochydne','1',0),(45,2,'ujdzie','3',0),(45,10,'ujdzie w tłoku','2',0),(46,0,'Za kwaśne','3',0),(46,1,'Za słodkie','2',0),(47,8,'Mgła gęsta jak mleko','4',0),(47,9,'Całkiem całkiem ','4',0),(48,1,'ala ma kota','2',0),(48,6,'powiedzieć Ci fraszkę','3',0),(48,7,'Obudził się w tobie poeta','5',0),(49,4,'Lambert lambert','5',0),(49,5,'No dawaj','5',0),(50,2,'Rybki lubię łowić','5',0),(50,3,'Sandacz z tymiankiem lepszy','2',0),(51,0,'Robię dzieciąm do szkoły i są zadowolone','5',0),(51,1,'Spoko deser','4',0);
/*!40000 ALTER TABLE `recenzje` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`project0admindb`@`%`*/ /*!50003 TRIGGER przepisy_update_rating_insert
AFTER INSERT ON recenzje
FOR EACH ROW
BEGIN
  UPDATE przepisy
  SET ocena = ROUND((SELECT AVG(ocena_user) FROM recenzje WHERE przepisy_id_przepis = NEW.przepisy_id_przepis), 1)
  WHERE id_przepis = NEW.przepisy_id_przepis;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`project0admindb`@`%`*/ /*!50003 TRIGGER przepisy_update_rating_delete
AFTER DELETE ON recenzje
FOR EACH ROW
BEGIN
  UPDATE przepisy
  SET ocena = ROUND((SELECT AVG(ocena_user) FROM recenzje WHERE przepisy_id_przepis = OLD.przepisy_id_przepis), 1)
  WHERE id_przepis = OLD.przepisy_id_przepis;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `skladniki`
--

DROP TABLE IF EXISTS `skladniki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skladniki` (
  `id_skladniki` int(11) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gramatura_id_gramatura` int(11) NOT NULL,
  PRIMARY KEY (`id_skladniki`),
  KEY `fk_składniki_gramatura1_idx` (`gramatura_id_gramatura`),
  CONSTRAINT `fk_składniki_gramatura1` FOREIGN KEY (`gramatura_id_gramatura`) REFERENCES `gramatura` (`id_gramatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skladniki`
--

LOCK TABLES `skladniki` WRITE;
/*!40000 ALTER TABLE `skladniki` DISABLE KEYS */;
INSERT INTO `skladniki` VALUES (1,'mąka',5),(2,'mleko',3),(3,'jajko',4),(4,'woda gazowana',3),(5,'masło',2),(6,'filet z kurczaka',5),(7,'ser żółty',5),(8,'kromka chleba',4),(9,'awokado',4),(10,'oliwa z oliwek',2),(11,'makaron spaghetti',5),(12,'boczek',5),(13,'parmezan',5),(14,'tofu',5),(15,'koperek',4),(16,'cytryna',4),(17,'szpinak',5),(18,'woda',1),(19,'cukier',8),(20,'suszone drożdże',5),(21,'sól',8),(22,'kiełbasa',5),(23,'cebula',4),(24,'passata pomidorowa',5),(25,'ząbek czosnku',4),(26,'marchewka',4),(27,'bulion warzywny',1),(28,'pieczarki',4),(29,'pesto bazyliowe',5),(30,'ogórek',5),(31,'cytryna',4),(32,'limonka',4),(33,'liść mięty',4),(34,'pomarańcza',4),(35,'Imbir',5),(36,'Kurkuma mielona',8),(37,'Miód',8),(38,'Pieprz',9),(39,'Cynamon',9),(40,'Goździki',9),(41,'Przyprawa Knorr',4),(42,'Kurczak cały',4),(43,'Butelka piwa pils',4),(44,'Wołowina',5),(45,'Wołowy łój',5),(46,'Espresso',3),(47,'Lody waniliowe',5),(48,'Olej',3),(49,'Ziarna Kawy',5),(50,'Herbata zielona',5),(51,'Herbata czarna',5),(52,'Sok z malin',3),(53,'Malina',4),(54,'Śmietana 18%',1),(55,'Dżem truskawkowy',5),(56,'Mascarpone',5),(57,'Czekolada',5),(58,'Cukier puder',5),(59,'Majonez',2),(60,'Barwnik spożywczy',4),(61,'Chrzan',2),(62,'Truskawki',5),(63,'Skrobia ziemniaczana',2),(64,'Kefir',1),(65,'Jabłko',4),(66,'Banan',4),(67,'Galaretka',5),(68,'Maliny',5),(69,'Otręby pszenne',2),(70,'Nasiona słonecznika',8),(71,'Kawa zbożowa',8),(72,'Skorupki rakowe',1),(73,'Miód',3),(74,'Goździki całe',4),(75,'Drożdże',5),(76,'Chleb żytni',5),(77,'Kostka rosołowa',4),(78,'Pietruszka',4),(79,'Kalarepa',5);
/*!40000 ALTER TABLE `skladniki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagi`
--

DROP TABLE IF EXISTS `tagi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagi` (
  `id_tag` int(11) NOT NULL,
  `nazwa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagi`
--

LOCK TABLES `tagi` WRITE;
/*!40000 ALTER TABLE `tagi` DISABLE KEYS */;
INSERT INTO `tagi` VALUES (1,'śniadanie'),(2,'obiad'),(3,'kolacja'),(4,'wegetariańskie'),(5,'wegańskie'),(6,'deser'),(7,'włoskie'),(8,'azjatyckie'),(9,'fast food'),(10,'szybki posiłek');
/*!40000 ALTER TABLE `tagi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_10_najpop_przepisow`
--

DROP TABLE IF EXISTS `top_10_najpop_przepisow`;
/*!50001 DROP VIEW IF EXISTS `top_10_najpop_przepisow`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_10_najpop_przepisow` AS SELECT 
 1 AS `nazwa`,
 1 AS `ocena`,
 1 AS `liczba_recenzji`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_10_przepisow_wg_oceny`
--

DROP TABLE IF EXISTS `top_10_przepisow_wg_oceny`;
/*!50001 DROP VIEW IF EXISTS `top_10_przepisow_wg_oceny`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_10_przepisow_wg_oceny` AS SELECT 
 1 AS `nazwa`,
 1 AS `ocena`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` DOUBLE NOT NULL,
  `nazwa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dodatkowe_informacje` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'Anonimowy','anonim@gmail.com','fy837hjksd','',0),(1,'Ziółkowska','marazioolkowska@420.pl','gt39hfskd2','',0),(2,'Kowalski','michael_smith@wp.pl','lk50jfdsla','',0),(3,'Górecki','mountanish@o2.pl','zx91kghtre','',0),(4,'muchaanna','annamuchacie@wy.pl','asa1dfqa3','',0),(5,'RL9','robercik9@wp.pl','qw23mnbvcx','',0),(6,'diabelekkucharek','gdziekucharek666tamniemaco@je.sc','asd134fafd','',0),(7,'Messi_fan','ezwinnazaby@onet.pl','ui75rtyuio','',0),(8,'Halland_enyojer','norwegiajestsuper@gmail.com','vc56sdfghj','',0),(9,'Michniewiczmlynarz','czesiu123@wp.pl','yx17vbnmki','',0),(10,'kucharz','kucharzyk129@wp.pl','aoplq2mn2','',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_przepisy`
--

DROP TABLE IF EXISTS `user_has_przepisy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_przepisy` (
  `user_id_user` DOUBLE NOT NULL,
  `przepisy_id_przepis` int(11) NOT NULL,
  PRIMARY KEY (`user_id_user`,`przepisy_id_przepis`),
  KEY `fk_user_has_przepisy_przepisy1_idx` (`przepisy_id_przepis`),
  KEY `fk_user_has_przepisy_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_user_has_przepisy_przepisy1` FOREIGN KEY (`przepisy_id_przepis`) REFERENCES `przepisy` (`id_przepis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_przepisy_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_has_przepisy_ibfk_1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_przepisy`
--

LOCK TABLES `user_has_przepisy` WRITE;
/*!40000 ALTER TABLE `user_has_przepisy` DISABLE KEYS */;
INSERT INTO `user_has_przepisy` VALUES (1,1),(2,1),(9,1),(10,1),(9,2),(0,3),(2,3),(9,3),(1,4),(2,4),(9,4),(9,5),(7,6),(3,7),(8,8),(9,9),(1,10),(2,10),(1,24),(1,32),(1,44),(1,51);
/*!40000 ALTER TABLE `user_has_przepisy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_skladniki`
--

DROP TABLE IF EXISTS `user_has_skladniki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_skladniki` (
  `user_id_user` DOUBLE NOT NULL,
  `skladniki_id_skladniki` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  PRIMARY KEY (`user_id_user`,`skladniki_id_skladniki`),
  KEY `fk_user_has_składniki_składniki1_idx` (`skladniki_id_skladniki`),
  KEY `fk_user_has_składniki_user1_idx` (`user_id_user`),
  CONSTRAINT `fk_user_has_składniki_składniki1` FOREIGN KEY (`skladniki_id_skladniki`) REFERENCES `skladniki` (`id_skladniki`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_składniki_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_has_skladniki_ibfk_1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_skladniki`
--

LOCK TABLES `user_has_skladniki` WRITE;
/*!40000 ALTER TABLE `user_has_skladniki` DISABLE KEYS */;
INSERT INTO `user_has_skladniki` VALUES (0,1,15000),(0,2,500),(0,3,25),(0,14,180),(0,35,10),(0,69,23),(1,1,111),(1,2,111),(1,3,0),(1,7,0),(1,28,2),(1,42,10),(1,60,10),(1,72,546),(2,1,2000),(2,3,20),(2,5,50),(2,48,10),(2,61,100),(3,1,10000),(3,3,5),(3,14,360),(3,53,10),(3,62,24),(4,11,10),(4,63,55),(5,2,240),(5,3,100),(5,4,5),(5,5,56),(5,6,6),(5,8,200),(5,10,45),(5,13,12),(5,20,10),(5,64,123),(6,39,10),(6,65,564),(7,1,3500),(7,3,8),(7,12,300),(7,13,500),(7,15,10),(7,28,40),(7,41,10),(7,67,32),(8,1,4000),(8,2,500),(8,12,150),(8,28,16),(8,43,10),(8,66,43),(9,1,200000),(9,46,10),(9,68,12),(10,1,200),(10,12,450),(10,14,10),(10,28,12),(10,69,54);
/*!40000 ALTER TABLE `user_has_skladniki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zgloszenia`
--

DROP TABLE IF EXISTS `zgloszenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zgloszenia` (
  `recenzje_przepisy_id_przepis` int(11) NOT NULL,
  `recenzje_user_id_user` DOUBLE NOT NULL,
  `user_id_user` DOUBLE NOT NULL,
  `tresc` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`recenzje_przepisy_id_przepis`,`recenzje_user_id_user`,`user_id_user`),
  KEY `fk_recenzje_has_user_recenzje1` (`recenzje_przepisy_id_przepis`,`recenzje_user_id_user`),
  KEY `fk_recenzje_has_user_recenzje1_idx` (`user_id_user`),
  CONSTRAINT `fk_recenzje_has_user_recenzje1` FOREIGN KEY (`recenzje_przepisy_id_przepis`, `recenzje_user_id_user`) REFERENCES `recenzje` (`przepisy_id_przepis`, `user_id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recenzje_has_user_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zgloszenia`
--

LOCK TABLES `zgloszenia` WRITE;
/*!40000 ALTER TABLE `zgloszenia` DISABLE KEYS */;
INSERT INTO `zgloszenia` VALUES (2,1,1,'trolling'),(3,5,0,'mowa nienawisci'),(3,5,1,'mowa nienawisci'),(3,5,2,'mowa nienawisci'),(3,5,3,'mowa nienawisci'),(3,5,8,'mowa nienawisci'),(3,5,9,'mowa nienawisci'),(3,5,10,'mowa nienawisci'),(4,2,2,'fałsz'),(5,7,0,'rasizm'),(5,7,1,'obraza wielkiego narodu polskiego'),(7,1,1,'trolling');
/*!40000 ALTER TABLE `zgloszenia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`project0admindb`@`%`*/ /*!50003 TRIGGER przeliczenie_ilosci_zgloszen_insert
AFTER INSERT ON zgloszenia
FOR EACH ROW
BEGIN
  UPDATE recenzje
  SET ilosc_zglaszen = (SELECT COUNT(*) FROM zgloszenia WHERE recenzje_przepisy_id_przepis = NEW.recenzje_przepisy_id_przepis)
  WHERE przepisy_id_przepis = NEW.recenzje_przepisy_id_przepis AND user_id_user = NEW.recenzje_user_id_user;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`project0admindb`@`%`*/ /*!50003 TRIGGER przeliczenie_ilosci_zgloszen_delete
AFTER DELETE ON zgloszenia
FOR EACH ROW
BEGIN
  UPDATE recenzje
  SET ilosc_zglaszen = (SELECT COUNT(*) FROM zgloszenia WHERE recenzje_przepisy_id_przepis = OLD.recenzje_przepisy_id_przepis)
  WHERE przepisy_id_przepis = OLD.recenzje_przepisy_id_przepis AND user_id_user = old.recenzje_user_id_user;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'dbp3'
--

--
-- Dumping routines for database 'dbp3'
--
/*!50003 DROP PROCEDURE IF EXISTS `dodaj_skladnik_do_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `dodaj_skladnik_do_inventory`(IN user_id DOUBLE, IN nazwa_arg VARCHAR(255), IN ilosc_arg INT)
BEGIN
  DECLARE skladnik_id INT;

  SELECT id_skladniki INTO skladnik_id
  FROM skladniki
  WHERE nazwa = nazwa_arg;

  INSERT INTO user_has_skladniki (user_id_user, skladniki_id_skladniki, ilosc)
  SELECT u.id_user, s.id_skladniki, ilosc_arg
  FROM user u
  JOIN skladniki s ON s.id_skladniki = skladnik_id
  WHERE u.id_user = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dodawanie_nowego_składnika_do_bazy` */;
ALTER DATABASE `dbp3` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `dodawanie_nowego_składnika_do_bazy`(IN id_skladniki INT(11), IN nazwa VARCHAR(30), IN gramatura_id_gramatura INT(11))
BEGIN
    INSERT INTO skladniki (id_skladniki, nazwa, gramatura_id_gramatura)
    VALUES (id_skladniki, nazwa, gramatura_id_gramatura);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `dbp3` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `pokaz_skladniki_uzytkownika` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `pokaz_skladniki_uzytkownika`(IN user_id DOUBLE)
BEGIN
  SELECT skladniki.nazwa
  FROM user_has_skladniki
  JOIN skladniki ON user_has_skladniki.skladniki_id_skladniki = skladniki.id_skladniki
  WHERE user_has_skladniki.user_id_user = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `posiadanie_skladnikow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `posiadanie_skladnikow`(IN skladniki VARCHAR(255),IN recipe_id INT)
BEGIN
SELECT skladniki.nazwa AS nazwa_skladnika,
         CASE WHEN FIND_IN_SET(LOWER(skladniki.nazwa), LOWER(skladniki)) THEN 'posiadasz składnik' ELSE 'nie posiadasz' END AS posiada
  FROM przepisy
  JOIN przepisy_has_skladniki ON przepisy.id_przepis = przepisy_has_skladniki.przepisy_id_przepis
  JOIN skladniki ON przepisy_has_skladniki.skladniki_id_skladniki = skladniki.id_skladniki
  WHERE przepisy.id_przepis = recipe_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `przepisy_na_podstawie_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `przepisy_na_podstawie_inventory`(IN p_user_id DOUBLE)
BEGIN
  SELECT przepisy.id_przepis,przepisy.nazwa, przepisy.rozmiar_porcji,przepisy.ocena,COUNT(*) AS ilosc_posiadanych_składników_do_przepisu,
         przepisy.ilosc_skladnikow,
         ROUND(CAST(COUNT(*) AS DECIMAL) / CAST(przepisy.ilosc_skladnikow AS DECIMAL) * 100, 2) AS procent_zgodnosci
  FROM user_has_skladniki
  JOIN skladniki ON user_has_skladniki.skladniki_id_skladniki = skladniki.id_skladniki
  JOIN przepisy_has_skladniki ON skladniki.id_skladniki = przepisy_has_skladniki.skladniki_id_skladniki
  JOIN przepisy ON przepisy_has_skladniki.przepisy_id_przepis = przepisy.id_przepis
  WHERE user_has_skladniki.user_id_user = p_user_id
  GROUP BY przepisy.id_przepis
  ORDER BY procent_zgodnosci DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `przepisy_na_podstawie_podanych_skladników` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `przepisy_na_podstawie_podanych_skladników`(IN skladniki VARCHAR(255))
BEGIN
SELECT przepisy.id_przepis, przepisy.nazwa,przepisy.instrukcja, przepisy.rozmiar_porcji, przepisy.ocena, COUNT(*) AS ilosc_posiadanych_składników_do_przepisu,
przepisy.ilosc_skladnikow as ilosc_skladnikow_w_przepisie,
ROUND(CAST(COUNT(*) AS DECIMAL) / CAST(przepisy.ilosc_skladnikow AS DECIMAL) * 100, 2) AS procent_zgodnosci
FROM przepisy
JOIN przepisy_has_skladniki ON przepisy.id_przepis = przepisy_has_skladniki.przepisy_id_przepis
JOIN skladniki ON przepisy_has_skladniki.skladniki_id_skladniki = skladniki.id_skladniki
WHERE FIND_IN_SET(CONVERT(LOWER(skladniki.nazwa) USING utf8mb4), LOWER(CONVERT(skladniki USING utf8mb4)))
GROUP BY przepisy.id_przepis
ORDER BY procent_zgodnosci DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `przepis_o_ocenie_wiekszej_niz` */;
ALTER DATABASE `dbp3` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `przepis_o_ocenie_wiekszej_niz`(IN rating FLOAT)
BEGIN
    SELECT nazwa, ocena
    FROM przepisy
    WHERE ocena > rating;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `dbp3` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `skladniki_dla_przepisuid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `skladniki_dla_przepisuid`(IN `recipe_id` INT)
BEGIN
  SELECT
   skladniki.nazwa, (gramatura.ilosc_w_jednosce * przepisy_has_skladniki.ilosc) as ilosc, gramatura.SI_unit
  FROM
    przepisy_has_skladniki
    JOIN przepisy ON przepisy_has_skladniki.przepisy_id_przepis = przepisy.id_przepis
    JOIN skladniki ON skladniki.id_skladniki = przepisy_has_skladniki.skladniki_id_skladniki
    JOIN gramatura ON gramatura.id_gramatura = skladniki.gramatura_id_gramatura
  WHERE id_przepis = recipe_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `szukaj_po_tagu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `szukaj_po_tagu`(nazwaTag VARCHAR(255))
BEGIN
  SELECT
    *
  FROM
    przepisy
    JOIN przepisy_has_tagi ON przepisy.id_przepis = przepisy_has_tagi.przepisy_id_przepis
    JOIN tagi ON przepisy_has_tagi.tagi_id_tag = tagi.id_tag
 WHERE tagi.nazwa = nazwaTag;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `szukanie_po_nazwach` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `szukanie_po_nazwach`(IN wyszukiwanie VARCHAR(255))
BEGIN
  SELECT * FROM przepisy WHERE nazwa LIKE CONCAT('%', wyszukiwanie, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usun_skladnik_z_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `usun_skladnik_z_inventory`(IN user_id DOUBLE, IN nazwa_skladnika VARCHAR(255))
BEGIN 
 DELETE FROM user_has_skladniki
 WHERE user_id_user = user_id AND skladniki_id_skladniki = (SELECT id_skladniki FROM skladniki WHERE nazwa = nazwa_skladnika);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuwanie_uzytkownikaa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`project0admindb`@`%` PROCEDURE `usuwanie_uzytkownikaa`(IN id_user2 DOUBLE)
BEGIN
  DELETE FROM zgloszenia WHERE user_id_user = id_user2;
  DELETE FROM recenzje WHERE user_id_user = id_user2;
  DELETE FROM user_has_przepisy WHERE user_id_user = id_user2;
  DELETE FROM user_has_skladniki WHERE user_id_user = id_user2;

  DELETE FROM user WHERE id_user = id_user2;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `oceny_wszystkich_przepisów_i_opinie`
--

/*!50001 DROP VIEW IF EXISTS `oceny_wszystkich_przepisów_i_opinie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`project0admindb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `oceny_wszystkich_przepisów_i_opinie` AS select `przepisy`.`nazwa` AS `nazwa`,`recenzje`.`ocena_user` AS `ocena_user`,`recenzje`.`recenzja` AS `recenzja` from (`przepisy` join `recenzje` on((`przepisy`.`id_przepis` = `recenzje`.`przepisy_id_przepis`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10_najpop_przepisow`
--

/*!50001 DROP VIEW IF EXISTS `top_10_najpop_przepisow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`project0admindb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10_najpop_przepisow` AS select `przepisy`.`nazwa` AS `nazwa`,`przepisy`.`ocena` AS `ocena`,count(`recenzje`.`przepisy_id_przepis`) AS `liczba_recenzji` from (`przepisy` left join `recenzje` on((`przepisy`.`id_przepis` = `recenzje`.`przepisy_id_przepis`))) group by `przepisy`.`id_przepis` order by `liczba_recenzji` desc,`przepisy`.`ocena` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10_przepisow_wg_oceny`
--

/*!50001 DROP VIEW IF EXISTS `top_10_przepisow_wg_oceny`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`project0admindb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10_przepisow_wg_oceny` AS select `przepisy`.`nazwa` AS `nazwa`,`przepisy`.`ocena` AS `ocena` from `przepisy` order by `przepisy`.`ocena` desc limit 10 */;
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

-- Dump completed on 2023-01-21 22:12:48
