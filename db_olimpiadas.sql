CREATE DATABASE  IF NOT EXISTS `db_olimpiadas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_olimpiadas`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_olimpiadas
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
-- Table structure for table `atletas`
--

DROP TABLE IF EXISTS `atletas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atletas` (
  `id_atleta` int NOT NULL AUTO_INCREMENT,
  `nome_atleta` varchar(100) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_atleta`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `atletas_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atletas`
--

LOCK TABLES `atletas` WRITE;
/*!40000 ALTER TABLE `atletas` DISABLE KEYS */;
INSERT INTO `atletas` VALUES (1,'Rebeca Andrade',25,1),(2,'Simone Biles',27,2),(3,'Teddy Riner',35,3),(4,'Caeleb Dressel',28,2),(5,'Allyson Felix',38,2),(6,'Rafael Nadal',38,8),(7,'Novak Djokovic',37,NULL),(8,'Marta Vieira da Silva',39,1),(9,'Kevin Durant',36,2),(10,'LeBron James',40,2),(11,'Usain Bolt',38,NULL),(12,'Michael Phelps',39,2),(13,'Katie Ledecky',27,2),(14,'Serena Williams',43,2),(15,'Neymar Jr.',33,1),(16,'Gabriel Medina',31,1),(17,'Tony Hawk',57,2),(18,'Leticia Bufoni',31,1),(19,'Sky Brown',16,10),(20,'Shaun White',38,2),(21,'Tom Daley',30,10),(22,'Caio Bonfim',34,1),(23,'Arthur Zanetti',34,1),(24,'Eliud Kipchoge',40,NULL),(25,'Yulimar Rojas',29,NULL),(26,'Simona Halep',33,NULL),(27,'Dafne Schippers',32,NULL),(28,'Hugo Calderano',28,1),(29,'Zhang Jike',36,6),(30,'Ma Long',36,6),(31,'Sun Yang',34,6),(32,'Ding Ning',34,6),(33,'Fernando Pimenta',35,NULL),(34,'Jessica Fox',30,NULL),(35,'Naomi Osaka',27,5),(36,'Kento Momota',30,5),(37,'Viktor Axelsen',30,NULL),(38,'Sifan Hassan',32,NULL),(39,'Filippo Ganna',28,7),(40,'An Se-young',24,NULL),(41,'Kim Ji-woo',26,NULL),(42,'Marcus Rashford',27,10),(43,'Harry Kane',31,10),(44,'Luka Doncic',26,NULL),(45,'Damian Lillard',34,2),(46,'Anthony Joshua',35,10),(47,'Tyson Fury',37,10),(48,'Andy Murray',37,10),(49,'Nick Kyrgios',29,NULL),(50,'Daniel Ricciardo',35,NULL);
/*!40000 ALTER TABLE `atletas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competicao`
--

DROP TABLE IF EXISTS `competicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competicao` (
  `id_competicao` int NOT NULL AUTO_INCREMENT,
  `id_modalidade` int DEFAULT NULL,
  `nome_competicao` varchar(100) DEFAULT NULL,
  `data_competicao` date DEFAULT NULL,
  `local_competicao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_competicao`),
  KEY `id_modalidade` (`id_modalidade`),
  CONSTRAINT `competicao_ibfk_1` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competicao`
--

LOCK TABLES `competicao` WRITE;
/*!40000 ALTER TABLE `competicao` DISABLE KEYS */;
INSERT INTO `competicao` VALUES (1,3,'Final Feminina de Ginástica Artística Individual Geral','2024-07-30','Paris'),(2,1,'Final Masculina dos 100m Rasos','2024-08-01','Paris'),(3,2,'Final Masculina dos 200m Livre Natação','2024-08-02','Paris'),(4,4,'Final Feminina de Judô até 78kg','2024-08-03','Paris'),(5,9,'Final Masculina de Tênis Individual','2024-08-04','Paris'),(6,6,'Final Feminina de Futebol','2024-08-05','Paris'),(7,7,'Final Masculina de Basquete','2024-08-06','Paris'),(8,5,'Final Feminina de Vôlei','2024-08-07','Paris'),(9,10,'Final Masculina de Levantamento de Peso acima de 105kg','2024-08-08','Paris'),(10,1,'Final Feminina dos 400m Rasos','2024-08-09','Paris'),(11,18,'Final Masculina de Skate Street','2024-08-10','Paris'),(12,19,'Final Masculina de Surfe','2024-08-11','Paris'),(13,11,'Final Masculina de Boxe Peso Pesado','2024-08-12','Paris'),(14,8,'Final Feminina de Handebol','2024-08-13','Paris'),(15,12,'Final Masculina de Ciclismo de Estrada','2024-08-14','Paris'),(16,13,'Final Masculina de Esgrima Sabre','2024-08-15','Paris'),(17,14,'Final Feminina de Hipismo Saltos','2024-08-16','Paris'),(18,16,'Final Masculina de Rúgbi','2024-08-17','Paris'),(19,21,'Final Feminina de Tiro com Arco','2024-08-18','Paris');
/*!40000 ALTER TABLE `competicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades`
--

DROP TABLE IF EXISTS `modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidades` (
  `id_modalidade` int NOT NULL AUTO_INCREMENT,
  `nome_modalidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades`
--

LOCK TABLES `modalidades` WRITE;
/*!40000 ALTER TABLE `modalidades` DISABLE KEYS */;
INSERT INTO `modalidades` VALUES (1,'Atletismo'),(2,'Natação'),(3,'Ginástica Artística'),(4,'Judô'),(5,'Vôlei'),(6,'Futebol'),(7,'Basquete'),(8,'Handebol'),(9,'Tênis'),(10,'Levantamento de Peso'),(11,'Boxe'),(12,'Ciclismo'),(13,'Esgrima'),(14,'Hipismo'),(15,'Remo'),(16,'Rúgbi'),(17,'Saltos Ornamentais'),(18,'Skateboarding'),(19,'Surfe'),(20,'Taekwondo'),(21,'Tiro com Arco'),(22,'Tiro Esportivo'),(23,'Triatlo'),(24,'Vôlei de Praia'),(25,'Badminton'),(26,'Canoagem Slalom'),(27,'Canoagem Velocidade'),(28,'Pentatlo Moderno'),(29,'Escalada Esportiva'),(30,'Beisebol'),(31,'Softbol');
/*!40000 ALTER TABLE `modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nome_pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Brasil'),(2,'Estados Unidos'),(3,'França'),(4,'Alemanha'),(5,'Japão'),(6,'China'),(7,'Itália'),(8,'Espanha'),(9,'Canadá'),(10,'Reino Unido');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participacao`
--

DROP TABLE IF EXISTS `participacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participacao` (
  `id_participacao` int NOT NULL AUTO_INCREMENT,
  `id_atleta` int DEFAULT NULL,
  `id_competicao` int DEFAULT NULL,
  `id_modalidade` int DEFAULT NULL,
  PRIMARY KEY (`id_participacao`),
  KEY `id_atleta` (`id_atleta`),
  KEY `id_competicao` (`id_competicao`),
  KEY `id_modalidade` (`id_modalidade`),
  CONSTRAINT `participacao_ibfk_1` FOREIGN KEY (`id_atleta`) REFERENCES `atletas` (`id_atleta`),
  CONSTRAINT `participacao_ibfk_2` FOREIGN KEY (`id_competicao`) REFERENCES `competicao` (`id_competicao`),
  CONSTRAINT `participacao_ibfk_3` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id_modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participacao`
--

LOCK TABLES `participacao` WRITE;
/*!40000 ALTER TABLE `participacao` DISABLE KEYS */;
INSERT INTO `participacao` VALUES (1,1,1,3),(2,11,2,1),(3,4,3,2),(4,3,4,4),(5,6,5,9),(6,8,6,6),(7,9,7,7),(8,23,8,5),(9,15,9,10),(10,5,10,1),(11,17,11,18),(12,16,12,19),(13,46,13,11),(14,18,14,8),(15,39,15,12),(16,35,16,13),(17,34,17,14),(18,19,18,16),(19,40,19,21);
/*!40000 ALTER TABLE `participacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado`
--

CREATE TABLE `medalha` (
  `id_medalha` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_medalha`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `medalha` VALUES (1,'Ouro'),(2,'Prata'),(3,'Bronze');


CREATE TABLE `resultado` (
  `id_resultado` int NOT NULL AUTO_INCREMENT,
  `id_participacao` int DEFAULT NULL,
  `id_medalha` int DEFAULT NULL,
  `posicao_final` int DEFAULT NULL,
  PRIMARY KEY (`id_resultado`),
  KEY `id_participacao` (`id_participacao`),
  KEY `id_medalha` (`id_medalha`),
  CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`id_participacao`) REFERENCES `participacao` (`id_participacao`),
  CONSTRAINT `resultado_ibfk_2` FOREIGN KEY (`id_medalha`) REFERENCES `medalha` (`id_medalha`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
INSERT INTO `resultado` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,2,2),(5,5,1,1),(6,6,1,2),(7,7,1,1),(8,14,3,3),(9,12,1,1),(10,NULL,2,2);
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-25 17:54:27
