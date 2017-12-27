-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: chrono
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `activity_type` int(11) NOT NULL DEFAULT '0',
  `body` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_chat_messages_on_chat_id_and_created_at` (`chat_id`,`created_at`),
  KEY `chat_messages_chat_id_id_archived_index` (`chat_id`,`id`,`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `position` int(11) DEFAULT '0',
  `last_seen` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_chats_on_user_id_and_target_id` (`user_id`,`target_id`),
  KEY `index_chats_on_user_id_and_position` (`user_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `contact_email` varchar(200) DEFAULT NULL,
  `contact_name` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `subdomain` varchar(255) NOT NULL DEFAULT '',
  `show_wiki` tinyint(1) DEFAULT '1',
  `show_forum` tinyint(1) DEFAULT '1',
  `show_chat` tinyint(1) DEFAULT '1',
  `show_messaging` tinyint(1) DEFAULT '1',
  `restricted_userlist` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_subdomain_index` (`subdomain`),
  KEY `companies_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Your Company','admin@localhost','admin','2010-05-09 20:14:43','2017-01-09 19:53:02','projects',1,0,0,1,0);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `contact_email` varchar(200) DEFAULT NULL,
  `contact_name` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `css` text,
  `binary_id` int(11) DEFAULT NULL,
  `evernote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_company_id_index` (`company_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,1,'Sample Client','client@client.com','Head Cheese','2017-12-22 18:21:37','2017-12-22 18:21:37',NULL,NULL,'');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencies` (
  `task_id` int(11) DEFAULT NULL,
  `dependency_id` int(11) DEFAULT NULL,
  KEY `dependencies_task_id_index` (`task_id`,`dependency_id`),
  KEY `dependencies_dependency_id_index` (`dependency_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_logs`
--

DROP TABLE IF EXISTS `event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_type` int(11) DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_event_logs_on_company_id_and_project_id` (`company_id`,`project_id`),
  KEY `index_event_logs_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `event_logs_company_id_project_id_created_at_index` (`company_id`,`project_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_logs`
--

LOCK TABLES `event_logs` WRITE;
/*!40000 ALTER TABLE `event_logs` DISABLE KEYS */;
INSERT INTO `event_logs` VALUES (1,1,2,2,1,'WorkLog',1,NULL,NULL,'2017-12-22 18:35:50','2017-12-22 18:35:51',NULL),(2,1,2,2,5,'WorkLog',2,NULL,NULL,'2017-12-22 18:37:17','2017-12-22 18:37:17',NULL),(3,1,2,2,5,'WorkLog',3,NULL,NULL,'2017-12-27 19:16:32','2017-12-27 19:16:32',NULL);
/*!40000 ALTER TABLE `event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `topics_count` int(11) DEFAULT '0',
  `posts_count` int(11) DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `description_html` text,
  PRIMARY KEY (`id`),
  KEY `index_forums_on_project_id` (`project_id`),
  KEY `index_forums_on_company_id_position` (`company_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generated_reports`
--

DROP TABLE IF EXISTS `generated_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generated_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `report` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_reports`
--

LOCK TABLES `generated_reports` WRITE;
/*!40000 ALTER TABLE `generated_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `generated_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ical_entries`
--

DROP TABLE IF EXISTS `ical_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ical_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `work_log_id` int(11) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `index_ical_entries_on_task_id` (`task_id`),
  KEY `index_ical_entries_on_work_log_id` (`work_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ical_entries`
--

LOCK TABLES `ical_entries` WRITE;
/*!40000 ALTER TABLE `ical_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ical_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `singular` text,
  `plural` text,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `same` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_locales_on_locale_and_key` (`locale`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `due_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `total_tasks` int(11) DEFAULT '0',
  `completed_tasks` int(11) DEFAULT '0',
  `scheduled_at` datetime DEFAULT NULL,
  `scheduled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `milestones_company_id_index` (`company_id`),
  KEY `milestones_project_id_index` (`project_id`),
  KEY `milestones_company_project_index` (`company_id`,`project_id`),
  KEY `milestones_project_id_completed_at_due_at_name` (`project_id`,`completed_at`,`due_at`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderatorships`
--

DROP TABLE IF EXISTS `moderatorships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderatorships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_moderatorships_on_forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderatorships`
--

LOCK TABLES `moderatorships` WRITE;
/*!40000 ALTER TABLE `moderatorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderatorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitorships`
--

DROP TABLE IF EXISTS `monitorships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitorships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitorship_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `monitorship_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_monitorships_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitorships`
--

LOCK TABLES `monitorships` WRITE;
/*!40000 ALTER TABLE `monitorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_items`
--

DROP TABLE IF EXISTS `news_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `body` text,
  `portal` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_items`
--

LOCK TABLES `news_items` WRITE;
/*!40000 ALTER TABLE `news_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id_task_id` (`user_id`,`task_id`),
  KEY `index_notifications_on_task_id_user_id` (`task_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `body` text,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_company_id_updated_at_name_index` (`company_id`,`updated_at`,`name`),
  KEY `pages_company_id_project_id_name` (`company_id`,`project_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `body_html` text,
  PRIMARY KEY (`id`),
  KEY `index_posts_on_forum_id` (`forum_id`,`created_at`),
  KEY `index_posts_on_user_id` (`user_id`,`created_at`),
  KEY `index_posts_on_topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `binary_id` int(11) NOT NULL DEFAULT '0',
  `file_type` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `filename` varchar(200) NOT NULL DEFAULT '',
  `thumbnail_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT 'application/octet-stream',
  `project_folder_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_files_company_id_index` (`company_id`),
  KEY `index_project_files_on_project_folder_id` (`project_folder_id`),
  KEY `index_project_files_on_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_files`
--

LOCK TABLES `project_files` WRITE;
/*!40000 ALTER TABLE `project_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_folders`
--

DROP TABLE IF EXISTS `project_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_folders_on_project_id` (`project_id`),
  KEY `index_project_folders_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_folders`
--

LOCK TABLES `project_folders` WRITE;
/*!40000 ALTER TABLE `project_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_permissions`
--

DROP TABLE IF EXISTS `project_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `can_comment` tinyint(1) DEFAULT '0',
  `can_work` tinyint(1) DEFAULT '0',
  `can_report` tinyint(1) DEFAULT '0',
  `can_create` tinyint(1) DEFAULT '0',
  `can_edit` tinyint(1) DEFAULT '0',
  `can_reassign` tinyint(1) DEFAULT '0',
  `can_prioritize` tinyint(1) DEFAULT '0',
  `can_close` tinyint(1) DEFAULT '0',
  `can_grant` tinyint(1) DEFAULT '0',
  `can_milestone` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `project_permissions_user_id_index` (`user_id`),
  KEY `project_permissions_project_id_user_id_index` (`project_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_permissions`
--

LOCK TABLES `project_permissions` WRITE;
/*!40000 ALTER TABLE `project_permissions` DISABLE KEYS */;
INSERT INTO `project_permissions` VALUES (1,1,1,2,'2017-12-16 21:27:25',1,1,1,1,1,1,1,1,1,1),(2,1,2,2,'2017-12-22 18:33:37',1,1,1,1,1,1,1,1,1,1),(5,1,2,31,'2017-12-23 00:50:07',1,1,0,0,0,0,0,1,0,0),(6,1,1,31,'2017-12-23 00:50:08',1,1,0,0,0,0,0,1,0,0);
/*!40000 ALTER TABLE `project_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `critical_count` int(11) DEFAULT '0',
  `normal_count` int(11) DEFAULT '0',
  `low_count` int(11) DEFAULT '0',
  `description` text,
  `create_forum` tinyint(1) DEFAULT '1',
  `open_tasks` int(11) DEFAULT NULL,
  `total_tasks` int(11) DEFAULT NULL,
  `total_milestones` int(11) DEFAULT NULL,
  `open_milestones` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_company_id_index` (`company_id`),
  KEY `projects_customer_id_index` (`customer_id`),
  KEY `projects_completed_at_customer_id_name_index` (`completed_at`,`customer_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Test Project',2,1,1,'2017-12-16 21:27:25','2017-12-23 00:50:38',NULL,0,0,0,'',1,NULL,0,0,0),(2,'Sample Project',2,1,1,'2017-12-22 18:33:37','2017-12-27 19:16:32',NULL,0,1,0,'',1,NULL,NULL,0,0);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scm_changesets`
--

DROP TABLE IF EXISTS `scm_changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scm_changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `scm_project_id` int(11) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `changeset_num` int(11) DEFAULT NULL,
  `commit_date` datetime DEFAULT NULL,
  `changeset_rev` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `scm_changesets_commit_date_index` (`commit_date`),
  KEY `scm_changesets_author_index` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scm_changesets`
--

LOCK TABLES `scm_changesets` WRITE;
/*!40000 ALTER TABLE `scm_changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `scm_changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scm_files`
--

DROP TABLE IF EXISTS `scm_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scm_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `name` text,
  `path` text,
  `state` varchar(255) DEFAULT NULL,
  `commit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scm_files_project_id_index` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scm_files`
--

LOCK TABLES `scm_files` WRITE;
/*!40000 ALTER TABLE `scm_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `scm_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scm_projects`
--

DROP TABLE IF EXISTS `scm_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scm_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `scm_type` varchar(255) DEFAULT NULL,
  `last_commit_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `last_checkout` datetime DEFAULT NULL,
  `module` text,
  `location` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scm_projects`
--

LOCK TABLES `scm_projects` WRITE;
/*!40000 ALTER TABLE `scm_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `scm_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scm_revisions`
--

DROP TABLE IF EXISTS `scm_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scm_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `scm_changeset_id` int(11) DEFAULT NULL,
  `scm_file_id` int(11) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `commit_date` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scm_revisions_scm_changeset_id_index` (`scm_changeset_id`),
  KEY `scm_revisions_scm_file_id_index` (`scm_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scm_revisions`
--

LOCK TABLES `scm_revisions` WRITE;
/*!40000 ALTER TABLE `scm_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `scm_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) DEFAULT NULL,
  `data` longtext,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sessions_session_id_index` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'dee621fda72597a533c499a6a049e903','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-08 21:11:47'),(2,'c8261f4423ae1dfe43efe2e9bbe8b751','BAh7GToTcmVtZW1iZXJfdW50aWxJdToJVGltZQ3Tbh3AFccHjQY6H0BtYXJz\naGFsX3dpdGhfdXRjX2NvZXJjaW9uVDoTZmlsdGVyX3Byb2plY3QiBjA6FGZp\nbHRlcl9wcmlvcml0eSIILTEwOhZoaWRlX2RlcGVuZGVuY2llcyIGMDoSZmls\ndGVyX3N0YXR1cyIGMDoMdXNlcl9pZGkHOg1jaGFubmVsc1sHIgtpbmZvXzEi\nC3VzZXJfMjoQZmlsdGVyX3R5cGUiBy0xOg1yZWRpcmVjdDA6EGZpbHRlcl91\nc2VyIgYyOhRmaWx0ZXJfY3VzdG9tZXIiBjA6CXZpZXcwIgpmbGFzaElDOidB\nY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\nOhVmaWx0ZXJfbWlsZXN0b25lIgYwOg1yZW1lbWJlcmkAOhJoaWRlX2RlZmVy\ncmVkIgYxOgpzaGVldDA6FGZpbHRlcl9zZXZlcml0eSIILTEwOgxoaXN0b3J5\nWwkiFS9hY3Rpdml0aWVzL2xpc3QiEy9wcm9qZWN0cy9saXN0IhAvdGFza3Mv\nbGlzdCITL3Byb2plY3RzL2xpc3Q6EmZpbHRlcl9oaWRkZW4iBjA=\n','2017-12-22 18:35:16'),(3,'e5789d01a4ac3f36fb7716293945f24c','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-08 21:17:59'),(4,'eed6a48f6ada6e61813297fa7ea3507e','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-08 21:18:41'),(5,'fd35199fe37e026178f17c0defc13717','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-08 21:19:33'),(6,'52b38fccdf709b3c9621fc4d10050ec2','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-08 21:48:56'),(7,'34ab257180597abe2ae6feec327619f0','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-08 21:49:02'),(8,'e114b10be807cb4b1774d5b4c0ff7dd4','BAh7HToTcmVtZW1iZXJfdW50aWxJdToJVGltZQ10bx3AF84BRQY6H0BtYXJz\naGFsX3dpdGhfdXRjX2NvZXJjaW9uVDoUbGFzdF9wcm9qZWN0X2lkIgYwOhRm\naWx0ZXJfcHJpb3JpdHkiCC0xMDoTZmlsdGVyX3Byb2plY3RABzoPZm9ydW1f\ncGFnZTA6FmhpZGVfZGVwZW5kZW5jaWVzIgA6DXJlZGlyZWN0MDoNY2hhbm5l\nbHNbByILaW5mb18xIgt1c2VyXzI6DHVzZXJfaWRpBzoQZmlsdGVyX3R5cGUi\nBy0xOhJmaWx0ZXJfc3RhdHVzafo6EGZpbHRlcl91c2VyIgYwOg1ncm91cF9i\neSIGMDoJdmlld286CVZpZXcKOhBAYXR0cmlidXRlc3sXIhZmaWx0ZXJfcHJv\namVjdF9pZCIGMCISaGlkZV9kZWZlcnJlZDAiD2F1dG9fZ3JvdXAiBjAiEGZp\nbHRlcl90YWdzIgAiFGZpbHRlcl9zZXZlcml0eSIILTEwIgx1c2VyX2lkIgYy\nIgtzaGFyZWQiBjAiEmZpbHRlcl9zdGF0dXMiBy0xIhNmaWx0ZXJfdHlwZV9p\nZCIHLTEiFmhpZGVfZGVwZW5kZW5jaWVzMCIPY29tcGFueV9pZCIGMSIJc29y\ndCIGMCIYZmlsdGVyX21pbGVzdG9uZV9pZCIGMCIJbmFtZSIRQW5vdGhlciB2\naWV3IhRmaWx0ZXJfcHJpb3JpdHkiCC0xMCIHaWQiBjEiF2ZpbHRlcl9jdXN0\nb21lcl9pZCIGMCITZmlsdGVyX3VzZXJfaWQiBjA6FkBhdHRyaWJ1dGVzX2Nh\nY2hlewA6DUBjb21wYW55MDoYQGNoYW5nZWRfYXR0cmlidXRlc3sAOgpAdXNl\ncjA6FGZpbHRlcl9jdXN0b21lciIGMDoVZmlsdGVyX21pbGVzdG9uZSIGMCIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7ADoJc29ydCIGMDoSaGlkZV9kZWZlcnJlZCIAOg1yZW1lbWJl\ncmkAOgpzaGVldDA6EmZpbHRlcl9oaWRkZW4iBjA6DGhpc3RvcnlbCSIcL3Vz\nZXJzL2VkaXRfcHJlZmVyZW5jZXMiFS9hY3Rpdml0aWVzL2xpc3QiEy9zY2hl\nZHVsZS9saXN0IhUvYWN0aXZpdGllcy9saXN0OhRmaWx0ZXJfc2V2ZXJpdHki\nCC0xMA==\n','2017-12-27 19:17:16'),(9,'904d468307417b6ac174adb41c7e547a','BAh7CDoNcmVkaXJlY3QiFS9hY3Rpdml0aWVzL2xpc3QiCmZsYXNoSUM6J0Fj\ndGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6\nDGhpc3RvcnlbBkAG\n','2017-12-08 21:49:53'),(10,'a8b5733f3d3ec35b3d7340d696143b66','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-09 01:44:20'),(11,'1b34d1ee9b7c382b99f3116fa37882dc','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-09 01:45:31'),(12,'2978ab54063d9327a85ab6942f86b427','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 13:45:45'),(13,'6761063cec1d7de01098ad20fdcd8186','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 19:58:25'),(14,'b472700e7247c9f59d4198ed1e368a9f','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 23:32:39'),(15,'dc53d989a61131f05fa706d0c24b2f37','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 23:32:39'),(16,'9ef91ccdc0b4a36b6552f0a12d0420ec','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 23:32:39'),(17,'f7231f64f7a39f7c59b536b5c3dc2083','BAh7CDoNcmVkaXJlY3QiJy9hcGkvdXNlci81OWY2MWEzNDkzMDJiMjYxNDRj\nMzRjMWQiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz\naEhhc2h7AAY6CkB1c2VkewA6DGhpc3RvcnlbAA==\n','2017-12-10 23:32:39'),(18,'40bedd783cf9e05920f7247528302285','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 23:32:39'),(19,'48b0dc3936e7dadc1706e140ae058594','BAh7CDoNcmVkaXJlY3QiDi9hcGkvbmV3cyIKZmxhc2hJQzonQWN0aW9uQ29u\ndHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoMaGlzdG9y\neVsA\n','2017-12-10 23:32:39'),(20,'14c34b07b95bc2ae4bd5f30977c4be40','BAh7CDoNcmVkaXJlY3QiKi9hcGkvcmVwb3J0cy81OWY2MWEzNDkzMDJiMjYx\nNDRjMzRjMWQiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpG\nbGFzaEhhc2h7AAY6CkB1c2VkewA6DGhpc3RvcnlbAA==\n','2017-12-10 23:32:39'),(21,'8b955db21c220fe9a8c42d4f1b904885','BAh7CDoNcmVkaXJlY3QiEy9hcGkvcXVpei9kYXRhIgpmbGFzaElDOidBY3Rp\nb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOgxo\naXN0b3J5WwA=\n','2017-12-10 23:32:39'),(22,'a756614cbe0a64f605422e4386affbc2','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 23:32:39'),(23,'016c0668aa7819f4d1bcdf98fb8e1b12','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 23:32:39'),(24,'9dffaa026c08bbd71d56dd4b044efb4c','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-10 23:32:39'),(25,'29c1251f8e251d571c8d7adc06da68ca','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-11 06:03:07'),(26,'df3cd1e81f6e7c7490283355268eefa5','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-11 17:11:41'),(27,'38ad89fbf94367ac5654e9d214c698b6','BAh7CDoNcmVkaXJlY3QiKi9hcGkvcmVwb3J0cy81OWY2MWEzNDkzMDJiMjYx\nNDRjMzRjMWQiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpG\nbGFzaEhhc2h7AAY6CkB1c2VkewA6DGhpc3RvcnlbAA==\n','2017-12-11 17:11:41'),(28,'d687b266b12f27991f1619eb18db8519','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-11 17:11:42'),(29,'7b52c3e70cdd95c46b4e8feed2c227b5','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-11 17:11:42'),(30,'644f6f2882edfa74a7d3a9ab174bc42c','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-11 17:11:42'),(31,'830f4a5c8bd1bf3cd241a87fa8859453','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-11 17:11:42'),(32,'b039875140b8e0be531f7909f14c0bd7','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-11 18:11:38'),(33,'be28c120be31e6bdc7a1b039683142cc','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-14 15:07:03'),(34,'42d1f41ca2df0b2bccd9843afcead579','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-15 18:22:00'),(35,'856df74e7547f86f0893f6682b97ec4f','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-15 18:22:00'),(36,'14450f28e59f485ff52ceeddfaf61c57','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-16 21:22:59'),(37,'a2c240c68dc9e1949d28ec7252812268','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-16 21:23:00'),(38,'fd818080af7f43bd154d3cade16c06df','BAh7GToWaGlkZV9kZXBlbmRlbmNpZXMiBjA6E3JlbWVtYmVyX3VudGlsSXU6\nCVRpbWUNFm4dwAiwvnQGOh9AbWFyc2hhbF93aXRoX3V0Y19jb2VyY2lvblQ6\nFGZpbHRlcl9wcmlvcml0eSIILTEwOhBmaWx0ZXJfdXNlciIGMjoQZmlsdGVy\nX3R5cGUiBy0xOhVmaWx0ZXJfbWlsZXN0b25lIgYwOgx1c2VyX2lkaQc6DWNo\nYW5uZWxzWwciC2luZm9fMSILdXNlcl8yOhJoaWRlX2RlZmVycmVkIgYxOhJm\naWx0ZXJfaGlkZGVuIgYwOgl2aWV3bzoJVmlldwk6EEBhdHRyaWJ1dGVzexYi\nFGZpbHRlcl9wcmlvcml0eWnxIglzb3J0aQAiC3NoYXJlZGkAIhJoaWRlX2Rl\nZmVycmVkMCIWZmlsdGVyX3Byb2plY3RfaWRpACIPYXV0b19ncm91cGkAIhBm\naWx0ZXJfdGFncyIAIhZoaWRlX2RlcGVuZGVuY2llczAiE2ZpbHRlcl90eXBl\nX2lkaQAiEmZpbHRlcl9zdGF0dXNpACIUZmlsdGVyX3NldmVyaXR5afEiGGZp\nbHRlcl9taWxlc3RvbmVfaWRpACIXZmlsdGVyX2N1c3RvbWVyX2lkaQAiE2Zp\nbHRlcl91c2VyX2lkaQAiDHVzZXJfaWQwIg9jb21wYW55X2lkMCIJbmFtZSIS\nTXkgT3BlbiBUYXNrczoWQGF0dHJpYnV0ZXNfY2FjaGV7ADoYQGNoYW5nZWRf\nYXR0cmlidXRlc3sGIgluYW1lMDoQQG5ld19yZWNvcmRUOhNmaWx0ZXJfcHJv\namVjdCIGMDoUbGFzdF9wcm9qZWN0X2lkMDoSZmlsdGVyX3N0YXR1cyIGMDoU\nZmlsdGVyX2N1c3RvbWVyIgYwOg1yZW1lbWJlcmkAIgpmbGFzaElDOidBY3Rp\nb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAOhRm\naWx0ZXJfc2V2ZXJpdHkiCC0xMDoKc2hlZXQwOgxoaXN0b3J5WwkiEC90YXNr\ncy9saXN0IhUvYWN0aXZpdGllcy9saXN0IhAvdGFza3MvbGlzdCIUL3NjaGVk\ndWxlL2dhbnR0\n','2017-12-16 21:29:12'),(39,'a76ae95cfc913f63f35e8a4624e6e9c2','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-17 08:28:49'),(40,'5a669cf732bbd5760effccef5eb72d71','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-18 10:29:51'),(41,'cf0fb448608bf1302a06278e351503a6','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-19 13:33:06'),(42,'8c795cf8715a3c8d115fece240a594e9','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-19 13:33:07'),(43,'0e39de1546dec0634ebf231aa495b510','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-19 19:31:50'),(44,'af686b99ef5df3a010ad3022fd6cb87b','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-20 04:05:06'),(45,'90ec531d865626a50023741e85508341','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-22 17:37:01'),(46,'d3ffaa4d21b7a30b759aa00eb33ac5c6','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-22 21:47:53'),(47,'497e4d11d373a31a32760aa25ddb89a3','BAh7FzoTcmVtZW1iZXJfdW50aWxJdToJVGltZQ3jbh3ASnBrFgY6H0BtYXJz\naGFsX3dpdGhfdXRjX2NvZXJjaW9uVDoTZmlsdGVyX3Byb2plY3QiBjA6FGZp\nbHRlcl9wcmlvcml0eSIILTEwOhZoaWRlX2RlcGVuZGVuY2llcyIGMToNY2hh\nbm5lbHNbByILaW5mb18xIgx1c2VyXzMxOg1yZWRpcmVjdDA6DHVzZXJfaWRp\nJDoSZmlsdGVyX3N0YXR1cyIGMDoQZmlsdGVyX3R5cGUiBy0xOhBmaWx0ZXJf\ndXNlciIHMzE6FGZpbHRlcl9jdXN0b21lciIGMCIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoVZmls\ndGVyX21pbGVzdG9uZSIGMDoNcmVtZW1iZXJpADoKc2hlZXQwOgxoaXN0b3J5\nWwYiFS9hY3Rpdml0aWVzL2xpc3Q6EmZpbHRlcl9oaWRkZW4iBjA6FGZpbHRl\ncl9zZXZlcml0eSIILTEw\n','2017-12-23 02:05:38'),(48,'fbce5c2c9c6dc9728f17d80376ae40db','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-23 01:20:45'),(49,'37ce6153ec53e1a2af16266d4ad27522','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-23 11:58:36'),(50,'aba36906e76f5dd41abb097deb42b4ad','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-25 03:53:08'),(51,'360ed814df38c18bb2764d70d8cb7979','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-26 03:10:02'),(52,'768277a237d221bb15b564037204207b','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-26 16:14:56'),(53,'19109675b04ed44d259d4d9b174557fd','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-26 16:14:58'),(54,'b74ce75a79491f620195f1b9d150978e','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-27 18:18:48'),(55,'ac28e1c6dc57ca850b9b8dfaf956394c','BAh7BiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2017-12-27 18:19:05');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sheets`
--

DROP TABLE IF EXISTS `sheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `body` text,
  `paused_at` datetime DEFAULT NULL,
  `paused_duration` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_sheets_on_task_id` (`task_id`),
  KEY `index_sheets_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sheets`
--

LOCK TABLES `sheets` WRITE;
/*!40000 ALTER TABLE `sheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shout_channel_subscriptions`
--

DROP TABLE IF EXISTS `shout_channel_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shout_channel_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shout_channel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shout_channel_subscriptions_on_shout_channel_id` (`shout_channel_id`),
  KEY `index_shout_channel_subscriptions_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shout_channel_subscriptions`
--

LOCK TABLES `shout_channel_subscriptions` WRITE;
/*!40000 ALTER TABLE `shout_channel_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shout_channel_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shout_channels`
--

DROP TABLE IF EXISTS `shout_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shout_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `public` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shout_channels_on_company_id` (`company_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shout_channels`
--

LOCK TABLES `shout_channels` WRITE;
/*!40000 ALTER TABLE `shout_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `shout_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shouts`
--

DROP TABLE IF EXISTS `shouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `body` text,
  `shout_channel_id` int(11) DEFAULT NULL,
  `message_type` int(11) DEFAULT '0',
  `nick` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shouts_created_at_index` (`created_at`),
  KEY `index_shouts_on_shout_channel_id` (`shout_channel_id`),
  KEY `shouts_company_id_index` (`company_id`,`shout_channel_id`,`message_type`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tags_on_company_id_and_name` (`company_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_owners`
--

DROP TABLE IF EXISTS `task_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_owners_task_id_user_id_index` (`task_id`,`user_id`),
  KEY `task_owners_user_id_task_id_index` (`user_id`,`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_owners`
--

LOCK TABLES `task_owners` WRITE;
/*!40000 ALTER TABLE `task_owners` DISABLE KEYS */;
INSERT INTO `task_owners` VALUES (4,2,1);
/*!40000 ALTER TABLE `task_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_tags`
--

DROP TABLE IF EXISTS `task_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_tags` (
  `tag_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  KEY `task_tags_tag_id_task_id_index` (`tag_id`,`task_id`),
  KEY `task_tags_task_id_tag_id_index` (`task_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_tags`
--

LOCK TABLES `task_tags` WRITE;
/*!40000 ALTER TABLE `task_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `due_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT '1',
  `hidden` int(11) DEFAULT '0',
  `milestone_id` int(11) DEFAULT NULL,
  `description` text,
  `company_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `updated_by_id` int(11) DEFAULT NULL,
  `severity_id` int(11) DEFAULT '0',
  `type_id` int(11) DEFAULT '0',
  `task_num` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `requested_by` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `notify_emails` varchar(255) DEFAULT NULL,
  `repeat` varchar(255) DEFAULT NULL,
  `hide_until` datetime DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `scheduled_duration` int(11) DEFAULT NULL,
  `scheduled` tinyint(1) DEFAULT '0',
  `worked_minutes` int(11) DEFAULT '0',
  `start_at` datetime DEFAULT NULL,
  `scheduled_start` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_index` (`project_id`,`milestone_id`),
  KEY `tasks_company_id_index` (`company_id`),
  KEY `tasks_project_completed_index` (`project_id`,`completed_at`),
  KEY `index_tasks_on_milestone_id` (`milestone_id`),
  KEY `tasks_due_at_idx` (`due_at`),
  KEY `tasks_completed_at_idx` (`completed_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'A very interesting task',2,0,'2017-12-22 18:35:50','2017-12-23 07:59:00','2017-12-27 19:16:32',NULL,1200,0,0,'',1,0,2,0,0,1,0,'',2,NULL,NULL,NULL,NULL,NULL,0,0,'2017-12-22 08:00:00',NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todos`
--

DROP TABLE IF EXISTS `todos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `completed_by_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_todos_on_task_id` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todos`
--

LOCK TABLES `todos` WRITE;
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
INSERT INTO `todos` VALUES (1,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit',1,2,'2017-12-27 18:33:12','2017-12-22 21:48:50','2017-12-27 18:33:12',2),(2,1,'Proin vitae faucibus purus. Nullam id erat id dui rhoncus ullamcorper in eget purus',2,2,'2017-12-27 18:33:12','2017-12-22 21:49:04','2017-12-27 18:33:12',2),(3,1,'Aliquam faucibus dui id arcu porta facilisis',3,2,'2017-12-27 18:33:09','2017-12-22 21:49:05','2017-12-27 18:33:09',2),(4,1,'Curabitur finibus purus eu dolor laoreet, in maximus ex fermentum',4,2,'2017-12-27 18:33:08','2017-12-22 21:56:54','2017-12-27 18:33:08',2);
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `hits` int(11) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  `posts_count` int(11) DEFAULT '0',
  `replied_at` datetime DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `replied_by` int(11) DEFAULT NULL,
  `last_post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topics_on_forum_id` (`forum_id`),
  KEY `index_topics_on_sticky_and_replied_at` (`forum_id`,`sticky`,`replied_at`),
  KEY `index_topics_on_forum_id_and_replied_at` (`forum_id`,`replied_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `username` varchar(200) NOT NULL DEFAULT '',
  `password` varchar(200) NOT NULL DEFAULT '',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `admin` int(11) DEFAULT '0',
  `time_zone` varchar(255) DEFAULT NULL,
  `option_tracktime` int(11) DEFAULT NULL,
  `option_externalclients` int(11) DEFAULT NULL,
  `option_tooltips` int(11) DEFAULT NULL,
  `seen_news_id` int(11) DEFAULT '0',
  `last_project_id` int(11) DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `last_ping_at` datetime DEFAULT NULL,
  `last_milestone_id` int(11) DEFAULT NULL,
  `last_filter` int(11) DEFAULT NULL,
  `date_format` varchar(255) DEFAULT NULL,
  `time_format` varchar(255) DEFAULT NULL,
  `send_notifications` int(11) DEFAULT '1',
  `receive_notifications` int(11) DEFAULT '1',
  `receive_own_notifications` int(11) DEFAULT '0',
  `uuid` varchar(255) DEFAULT NULL,
  `seen_welcome` int(11) DEFAULT '0',
  `locale` varchar(255) DEFAULT 'en_US',
  `duration_format` int(11) DEFAULT '0',
  `workday_duration` int(11) DEFAULT '480',
  `posts_count` int(11) DEFAULT '0',
  `newsletter` int(11) DEFAULT '1',
  `option_avatars` int(11) DEFAULT '1',
  `autologin` varchar(255) DEFAULT NULL,
  `remember_until` datetime DEFAULT NULL,
  `option_floating_chat` tinyint(1) DEFAULT '1',
  `days_per_week` int(11) DEFAULT '5',
  `enable_sounds` tinyint(1) DEFAULT '1',
  `create_projects` tinyint(1) DEFAULT '1',
  `show_type_icons` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `users_uuid_index` (`uuid`),
  KEY `users_username_index` (`username`),
  KEY `index_users_on_last_seen_at` (`last_seen_at`),
  KEY `index_users_on_autologin` (`autologin`),
  KEY `users_company_id_index` (`company_id`,`name`),
  KEY `users_last_ping_at_idx` (`last_ping_at`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Default user','admin','admin',1,'2010-05-09 20:24:32','2017-12-27 19:17:16','admin@localhost.com','2017-12-27 18:19:35',2,'US/Pacific',1,1,1,65,0,'2017-12-27 19:17:16','2017-12-27 19:17:16',0,NULL,'%m/%d/%Y','%I:%M%p',1,1,1,'da222717fb7b4dfc61f3ed49e3f62f4d',1,'en_US',3,480,4,1,1,'0bc3ccb7e413dbcd372ced4aaeb5fec5',NULL,1,5,1,1,1),(31,'Another User','user','user',1,'2017-12-23 00:49:58','2017-12-23 02:05:38','office@emrl.com','2017-12-23 00:50:37',0,'US/Pacific',0,1,1,0,NULL,'2017-12-23 00:50:38','2017-12-23 02:05:38',NULL,NULL,'%d/%m/%Y','%H:%M',1,1,0,'f698fb8966e6651a38f5f57e40e2bab8',0,'en_US',0,480,0,1,1,'78c3635de8a9c7c4675cf7a78ba6951a',NULL,1,5,1,0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shared` int(11) DEFAULT '0',
  `auto_group` int(11) DEFAULT '0',
  `filter_customer_id` int(11) DEFAULT '0',
  `filter_project_id` int(11) DEFAULT '0',
  `filter_milestone_id` int(11) DEFAULT '0',
  `filter_user_id` int(11) DEFAULT '0',
  `filter_tags` varchar(255) DEFAULT '',
  `filter_status` int(11) DEFAULT '0',
  `filter_type_id` int(11) DEFAULT '0',
  `hide_deferred` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `filter_severity` int(11) DEFAULT '-10',
  `filter_priority` int(11) DEFAULT '-10',
  `hide_dependencies` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `views_company_id_shared_name_index` (`company_id`,`shared`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,'Another view',1,2,0,0,0,0,0,0,'',-1,-1,NULL,0,-10,-10,NULL);
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `widget_type` int(11) DEFAULT '0',
  `number` int(11) DEFAULT '5',
  `mine` tinyint(1) DEFAULT NULL,
  `order_by` varchar(255) DEFAULT NULL,
  `group_by` varchar(255) DEFAULT NULL,
  `filter_by` varchar(255) DEFAULT NULL,
  `collapsed` tinyint(1) DEFAULT '0',
  `column` int(11) DEFAULT '0',
  `position` int(11) DEFAULT '0',
  `configured` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gadget_url` text,
  PRIMARY KEY (`id`),
  KEY `widgets_user_id_column_position_index` (`user_id`,`column`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (2,1,2,'Due Tasks',7,10,0,NULL,NULL,'0',0,0,0,1,'2017-12-22 18:36:49','2017-12-22 18:36:54',NULL),(3,1,31,'Top Tasks',0,5,1,'priority',NULL,NULL,0,0,0,1,'2017-12-23 00:49:58','2017-12-23 00:49:58',NULL),(4,1,31,'Newest Tasks',0,5,0,'date',NULL,NULL,0,0,1,1,'2017-12-23 00:49:58','2017-12-23 00:49:58',NULL),(5,1,31,'Recent Activities',2,20,NULL,NULL,NULL,NULL,0,2,0,1,'2017-12-23 00:49:58','2017-12-23 00:49:58',NULL),(6,1,31,'Open Tasks',3,7,1,NULL,NULL,NULL,0,1,0,1,'2017-12-23 00:49:58','2017-12-23 00:49:58',NULL),(7,1,31,'Projects',1,0,NULL,NULL,NULL,NULL,0,1,1,1,'2017-12-23 00:49:58','2017-12-23 00:49:58',NULL);
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `locked_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_references`
--

DROP TABLE IF EXISTS `wiki_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_page_id` int(11) DEFAULT NULL,
  `referenced_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wiki_references_on_wiki_page_id` (`wiki_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_references`
--

LOCK TABLES `wiki_references` WRITE;
/*!40000 ALTER TABLE `wiki_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_revisions`
--

DROP TABLE IF EXISTS `wiki_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_page_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `body` text,
  `user_id` int(11) DEFAULT NULL,
  `change` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_revisions_wiki_page_id_index` (`wiki_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_revisions`
--

LOCK TABLES `wiki_revisions` WRITE;
/*!40000 ALTER TABLE `wiki_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_logs`
--

DROP TABLE IF EXISTS `work_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) DEFAULT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `started_at` datetime NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `body` text,
  `log_type` int(11) DEFAULT '0',
  `scm_changeset_id` int(11) DEFAULT NULL,
  `paused_duration` int(11) DEFAULT '0',
  `comment` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `work_logs_user_id_index` (`user_id`,`task_id`),
  KEY `work_logs_task_id_index` (`task_id`,`log_type`),
  KEY `work_logs_company_id_index` (`company_id`),
  KEY `work_logs_project_id_index` (`project_id`),
  KEY `work_logs_customer_id_index` (`customer_id`),
  KEY `work_logs_company_project_index` (`company_id`,`project_id`,`log_type`,`started_at`),
  KEY `work_logs_user_id_started_at_index` (`user_id`,`started_at`),
  KEY `work_logs_duration_idx` (`duration`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_logs`
--

LOCK TABLES `work_logs` WRITE;
/*!40000 ALTER TABLE `work_logs` DISABLE KEYS */;
INSERT INTO `work_logs` VALUES (1,2,1,2,1,1,'2017-12-22 18:35:50',0,NULL,1,NULL,0,0),(2,2,1,2,1,1,'2017-12-22 18:37:17',0,'- <strong>Due</strong>: Friday, 20 December 2019 -> Friday, 22 December 2017\n',5,NULL,0,0),(3,2,1,2,1,1,'2017-12-27 19:16:32',0,'- <strong>Name</strong>: Execute a Task -> A very interesting task\n',5,NULL,0,0);
/*!40000 ALTER TABLE `work_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'chrono'
--

--
-- Dumping routines for database 'chrono'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-27 11:18:34
