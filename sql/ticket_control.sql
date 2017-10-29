CREATE DATABASE  IF NOT EXISTS `ticket_control` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ticket_control`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ticket_control
-- ------------------------------------------------------
-- Server version	5.7.16-log

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

--
-- Table structure for table `bug`
--

DROP TABLE IF EXISTS `bug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bug` (
  `id_bug` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_sprint` int(11) DEFAULT NULL,
  `sprint_year` year(4) DEFAULT NULL,
  `bug_title` varchar(45) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `bug_description` text,
  `bug_solution` text,
  PRIMARY KEY (`id_bug`),
  KEY `tickte_bug_idx` (`id_ticket`),
  KEY `bug_categpry_idx` (`id_category`),
  KEY `bug_status_idx` (`id_status`),
  KEY `sprint_bug_idx` (`id_sprint`,`sprint_year`),
  CONSTRAINT `category_bug` FOREIGN KEY (`id_category`) REFERENCES `bug_category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sprint_bug` FOREIGN KEY (`id_sprint`, `sprint_year`) REFERENCES `sprint` (`id_sprint`, `year`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `status_bug` FOREIGN KEY (`id_status`) REFERENCES `bug_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_bug` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bug_category`
--

DROP TABLE IF EXISTS `bug_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bug_category` (
  `id_category` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bug_status`
--

DROP TABLE IF EXISTS `bug_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bug_status` (
  `id_status` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deliverables`
--

DROP TABLE IF EXISTS `deliverables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deliverables` (
  `id_deliverable` int(11) NOT NULL AUTO_INCREMENT,
  `deliverable` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_deliverable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `developer` (
  `id_developer` int(11) NOT NULL AUTO_INCREMENT,
  `developer` varchar(45) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_developer`),
  KEY `dev_cargo_idx` (`id_cargo`),
  CONSTRAINT `dev_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `functional`
--

DROP TABLE IF EXISTS `functional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functional` (
  `id_functional` int(11) NOT NULL AUTO_INCREMENT,
  `functional` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_functional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform` (
  `id_platform` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `platform_requirements`
--

DROP TABLE IF EXISTS `platform_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_requirements` (
  `id_platform` int(11) NOT NULL,
  `id_requirement` int(11) NOT NULL,
  PRIMARY KEY (`id_platform`,`id_requirement`),
  KEY `platform_requirement_idx` (`id_requirement`),
  CONSTRAINT `platform_id` FOREIGN KEY (`id_platform`) REFERENCES `platform` (`id_platform`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `platform_requirement` FOREIGN KEY (`id_requirement`) REFERENCES `requirements` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id_project` int(11) NOT NULL AUTO_INCREMENT,
  `project` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirements` (
  `id_requirement` int(11) NOT NULL AUTO_INCREMENT,
  `requirement` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_requirement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprint`
--

DROP TABLE IF EXISTS `sprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprint` (
  `id_sprint` int(11) NOT NULL AUTO_INCREMENT,
  `year` year(4) NOT NULL,
  `sprint` varchar(45) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id_sprint`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id_task` int(11) NOT NULL,
  `task` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `ticket_desc` varchar(60) DEFAULT NULL,
  `story_points` int(11) DEFAULT NULL,
  `wricef_type` varchar(45) DEFAULT NULL,
  `wricef` varchar(45) DEFAULT NULL,
  `id_platform` int(11) DEFAULT NULL,
  `id_value_stream` int(11) DEFAULT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_functional` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `ticket_platform_idx` (`id_platform`),
  KEY `ticket_value_stream_idx` (`id_value_stream`),
  KEY `ticket_project_idx` (`id_project`),
  KEY `ticket_functional_idx` (`id_functional`),
  CONSTRAINT `ticket_functional` FOREIGN KEY (`id_functional`) REFERENCES `functional` (`id_functional`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_platform` FOREIGN KEY (`id_platform`) REFERENCES `platform` (`id_platform`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_value_stream` FOREIGN KEY (`id_value_stream`) REFERENCES `value_stream` (`id_value_stream`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_deliverables`
--

DROP TABLE IF EXISTS `ticket_deliverables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_deliverables` (
  `id_ticket` int(11) NOT NULL,
  `id_deliverable` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `information` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`,`id_deliverable`),
  KEY `ticket_deliverable_idx` (`id_deliverable`),
  CONSTRAINT `ticket_del_id` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_deliverable` FOREIGN KEY (`id_deliverable`) REFERENCES `deliverables` (`id_deliverable`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_requirements`
--

DROP TABLE IF EXISTS `ticket_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_requirements` (
  `id_ticket` int(11) NOT NULL,
  `id_requirement` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `information` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`,`id_requirement`),
  KEY `ticket_requirement_idx` (`id_requirement`),
  CONSTRAINT `ticket_req_id` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_requirement` FOREIGN KEY (`id_requirement`) REFERENCES `requirements` (`id_requirement`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_sprint`
--

DROP TABLE IF EXISTS `ticket_sprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_sprint` (
  `id_ticket` int(11) NOT NULL,
  `id_sprint` int(11) NOT NULL,
  `sprint_year` year(4) NOT NULL,
  `id_developer` int(11) NOT NULL,
  `spike` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`,`id_sprint`,`id_developer`,`sprint_year`),
  KEY `ticket_dev_idx` (`id_developer`),
  KEY `ticket_sprint_idx` (`id_sprint`,`sprint_year`),
  CONSTRAINT `ticket_dev` FOREIGN KEY (`id_developer`) REFERENCES `developer` (`id_developer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_id` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ticket_sprint` FOREIGN KEY (`id_sprint`, `sprint_year`) REFERENCES `sprint` (`id_sprint`, `year`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_task`
--

DROP TABLE IF EXISTS `ticket_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_task` (
  `id_ticket` int(11) NOT NULL,
  `id_sprint` int(11) NOT NULL,
  `sprint_year` year(4) NOT NULL,
  `id_task` int(11) NOT NULL,
  `task_description` text,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `duration` time DEFAULT NULL,
  PRIMARY KEY (`id_ticket`,`id_sprint`,`sprint_year`,`id_task`),
  KEY `task_sprint_idx` (`id_sprint`,`sprint_year`),
  KEY `task_id_idx` (`id_task`),
  CONSTRAINT `task_id` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_sprint` FOREIGN KEY (`id_sprint`, `sprint_year`) REFERENCES `sprint` (`id_sprint`, `year`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `task_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_developer` int(11) NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `password` varchar(12) DEFAULT NULL,
  `id_user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_developer`),
  KEY `user_type_idx` (`id_user_type`),
  CONSTRAINT `dev_user` FOREIGN KEY (`id_developer`) REFERENCES `developer` (`id_developer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_type` FOREIGN KEY (`id_user_type`) REFERENCES `user_type` (`id_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_type` (
  `id_user_type` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(45) DEFAULT NULL,
  `access` text,
  PRIMARY KEY (`id_user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `value_stream`
--

DROP TABLE IF EXISTS `value_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `value_stream` (
  `id_value_stream` int(11) NOT NULL AUTO_INCREMENT,
  `value_stream` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_value_stream`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 17:27:44
