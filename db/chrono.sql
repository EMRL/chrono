-- phpMyAdmin SQL Dump
-- version 4.1.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 18, 2017 at 11:55 AM
-- Server version: 5.0.67
-- PHP Version: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chrono`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `company_id` int(11) NOT NULL default '0',
  `customer_id` int(11) NOT NULL default '0',
  `project_id` int(11) NOT NULL default '0',
  `activity_type` int(11) NOT NULL default '0',
  `body` varchar(255) NOT NULL default '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE IF NOT EXISTS `chats` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `target_id` int(11) default NULL,
  `active` int(11) default '1',
  `position` int(11) default '0',
  `last_seen` int(11) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_chats_on_user_id_and_target_id` (`user_id`,`target_id`),
  KEY `index_chats_on_user_id_and_position` (`user_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE IF NOT EXISTS `chat_messages` (
  `id` int(11) NOT NULL auto_increment,
  `chat_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `body` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `archived` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `index_chat_messages_on_chat_id_and_created_at` (`chat_id`,`created_at`),
  KEY `chat_messages_chat_id_id_archived_index` (`chat_id`,`id`,`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `contact_email` varchar(200) default NULL,
  `contact_name` varchar(200) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `subdomain` varchar(255) NOT NULL default '',
  `show_wiki` tinyint(1) default '1',
  `show_forum` tinyint(1) default '1',
  `show_chat` tinyint(1) default '1',
  `show_messaging` tinyint(1) default '1',
  `restricted_userlist` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `companies_subdomain_index` (`subdomain`),
  KEY `companies_name_index` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `contact_email` varchar(200) default NULL,
  `contact_name` varchar(200) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `css` text,
  `binary_id` int(11) default NULL,
  `evernote` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `customers_company_id_index` (`company_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dependencies`
--

CREATE TABLE IF NOT EXISTS `dependencies` (
  `task_id` int(11) default NULL,
  `dependency_id` int(11) default NULL,
  KEY `dependencies_task_id_index` (`task_id`,`dependency_id`),
  KEY `dependencies_dependency_id_index` (`dependency_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL auto_increment,
  `from` varchar(255) default NULL,
  `to` varchar(255) default NULL,
  `subject` varchar(255) default NULL,
  `body` text,
  `company_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_logs`
--

CREATE TABLE IF NOT EXISTS `event_logs` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `event_type` int(11) default NULL,
  `target_type` varchar(255) default NULL,
  `target_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `user` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_event_logs_on_company_id_and_project_id` (`company_id`,`project_id`),
  KEY `index_event_logs_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `event_logs_company_id_project_id_created_at_index` (`company_id`,`project_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE IF NOT EXISTS `forums` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `topics_count` int(11) default '0',
  `posts_count` int(11) default '0',
  `position` int(11) default NULL,
  `description_html` text,
  PRIMARY KEY  (`id`),
  KEY `index_forums_on_project_id` (`project_id`),
  KEY `index_forums_on_company_id_position` (`company_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `generated_reports`
--

CREATE TABLE IF NOT EXISTS `generated_reports` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `filename` varchar(255) default NULL,
  `report` text,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ical_entries`
--

CREATE TABLE IF NOT EXISTS `ical_entries` (
  `id` int(11) NOT NULL auto_increment,
  `task_id` int(11) default NULL,
  `work_log_id` int(11) default NULL,
  `body` text,
  PRIMARY KEY  (`id`),
  KEY `index_ical_entries_on_task_id` (`task_id`),
  KEY `index_ical_entries_on_work_log_id` (`work_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE IF NOT EXISTS `locales` (
  `id` int(11) NOT NULL auto_increment,
  `locale` varchar(255) default NULL,
  `key` varchar(255) default NULL,
  `singular` text,
  `plural` text,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `same` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_locales_on_locale_and_key` (`locale`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE IF NOT EXISTS `milestones` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `due_at` datetime default NULL,
  `position` int(11) default NULL,
  `completed_at` datetime default NULL,
  `total_tasks` int(11) default '0',
  `completed_tasks` int(11) default '0',
  `scheduled_at` datetime default NULL,
  `scheduled` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `milestones_company_id_index` (`company_id`),
  KEY `milestones_project_id_index` (`project_id`),
  KEY `milestones_company_project_index` (`company_id`,`project_id`),
  KEY `milestones_project_id_completed_at_due_at_name` (`project_id`,`completed_at`,`due_at`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `moderatorships`
--

CREATE TABLE IF NOT EXISTS `moderatorships` (
  `id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_moderatorships_on_forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `monitorships`
--

CREATE TABLE IF NOT EXISTS `monitorships` (
  `id` int(11) NOT NULL auto_increment,
  `monitorship_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `active` tinyint(1) default '1',
  `monitorship_type` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_monitorships_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `news_items`
--

CREATE TABLE IF NOT EXISTS `news_items` (
  `id` int(11) NOT NULL auto_increment,
  `created_at` datetime default NULL,
  `body` text,
  `portal` tinyint(1) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL auto_increment,
  `task_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_notifications_on_user_id_task_id` (`user_id`,`task_id`),
  KEY `index_notifications_on_task_id_user_id` (`task_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `body` text,
  `company_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  `project_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `position` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `pages_company_id_updated_at_name_index` (`company_id`,`updated_at`,`name`),
  KEY `pages_company_id_project_id_name` (`company_id`,`project_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  `body` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `forum_id` int(11) default NULL,
  `body_html` text,
  PRIMARY KEY  (`id`),
  KEY `index_posts_on_forum_id` (`forum_id`,`created_at`),
  KEY `index_posts_on_user_id` (`user_id`,`created_at`),
  KEY `index_posts_on_topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `company_id` int(11) NOT NULL default '0',
  `customer_id` int(11) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `completed_at` datetime default NULL,
  `critical_count` int(11) default '0',
  `normal_count` int(11) default '0',
  `low_count` int(11) default '0',
  `description` text,
  `create_forum` tinyint(1) default '1',
  `open_tasks` int(11) default NULL,
  `total_tasks` int(11) default NULL,
  `total_milestones` int(11) default NULL,
  `open_milestones` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `projects_company_id_index` (`company_id`),
  KEY `projects_customer_id_index` (`customer_id`),
  KEY `projects_completed_at_customer_id_name_index` (`completed_at`,`customer_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE IF NOT EXISTS `project_files` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) NOT NULL default '0',
  `project_id` int(11) NOT NULL default '0',
  `customer_id` int(11) NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `binary_id` int(11) NOT NULL default '0',
  `file_type` int(11) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `filename` varchar(200) NOT NULL default '',
  `thumbnail_id` int(11) default NULL,
  `file_size` int(11) default NULL,
  `task_id` int(11) default NULL,
  `mime_type` varchar(255) default 'application/octet-stream',
  `project_folder_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `project_files_company_id_index` (`company_id`),
  KEY `index_project_files_on_project_folder_id` (`project_folder_id`),
  KEY `index_project_files_on_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_folders`
--

CREATE TABLE IF NOT EXISTS `project_folders` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `project_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `company_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_project_folders_on_project_id` (`project_id`),
  KEY `index_project_folders_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `project_permissions`
--

CREATE TABLE IF NOT EXISTS `project_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `can_comment` tinyint(1) default '0',
  `can_work` tinyint(1) default '0',
  `can_report` tinyint(1) default '0',
  `can_create` tinyint(1) default '0',
  `can_edit` tinyint(1) default '0',
  `can_reassign` tinyint(1) default '0',
  `can_prioritize` tinyint(1) default '0',
  `can_close` tinyint(1) default '0',
  `can_grant` tinyint(1) default '0',
  `can_milestone` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `project_permissions_user_id_index` (`user_id`),
  KEY `project_permissions_project_id_user_id_index` (`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scm_changesets`
--

CREATE TABLE IF NOT EXISTS `scm_changesets` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `scm_project_id` int(11) default NULL,
  `author` varchar(255) default NULL,
  `changeset_num` int(11) default NULL,
  `commit_date` datetime default NULL,
  `changeset_rev` varchar(255) default NULL,
  `message` text,
  PRIMARY KEY  (`id`),
  KEY `scm_changesets_commit_date_index` (`commit_date`),
  KEY `scm_changesets_author_index` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scm_files`
--

CREATE TABLE IF NOT EXISTS `scm_files` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) default NULL,
  `company_id` int(11) default NULL,
  `name` text,
  `path` text,
  `state` varchar(255) default NULL,
  `commit_date` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `scm_files_project_id_index` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scm_projects`
--

CREATE TABLE IF NOT EXISTS `scm_projects` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) default NULL,
  `company_id` int(11) default NULL,
  `scm_type` varchar(255) default NULL,
  `last_commit_date` datetime default NULL,
  `last_update` datetime default NULL,
  `last_checkout` datetime default NULL,
  `module` text,
  `location` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scm_revisions`
--

CREATE TABLE IF NOT EXISTS `scm_revisions` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `scm_changeset_id` int(11) default NULL,
  `scm_file_id` int(11) default NULL,
  `revision` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `commit_date` datetime default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `scm_revisions_scm_changeset_id_index` (`scm_changeset_id`),
  KEY `scm_revisions_scm_file_id_index` (`scm_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(32) default NULL,
  `data` longtext,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `sessions_session_id_index` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sheets`
--

CREATE TABLE IF NOT EXISTS `sheets` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `task_id` int(11) NOT NULL default '0',
  `project_id` int(11) NOT NULL default '0',
  `created_at` datetime default NULL,
  `body` text,
  `paused_at` datetime default NULL,
  `paused_duration` int(11) default '0',
  PRIMARY KEY  (`id`),
  KEY `index_sheets_on_task_id` (`task_id`),
  KEY `index_sheets_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shouts`
--

CREATE TABLE IF NOT EXISTS `shouts` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `body` text,
  `shout_channel_id` int(11) default NULL,
  `message_type` int(11) default '0',
  `nick` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `shouts_created_at_index` (`created_at`),
  KEY `index_shouts_on_shout_channel_id` (`shout_channel_id`),
  KEY `shouts_company_id_index` (`company_id`,`shout_channel_id`,`message_type`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shout_channels`
--

CREATE TABLE IF NOT EXISTS `shout_channels` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `public` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_shout_channels_on_company_id` (`company_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shout_channel_subscriptions`
--

CREATE TABLE IF NOT EXISTS `shout_channel_subscriptions` (
  `id` int(11) NOT NULL auto_increment,
  `shout_channel_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_shout_channel_subscriptions_on_shout_channel_id` (`shout_channel_id`),
  KEY `index_shout_channel_subscriptions_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_tags_on_company_id_and_name` (`company_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `project_id` int(11) NOT NULL default '0',
  `position` int(11) NOT NULL default '0',
  `created_at` datetime NOT NULL,
  `due_at` datetime default NULL,
  `updated_at` datetime NOT NULL,
  `completed_at` datetime default NULL,
  `duration` int(11) default '1',
  `hidden` int(11) default '0',
  `milestone_id` int(11) default NULL,
  `description` text,
  `company_id` int(11) default NULL,
  `priority` int(11) default '0',
  `updated_by_id` int(11) default NULL,
  `severity_id` int(11) default '0',
  `type_id` int(11) default '0',
  `task_num` int(11) default '0',
  `status` int(11) default '0',
  `requested_by` varchar(255) default NULL,
  `creator_id` int(11) default NULL,
  `notify_emails` varchar(255) default NULL,
  `repeat` varchar(255) default NULL,
  `hide_until` datetime default NULL,
  `scheduled_at` datetime default NULL,
  `scheduled_duration` int(11) default NULL,
  `scheduled` tinyint(1) default '0',
  `worked_minutes` int(11) default '0',
  `start_at` datetime default NULL,
  `scheduled_start` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `tasks_project_id_index` (`project_id`,`milestone_id`),
  KEY `tasks_company_id_index` (`company_id`),
  KEY `tasks_project_completed_index` (`project_id`,`completed_at`),
  KEY `index_tasks_on_milestone_id` (`milestone_id`),
  KEY `tasks_due_at_idx` (`due_at`),
  KEY `tasks_completed_at_idx` (`completed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `task_owners`
--

CREATE TABLE IF NOT EXISTS `task_owners` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `task_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `task_owners_task_id_user_id_index` (`task_id`,`user_id`),
  KEY `task_owners_user_id_task_id_index` (`user_id`,`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `task_tags`
--

CREATE TABLE IF NOT EXISTS `task_tags` (
  `tag_id` int(11) default NULL,
  `task_id` int(11) default NULL,
  KEY `task_tags_tag_id_task_id_index` (`tag_id`,`task_id`),
  KEY `task_tags_task_id_tag_id_index` (`task_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE IF NOT EXISTS `todos` (
  `id` int(11) NOT NULL auto_increment,
  `task_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `position` int(11) default NULL,
  `creator_id` int(11) default NULL,
  `completed_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `completed_by_user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_todos_on_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) NOT NULL auto_increment,
  `forum_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `hits` int(11) default '0',
  `sticky` int(11) default '0',
  `posts_count` int(11) default '0',
  `replied_at` datetime default NULL,
  `locked` tinyint(1) default '0',
  `replied_by` int(11) default NULL,
  `last_post_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_topics_on_forum_id` (`forum_id`),
  KEY `index_topics_on_sticky_and_replied_at` (`forum_id`,`sticky`,`replied_at`),
  KEY `index_topics_on_forum_id_and_replied_at` (`forum_id`,`replied_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `username` varchar(200) NOT NULL default '',
  `password` varchar(200) NOT NULL default '',
  `company_id` int(11) NOT NULL default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `email` varchar(200) default NULL,
  `last_login_at` datetime default NULL,
  `admin` int(11) default '0',
  `time_zone` varchar(255) default NULL,
  `option_tracktime` int(11) default NULL,
  `option_externalclients` int(11) default NULL,
  `option_tooltips` int(11) default NULL,
  `seen_news_id` int(11) default '0',
  `last_project_id` int(11) default NULL,
  `last_seen_at` datetime default NULL,
  `last_ping_at` datetime default NULL,
  `last_milestone_id` int(11) default NULL,
  `last_filter` int(11) default NULL,
  `date_format` varchar(255) default NULL,
  `time_format` varchar(255) default NULL,
  `send_notifications` int(11) default '1',
  `receive_notifications` int(11) default '1',
  `receive_own_notifications` int(11) default '0',
  `uuid` varchar(255) default NULL,
  `seen_welcome` int(11) default '0',
  `locale` varchar(255) default 'en_US',
  `duration_format` int(11) default '0',
  `workday_duration` int(11) default '480',
  `posts_count` int(11) default '0',
  `newsletter` int(11) default '1',
  `option_avatars` int(11) default '1',
  `autologin` varchar(255) default NULL,
  `remember_until` datetime default NULL,
  `option_floating_chat` tinyint(1) default '1',
  `days_per_week` int(11) default '5',
  `enable_sounds` tinyint(1) default '1',
  `create_projects` tinyint(1) default '1',
  `show_type_icons` tinyint(1) default '1',
  PRIMARY KEY  (`id`),
  KEY `users_uuid_index` (`uuid`),
  KEY `users_username_index` (`username`),
  KEY `index_users_on_last_seen_at` (`last_seen_at`),
  KEY `index_users_on_autologin` (`autologin`),
  KEY `users_company_id_index` (`company_id`,`name`),
  KEY `users_last_ping_at_idx` (`last_ping_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE IF NOT EXISTS `views` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `company_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `shared` int(11) default '0',
  `auto_group` int(11) default '0',
  `filter_customer_id` int(11) default '0',
  `filter_project_id` int(11) default '0',
  `filter_milestone_id` int(11) default '0',
  `filter_user_id` int(11) default '0',
  `filter_tags` varchar(255) default '',
  `filter_status` int(11) default '0',
  `filter_type_id` int(11) default '0',
  `hide_deferred` int(11) default NULL,
  `sort` int(11) default '0',
  `filter_severity` int(11) default '-10',
  `filter_priority` int(11) default '-10',
  `hide_dependencies` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `views_company_id_shared_name_index` (`company_id`,`shared`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `name` varchar(255) default NULL,
  `widget_type` int(11) default '0',
  `number` int(11) default '5',
  `mine` tinyint(1) default NULL,
  `order_by` varchar(255) default NULL,
  `group_by` varchar(255) default NULL,
  `filter_by` varchar(255) default NULL,
  `collapsed` tinyint(1) default '0',
  `column` int(11) default '0',
  `position` int(11) default '0',
  `configured` tinyint(1) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `gadget_url` text,
  PRIMARY KEY  (`id`),
  KEY `widgets_user_id_column_position_index` (`user_id`,`column`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_pages`
--

CREATE TABLE IF NOT EXISTS `wiki_pages` (
  `id` int(11) NOT NULL auto_increment,
  `company_id` int(11) default NULL,
  `project_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `name` varchar(255) default NULL,
  `locked_at` datetime default NULL,
  `locked_by` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `wiki_pages_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_references`
--

CREATE TABLE IF NOT EXISTS `wiki_references` (
  `id` int(11) NOT NULL auto_increment,
  `wiki_page_id` int(11) default NULL,
  `referenced_name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_wiki_references_on_wiki_page_id` (`wiki_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_revisions`
--

CREATE TABLE IF NOT EXISTS `wiki_revisions` (
  `id` int(11) NOT NULL auto_increment,
  `wiki_page_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `body` text,
  `user_id` int(11) default NULL,
  `change` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `wiki_revisions_wiki_page_id_index` (`wiki_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `work_logs`
--

CREATE TABLE IF NOT EXISTS `work_logs` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `task_id` int(11) default NULL,
  `project_id` int(11) NOT NULL default '0',
  `company_id` int(11) NOT NULL default '0',
  `customer_id` int(11) NOT NULL default '0',
  `started_at` datetime NOT NULL,
  `duration` int(11) NOT NULL default '0',
  `body` text,
  `log_type` int(11) default '0',
  `scm_changeset_id` int(11) default NULL,
  `paused_duration` int(11) default '0',
  `comment` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `work_logs_user_id_index` (`user_id`,`task_id`),
  KEY `work_logs_task_id_index` (`task_id`,`log_type`),
  KEY `work_logs_company_id_index` (`company_id`),
  KEY `work_logs_project_id_index` (`project_id`),
  KEY `work_logs_customer_id_index` (`customer_id`),
  KEY `work_logs_company_project_index` (`company_id`,`project_id`,`log_type`,`started_at`),
  KEY `work_logs_user_id_started_at_index` (`user_id`,`started_at`),
  KEY `work_logs_duration_idx` (`duration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
