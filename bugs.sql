-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 16, 2021 at 07:05 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bugs`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE IF NOT EXISTS `attachments` (
  `attach_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `creation_ts` datetime NOT NULL,
  `modification_time` datetime NOT NULL,
  `description` tinytext NOT NULL,
  `mimetype` tinytext NOT NULL,
  `ispatch` tinyint(4) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `submitter_id` mediumint(9) NOT NULL,
  `isobsolete` tinyint(4) NOT NULL DEFAULT '0',
  `isprivate` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `attachments_bug_id_idx` (`bug_id`),
  KEY `attachments_creation_ts_idx` (`creation_ts`),
  KEY `attachments_modification_time_idx` (`modification_time`),
  KEY `attachments_submitter_id_idx` (`submitter_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attach_data`
--

DROP TABLE IF EXISTS `attach_data`;
CREATE TABLE IF NOT EXISTS `attach_data` (
  `id` mediumint(9) NOT NULL,
  `thedata` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AVG_ROW_LENGTH=1000000 DEFAULT CHARSET=utf8 MAX_ROWS=100000;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE IF NOT EXISTS `audit_log` (
  `user_id` mediumint(9) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `object_id` int(11) NOT NULL,
  `field` varchar(64) NOT NULL,
  `removed` mediumtext,
  `added` mediumtext,
  `at_time` datetime NOT NULL,
  KEY `audit_log_class_idx` (`class`,`at_time`),
  KEY `fk_audit_log_user_id_profiles_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`user_id`, `class`, `object_id`, `field`, `removed`, `added`, `at_time`) VALUES
(NULL, 'Bugzilla::Field', 1, '__create__', NULL, 'bug_id', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 2, '__create__', NULL, 'short_desc', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 3, '__create__', NULL, 'classification', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 4, '__create__', NULL, 'product', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 5, '__create__', NULL, 'version', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 6, '__create__', NULL, 'rep_platform', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 7, '__create__', NULL, 'bug_file_loc', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 8, '__create__', NULL, 'op_sys', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 9, '__create__', NULL, 'bug_status', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 10, '__create__', NULL, 'status_whiteboard', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 11, '__create__', NULL, 'keywords', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 12, '__create__', NULL, 'resolution', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 13, '__create__', NULL, 'bug_severity', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 14, '__create__', NULL, 'priority', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 15, '__create__', NULL, 'component', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 16, '__create__', NULL, 'assigned_to', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 17, '__create__', NULL, 'reporter', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 18, '__create__', NULL, 'qa_contact', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 19, '__create__', NULL, 'assigned_to_realname', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 20, '__create__', NULL, 'reporter_realname', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 21, '__create__', NULL, 'qa_contact_realname', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 22, '__create__', NULL, 'cc', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 23, '__create__', NULL, 'dependson', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 24, '__create__', NULL, 'blocked', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 25, '__create__', NULL, 'attachments.description', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 26, '__create__', NULL, 'attachments.filename', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 27, '__create__', NULL, 'attachments.mimetype', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 28, '__create__', NULL, 'attachments.ispatch', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 29, '__create__', NULL, 'attachments.isobsolete', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 30, '__create__', NULL, 'attachments.isprivate', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 31, '__create__', NULL, 'attachments.submitter', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 32, '__create__', NULL, 'target_milestone', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 33, '__create__', NULL, 'creation_ts', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 34, '__create__', NULL, 'delta_ts', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 35, '__create__', NULL, 'longdesc', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 36, '__create__', NULL, 'longdescs.isprivate', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 37, '__create__', NULL, 'longdescs.count', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 38, '__create__', NULL, 'alias', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 39, '__create__', NULL, 'everconfirmed', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 40, '__create__', NULL, 'reporter_accessible', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 41, '__create__', NULL, 'cclist_accessible', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 42, '__create__', NULL, 'bug_group', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 43, '__create__', NULL, 'estimated_time', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 44, '__create__', NULL, 'remaining_time', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 45, '__create__', NULL, 'deadline', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 46, '__create__', NULL, 'commenter', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 47, '__create__', NULL, 'flagtypes.name', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 48, '__create__', NULL, 'requestees.login_name', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 49, '__create__', NULL, 'setters.login_name', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 50, '__create__', NULL, 'work_time', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 51, '__create__', NULL, 'percentage_complete', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 52, '__create__', NULL, 'content', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 53, '__create__', NULL, 'attach_data.thedata', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 54, '__create__', NULL, 'owner_idle_time', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 55, '__create__', NULL, 'see_also', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 56, '__create__', NULL, 'tag', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 57, '__create__', NULL, 'last_visit_ts', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 58, '__create__', NULL, 'comment_tag', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Field', 59, '__create__', NULL, 'days_elapsed', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Classification', 1, '__create__', NULL, 'Unclassified', '2021-11-28 21:22:47'),
(NULL, 'Bugzilla::Group', 1, '__create__', NULL, 'admin', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 2, '__create__', NULL, 'tweakparams', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 3, '__create__', NULL, 'editusers', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 4, '__create__', NULL, 'creategroups', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 5, '__create__', NULL, 'editclassifications', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 6, '__create__', NULL, 'editcomponents', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 7, '__create__', NULL, 'editkeywords', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 8, '__create__', NULL, 'editbugs', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 9, '__create__', NULL, 'canconfirm', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 10, '__create__', NULL, 'bz_canusewhineatothers', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 11, '__create__', NULL, 'bz_canusewhines', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 12, '__create__', NULL, 'bz_sudoers', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 13, '__create__', NULL, 'bz_sudo_protect', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::Group', 14, '__create__', NULL, 'bz_quip_moderators', '2021-11-28 21:22:52'),
(NULL, 'Bugzilla::User', 1, '__create__', NULL, 'loclocloc22032000@gmail.com', '2021-11-28 21:23:51'),
(NULL, 'Bugzilla::Product', 1, '__create__', NULL, 'TestProduct', '2021-11-28 21:23:51'),
(NULL, 'Bugzilla::Version', 1, '__create__', NULL, 'unspecified', '2021-11-28 21:23:51'),
(NULL, 'Bugzilla::Milestone', 1, '__create__', NULL, '---', '2021-11-28 21:23:51'),
(NULL, 'Bugzilla::Component', 1, '__create__', NULL, 'TestComponent', '2021-11-28 21:23:51'),
(1, 'Bugzilla::Product', 2, '__create__', NULL, 'Đồ án chuyên ngành', '2021-11-29 13:12:47'),
(1, 'Bugzilla::Version', 2, '__create__', NULL, 'unspecified', '2021-11-29 13:12:47'),
(1, 'Bugzilla::Milestone', 2, '__create__', NULL, '---', '2021-11-29 13:12:47'),
(1, 'Bugzilla::Component', 2, '__create__', NULL, 'Model', '2021-11-29 13:12:47'),
(1, 'Bugzilla::Component', 3, '__create__', NULL, 'control', '2021-11-29 13:13:20'),
(1, 'Bugzilla::Component', 4, '__create__', NULL, 'View', '2021-11-29 13:13:46'),
(1, 'Bugzilla::User', 2, '__create__', NULL, 'user1@gmail.com', '2021-11-29 13:16:01'),
(1, 'Bugzilla::Group', 15, '__create__', NULL, 'viewonly', '2021-11-29 13:23:34'),
(1, 'Bugzilla::User', 3, '__create__', NULL, 'user2@gmail.com', '2021-11-29 13:24:23'),
(1, 'Bugzilla::User', 4, '__create__', NULL, 'user3@gmail.com', '2021-11-29 13:25:12'),
(1, 'Bugzilla::User', 2, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 13:39:01'),
(1, 'Bugzilla::User', 2, 'realname', '', 'User1', '2021-11-29 13:39:01'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 13:39:31'),
(1, 'Bugzilla::User', 3, 'realname', '', 'User2', '2021-11-29 13:39:31'),
(1, 'Bugzilla::Bug', 3, '__remove__', '3', NULL, '2021-11-29 14:00:13'),
(1, 'Bugzilla::Component', 4, '__remove__', 'View', NULL, '2021-11-29 14:00:13'),
(1, 'Bugzilla::User', 3, 'disable_mail', '0', '1', '2021-11-29 14:03:17'),
(1, 'Bugzilla::User', 3, 'disabledtext', '', 'Khong the login', '2021-11-29 14:03:17'),
(1, 'Bugzilla::User', 3, 'is_enabled', '1', '0', '2021-11-29 14:03:17'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 14:03:17'),
(1, 'Bugzilla::User', 3, 'is_enabled', '0', '1', '2021-11-29 14:50:55'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 14:50:55'),
(1, 'Bugzilla::User', 3, 'disabledtext', 'Khong the login', '', '2021-11-29 14:50:55'),
(1, 'Bugzilla::User', 3, 'disable_mail', '1', '0', '2021-11-29 14:54:05'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 14:54:05'),
(1, 'Bugzilla::Group', 16, '__create__', NULL, 'thembug', '2021-11-29 14:55:50'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 14:57:55'),
(1, 'Bugzilla::User', 2, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 14:58:22'),
(1, 'Bugzilla::Group', 15, 'isactive', '1', '0', '2021-11-29 15:00:25'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 15:01:46'),
(1, 'Bugzilla::Product', 2, 'isactive', '1', '0', '2021-11-29 15:05:29'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 15:06:51'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 15:08:20'),
(1, 'Bugzilla::User', 3, 'cryptpassword', NULL, 'hashed_with_SHA-256', '2021-11-29 15:09:04'),
(1, 'Bugzilla::User', 5, '__create__', NULL, 'assigneebugzilla@gmail.com', '2021-12-07 09:47:27'),
(1, 'Bugzilla::Group', 17, '__create__', NULL, 'groupViewBug_GIT', '2021-12-07 09:55:35'),
(1, 'Bugzilla::Group', 18, '__create__', NULL, 'Nam Định', '2021-12-07 10:02:01'),
(1, 'Bugzilla::Product', 3, '__create__', NULL, 'Đồ án thầy Bằng', '2021-12-12 13:18:40'),
(1, 'Bugzilla::Version', 3, '__create__', NULL, 'unspecified', '2021-12-12 13:18:40'),
(1, 'Bugzilla::Milestone', 3, '__create__', NULL, '---', '2021-12-12 13:18:40'),
(1, 'Bugzilla::Component', 4, '__create__', NULL, 'Model', '2021-12-12 13:18:40'),
(1, 'Bugzilla::Component', 5, '__create__', NULL, 'controller', '2021-12-12 13:19:16'),
(1, 'Bugzilla::Component', 6, '__create__', NULL, 'Admin', '2021-12-12 13:19:47'),
(1, 'Bugzilla::Component', 7, '__create__', NULL, 'Lỗi tổng', '2021-12-12 13:24:59'),
(1, 'Bugzilla::Product', 4, '__create__', NULL, 'Đồ án phần mềm nguồn mở', '2021-12-16 10:37:10'),
(1, 'Bugzilla::Version', 4, '__create__', NULL, 'unspecified', '2021-12-16 10:37:10'),
(1, 'Bugzilla::Milestone', 4, '__create__', NULL, '---', '2021-12-16 10:37:10'),
(1, 'Bugzilla::Component', 8, '__create__', NULL, 'Model', '2021-12-16 10:37:10'),
(1, 'Bugzilla::Bug', 7, '__remove__', '7', NULL, '2021-12-16 10:44:31'),
(1, 'Bugzilla::Bug', 8, '__remove__', '8', NULL, '2021-12-16 10:44:31'),
(1, 'Bugzilla::Bug', 9, '__remove__', '9', NULL, '2021-12-16 10:44:31'),
(1, 'Bugzilla::Bug', 10, '__remove__', '10', NULL, '2021-12-16 10:44:31'),
(1, 'Bugzilla::Bug', 11, '__remove__', '11', NULL, '2021-12-16 10:44:31'),
(1, 'Bugzilla::Product', 3, '__remove__', 'Đồ án thầy Bằng', NULL, '2021-12-16 10:44:31'),
(1, 'Bugzilla::Bug', 1, '__remove__', '1', NULL, '2021-12-16 10:44:38'),
(1, 'Bugzilla::Bug', 2, '__remove__', '2', NULL, '2021-12-16 10:44:38'),
(1, 'Bugzilla::Bug', 4, '__remove__', '4', NULL, '2021-12-16 10:44:38'),
(1, 'Bugzilla::Product', 2, '__remove__', 'Đồ án chuyên ngành', NULL, '2021-12-16 10:44:38'),
(1, 'Bugzilla::Component', 9, '__create__', NULL, 'controllers', '2021-12-16 10:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
CREATE TABLE IF NOT EXISTS `bugs` (
  `bug_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `assigned_to` mediumint(9) NOT NULL,
  `bug_file_loc` mediumtext NOT NULL,
  `bug_severity` varchar(64) NOT NULL,
  `bug_status` varchar(64) NOT NULL,
  `creation_ts` datetime DEFAULT NULL,
  `delta_ts` datetime NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `op_sys` varchar(64) NOT NULL,
  `priority` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `rep_platform` varchar(64) NOT NULL,
  `reporter` mediumint(9) NOT NULL,
  `version` varchar(64) NOT NULL,
  `component_id` mediumint(9) NOT NULL,
  `resolution` varchar(64) NOT NULL DEFAULT '',
  `target_milestone` varchar(64) NOT NULL DEFAULT '---',
  `qa_contact` mediumint(9) DEFAULT NULL,
  `status_whiteboard` mediumtext NOT NULL,
  `lastdiffed` datetime DEFAULT NULL,
  `everconfirmed` tinyint(4) NOT NULL,
  `reporter_accessible` tinyint(4) NOT NULL DEFAULT '1',
  `cclist_accessible` tinyint(4) NOT NULL DEFAULT '1',
  `estimated_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `remaining_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`bug_id`),
  KEY `bugs_assigned_to_idx` (`assigned_to`),
  KEY `bugs_creation_ts_idx` (`creation_ts`),
  KEY `bugs_delta_ts_idx` (`delta_ts`),
  KEY `bugs_bug_severity_idx` (`bug_severity`),
  KEY `bugs_bug_status_idx` (`bug_status`),
  KEY `bugs_op_sys_idx` (`op_sys`),
  KEY `bugs_priority_idx` (`priority`),
  KEY `bugs_product_id_idx` (`product_id`),
  KEY `bugs_reporter_idx` (`reporter`),
  KEY `bugs_version_idx` (`version`),
  KEY `bugs_component_id_idx` (`component_id`),
  KEY `bugs_resolution_idx` (`resolution`),
  KEY `bugs_target_milestone_idx` (`target_milestone`),
  KEY `bugs_qa_contact_idx` (`qa_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bugs`
--

INSERT INTO `bugs` (`bug_id`, `assigned_to`, `bug_file_loc`, `bug_severity`, `bug_status`, `creation_ts`, `delta_ts`, `short_desc`, `op_sys`, `priority`, `product_id`, `rep_platform`, `reporter`, `version`, `component_id`, `resolution`, `target_milestone`, `qa_contact`, `status_whiteboard`, `lastdiffed`, `everconfirmed`, `reporter_accessible`, `cclist_accessible`, `estimated_time`, `remaining_time`, `deadline`) VALUES
(5, 5, '', 'enhancement', 'CONFIRMED', '2021-12-07 09:49:19', '2021-12-07 09:49:19', 'bug 2', 'Windows', '---', 1, 'PC', 1, 'unspecified', 1, '', '---', NULL, '', '2021-12-07 09:49:20', 1, 1, 1, '0.00', '0.00', NULL),
(6, 5, '', 'enhancement', 'CONFIRMED', '2021-12-07 10:09:25', '2021-12-07 10:09:25', 'bug3', 'Windows', '---', 1, 'PC', 1, 'unspecified', 1, '', '---', NULL, '', '2021-12-07 10:09:25', 1, 1, 1, '0.00', '0.00', NULL),
(12, 1, '', 'enhancement', 'RESOLVED', '2021-12-16 10:38:46', '2021-12-16 10:45:43', 'Không thể tìm kiếm sách', 'Windows', '---', 4, 'PC', 1, 'unspecified', 8, 'FIXED', '---', NULL, '', '2021-12-16 10:45:43', 1, 1, 1, '1.00', '0.00', NULL),
(13, 2, '', 'enhancement', 'RESOLVED', '2021-12-16 10:58:44', '2021-12-16 12:49:41', 'Không thể lọc sách', 'Windows', '---', 4, 'PC', 2, 'unspecified', 9, 'FIXED', '---', NULL, '', '2021-12-16 12:49:41', 1, 1, 1, '1.00', '0.00', '2021-12-16 00:00:00'),
(14, 2, '', 'enhancement', 'RESOLVED', '2021-12-16 11:34:05', '2021-12-16 11:34:54', 'Không lấy được tên nhà xuất bản và tên loại', 'Windows', '---', 4, 'PC', 1, 'unspecified', 9, 'FIXED', '---', NULL, '', '2021-12-16 11:34:54', 1, 1, 1, '1.00', '0.00', NULL),
(15, 2, '', 'enhancement', 'RESOLVED', '2021-12-16 12:34:46', '2021-12-16 12:50:14', 'sai đường dẫn đến database', 'Windows', '---', 4, 'PC', 2, 'unspecified', 9, 'FIXED', '---', NULL, '', '2021-12-16 12:50:14', 1, 1, 1, '0.00', '0.00', NULL),
(16, 2, '', 'enhancement', 'RESOLVED', '2021-12-16 12:45:19', '2021-12-16 12:48:55', 'Loại sách không hiển thị được lên from add sách', 'Windows', '---', 4, 'PC', 1, 'unspecified', 9, 'FIXED', '---', NULL, '', '2021-12-16 12:48:55', 1, 1, 1, '0.00', '0.00', NULL),
(17, 1, '', 'enhancement', 'RESOLVED', '2021-12-16 12:52:28', '2021-12-16 12:56:33', 'Không thêm được hình ảnh', 'Windows', '---', 4, 'PC', 1, 'unspecified', 8, 'FIXED', '---', NULL, '', '2021-12-16 12:56:33', 1, 1, 1, '0.00', '0.00', NULL),
(18, 2, '', 'enhancement', 'RESOLVED', '2021-12-16 13:01:59', '2021-12-16 13:02:10', 'Không ánh xạ được đối tượng muốn sửa vào form sửa', 'Windows', '---', 4, 'PC', 2, 'unspecified', 9, 'FIXED', '---', NULL, '', '2021-12-16 13:02:10', 1, 1, 1, '0.00', '0.00', NULL),
(19, 1, '', 'enhancement', 'RESOLVED', '2021-12-16 13:05:37', '2021-12-16 13:06:02', 'Không sửa được sách', 'Windows', '---', 4, 'PC', 2, 'unspecified', 8, 'FIXED', '---', NULL, '', '2021-12-16 13:06:02', 1, 1, 1, '0.00', '0.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_activity`
--

DROP TABLE IF EXISTS `bugs_activity`;
CREATE TABLE IF NOT EXISTS `bugs_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `attach_id` mediumint(9) DEFAULT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `fieldid` mediumint(9) NOT NULL,
  `added` varchar(255) DEFAULT NULL,
  `removed` varchar(255) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_activity_bug_id_idx` (`bug_id`),
  KEY `bugs_activity_who_idx` (`who`),
  KEY `bugs_activity_bug_when_idx` (`bug_when`),
  KEY `bugs_activity_fieldid_idx` (`fieldid`),
  KEY `bugs_activity_added_idx` (`added`),
  KEY `bugs_activity_removed_idx` (`removed`),
  KEY `fk_bugs_activity_attach_id_attachments_attach_id` (`attach_id`),
  KEY `fk_bugs_activity_comment_id_longdescs_comment_id` (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bugs_activity`
--

INSERT INTO `bugs_activity` (`id`, `bug_id`, `attach_id`, `who`, `bug_when`, `fieldid`, `added`, `removed`, `comment_id`) VALUES
(10, 12, NULL, 1, '2021-12-16 10:45:43', 50, '1.00', '', NULL),
(11, 12, NULL, 1, '2021-12-16 10:45:43', 9, 'RESOLVED', 'CONFIRMED', NULL),
(12, 12, NULL, 1, '2021-12-16 10:45:43', 43, '1.0', '0.00', NULL),
(13, 12, NULL, 1, '2021-12-16 10:45:43', 12, 'FIXED', '', NULL),
(14, 13, NULL, 1, '2021-12-16 11:05:22', 50, '1.00', '', NULL),
(15, 13, NULL, 1, '2021-12-16 11:05:22', 22, 'loclocloc22032000@gmail.com', '', NULL),
(16, 13, NULL, 1, '2021-12-16 11:05:22', 9, 'RESOLVED', 'CONFIRMED', NULL),
(17, 13, NULL, 1, '2021-12-16 11:05:22', 12, 'FIXED', '', NULL),
(18, 13, NULL, 1, '2021-12-16 11:05:22', 43, '1.0', '0.00', NULL),
(19, 13, NULL, 2, '2021-12-16 11:08:18', 12, 'INVALID', 'FIXED', NULL),
(20, 14, NULL, 2, '2021-12-16 11:34:54', 50, '1.00', '', NULL),
(21, 14, NULL, 2, '2021-12-16 11:34:54', 9, 'RESOLVED', 'CONFIRMED', NULL),
(22, 14, NULL, 2, '2021-12-16 11:34:54', 12, 'FIXED', '', NULL),
(23, 14, NULL, 2, '2021-12-16 11:34:54', 43, '1.0', '0.00', NULL),
(24, 15, NULL, 1, '2021-12-16 12:35:41', 9, 'RESOLVED', 'CONFIRMED', NULL),
(25, 15, NULL, 1, '2021-12-16 12:35:41', 12, 'FIXED', '', NULL),
(26, 15, NULL, 1, '2021-12-16 12:35:41', 22, 'loclocloc22032000@gmail.com', '', NULL),
(27, 16, NULL, 1, '2021-12-16 12:47:17', 2, 'Loại sách không hiển thị được lên from add sách', 'Loại sách không hiển thị được lên frontend', NULL),
(28, 16, NULL, 1, '2021-12-16 12:47:17', 9, 'RESOLVED', 'CONFIRMED', NULL),
(29, 16, NULL, 1, '2021-12-16 12:47:17', 12, 'INVALID', '', NULL),
(30, 16, NULL, 2, '2021-12-16 12:48:55', 12, 'FIXED', 'INVALID', NULL),
(31, 13, NULL, 1, '2021-12-16 12:49:41', 12, 'FIXED', 'INVALID', NULL),
(32, 15, NULL, 1, '2021-12-16 12:50:14', 2, 'sai đường dẫn đến database', 'sai đường dãn đến database', NULL),
(33, 17, NULL, 1, '2021-12-16 12:53:48', 9, 'RESOLVED', 'CONFIRMED', NULL),
(34, 17, NULL, 1, '2021-12-16 12:53:48', 12, 'INVALID', '', NULL),
(35, 17, NULL, 2, '2021-12-16 12:56:33', 12, 'FIXED', 'INVALID', NULL),
(36, 17, NULL, 2, '2021-12-16 12:56:33', 22, 'user1@gmail.com', '', NULL),
(37, 18, NULL, 2, '2021-12-16 13:02:10', 9, 'RESOLVED', 'CONFIRMED', NULL),
(38, 18, NULL, 2, '2021-12-16 13:02:10', 12, 'FIXED', '', NULL),
(39, 19, NULL, 1, '2021-12-16 13:06:02', 12, 'FIXED', '', NULL),
(40, 19, NULL, 1, '2021-12-16 13:06:02', 9, 'RESOLVED', 'CONFIRMED', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_aliases`
--

DROP TABLE IF EXISTS `bugs_aliases`;
CREATE TABLE IF NOT EXISTS `bugs_aliases` (
  `alias` varchar(40) NOT NULL,
  `bug_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `bugs_aliases_alias_idx` (`alias`),
  KEY `bugs_aliases_bug_id_idx` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_fulltext`
--

DROP TABLE IF EXISTS `bugs_fulltext`;
CREATE TABLE IF NOT EXISTS `bugs_fulltext` (
  `bug_id` mediumint(9) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `comments` mediumtext,
  `comments_noprivate` mediumtext,
  PRIMARY KEY (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bugs_fulltext`
--

INSERT INTO `bugs_fulltext` (`bug_id`, `short_desc`, `comments`, `comments_noprivate`) VALUES
(5, 'bug 2', '123', '123'),
(6, 'bug3', 'bug3', 'bug3'),
(12, 'Không thể tìm kiếm sách', 'không hiển thị sách cần tìm kiếm dù đã nhập đúng tên sách\nHướng giải quyết:\nSửa lại câu truy vấn', 'không hiển thị sách cần tìm kiếm dù đã nhập đúng tên sách\nHướng giải quyết:\nSửa lại câu truy vấn'),
(13, 'Không thể lọc sách', 'Chức năng lọc sách theo nhà xuất bản và loại không hoạt động\nNgô Thanh Danh đưa ra hướng giải quyết:\nSửa câu truy vấn trong model: Kiểm tra tên bảng và điều kiện để lấy\nNguyễn Tấn Lộc đưa ra hướng giải quyết:\nKiểm tra luồng xử lý của controllers: Giá trị truyền vào của action đã đúng hay chưa? Điều kiện if trong hàm loc đã đúng hay chưa?', 'Chức năng lọc sách theo nhà xuất bản và loại không hoạt động\nNgô Thanh Danh đưa ra hướng giải quyết:\nSửa câu truy vấn trong model: Kiểm tra tên bảng và điều kiện để lấy\nNguyễn Tấn Lộc đưa ra hướng giải quyết:\nKiểm tra luồng xử lý của controllers: Giá trị truyền vào của action đã đúng hay chưa? Điều kiện if trong hàm loc đã đúng hay chưa?'),
(14, 'Không lấy được tên nhà xuất bản và tên loại', 'Viết thêm hàm xuất tên nhà xuất bản và loại trong model sau đó truyền qua controller\n', 'Viết thêm hàm xuất tên nhà xuất bản và loại trong model sau đó truyền qua controller\n'),
(15, 'sai đường dẫn đến database', '\nsửa lại đường dẫn đến database', '\nsửa lại đường dẫn đến database'),
(16, 'Loại sách không hiển thị được lên from add sách', '\nLộc đề xuất cách sửa:\nKiểm tra câu truy vấn\nDanh đề ra hướng giải quyết:\nLỗi ở luồng xử lý controllers. Hãy kiểm tra giá trị action', '\nLộc đề xuất cách sửa:\nKiểm tra câu truy vấn\nDanh đề ra hướng giải quyết:\nLỗi ở luồng xử lý controllers. Hãy kiểm tra giá trị action'),
(17, 'Không thêm được hình ảnh', '\nLộc đề xuất hướng giải quyết:\nKiểm tra câu truy vấn vào database ở model, xem lại tên các trường ở database đã được đặt đúng hay chưa?\nDanh đề xuất hướng giải quyết:\nViết thêm 1 hàm chuyển hình vào file muốn lưu trong code', '\nLộc đề xuất hướng giải quyết:\nKiểm tra câu truy vấn vào database ở model, xem lại tên các trường ở database đã được đặt đúng hay chưa?\nDanh đề xuất hướng giải quyết:\nViết thêm 1 hàm chuyển hình vào file muốn lưu trong code'),
(18, 'Không ánh xạ được đối tượng muốn sửa vào form sửa', 'Danh đề xuất cách sửa:\nSửa lại biến id để lấy đúng trường giá trị', 'Danh đề xuất cách sửa:\nSửa lại biến id để lấy đúng trường giá trị'),
(19, 'Không sửa được sách', 'Danh đề ra hướng giải quyết: \nSửa lại câu truy vấn WHERE đối tượng phải lấy đúng id đối tượng', 'Danh đề ra hướng giải quyết: \nSửa lại câu truy vấn WHERE đối tượng phải lấy đúng id đối tượng');

-- --------------------------------------------------------

--
-- Table structure for table `bug_group_map`
--

DROP TABLE IF EXISTS `bug_group_map`;
CREATE TABLE IF NOT EXISTS `bug_group_map` (
  `bug_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `bug_group_map_bug_id_idx` (`bug_id`,`group_id`),
  KEY `bug_group_map_group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bug_see_also`
--

DROP TABLE IF EXISTS `bug_see_also`;
CREATE TABLE IF NOT EXISTS `bug_see_also` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `value` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_see_also_bug_id_idx` (`bug_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bug_severity`
--

DROP TABLE IF EXISTS `bug_severity`;
CREATE TABLE IF NOT EXISTS `bug_severity` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_severity_value_idx` (`value`),
  KEY `bug_severity_sortkey_idx` (`sortkey`,`value`),
  KEY `bug_severity_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bug_severity`
--

INSERT INTO `bug_severity` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'blocker', 100, 1, NULL),
(2, 'critical', 200, 1, NULL),
(3, 'major', 300, 1, NULL),
(4, 'normal', 400, 1, NULL),
(5, 'minor', 500, 1, NULL),
(6, 'trivial', 600, 1, NULL),
(7, 'enhancement', 700, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bug_status`
--

DROP TABLE IF EXISTS `bug_status`;
CREATE TABLE IF NOT EXISTS `bug_status` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_status_value_idx` (`value`),
  KEY `bug_status_sortkey_idx` (`sortkey`,`value`),
  KEY `bug_status_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bug_status`
--

INSERT INTO `bug_status` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`, `is_open`) VALUES
(1, 'UNCONFIRMED', 100, 1, NULL, 1),
(2, 'CONFIRMED', 200, 1, NULL, 1),
(3, 'IN_PROGRESS', 300, 1, NULL, 1),
(4, 'RESOLVED', 400, 1, NULL, 0),
(5, 'VERIFIED', 500, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bug_tag`
--

DROP TABLE IF EXISTS `bug_tag`;
CREATE TABLE IF NOT EXISTS `bug_tag` (
  `bug_id` mediumint(9) NOT NULL,
  `tag_id` mediumint(9) NOT NULL,
  UNIQUE KEY `bug_tag_bug_id_idx` (`bug_id`,`tag_id`),
  KEY `fk_bug_tag_tag_id_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bug_user_last_visit`
--

DROP TABLE IF EXISTS `bug_user_last_visit`;
CREATE TABLE IF NOT EXISTS `bug_user_last_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  `last_visit_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_user_last_visit_idx` (`user_id`,`bug_id`),
  KEY `bug_user_last_visit_last_visit_ts_idx` (`last_visit_ts`),
  KEY `fk_bug_user_last_visit_bug_id_bugs_bug_id` (`bug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bug_user_last_visit`
--

INSERT INTO `bug_user_last_visit` (`id`, `user_id`, `bug_id`, `last_visit_ts`) VALUES
(8, 1, 5, '2021-12-13 12:57:16'),
(9, 1, 6, '2021-12-07 10:18:46'),
(16, 1, 12, '2021-12-16 13:40:04'),
(17, 2, 13, '2021-12-16 11:08:50'),
(18, 1, 13, '2021-12-16 13:43:18'),
(19, 1, 14, '2021-12-16 13:43:56'),
(20, 2, 14, '2021-12-16 11:34:54'),
(21, 2, 15, '2021-12-16 12:34:47'),
(22, 1, 15, '2021-12-16 13:44:58'),
(23, 1, 16, '2021-12-16 13:47:17'),
(24, 2, 16, '2021-12-16 12:48:55'),
(25, 1, 17, '2021-12-16 13:47:40'),
(26, 2, 17, '2021-12-16 12:56:33'),
(27, 2, 18, '2021-12-16 13:02:10'),
(28, 2, 19, '2021-12-16 13:05:42'),
(29, 1, 19, '2021-12-16 13:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `bz_schema`
--

DROP TABLE IF EXISTS `bz_schema`;
CREATE TABLE IF NOT EXISTS `bz_schema` (
  `schema_data` longblob NOT NULL,
  `version` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bz_schema`
--

INSERT INTO `bz_schema` (`schema_data`, `version`) VALUES
(0x2456415231203d207b0a20202020202020202020276174746163685f6461746127203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276174746163685f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276174746163686d656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774686564617461272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276174746163686d656e747327203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d6f64696669636174696f6e5f74696d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d696d6574797065272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769737061746368272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766696c656e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277375626d69747465725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769736f62736f6c657465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027697370726976617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f6372656174696f6e5f74735f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f6d6f64696669636174696f6e5f74696d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d6f64696669636174696f6e5f74696d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f7375626d69747465725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277375626d69747465725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202761756469745f6c6f6727203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276f626a6563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202761745f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202761756469745f6c6f675f636c6173735f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202761745f74696d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f67726f75705f6d617027203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f67726f75705f6d61705f6275675f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f67726f75705f6d61705f67726f75705f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f7365655f616c736f27203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7365655f616c736f5f6275675f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f736576657269747927203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f73657665726974795f76616c75655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f73657665726974795f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f73657665726974795f7669736962696c6974795f76616c75655f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f73746174757327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6f70656e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7374617475735f76616c75655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7374617475735f736f72746b65795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7374617475735f7669736962696c6974795f76616c75655f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f74616727203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020277461675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027746167272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7461675f6275675f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277461675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f757365725f6c6173745f766973697427203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f76697369745f7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f757365725f6c6173745f76697369745f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f757365725f6c6173745f76697369745f6c6173745f76697369745f74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f76697369745f7473270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275677327203d3e207b0a20202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202761737369676e65645f746f272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f66696c655f6c6f63272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f7365766572697479272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f737461747573272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202764656c74615f7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202773686f72745f64657363272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276f705f737973272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277072696f72697479272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265706f72746572272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277461726765745f6d696c6573746f6e65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c272d2d2d5c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202771615f636f6e74616374272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277374617475735f7768697465626f617264272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276c617374646966666564272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202765766572636f6e6669726d6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265706f727465725f61636365737369626c65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202763636c6973745f61636365737369626c65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027657374696d617465645f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28372c3229270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202772656d61696e696e675f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28372c3229270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027646561646c696e65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61737369676e65645f746f5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202761737369676e65645f746f270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6372656174696f6e5f74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f64656c74615f74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202764656c74615f7473270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6275675f73657665726974795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7365766572697479270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6275675f7374617475735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f737461747573270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6f705f7379735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f737973270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7072696f726974795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f72697479270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f70726f647563745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7265706f727465725f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277265706f72746572270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f76657273696f6e5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f636f6d706f6e656e745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7265736f6c7574696f6e5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7461726765745f6d696c6573746f6e655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277461726765745f6d696c6573746f6e65270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f71615f636f6e746163745f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202771615f636f6e74616374270a202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020207d2c0a2020202020202020202027627567735f616374697669747927203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276174746163685f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276174746163686d656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027636f6d6d656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276c6f6e676465736373272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f6275675f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f77686f5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f6275675f7768656e5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f6669656c6469645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f61646465645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f72656d6f7665645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027627567735f616c696173657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027616c696173272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228343029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f616c69617365735f6275675f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f616c69617365735f616c6961735f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027616c696173270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027627567735f66756c6c7465787427203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773686f72745f64657363272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e74735f6e6f70726976617465272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f66756c6c746578745f73686f72745f646573635f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773686f72745f64657363270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202746554c4c54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f66756c6c746578745f636f6d6d656e74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e7473270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202746554c4c54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f66756c6c746578745f636f6d6d656e74735f6e6f707269766174655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e74735f6e6f70726976617465270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202746554c4c54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027627a5f736368656d6127203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736368656d615f64617461272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28332c3229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a202020202020202020202763617465676f72795f67726f75705f6d617027203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f72795f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277365726965735f63617465676f72696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f72795f67726f75705f6d61705f63617465676f72795f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f72795f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027636327203d3e207b0a2020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202763635f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202763635f77686f5f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202777686f270a20202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020207d2c0a2020202020202020202027636c617373696669636174696f6e7327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373696669636174696f6e735f6e616d655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027636f6d706f6e656e745f636327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f63635f757365725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027636f6d706f6e656e747327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027696e697469616c6f776e6572272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027696e697469616c7161636f6e74616374272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e74735f70726f647563745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e74735f6e616d655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027646570656e64656e6369657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027626c6f636b6564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64736f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64656e636965735f626c6f636b65645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027626c6f636b6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64736f6e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64656e636965735f646570656e64736f6e5f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64736f6e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276475706c69636174657327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027647570655f6f66272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202764757065272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027656d61696c5f6275675f69676e6f726527203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027656d61696c5f6275675f69676e6f72655f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027656d61696c5f73657474696e6727203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656c6174696f6e73686970272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e74272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027656d61696c5f73657474696e675f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656c6174696f6e73686970272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e74270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276669656c645f7669736962696c69747927203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c645f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c645f7669736962696c6974795f6669656c645f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c645f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276669656c646465667327203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027637573746f6d272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e675f64657363272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c68656164272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276f62736f6c657465272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027656e7465725f627567272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276275676c697374272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f6669656c645f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6669656c645f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027726576657273655f64657363272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6d616e6461746f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6e756d65726963272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f6e616d655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f76616c75655f6669656c645f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6669656c645f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f69735f6d616e6461746f72795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6d616e6461746f7279270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027666c61676578636c7573696f6e7327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027666c61677479706573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027666c61676578636c7573696f6e735f747970655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027666c6167696e636c7573696f6e7327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027666c61677479706573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167696e636c7573696f6e735f747970655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027666c61677327203d3e207b0a2020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027666c61677479706573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027737461747573272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202763686172283129270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276174746163685f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276174746163686d656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276d6f64696669636174696f6e5f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020277365747465725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020277265717565737465655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f7365747465725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277365747465725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f7265717565737465655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277265717565737465655f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f747970655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020207d2c0a2020202020202020202027666c6167747970657327203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228353029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202763635f6c697374272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832303029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277461726765745f74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c27625c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202763686172283129270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f7265717565737461626c65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f726571756573746565626c65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6d756c7469706c696361626c65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f67726f75705f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027726571756573745f67726f75705f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a202020202020202020202767726f75705f636f6e74726f6c5f6d617027203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027656e747279272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d656d626572636f6e74726f6c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f74686572636f6e74726f6c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763616e65646974272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202765646974636f6d706f6e656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276564697462756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763616e636f6e6669726d272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f636f6e74726f6c5f6d61705f70726f647563745f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f636f6e74726f6c5f6d61705f67726f75705f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202767726f75705f67726f75705f6d617027203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d656d6265725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e746f725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f67726f75705f6d61705f6d656d6265725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d656d6265725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e746f725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202767726f75707327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027697362756767726f7570272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202775736572726567657870272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202769636f6e5f75726c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202767726f7570735f6e616d655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a20202020202020202020276b6579776f72646465667327203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f7264646566735f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276b6579776f72647327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f72646964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276b6579776f726464656673272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f7264735f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f72646964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f7264735f6b6579776f726469645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f72646964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f67696e5f6661696c75726527203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769705f61646472272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228343029270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f6661696c7572655f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f67696e636f6f6b69657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6f6b6965272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228313629270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027697061646472272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228343029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c61737475736564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e636f6f6b6965735f6c617374757365645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c61737475736564270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e67646573637327203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027776f726b5f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28372c3229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774686574657874272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027697370726976617465272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027616c72656164795f77726170706564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202765787472615f64617461272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f6275675f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027776f726b5f74696d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f77686f5f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f6275675f7768656e5f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e6764657363735f7461677327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027636f6d6d656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276c6f6e676465736373272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f746167735f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e6764657363735f746167735f616374697669747927203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027636f6d6d656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276c6f6e676465736373272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f746167735f61637469766974795f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e6764657363735f746167735f7765696768747327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027776569676874272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f746167735f776569676874735f7461675f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276d61696c5f73746167696e6727203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d657373616765272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276d696c6573746f6e657327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d696c6573746f6e65735f70726f647563745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276e616d65647175657269657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277175657279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d6564717565726965735f7573657269645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276e616d6564717565726965735f6c696e6b5f696e5f666f6f74657227203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276e616d656471756572696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d6564717565726965735f6c696e6b5f696e5f666f6f7465725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d6564717565726965735f6c696e6b5f696e5f666f6f7465725f7573657269645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276e616d656471756572795f67726f75705f6d617027203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276e616d656471756572696573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f67726f75705f6d61705f6e616d656471756572795f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f67726f75705f6d61705f67726f75705f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276f705f73797327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f7379735f76616c75655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f7379735f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f7379735f7669736962696c6974795f76616c75655f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a20202020202020202020277072696f7269747927203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f726974795f76616c75655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f726974795f736f72746b65795f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f726974795f7669736962696c6974795f76616c75655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f647563747327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373696669636174696f6e5f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202731272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636c617373696669636174696f6e73272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202764656661756c746d696c6573746f6e65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c272d2d2d5c27272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027616c6c6f77735f756e636f6e6669726d6564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f64756374735f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c655f73656172636827203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6c697374272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6973745f6f72646572272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c655f7365617263685f757365725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c655f73657474696e6727203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f6e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202773657474696e67272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f76616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c655f73657474696e675f76616c75655f756e697175655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f6e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c657327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f6e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027637279707470617373776f7264272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722831323829270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277265616c6e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202764697361626c656474657874272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202764697361626c655f6d61696c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276d79627567736c696e6b272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202765787465726e5f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f656e61626c6564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f7365656e5f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f6c6f67696e5f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f6e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f65787465726e5f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202765787465726e5f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c65735f616374697669747927203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f7768656e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6c6476616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e657776616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f61637469766974795f7573657269645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f61637469766974795f70726f66696c65735f7768656e5f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f7768656e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f61637469766974795f6669656c6469645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027717569707327203d3e207b0a2020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202027717569706964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202771756970272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722835313229270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027617070726f766564272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020207d2c0a20202020202020202020277265705f706c6174666f726d27203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d5f76616c75655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d5f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d5f7669736962696c6974795f76616c75655f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277265706f72747327203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020277175657279272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277265706f7274735f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a20202020202020202020277265736f6c7574696f6e27203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e5f76616c75655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e5f736f72746b65795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e5f7669736962696c6974795f76616c75655f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a202020202020202020202773657269657327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202763726561746f72272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277365726965735f63617465676f72696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202773756263617465676f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277365726965735f63617465676f72696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276672657175656e6379272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020277175657279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202769735f7075626c6963272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f63726561746f725f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202763726561746f72270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f63617465676f72795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f7279272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773756263617465676f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a20202020202020202020277365726965735f63617465676f7269657327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f63617465676f726965735f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277365726965735f6461746127203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20277365726965735f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027736572696573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f76616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f646174615f7365726965735f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f64617465270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202773657474696e6727203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202764656661756c745f76616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202769735f656e61626c6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202027737562636c617373272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a202020202020202020202773657474696e675f76616c756527203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202773657474696e67272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f7274696e646578272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f76616c75655f6e765f756e697175655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f76616c75655f6e735f756e697175655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f7274696e646578270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277374617475735f776f726b666c6f7727203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6c645f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276275675f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e65775f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276275675f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027726571756972655f636f6d6d656e74272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277374617475735f776f726b666c6f775f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6c645f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e65775f737461747573270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202774616727203d3e207b0a202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020277461675f757365725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020207d2c0a2020202020202020202027746f6b656e7327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027697373756564617465272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027746f6b656e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228313629270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027746f6b656e74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228313629270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276576656e7464617461272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202027746f6b656e735f7573657269645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6572726f7227203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276572726f725f74696d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276d657373616765272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6572726f725f66756e6369645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276572726f725f74696d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6572726f725f6572726f725f74696d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276572726f725f74696d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6572726f725f6a6f6269645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6578697473746174757327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027737461747573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706c6574696f6e5f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202764656c6574655f6166746572272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f657869747374617475735f66756e6369645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f657869747374617475735f64656c6574655f61667465725f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202764656c6574655f6166746572270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f66756e636d617027203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f66756e636d61705f66756e636e616d655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636e616d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6a6f6227203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027617267272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027756e69716b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027696e736572745f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6166746572272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027677261626265645f756e74696c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020277072696f72697479272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027636f616c65736365272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6a6f625f66756e6369645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027756e69716b6579270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6a6f625f72756e5f61667465725f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6166746572272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6a6f625f636f616c657363655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f616c65736365272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6e6f746527203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276e6f74656b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6e6f74655f6a6f6269645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e6f74656b6579270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a2020202020202020202027757365725f6170695f6b65797327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276170695f6b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20275641524348415228343029270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027564152434841522832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265766f6b6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f75736564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6170695f6b6579735f6170695f6b65795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276170695f6b6579270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6170695f6b6579735f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027757365725f67726f75705f6d617027203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973626c657373272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f67726f75705f6d61705f757365725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973626c657373270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202776657273696f6e7327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e735f70726f647563745f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a2020202020202020202027776174636827203d3e207b0a2020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202777617463686572272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202777617463686564272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202777617463685f776174636865725f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777617463686572272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777617463686564270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202777617463685f776174636865645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202777617463686564270a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020207d2c0a20202020202020202020277768696e655f6576656e747327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f776e65725f757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277375626a656374272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722831323829270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027626f6479272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c69666e6f62756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277768696e655f7175657269657327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277768696e655f6576656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202771756572795f6e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6e656d61696c706572627567272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277469746c65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722831323829270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277768696e655f717565726965735f6576656e7469645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277768696e655f7363686564756c657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277768696e655f6576656e7473272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f646179272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6e657874272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c746f272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c746f5f74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277768696e655f7363686564756c65735f72756e5f6e6578745f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6e657874270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277768696e655f7363686564756c65735f6576656e7469645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d0a20202020202020207d3b0a, '3.00');

-- --------------------------------------------------------

--
-- Table structure for table `category_group_map`
--

DROP TABLE IF EXISTS `category_group_map`;
CREATE TABLE IF NOT EXISTS `category_group_map` (
  `category_id` smallint(6) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `category_group_map_category_id_idx` (`category_id`,`group_id`),
  KEY `fk_category_group_map_group_id_groups_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cc`
--

DROP TABLE IF EXISTS `cc`;
CREATE TABLE IF NOT EXISTS `cc` (
  `bug_id` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  UNIQUE KEY `cc_bug_id_idx` (`bug_id`,`who`),
  KEY `cc_who_idx` (`who`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cc`
--

INSERT INTO `cc` (`bug_id`, `who`) VALUES
(13, 1),
(15, 1),
(17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `classifications`
--

DROP TABLE IF EXISTS `classifications`;
CREATE TABLE IF NOT EXISTS `classifications` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` mediumtext,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `classifications_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classifications`
--

INSERT INTO `classifications` (`id`, `name`, `description`, `sortkey`) VALUES
(1, 'Unclassified', 'Not assigned to any classification', 0);

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
CREATE TABLE IF NOT EXISTS `components` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `initialowner` mediumint(9) NOT NULL,
  `initialqacontact` mediumint(9) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_id_idx` (`product_id`,`name`),
  KEY `components_name_idx` (`name`),
  KEY `fk_components_initialqacontact_profiles_userid` (`initialqacontact`),
  KEY `fk_components_initialowner_profiles_userid` (`initialowner`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `name`, `product_id`, `initialowner`, `initialqacontact`, `description`, `isactive`) VALUES
(1, 'TestComponent', 1, 1, NULL, 'This is a test component in the test product database. This ought to be blown away and replaced with real stuff in a finished installation of Bugzilla.', 1),
(8, 'Model', 4, 1, NULL, 'Các hàm xử lý', 1),
(9, 'controllers', 4, 2, NULL, 'Các hàm điều khiển hoạt động của trang web', 1);

-- --------------------------------------------------------

--
-- Table structure for table `component_cc`
--

DROP TABLE IF EXISTS `component_cc`;
CREATE TABLE IF NOT EXISTS `component_cc` (
  `user_id` mediumint(9) NOT NULL,
  `component_id` mediumint(9) NOT NULL,
  UNIQUE KEY `component_cc_user_id_idx` (`component_id`,`user_id`),
  KEY `fk_component_cc_user_id_profiles_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
CREATE TABLE IF NOT EXISTS `dependencies` (
  `blocked` mediumint(9) NOT NULL,
  `dependson` mediumint(9) NOT NULL,
  UNIQUE KEY `dependencies_blocked_idx` (`blocked`,`dependson`),
  KEY `dependencies_dependson_idx` (`dependson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `duplicates`
--

DROP TABLE IF EXISTS `duplicates`;
CREATE TABLE IF NOT EXISTS `duplicates` (
  `dupe_of` mediumint(9) NOT NULL,
  `dupe` mediumint(9) NOT NULL,
  PRIMARY KEY (`dupe`),
  KEY `fk_duplicates_dupe_of_bugs_bug_id` (`dupe_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_bug_ignore`
--

DROP TABLE IF EXISTS `email_bug_ignore`;
CREATE TABLE IF NOT EXISTS `email_bug_ignore` (
  `user_id` mediumint(9) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  UNIQUE KEY `email_bug_ignore_user_id_idx` (`user_id`,`bug_id`),
  KEY `fk_email_bug_ignore_bug_id_bugs_bug_id` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_setting`
--

DROP TABLE IF EXISTS `email_setting`;
CREATE TABLE IF NOT EXISTS `email_setting` (
  `user_id` mediumint(9) NOT NULL,
  `relationship` tinyint(4) NOT NULL,
  `event` tinyint(4) NOT NULL,
  UNIQUE KEY `email_setting_user_id_idx` (`user_id`,`relationship`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_setting`
--

INSERT INTO `email_setting` (`user_id`, `relationship`, `event`) VALUES
(1, 0, 0),
(1, 0, 1),
(1, 0, 2),
(1, 0, 3),
(1, 0, 4),
(1, 0, 5),
(1, 0, 6),
(1, 0, 7),
(1, 0, 9),
(1, 0, 10),
(1, 0, 11),
(1, 0, 50),
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(1, 1, 9),
(1, 1, 10),
(1, 1, 11),
(1, 1, 50),
(1, 2, 0),
(1, 2, 1),
(1, 2, 2),
(1, 2, 3),
(1, 2, 4),
(1, 2, 5),
(1, 2, 6),
(1, 2, 7),
(1, 2, 8),
(1, 2, 9),
(1, 2, 10),
(1, 2, 11),
(1, 2, 50),
(1, 3, 0),
(1, 3, 1),
(1, 3, 2),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 3, 6),
(1, 3, 7),
(1, 3, 9),
(1, 3, 10),
(1, 3, 11),
(1, 3, 50),
(1, 5, 0),
(1, 5, 1),
(1, 5, 2),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 5, 6),
(1, 5, 7),
(1, 5, 9),
(1, 5, 10),
(1, 5, 11),
(1, 5, 50),
(1, 100, 100),
(1, 100, 101),
(2, 0, 0),
(2, 0, 1),
(2, 0, 2),
(2, 0, 3),
(2, 0, 4),
(2, 0, 5),
(2, 0, 6),
(2, 0, 7),
(2, 0, 9),
(2, 0, 10),
(2, 0, 11),
(2, 0, 50),
(2, 1, 0),
(2, 1, 1),
(2, 1, 2),
(2, 1, 3),
(2, 1, 4),
(2, 1, 5),
(2, 1, 6),
(2, 1, 7),
(2, 1, 9),
(2, 1, 10),
(2, 1, 11),
(2, 1, 50),
(2, 2, 0),
(2, 2, 1),
(2, 2, 2),
(2, 2, 3),
(2, 2, 4),
(2, 2, 5),
(2, 2, 6),
(2, 2, 7),
(2, 2, 8),
(2, 2, 9),
(2, 2, 10),
(2, 2, 11),
(2, 2, 50),
(2, 3, 0),
(2, 3, 1),
(2, 3, 2),
(2, 3, 3),
(2, 3, 4),
(2, 3, 5),
(2, 3, 6),
(2, 3, 7),
(2, 3, 9),
(2, 3, 10),
(2, 3, 11),
(2, 3, 50),
(2, 5, 0),
(2, 5, 1),
(2, 5, 2),
(2, 5, 3),
(2, 5, 4),
(2, 5, 5),
(2, 5, 6),
(2, 5, 7),
(2, 5, 9),
(2, 5, 10),
(2, 5, 11),
(2, 5, 50),
(2, 100, 100),
(2, 100, 101),
(3, 0, 0),
(3, 0, 1),
(3, 0, 2),
(3, 0, 3),
(3, 0, 4),
(3, 0, 5),
(3, 0, 6),
(3, 0, 7),
(3, 0, 9),
(3, 0, 10),
(3, 0, 11),
(3, 0, 50),
(3, 1, 0),
(3, 1, 1),
(3, 1, 2),
(3, 1, 3),
(3, 1, 4),
(3, 1, 5),
(3, 1, 6),
(3, 1, 7),
(3, 1, 9),
(3, 1, 10),
(3, 1, 11),
(3, 1, 50),
(3, 2, 0),
(3, 2, 1),
(3, 2, 2),
(3, 2, 3),
(3, 2, 4),
(3, 2, 5),
(3, 2, 6),
(3, 2, 7),
(3, 2, 8),
(3, 2, 9),
(3, 2, 10),
(3, 2, 11),
(3, 2, 50),
(3, 3, 0),
(3, 3, 1),
(3, 3, 2),
(3, 3, 3),
(3, 3, 4),
(3, 3, 5),
(3, 3, 6),
(3, 3, 7),
(3, 3, 9),
(3, 3, 10),
(3, 3, 11),
(3, 3, 50),
(3, 5, 0),
(3, 5, 1),
(3, 5, 2),
(3, 5, 3),
(3, 5, 4),
(3, 5, 5),
(3, 5, 6),
(3, 5, 7),
(3, 5, 9),
(3, 5, 10),
(3, 5, 11),
(3, 5, 50),
(3, 100, 100),
(3, 100, 101),
(4, 0, 0),
(4, 0, 1),
(4, 0, 2),
(4, 0, 3),
(4, 0, 4),
(4, 0, 5),
(4, 0, 6),
(4, 0, 7),
(4, 0, 9),
(4, 0, 10),
(4, 0, 11),
(4, 0, 50),
(4, 1, 0),
(4, 1, 1),
(4, 1, 2),
(4, 1, 3),
(4, 1, 4),
(4, 1, 5),
(4, 1, 6),
(4, 1, 7),
(4, 1, 9),
(4, 1, 10),
(4, 1, 11),
(4, 1, 50),
(4, 2, 0),
(4, 2, 1),
(4, 2, 2),
(4, 2, 3),
(4, 2, 4),
(4, 2, 5),
(4, 2, 6),
(4, 2, 7),
(4, 2, 8),
(4, 2, 9),
(4, 2, 10),
(4, 2, 11),
(4, 2, 50),
(4, 3, 0),
(4, 3, 1),
(4, 3, 2),
(4, 3, 3),
(4, 3, 4),
(4, 3, 5),
(4, 3, 6),
(4, 3, 7),
(4, 3, 9),
(4, 3, 10),
(4, 3, 11),
(4, 3, 50),
(4, 5, 0),
(4, 5, 1),
(4, 5, 2),
(4, 5, 3),
(4, 5, 4),
(4, 5, 5),
(4, 5, 6),
(4, 5, 7),
(4, 5, 9),
(4, 5, 10),
(4, 5, 11),
(4, 5, 50),
(4, 100, 100),
(4, 100, 101),
(5, 0, 0),
(5, 0, 1),
(5, 0, 2),
(5, 0, 3),
(5, 0, 4),
(5, 0, 5),
(5, 0, 6),
(5, 0, 7),
(5, 0, 9),
(5, 0, 10),
(5, 0, 11),
(5, 0, 50),
(5, 1, 0),
(5, 1, 1),
(5, 1, 2),
(5, 1, 3),
(5, 1, 4),
(5, 1, 5),
(5, 1, 6),
(5, 1, 7),
(5, 1, 9),
(5, 1, 10),
(5, 1, 11),
(5, 1, 50),
(5, 2, 0),
(5, 2, 1),
(5, 2, 2),
(5, 2, 3),
(5, 2, 4),
(5, 2, 5),
(5, 2, 6),
(5, 2, 7),
(5, 2, 8),
(5, 2, 9),
(5, 2, 10),
(5, 2, 11),
(5, 2, 50),
(5, 3, 0),
(5, 3, 1),
(5, 3, 2),
(5, 3, 3),
(5, 3, 4),
(5, 3, 5),
(5, 3, 6),
(5, 3, 7),
(5, 3, 9),
(5, 3, 10),
(5, 3, 11),
(5, 3, 50),
(5, 5, 0),
(5, 5, 1),
(5, 5, 2),
(5, 5, 3),
(5, 5, 4),
(5, 5, 5),
(5, 5, 6),
(5, 5, 7),
(5, 5, 9),
(5, 5, 10),
(5, 5, 11),
(5, 5, 50),
(5, 100, 100),
(5, 100, 101);

-- --------------------------------------------------------

--
-- Table structure for table `fielddefs`
--

DROP TABLE IF EXISTS `fielddefs`;
CREATE TABLE IF NOT EXISTS `fielddefs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `description` tinytext NOT NULL,
  `long_desc` varchar(255) NOT NULL DEFAULT '',
  `mailhead` tinyint(4) NOT NULL DEFAULT '0',
  `sortkey` smallint(6) NOT NULL,
  `obsolete` tinyint(4) NOT NULL DEFAULT '0',
  `enter_bug` tinyint(4) NOT NULL DEFAULT '0',
  `buglist` tinyint(4) NOT NULL DEFAULT '0',
  `visibility_field_id` mediumint(9) DEFAULT NULL,
  `value_field_id` mediumint(9) DEFAULT NULL,
  `reverse_desc` tinytext,
  `is_mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `is_numeric` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fielddefs_name_idx` (`name`),
  KEY `fielddefs_sortkey_idx` (`sortkey`),
  KEY `fielddefs_value_field_id_idx` (`value_field_id`),
  KEY `fielddefs_is_mandatory_idx` (`is_mandatory`),
  KEY `fk_fielddefs_visibility_field_id_fielddefs_id` (`visibility_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fielddefs`
--

INSERT INTO `fielddefs` (`id`, `name`, `type`, `custom`, `description`, `long_desc`, `mailhead`, `sortkey`, `obsolete`, `enter_bug`, `buglist`, `visibility_field_id`, `value_field_id`, `reverse_desc`, `is_mandatory`, `is_numeric`) VALUES
(1, 'bug_id', 0, 0, 'Bug #', '', 1, 100, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(2, 'short_desc', 0, 0, 'Summary', '', 1, 200, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(3, 'classification', 2, 0, 'Classification', '', 1, 300, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(4, 'product', 2, 0, 'Product', '', 1, 400, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(5, 'version', 0, 0, 'Version', '', 1, 500, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(6, 'rep_platform', 2, 0, 'Platform', '', 1, 600, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(7, 'bug_file_loc', 0, 0, 'URL', '', 1, 700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(8, 'op_sys', 2, 0, 'OS/Version', '', 1, 800, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(9, 'bug_status', 2, 0, 'Status', '', 1, 900, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(10, 'status_whiteboard', 0, 0, 'Status Whiteboard', '', 1, 1000, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(11, 'keywords', 8, 0, 'Keywords', '', 1, 1100, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(12, 'resolution', 2, 0, 'Resolution', '', 0, 1200, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(13, 'bug_severity', 2, 0, 'Severity', '', 1, 1300, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(14, 'priority', 2, 0, 'Priority', '', 1, 1400, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(15, 'component', 2, 0, 'Component', '', 1, 1500, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(16, 'assigned_to', 0, 0, 'AssignedTo', '', 1, 1600, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(17, 'reporter', 0, 0, 'ReportedBy', '', 1, 1700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(18, 'qa_contact', 0, 0, 'QAContact', '', 1, 1800, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(19, 'assigned_to_realname', 0, 0, 'AssignedToName', '', 0, 1900, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(20, 'reporter_realname', 0, 0, 'ReportedByName', '', 0, 2000, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(21, 'qa_contact_realname', 0, 0, 'QAContactName', '', 0, 2100, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(22, 'cc', 0, 0, 'CC', '', 1, 2200, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(23, 'dependson', 0, 0, 'Depends on', '', 1, 2300, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(24, 'blocked', 0, 0, 'Blocks', '', 1, 2400, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(25, 'attachments.description', 0, 0, 'Attachment description', '', 0, 2500, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(26, 'attachments.filename', 0, 0, 'Attachment filename', '', 0, 2600, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(27, 'attachments.mimetype', 0, 0, 'Attachment mime type', '', 0, 2700, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(28, 'attachments.ispatch', 0, 0, 'Attachment is patch', '', 0, 2800, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(29, 'attachments.isobsolete', 0, 0, 'Attachment is obsolete', '', 0, 2900, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(30, 'attachments.isprivate', 0, 0, 'Attachment is private', '', 0, 3000, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(31, 'attachments.submitter', 0, 0, 'Attachment creator', '', 0, 3100, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(32, 'target_milestone', 0, 0, 'Target Milestone', '', 1, 3200, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(33, 'creation_ts', 0, 0, 'Creation date', '', 0, 3300, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(34, 'delta_ts', 0, 0, 'Last changed date', '', 0, 3400, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(35, 'longdesc', 0, 0, 'Comment', '', 0, 3500, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(36, 'longdescs.isprivate', 0, 0, 'Comment is private', '', 0, 3600, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(37, 'longdescs.count', 0, 0, 'Number of Comments', '', 0, 3700, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(38, 'alias', 0, 0, 'Alias', '', 0, 3800, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(39, 'everconfirmed', 0, 0, 'Ever Confirmed', '', 0, 3900, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(40, 'reporter_accessible', 0, 0, 'Reporter Accessible', '', 0, 4000, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(41, 'cclist_accessible', 0, 0, 'CC Accessible', '', 0, 4100, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(42, 'bug_group', 0, 0, 'Group', '', 1, 4200, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(43, 'estimated_time', 0, 0, 'Estimated Hours', '', 1, 4300, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(44, 'remaining_time', 0, 0, 'Remaining Hours', '', 0, 4400, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(45, 'deadline', 5, 0, 'Deadline', '', 1, 4500, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(46, 'commenter', 0, 0, 'Commenter', '', 0, 4600, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(47, 'flagtypes.name', 0, 0, 'Flags', '', 0, 4700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(48, 'requestees.login_name', 0, 0, 'Flag Requestee', '', 0, 4800, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(49, 'setters.login_name', 0, 0, 'Flag Setter', '', 0, 4900, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(50, 'work_time', 0, 0, 'Hours Worked', '', 0, 5000, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(51, 'percentage_complete', 0, 0, 'Percentage Complete', '', 0, 5100, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(52, 'content', 0, 0, 'Content', '', 0, 5200, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(53, 'attach_data.thedata', 0, 0, 'Attachment data', '', 0, 5300, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(54, 'owner_idle_time', 0, 0, 'Time Since Assignee Touched', '', 0, 5400, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(55, 'see_also', 7, 0, 'See Also', '', 0, 5500, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(56, 'tag', 8, 0, 'Personal Tags', '', 0, 5600, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(57, 'last_visit_ts', 5, 0, 'Last Visit', '', 0, 5700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(58, 'comment_tag', 0, 0, 'Comment Tag', '', 0, 5800, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(59, 'days_elapsed', 0, 0, 'Days since bug changed', '', 0, 5900, 0, 0, 0, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_visibility`
--

DROP TABLE IF EXISTS `field_visibility`;
CREATE TABLE IF NOT EXISTS `field_visibility` (
  `field_id` mediumint(9) DEFAULT NULL,
  `value_id` smallint(6) NOT NULL,
  UNIQUE KEY `field_visibility_field_id_idx` (`field_id`,`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flagexclusions`
--

DROP TABLE IF EXISTS `flagexclusions`;
CREATE TABLE IF NOT EXISTS `flagexclusions` (
  `type_id` mediumint(9) NOT NULL,
  `product_id` smallint(6) DEFAULT NULL,
  `component_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `flagexclusions_type_id_idx` (`type_id`,`product_id`,`component_id`),
  KEY `fk_flagexclusions_component_id_components_id` (`component_id`),
  KEY `fk_flagexclusions_product_id_products_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flaginclusions`
--

DROP TABLE IF EXISTS `flaginclusions`;
CREATE TABLE IF NOT EXISTS `flaginclusions` (
  `type_id` mediumint(9) NOT NULL,
  `product_id` smallint(6) DEFAULT NULL,
  `component_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `flaginclusions_type_id_idx` (`type_id`,`product_id`,`component_id`),
  KEY `fk_flaginclusions_component_id_components_id` (`component_id`),
  KEY `fk_flaginclusions_product_id_products_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
CREATE TABLE IF NOT EXISTS `flags` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type_id` mediumint(9) NOT NULL,
  `status` char(1) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  `attach_id` mediumint(9) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  `setter_id` mediumint(9) NOT NULL,
  `requestee_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_bug_id_idx` (`bug_id`,`attach_id`),
  KEY `flags_setter_id_idx` (`setter_id`),
  KEY `flags_requestee_id_idx` (`requestee_id`),
  KEY `flags_type_id_idx` (`type_id`),
  KEY `fk_flags_attach_id_attachments_attach_id` (`attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flagtypes`
--

DROP TABLE IF EXISTS `flagtypes`;
CREATE TABLE IF NOT EXISTS `flagtypes` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` mediumtext NOT NULL,
  `cc_list` varchar(200) DEFAULT NULL,
  `target_type` char(1) NOT NULL DEFAULT 'b',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_requestable` tinyint(4) NOT NULL DEFAULT '0',
  `is_requesteeble` tinyint(4) NOT NULL DEFAULT '0',
  `is_multiplicable` tinyint(4) NOT NULL DEFAULT '0',
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `grant_group_id` mediumint(9) DEFAULT NULL,
  `request_group_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flagtypes_grant_group_id_groups_id` (`grant_group_id`),
  KEY `fk_flagtypes_request_group_id_groups_id` (`request_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `isbuggroup` tinyint(4) NOT NULL,
  `userregexp` tinytext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `icon_url` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `isbuggroup`, `userregexp`, `isactive`, `icon_url`) VALUES
(1, 'admin', 'Administrators', 0, '', 1, NULL),
(2, 'tweakparams', 'Can change Parameters', 0, '', 1, NULL),
(3, 'editusers', 'Can edit or disable users', 0, '', 1, NULL),
(4, 'creategroups', 'Can create and destroy groups', 0, '', 1, NULL),
(5, 'editclassifications', 'Can create, destroy, and edit classifications', 0, '', 1, NULL),
(6, 'editcomponents', 'Can create, destroy, and edit components', 0, '', 1, NULL),
(7, 'editkeywords', 'Can create, destroy, and edit keywords', 0, '', 1, NULL),
(8, 'editbugs', 'Can edit all bug fields', 0, '.*', 1, NULL),
(9, 'canconfirm', 'Can confirm a bug or mark it a duplicate', 0, '', 1, NULL),
(10, 'bz_canusewhineatothers', 'Can configure whine reports for other users', 0, '', 1, NULL),
(11, 'bz_canusewhines', 'User can configure whine reports for self', 0, '', 1, NULL),
(12, 'bz_sudoers', 'Can perform actions as other users', 0, '', 1, NULL),
(13, 'bz_sudo_protect', 'Can not be impersonated by other users', 0, '', 1, NULL),
(14, 'bz_quip_moderators', 'Can moderate quips', 0, '', 1, NULL),
(15, 'viewonly', 'just view field', 1, '', 0, NULL),
(16, 'thembug', 'Them bug mới', 1, '', 1, NULL),
(17, 'groupViewBug_GIT', 'groupViewBug_GIT', 1, '', 1, NULL),
(18, 'Nam Định', '123', 1, '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_control_map`
--

DROP TABLE IF EXISTS `group_control_map`;
CREATE TABLE IF NOT EXISTS `group_control_map` (
  `group_id` mediumint(9) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `entry` tinyint(4) NOT NULL DEFAULT '0',
  `membercontrol` tinyint(4) NOT NULL DEFAULT '0',
  `othercontrol` tinyint(4) NOT NULL DEFAULT '0',
  `canedit` tinyint(4) NOT NULL DEFAULT '0',
  `editcomponents` tinyint(4) NOT NULL DEFAULT '0',
  `editbugs` tinyint(4) NOT NULL DEFAULT '0',
  `canconfirm` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_control_map_product_id_idx` (`product_id`,`group_id`),
  KEY `group_control_map_group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_control_map`
--

INSERT INTO `group_control_map` (`group_id`, `product_id`, `entry`, `membercontrol`, `othercontrol`, `canedit`, `editcomponents`, `editbugs`, `canconfirm`) VALUES
(16, 1, 0, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_group_map`
--

DROP TABLE IF EXISTS `group_group_map`;
CREATE TABLE IF NOT EXISTS `group_group_map` (
  `member_id` mediumint(9) NOT NULL,
  `grantor_id` mediumint(9) NOT NULL,
  `grant_type` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_group_map_member_id_idx` (`member_id`,`grantor_id`,`grant_type`),
  KEY `fk_group_group_map_grantor_id_groups_id` (`grantor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_group_map`
--

INSERT INTO `group_group_map` (`member_id`, `grantor_id`, `grant_type`) VALUES
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 0),
(1, 2, 1),
(1, 2, 2),
(1, 3, 0),
(1, 3, 1),
(1, 3, 2),
(1, 4, 0),
(1, 4, 1),
(1, 4, 2),
(1, 5, 0),
(1, 5, 1),
(1, 5, 2),
(1, 6, 0),
(1, 6, 1),
(1, 6, 2),
(1, 7, 0),
(1, 7, 1),
(1, 7, 2),
(1, 8, 0),
(1, 8, 1),
(1, 8, 2),
(1, 9, 0),
(1, 9, 1),
(1, 9, 2),
(1, 10, 0),
(1, 10, 1),
(1, 10, 2),
(1, 11, 0),
(1, 11, 1),
(1, 11, 2),
(8, 11, 0),
(10, 11, 0),
(1, 12, 0),
(1, 12, 1),
(1, 12, 2),
(1, 13, 0),
(1, 13, 1),
(1, 13, 2),
(12, 13, 0),
(1, 14, 0),
(1, 14, 1),
(1, 14, 2),
(1, 15, 0),
(1, 15, 1),
(1, 15, 2),
(1, 16, 0),
(1, 16, 1),
(1, 16, 2),
(1, 17, 0),
(1, 17, 1),
(1, 17, 2),
(1, 18, 0),
(1, 18, 1),
(1, 18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `keyworddefs`
--

DROP TABLE IF EXISTS `keyworddefs`;
CREATE TABLE IF NOT EXISTS `keyworddefs` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyworddefs_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
CREATE TABLE IF NOT EXISTS `keywords` (
  `bug_id` mediumint(9) NOT NULL,
  `keywordid` smallint(6) NOT NULL,
  UNIQUE KEY `keywords_bug_id_idx` (`bug_id`,`keywordid`),
  KEY `keywords_keywordid_idx` (`keywordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logincookies`
--

DROP TABLE IF EXISTS `logincookies`;
CREATE TABLE IF NOT EXISTS `logincookies` (
  `cookie` varchar(16) NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `lastused` datetime NOT NULL,
  PRIMARY KEY (`cookie`),
  KEY `logincookies_lastused_idx` (`lastused`),
  KEY `fk_logincookies_userid_profiles_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logincookies`
--

INSERT INTO `logincookies` (`cookie`, `userid`, `ipaddr`, `lastused`) VALUES
('quaQKcfVNS', 1, NULL, '2021-12-16 13:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `login_failure`
--

DROP TABLE IF EXISTS `login_failure`;
CREATE TABLE IF NOT EXISTS `login_failure` (
  `user_id` mediumint(9) NOT NULL,
  `login_time` datetime NOT NULL,
  `ip_addr` varchar(40) NOT NULL,
  KEY `login_failure_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `longdescs`
--

DROP TABLE IF EXISTS `longdescs`;
CREATE TABLE IF NOT EXISTS `longdescs` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `work_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `thetext` mediumtext NOT NULL,
  `isprivate` tinyint(4) NOT NULL DEFAULT '0',
  `already_wrapped` tinyint(4) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `extra_data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `longdescs_bug_id_idx` (`bug_id`,`work_time`),
  KEY `longdescs_who_idx` (`who`,`bug_id`),
  KEY `longdescs_bug_when_idx` (`bug_when`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `longdescs`
--

INSERT INTO `longdescs` (`comment_id`, `bug_id`, `who`, `bug_when`, `work_time`, `thetext`, `isprivate`, `already_wrapped`, `type`, `extra_data`) VALUES
(5, 5, 1, '2021-12-07 09:49:19', '0.00', '123', 0, 0, 0, NULL),
(6, 6, 1, '2021-12-07 10:09:25', '0.00', 'bug3', 0, 0, 0, NULL),
(16, 12, 1, '2021-12-16 10:38:46', '0.00', 'không hiển thị sách cần tìm kiếm dù đã nhập đúng tên sách', 0, 0, 0, NULL),
(17, 12, 1, '2021-12-16 10:45:43', '1.00', 'Hướng giải quyết:\nSửa lại câu truy vấn', 0, 0, 0, NULL),
(18, 13, 2, '2021-12-16 10:58:44', '0.00', 'Chức năng lọc sách theo nhà xuất bản và loại không hoạt động', 0, 0, 0, NULL),
(19, 13, 2, '2021-12-16 11:02:49', '0.00', 'Ngô Thanh Danh đưa ra hướng giải quyết:\nSửa câu truy vấn trong model: Kiểm tra tên bảng và điều kiện để lấy', 0, 0, 0, NULL),
(20, 13, 1, '2021-12-16 11:05:22', '1.00', 'Nguyễn Tấn Lộc đưa ra hướng giải quyết:\nKiểm tra luồng xử lý của controllers: Giá trị truyền vào của action đã đúng hay chưa? Điều kiện if trong hàm loc đã đúng hay chưa?', 0, 0, 0, NULL),
(21, 14, 1, '2021-12-16 11:34:05', '0.00', 'Viết thêm hàm xuất tên nhà xuất bản và loại trong model sau đó truyền qua controller', 0, 0, 0, NULL),
(22, 14, 2, '2021-12-16 11:34:54', '1.00', '', 0, 0, 0, NULL),
(23, 15, 2, '2021-12-16 12:34:46', '0.00', '', 0, 0, 0, NULL),
(24, 15, 1, '2021-12-16 12:35:41', '0.00', 'sửa lại đường dẫn đến database', 0, 0, 0, NULL),
(25, 16, 1, '2021-12-16 12:45:19', '0.00', '', 0, 0, 0, NULL),
(26, 16, 1, '2021-12-16 12:47:17', '0.00', 'Lộc đề xuất cách sửa:\nKiểm tra câu truy vấn', 0, 0, 0, NULL),
(27, 16, 2, '2021-12-16 12:48:55', '0.00', 'Danh đề ra hướng giải quyết:\nLỗi ở luồng xử lý controllers. Hãy kiểm tra giá trị action', 0, 0, 0, NULL),
(28, 17, 1, '2021-12-16 12:52:28', '0.00', '', 0, 0, 0, NULL),
(29, 17, 1, '2021-12-16 12:53:48', '0.00', 'Lộc đề xuất hướng giải quyết:\nKiểm tra câu truy vấn vào database ở model, xem lại tên các trường ở database đã được đặt đúng hay chưa?', 0, 0, 0, NULL),
(30, 17, 2, '2021-12-16 12:56:33', '0.00', 'Danh đề xuất hướng giải quyết:\nViết thêm 1 hàm chuyển hình vào file muốn lưu trong code', 0, 0, 0, NULL),
(31, 18, 2, '2021-12-16 13:01:59', '0.00', 'Danh đề xuất cách sửa:\nSửa lại biến id để lấy đúng trường giá trị', 0, 0, 0, NULL),
(32, 19, 2, '2021-12-16 13:05:37', '0.00', 'Danh đề ra hướng giải quyết: \nSửa lại câu truy vấn WHERE đối tượng phải lấy đúng id đối tượng', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `longdescs_tags`
--

DROP TABLE IF EXISTS `longdescs_tags`;
CREATE TABLE IF NOT EXISTS `longdescs_tags` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `tag` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_idx` (`comment_id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `longdescs_tags_activity`
--

DROP TABLE IF EXISTS `longdescs_tags_activity`;
CREATE TABLE IF NOT EXISTS `longdescs_tags_activity` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `added` varchar(24) DEFAULT NULL,
  `removed` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `longdescs_tags_activity_bug_id_idx` (`bug_id`),
  KEY `fk_longdescs_tags_activity_who_profiles_userid` (`who`),
  KEY `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `longdescs_tags_weights`
--

DROP TABLE IF EXISTS `longdescs_tags_weights`;
CREATE TABLE IF NOT EXISTS `longdescs_tags_weights` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tag` varchar(24) NOT NULL,
  `weight` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_weights_tag_idx` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mail_staging`
--

DROP TABLE IF EXISTS `mail_staging`;
CREATE TABLE IF NOT EXISTS `mail_staging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
CREATE TABLE IF NOT EXISTS `milestones` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `product_id` smallint(6) NOT NULL,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_product_id_idx` (`product_id`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `product_id`, `value`, `sortkey`, `isactive`) VALUES
(1, 1, '---', 0, 1),
(4, 4, '---', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `namedqueries`
--

DROP TABLE IF EXISTS `namedqueries`;
CREATE TABLE IF NOT EXISTS `namedqueries` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) NOT NULL,
  `name` varchar(64) NOT NULL,
  `query` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namedqueries_userid_idx` (`userid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `namedqueries_link_in_footer`
--

DROP TABLE IF EXISTS `namedqueries_link_in_footer`;
CREATE TABLE IF NOT EXISTS `namedqueries_link_in_footer` (
  `namedquery_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  UNIQUE KEY `namedqueries_link_in_footer_id_idx` (`namedquery_id`,`user_id`),
  KEY `namedqueries_link_in_footer_userid_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `namedquery_group_map`
--

DROP TABLE IF EXISTS `namedquery_group_map`;
CREATE TABLE IF NOT EXISTS `namedquery_group_map` (
  `namedquery_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `namedquery_group_map_namedquery_id_idx` (`namedquery_id`),
  KEY `namedquery_group_map_group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `op_sys`
--

DROP TABLE IF EXISTS `op_sys`;
CREATE TABLE IF NOT EXISTS `op_sys` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `op_sys_value_idx` (`value`),
  KEY `op_sys_sortkey_idx` (`sortkey`,`value`),
  KEY `op_sys_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `op_sys`
--

INSERT INTO `op_sys` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'All', 100, 1, NULL),
(2, 'Windows', 200, 1, NULL),
(3, 'Mac OS', 300, 1, NULL),
(4, 'Linux', 400, 1, NULL),
(5, 'Other', 500, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
CREATE TABLE IF NOT EXISTS `priority` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `priority_value_idx` (`value`),
  KEY `priority_sortkey_idx` (`sortkey`,`value`),
  KEY `priority_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'Highest', 100, 1, NULL),
(2, 'High', 200, 1, NULL),
(3, 'Normal', 300, 1, NULL),
(4, 'Low', 400, 1, NULL),
(5, 'Lowest', 500, 1, NULL),
(6, '---', 600, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `classification_id` smallint(6) NOT NULL DEFAULT '1',
  `description` mediumtext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `defaultmilestone` varchar(64) NOT NULL DEFAULT '---',
  `allows_unconfirmed` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_idx` (`name`),
  KEY `fk_products_classification_id_classifications_id` (`classification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `classification_id`, `description`, `isactive`, `defaultmilestone`, `allows_unconfirmed`) VALUES
(1, 'TestProduct', 1, 'This is a test product. This ought to be blown away and replaced with real stuff in a finished installation of bugzilla.', 1, '---', 1),
(4, 'Đồ án phần mềm nguồn mở', 1, 'Đồ án môn học thực hành phát triển phần mềm nguồn mở. Viết website và sửa lỗi bằng công cụ GitHub và Bugzilla', 1, '---', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `userid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL,
  `cryptpassword` varchar(128) DEFAULT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `disabledtext` mediumtext NOT NULL,
  `disable_mail` tinyint(4) NOT NULL DEFAULT '0',
  `mybugslink` tinyint(4) NOT NULL DEFAULT '1',
  `extern_id` varchar(64) DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `last_seen_date` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `profiles_login_name_idx` (`login_name`),
  UNIQUE KEY `profiles_extern_id_idx` (`extern_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`userid`, `login_name`, `cryptpassword`, `realname`, `disabledtext`, `disable_mail`, `mybugslink`, `extern_id`, `is_enabled`, `last_seen_date`) VALUES
(1, 'loclocloc22032000@gmail.com', 'QL9bk0Ue,scLbDaEJf+ZL2vd768OblwQeBKT6vw8MI/KY48+cBV0{SHA-256}', 'LocNguyen', '', 0, 1, NULL, 1, '2021-12-16 00:00:00'),
(2, 'user1@gmail.com', '1oPHW7cE,J1nTt3jBMnDSY77RcM2b/LDiZHir+dvN6S0caFp6a34{SHA-256}', 'User1', '', 0, 1, NULL, 1, '2021-12-16 00:00:00'),
(3, 'user2@gmail.com', 'FYraXoDC,4fGPxfnCYQnGVjl65Q0RbrYu6Py0v/VkeW2Y1L20yJQ{SHA-256}', 'User2', '', 0, 1, NULL, 1, '2021-11-29 00:00:00'),
(4, 'user3@gmail.com', 'wXCLofkG,K9mfa9OAyuRXTdmeYxq2ObBd4qJ5ti8L2LdovMAaFBw{SHA-256}', '', '', 0, 1, NULL, 1, NULL),
(5, 'assigneebugzilla@gmail.com', '8NhlII38,OVq+TlWGPN1kV5KSfNlPF9jJgjrh0p0GLilwolqwGvM{SHA-256}', '', '', 0, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles_activity`
--

DROP TABLE IF EXISTS `profiles_activity`;
CREATE TABLE IF NOT EXISTS `profiles_activity` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  `profiles_when` datetime NOT NULL,
  `fieldid` mediumint(9) NOT NULL,
  `oldvalue` tinytext,
  `newvalue` tinytext,
  PRIMARY KEY (`id`),
  KEY `profiles_activity_userid_idx` (`userid`),
  KEY `profiles_activity_profiles_when_idx` (`profiles_when`),
  KEY `profiles_activity_fieldid_idx` (`fieldid`),
  KEY `fk_profiles_activity_who_profiles_userid` (`who`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles_activity`
--

INSERT INTO `profiles_activity` (`id`, `userid`, `who`, `profiles_when`, `fieldid`, `oldvalue`, `newvalue`) VALUES
(1, 1, 1, '2021-11-28 21:23:51', 33, NULL, '2021-11-28 21:23:51'),
(2, 2, 1, '2021-11-29 13:16:01', 33, NULL, '2021-11-29 13:16:01'),
(3, 2, 1, '2021-11-29 13:21:53', 42, '', 'editbugs'),
(4, 3, 1, '2021-11-29 13:24:23', 33, NULL, '2021-11-29 13:24:23'),
(5, 3, 1, '2021-11-29 13:24:46', 42, '', 'viewonly'),
(6, 4, 1, '2021-11-29 13:25:12', 33, NULL, '2021-11-29 13:25:12'),
(7, 2, 1, '2021-11-29 14:58:22', 42, '', 'thembug'),
(8, 3, 1, '2021-11-29 15:06:51', 42, 'viewonly', ''),
(9, 3, 1, '2021-11-29 15:08:20', 42, '', 'viewonly'),
(10, 5, 1, '2021-12-07 09:47:27', 33, NULL, '2021-12-07 09:47:27'),
(11, 5, 1, '2021-12-07 09:48:14', 42, '', 'viewonly');

-- --------------------------------------------------------

--
-- Table structure for table `profile_search`
--

DROP TABLE IF EXISTS `profile_search`;
CREATE TABLE IF NOT EXISTS `profile_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `bug_list` mediumtext NOT NULL,
  `list_order` mediumtext,
  PRIMARY KEY (`id`),
  KEY `profile_search_user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_search`
--

INSERT INTO `profile_search` (`id`, `user_id`, `bug_list`, `list_order`) VALUES
(3, 2, '1,2', 'priority,bug_severity'),
(6, 2, '1,2', 'priority,bug_severity'),
(8, 2, '1,2', 'priority,bug_severity'),
(30, 2, '8', 'priority,bug_severity'),
(47, 1, '13,12', 'changeddate DESC,priority,bug_severity'),
(48, 1, '13,12', 'changeddate DESC,priority,bug_severity'),
(49, 2, '13,12', 'changeddate DESC,priority,bug_severity'),
(50, 2, '13,12', 'changeddate DESC,priority,bug_severity'),
(51, 1, '13,12', 'changeddate DESC,priority,bug_severity'),
(52, 2, '14', 'changeddate DESC,priority,bug_severity'),
(53, 1, '15', 'priority,bug_severity'),
(54, 2, '16', 'priority,bug_severity'),
(55, 1, '5,6,16', 'priority,bug_severity'),
(56, 2, '12,13,14,15,16', 'priority,bug_severity'),
(57, 1, '12,13,14,15,16', 'priority,bug_severity'),
(58, 1, '12,13,14,15,16', 'priority,bug_severity'),
(59, 1, '12,13,14,15,16', 'priority,bug_severity'),
(60, 2, '12,13,14,15,16,17', 'priority,bug_severity'),
(61, 1, '19', 'priority,bug_severity'),
(62, 1, '12,13,14,15,16,17,18,19', 'priority,bug_severity');

-- --------------------------------------------------------

--
-- Table structure for table `profile_setting`
--

DROP TABLE IF EXISTS `profile_setting`;
CREATE TABLE IF NOT EXISTS `profile_setting` (
  `user_id` mediumint(9) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` varchar(32) NOT NULL,
  UNIQUE KEY `profile_setting_value_unique_idx` (`user_id`,`setting_name`),
  KEY `fk_profile_setting_setting_name_setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quips`
--

DROP TABLE IF EXISTS `quips`;
CREATE TABLE IF NOT EXISTS `quips` (
  `quipid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) DEFAULT NULL,
  `quip` varchar(512) NOT NULL,
  `approved` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`quipid`),
  KEY `fk_quips_userid_profiles_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `name` varchar(64) NOT NULL,
  `query` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reports_user_id_idx` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rep_platform`
--

DROP TABLE IF EXISTS `rep_platform`;
CREATE TABLE IF NOT EXISTS `rep_platform` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rep_platform_value_idx` (`value`),
  KEY `rep_platform_sortkey_idx` (`sortkey`,`value`),
  KEY `rep_platform_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rep_platform`
--

INSERT INTO `rep_platform` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'All', 100, 1, NULL),
(2, 'PC', 200, 1, NULL),
(3, 'Macintosh', 300, 1, NULL),
(4, 'Other', 400, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resolution`
--

DROP TABLE IF EXISTS `resolution`;
CREATE TABLE IF NOT EXISTS `resolution` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resolution_value_idx` (`value`),
  KEY `resolution_sortkey_idx` (`sortkey`,`value`),
  KEY `resolution_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resolution`
--

INSERT INTO `resolution` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, '', 100, 1, NULL),
(2, 'FIXED', 200, 1, NULL),
(3, 'INVALID', 300, 1, NULL),
(4, 'WONTFIX', 400, 1, NULL),
(5, 'DUPLICATE', 500, 1, NULL),
(6, 'WORKSFORME', 600, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `series_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `creator` mediumint(9) DEFAULT NULL,
  `category` smallint(6) NOT NULL,
  `subcategory` smallint(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `frequency` smallint(6) NOT NULL,
  `query` mediumtext NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_category_idx` (`category`,`subcategory`,`name`),
  KEY `series_creator_idx` (`creator`),
  KEY `fk_series_subcategory_series_categories_id` (`subcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`series_id`, `creator`, `category`, `subcategory`, `name`, `frequency`, `query`, `is_public`) VALUES
(37, 1, 10, 2, 'UNCONFIRMED', 1, 'bug_status=UNCONFIRMED&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(38, 1, 10, 2, 'CONFIRMED', 1, 'bug_status=CONFIRMED&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(39, 1, 10, 2, 'IN_PROGRESS', 1, 'bug_status=IN_PROGRESS&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(40, 1, 10, 2, 'RESOLVED', 1, 'bug_status=RESOLVED&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(41, 1, 10, 2, 'VERIFIED', 1, 'bug_status=VERIFIED&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(42, 1, 10, 2, 'FIXED', 1, 'resolution=FIXED&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(43, 1, 10, 2, 'INVALID', 1, 'resolution=INVALID&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(44, 1, 10, 2, 'WONTFIX', 1, 'resolution=WONTFIX&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(45, 1, 10, 2, 'DUPLICATE', 1, 'resolution=DUPLICATE&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(46, 1, 10, 2, 'WORKSFORME', 1, 'resolution=WORKSFORME&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(47, 1, 10, 2, 'All Open', 1, 'bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=IN_PROGRESS&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F', 1),
(48, 1, 10, 3, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F&component=Model', 1),
(49, 1, 10, 3, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F&component=Model', 1),
(50, 1, 10, 11, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F&component=controllers', 1),
(51, 1, 10, 11, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=%C4%90%E1%BB%93%20%C3%A1n%20ph%E1%BA%A7n%20m%E1%BB%81m%20ngu%E1%BB%93n%20m%E1%BB%9F&component=controllers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `series_categories`
--

DROP TABLE IF EXISTS `series_categories`;
CREATE TABLE IF NOT EXISTS `series_categories` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series_categories_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `series_categories`
--

INSERT INTO `series_categories` (`id`, `name`) VALUES
(2, '-All-'),
(8, 'Admin'),
(4, 'control'),
(7, 'controller'),
(11, 'controllers'),
(9, 'Lỗi tổng'),
(3, 'Model'),
(5, 'View'),
(10, 'Đồ án phần mềm nguồn mở');

-- --------------------------------------------------------

--
-- Table structure for table `series_data`
--

DROP TABLE IF EXISTS `series_data`;
CREATE TABLE IF NOT EXISTS `series_data` (
  `series_id` mediumint(9) NOT NULL,
  `series_date` datetime NOT NULL,
  `series_value` mediumint(9) NOT NULL,
  UNIQUE KEY `series_data_series_id_idx` (`series_id`,`series_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `name` varchar(32) NOT NULL,
  `default_value` varchar(32) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `subclass` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`name`, `default_value`, `is_enabled`, `subclass`) VALUES
('bugmail_new_prefix', 'on', 1, NULL),
('comment_box_position', 'before_comments', 1, NULL),
('comment_sort_order', 'oldest_to_newest', 1, NULL),
('csv_colsepchar', ',', 1, NULL),
('display_quips', 'on', 1, NULL),
('email_format', 'html', 1, NULL),
('lang', 'en', 1, 'Lang'),
('possible_duplicates', 'on', 1, NULL),
('post_bug_submit_action', 'next_bug', 1, NULL),
('quicksearch_fulltext', 'on', 1, NULL),
('quote_replies', 'quoted_reply', 1, NULL),
('requestee_cc', 'on', 1, NULL),
('skin', 'Dusk', 1, 'Skin'),
('state_addselfcc', 'cc_unless_role', 1, NULL),
('timezone', 'local', 1, 'Timezone'),
('zoom_textareas', 'on', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting_value`
--

DROP TABLE IF EXISTS `setting_value`;
CREATE TABLE IF NOT EXISTS `setting_value` (
  `name` varchar(32) NOT NULL,
  `value` varchar(32) NOT NULL,
  `sortindex` smallint(6) NOT NULL,
  UNIQUE KEY `setting_value_nv_unique_idx` (`name`,`value`),
  UNIQUE KEY `setting_value_ns_unique_idx` (`name`,`sortindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting_value`
--

INSERT INTO `setting_value` (`name`, `value`, `sortindex`) VALUES
('bugmail_new_prefix', 'on', 5),
('bugmail_new_prefix', 'off', 10),
('comment_box_position', 'before_comments', 5),
('comment_box_position', 'after_comments', 10),
('comment_sort_order', 'oldest_to_newest', 5),
('comment_sort_order', 'newest_to_oldest', 10),
('comment_sort_order', 'newest_to_oldest_desc_first', 15),
('csv_colsepchar', ',', 5),
('csv_colsepchar', ';', 10),
('display_quips', 'on', 5),
('display_quips', 'off', 10),
('email_format', 'html', 5),
('email_format', 'text_only', 10),
('possible_duplicates', 'on', 5),
('possible_duplicates', 'off', 10),
('post_bug_submit_action', 'next_bug', 5),
('post_bug_submit_action', 'same_bug', 10),
('post_bug_submit_action', 'nothing', 15),
('quicksearch_fulltext', 'on', 5),
('quicksearch_fulltext', 'off', 10),
('quote_replies', 'quoted_reply', 5),
('quote_replies', 'simple_reply', 10),
('quote_replies', 'off', 15),
('requestee_cc', 'on', 5),
('requestee_cc', 'off', 10),
('state_addselfcc', 'always', 5),
('state_addselfcc', 'never', 10),
('state_addselfcc', 'cc_unless_role', 15),
('zoom_textareas', 'on', 5),
('zoom_textareas', 'off', 10);

-- --------------------------------------------------------

--
-- Table structure for table `status_workflow`
--

DROP TABLE IF EXISTS `status_workflow`;
CREATE TABLE IF NOT EXISTS `status_workflow` (
  `old_status` smallint(6) DEFAULT NULL,
  `new_status` smallint(6) NOT NULL,
  `require_comment` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `status_workflow_idx` (`old_status`,`new_status`),
  KEY `fk_status_workflow_new_status_bug_status_id` (`new_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_workflow`
--

INSERT INTO `status_workflow` (`old_status`, `new_status`, `require_comment`) VALUES
(NULL, 1, 0),
(NULL, 2, 0),
(NULL, 3, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(2, 3, 0),
(2, 4, 0),
(3, 2, 0),
(3, 4, 0),
(4, 1, 0),
(4, 2, 0),
(4, 5, 0),
(5, 1, 0),
(5, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_user_id_idx` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `userid` mediumint(9) DEFAULT NULL,
  `issuedate` datetime NOT NULL,
  `token` varchar(16) NOT NULL,
  `tokentype` varchar(16) NOT NULL,
  `eventdata` tinytext,
  PRIMARY KEY (`token`),
  KEY `tokens_userid_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`userid`, `issuedate`, `token`, `tokentype`, `eventdata`) VALUES
(1, '2021-12-16 10:53:00', '0Vb2B8ZM0S', 'session', 'edit_product'),
(1, '2021-11-29 13:50:25', '1bZbcydtWz', 'session', 'edit_component'),
(1, '2021-11-29 13:22:30', '1kxcecmQQ1', 'session', 'add_user'),
(1, '2021-11-29 14:58:23', '25nzp7KEOO', 'session', 'edit_user'),
(1, '2021-11-29 14:52:32', '2sRGGYunhC', 'session', 'edit_product'),
(1, '2021-11-29 14:59:52', '319OSiRePS', 'session', 'add_group'),
(1, '2021-11-29 15:01:46', '4eLqFHOxiv', 'session', 'edit_user'),
(1, '2021-11-29 13:39:31', '4T5UST9fQu', 'session', 'edit_user'),
(3, '2021-11-29 15:07:23', '65HJMx8AmV', 'session', 'create_bug'),
(1, '2021-11-29 13:45:27', '6s9GbUVSrA', 'session', 'create_bug'),
(1, '2021-12-12 13:24:24', '70ejtYZeNj', 'session', 'edit_product'),
(1, '2021-11-29 14:11:14', '7ou6T2VE4F', 'session', 'workflow_edit'),
(1, '2021-12-16 10:54:49', '8fn5Inz8aB', 'session', 'edit_product'),
(1, '2021-12-16 10:34:20', '8hC1qHDHux', 'api_token', ''),
(1, '2021-11-29 13:54:05', '9ElzVhHGdm', 'session', 'delete_component'),
(3, '2021-11-29 14:54:24', '9G9TKTOE9d', 'session', 'create_bug'),
(1, '2021-11-29 13:56:52', '9LOAT38Poz', 'session', 'create_attachment'),
(1, '2021-11-29 13:54:00', 'AMoXoEySIQ', 'session', 'edit_product'),
(1, '2021-12-07 09:45:22', 'BCCEeIzygZ', 'api_token', ''),
(1, '2021-11-29 13:13:52', 'bmcy4tmhsp', 'session', 'edit_component'),
(1, '2021-11-29 13:56:14', 'BRYYX7a97X', 'session', 'edit_component'),
(1, '2021-11-29 13:24:46', 'cchMl1YamN', 'session', 'edit_user'),
(1, '2021-11-29 13:08:43', 'Cvr9PnGlnK', 'api_token', ''),
(1, '2021-12-07 10:06:00', 'D89C5F8xXl', 'session', 'create_bug'),
(1, '2021-12-07 09:56:14', 'DJPYurdv5h', 'session', 'edit_group'),
(1, '2021-11-29 13:25:12', 'E6agB5Pnjb', 'session', 'edit_user'),
(1, '2021-11-28 22:20:07', 'EatukXugaX', 'session', 'edit_parameters'),
(2, '2021-11-29 13:29:49', 'EJmq1KIYoH', 'api_token', ''),
(1, '2021-11-29 13:55:11', 'ejWwSwLCKY', 'session', 'delete_component'),
(1, '2021-11-29 13:56:26', 'FOfVVs9ujE', 'session', 'delete_component'),
(1, '2021-11-29 15:09:04', 'GD91rkhejU', 'session', 'edit_user'),
(2, '2021-12-12 13:40:58', 'GQFmyuaZ7A', 'api_token', ''),
(1, '2021-11-29 13:14:00', 'GXYzUYYHCC', 'session', 'edit_product'),
(2, '2021-11-29 15:06:06', 'hKeY9cDnyj', 'session', 'create_bug'),
(1, '2021-11-29 13:50:19', 'hpqmJSc4sP', 'session', 'edit_product'),
(1, '2021-12-12 13:20:00', 'hTWPcYBpe2', 'session', 'create_bug'),
(1, '2021-12-07 10:05:37', 'hWYYXSBXMb', 'session', 'create_bug'),
(1, '2021-12-16 10:56:05', 'i3GjKNPLYq', 'session', 'edit_user'),
(1, '2021-12-16 11:03:13', 'Iqw2jQb9pA', 'session', 'edit_product'),
(1, '2021-11-29 14:50:55', 'J65d7jZTk3', 'session', 'edit_user'),
(1, '2021-12-16 10:54:58', 'jcIODaRsXn', 'session', 'edit_group_controls'),
(1, '2021-12-07 09:55:35', 'jfxoCALQYw', 'session', 'edit_group'),
(1, '2021-12-07 10:02:01', 'jgUS9s4ZwP', 'session', 'edit_group'),
(1, '2021-11-29 13:39:01', 'JXVhTMY3at', 'session', 'edit_user'),
(1, '2021-11-29 13:59:02', 'KgRi3nKIaD', 'session', 'edit_parameters'),
(1, '2021-11-29 14:57:55', 'kpxaEsujYI', 'session', 'edit_user'),
(2, '2021-12-16 10:56:40', 'KpykWzwJiT', 'api_token', ''),
(1, '2021-11-29 14:54:06', 'KUCViivhw9', 'session', 'edit_user'),
(1, '2021-11-29 13:21:53', 'kYEOsBaWf5', 'session', 'edit_user'),
(1, '2021-11-29 13:29:10', 'Lh9FEQIC77', 'session', 'create_bug'),
(1, '2021-11-29 14:51:11', 'mbf72XLrOu', 'session', 'edit_product'),
(3, '2021-11-29 15:09:30', 'mMS3YRfY6T', 'session', 'create_bug'),
(1, '2021-11-29 15:07:50', 'muawImYXiw', 'session', 'edit_user_prefs'),
(1, '2021-11-29 15:07:53', 'n0J2fhCNOE', 'session', 'edit_user_prefs'),
(1, '2021-12-07 09:48:14', 'naMU1a9peY', 'session', 'edit_user'),
(1, '2021-11-29 15:09:14', 'nbxZaO3khT', 'session', 'create_bug'),
(1, '2021-12-07 09:54:58', 'Nl7LzVdQP1', 'session', 'add_group'),
(1, '2021-12-07 09:45:22', 'nxkX1OTauY', 'session', 'create_bug'),
(3, '2021-11-29 15:05:51', 'OD1FAvBF02', 'session', 'create_bug'),
(1, '2021-11-29 14:41:21', 'oluA8M17ZZ', 'session', 'workflow_comment'),
(1, '2021-11-29 14:52:35', 'ooMdxqtP0V', 'session', 'edit_group_controls'),
(1, '2021-11-29 13:55:08', 'OSmRyGCaWP', 'session', 'edit_component'),
(1, '2021-11-29 13:55:04', 'otcU0rRyIZ', 'session', 'edit_product'),
(1, '2021-11-29 13:56:07', 'oWkrGMlcyu', 'session', 'delete_component'),
(NULL, '2021-11-28 22:22:56', 'OXK9EzQlqN', 'account', 'loclocloc2320@gmail.com'),
(1, '2021-11-29 14:45:27', 'peA08QRNtU', 'session', 'edit_parameters'),
(1, '2021-11-29 13:23:34', 'pHX0joltB6', 'session', 'edit_group'),
(1, '2021-11-28 22:29:43', 'PitFAcAGvH', 'session', 'edit_parameters'),
(1, '2021-11-29 14:03:17', 'pZKebaLnBJ', 'session', 'edit_user'),
(1, '2021-12-07 10:06:40', 'QohW7A2vL4', 'session', 'edit_product'),
(1, '2021-12-07 10:10:25', 'QsxHCyXpFF', 'session', 'edit_product'),
(2, '2021-11-29 13:40:47', 'qYDCQ3o0xx', 'session', 'create_attachment'),
(1, '2021-11-29 15:07:42', 'rmqExV83ix', 'session', 'edit_user_prefs'),
(1, '2021-11-29 14:40:36', 'sbuJTBz4GC', 'session', 'workflow_edit'),
(1, '2021-11-28 22:29:41', 'Scys21GdRp', 'session', 'edit_parameters'),
(1, '2021-12-12 13:18:40', 'ssRwBi9mUp', 'session', 'edit_product'),
(1, '2021-11-29 14:57:12', 'sw5HOnF1Dl', 'session', 'edit_group'),
(1, '2021-11-29 15:06:51', 'tonsJ6XLsY', 'session', 'edit_user'),
(1, '2021-11-29 13:55:58', 'tZerwGGgxY', 'session', 'edit_product'),
(1, '2021-12-16 10:37:10', 'U6dKuzFaOM', 'session', 'edit_product'),
(1, '2021-11-29 14:45:38', 'ukOFKvsVEr', 'session', 'edit_parameters'),
(1, '2021-12-16 10:44:17', 'Vb3a2WC4ff', 'session', 'edit_product'),
(1, '2021-11-28 22:08:44', 'VkfSGBO7sJ', 'session', 'edit_parameters'),
(1, '2021-11-29 15:00:25', 'VyqeP5iGxZ', 'session', 'edit_group'),
(3, '2021-11-29 14:54:24', 'Wfk4NHgjhu', 'api_token', ''),
(1, '2021-12-12 13:17:25', 'Wi4xvXlWqh', 'api_token', ''),
(1, '2021-11-29 13:59:38', 'xIgLKqWi9k', 'session', 'edit_parameters'),
(1, '2021-11-29 14:00:00', 'XR02kiy5Tf', 'session', 'edit_product'),
(1, '2021-11-29 15:04:17', 'XR9WwVk1VW', 'session', 'edit_product'),
(1, '2021-11-29 14:53:14', 'XUlNHaK88z', 'session', 'edit_user'),
(1, '2021-11-29 13:47:05', 'yGYyKEUGV6', 'session', 'create_bug'),
(1, '2021-12-12 13:17:25', 'yidmrbM2Y8', 'session', 'create_bug'),
(1, '2021-11-29 13:26:27', 'YjIYi1uLoc', 'session', 'edit_group'),
(1, '2021-12-07 09:54:25', 'YsfpXyTtLf', 'session', 'edit_parameters'),
(3, '2021-11-29 15:00:54', 'YT5VXdYVrA', 'session', 'create_bug'),
(1, '2021-11-29 14:41:42', 'ytQYQvEB2B', 'session', 'workflow_edit'),
(1, '2021-11-29 14:00:02', 'YTz1AlIIy9', 'session', 'edit_component'),
(1, '2021-12-12 13:50:45', 'zFYZUFeGE6', 'session', 'edit_product'),
(1, '2021-11-29 13:54:02', 'zG1sB5Z8Ce', 'session', 'edit_component'),
(1, '2021-11-29 13:12:47', 'ZsBMO9fItf', 'session', 'edit_product');

-- --------------------------------------------------------

--
-- Table structure for table `ts_error`
--

DROP TABLE IF EXISTS `ts_error`;
CREATE TABLE IF NOT EXISTS `ts_error` (
  `error_time` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `funcid` int(11) NOT NULL DEFAULT '0',
  KEY `ts_error_funcid_idx` (`funcid`,`error_time`),
  KEY `ts_error_error_time_idx` (`error_time`),
  KEY `ts_error_jobid_idx` (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ts_exitstatus`
--

DROP TABLE IF EXISTS `ts_exitstatus`;
CREATE TABLE IF NOT EXISTS `ts_exitstatus` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `funcid` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) DEFAULT NULL,
  `completion_time` int(11) DEFAULT NULL,
  `delete_after` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  KEY `ts_exitstatus_funcid_idx` (`funcid`),
  KEY `ts_exitstatus_delete_after_idx` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ts_funcmap`
--

DROP TABLE IF EXISTS `ts_funcmap`;
CREATE TABLE IF NOT EXISTS `ts_funcmap` (
  `funcid` int(11) NOT NULL AUTO_INCREMENT,
  `funcname` varchar(255) NOT NULL,
  PRIMARY KEY (`funcid`),
  UNIQUE KEY `ts_funcmap_funcname_idx` (`funcname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ts_job`
--

DROP TABLE IF EXISTS `ts_job`;
CREATE TABLE IF NOT EXISTS `ts_job` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `funcid` int(11) NOT NULL,
  `arg` longblob,
  `uniqkey` varchar(255) DEFAULT NULL,
  `insert_time` int(11) DEFAULT NULL,
  `run_after` int(11) NOT NULL,
  `grabbed_until` int(11) NOT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `coalesce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  UNIQUE KEY `ts_job_funcid_idx` (`funcid`,`uniqkey`),
  KEY `ts_job_run_after_idx` (`run_after`,`funcid`),
  KEY `ts_job_coalesce_idx` (`coalesce`,`funcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ts_note`
--

DROP TABLE IF EXISTS `ts_note`;
CREATE TABLE IF NOT EXISTS `ts_note` (
  `jobid` int(11) NOT NULL,
  `notekey` varchar(255) DEFAULT NULL,
  `value` longblob,
  UNIQUE KEY `ts_note_jobid_idx` (`jobid`,`notekey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_api_keys`
--

DROP TABLE IF EXISTS `user_api_keys`;
CREATE TABLE IF NOT EXISTS `user_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `revoked` tinyint(4) NOT NULL DEFAULT '0',
  `last_used` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_keys_api_key_idx` (`api_key`),
  KEY `user_api_keys_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_group_map`
--

DROP TABLE IF EXISTS `user_group_map`;
CREATE TABLE IF NOT EXISTS `user_group_map` (
  `user_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  `isbless` tinyint(4) NOT NULL DEFAULT '0',
  `grant_type` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `user_group_map_user_id_idx` (`user_id`,`group_id`,`grant_type`,`isbless`),
  KEY `fk_user_group_map_group_id_groups_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_map`
--

INSERT INTO `user_group_map` (`user_id`, `group_id`, `isbless`, `grant_type`) VALUES
(1, 1, 0, 0),
(1, 1, 1, 0),
(1, 3, 0, 0),
(1, 8, 0, 2),
(2, 8, 0, 0),
(2, 8, 1, 0),
(2, 8, 0, 2),
(3, 8, 0, 2),
(4, 8, 0, 2),
(5, 8, 0, 2),
(3, 15, 0, 0),
(3, 15, 1, 0),
(5, 15, 0, 0),
(5, 15, 1, 0),
(2, 16, 0, 0),
(2, 16, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
CREATE TABLE IF NOT EXISTS `versions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `versions_product_id_idx` (`product_id`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `value`, `product_id`, `isactive`) VALUES
(1, 'unspecified', 1, 1),
(4, 'unspecified', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `watch`
--

DROP TABLE IF EXISTS `watch`;
CREATE TABLE IF NOT EXISTS `watch` (
  `watcher` mediumint(9) NOT NULL,
  `watched` mediumint(9) NOT NULL,
  UNIQUE KEY `watch_watcher_idx` (`watcher`,`watched`),
  KEY `watch_watched_idx` (`watched`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `whine_events`
--

DROP TABLE IF EXISTS `whine_events`;
CREATE TABLE IF NOT EXISTS `whine_events` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `owner_userid` mediumint(9) NOT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `body` mediumtext,
  `mailifnobugs` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_whine_events_owner_userid_profiles_userid` (`owner_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `whine_queries`
--

DROP TABLE IF EXISTS `whine_queries`;
CREATE TABLE IF NOT EXISTS `whine_queries` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) NOT NULL,
  `query_name` varchar(64) NOT NULL DEFAULT '',
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `onemailperbug` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `whine_queries_eventid_idx` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `whine_schedules`
--

DROP TABLE IF EXISTS `whine_schedules`;
CREATE TABLE IF NOT EXISTS `whine_schedules` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) NOT NULL,
  `run_day` varchar(32) DEFAULT NULL,
  `run_time` varchar(32) DEFAULT NULL,
  `run_next` datetime DEFAULT NULL,
  `mailto` mediumint(9) NOT NULL,
  `mailto_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `whine_schedules_run_next_idx` (`run_next`),
  KEY `whine_schedules_eventid_idx` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bugs_fulltext`
--
ALTER TABLE `bugs_fulltext` ADD FULLTEXT KEY `bugs_fulltext_short_desc_idx` (`short_desc`);
ALTER TABLE `bugs_fulltext` ADD FULLTEXT KEY `bugs_fulltext_comments_idx` (`comments`);
ALTER TABLE `bugs_fulltext` ADD FULLTEXT KEY `bugs_fulltext_comments_noprivate_idx` (`comments_noprivate`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `fk_attachments_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_attachments_submitter_id_profiles_userid` FOREIGN KEY (`submitter_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `attach_data`
--
ALTER TABLE `attach_data`
  ADD CONSTRAINT `fk_attach_data_id_attachments_attach_id` FOREIGN KEY (`id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_audit_log_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `bugs`
--
ALTER TABLE `bugs`
  ADD CONSTRAINT `fk_bugs_assigned_to_profiles_userid` FOREIGN KEY (`assigned_to`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_qa_contact_profiles_userid` FOREIGN KEY (`qa_contact`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_reporter_profiles_userid` FOREIGN KEY (`reporter`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `bugs_activity`
--
ALTER TABLE `bugs_activity`
  ADD CONSTRAINT `fk_bugs_activity_attach_id_attachments_attach_id` FOREIGN KEY (`attach_id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_fieldid_fielddefs_id` FOREIGN KEY (`fieldid`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `bugs_aliases`
--
ALTER TABLE `bugs_aliases`
  ADD CONSTRAINT `fk_bugs_aliases_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bugs_fulltext`
--
ALTER TABLE `bugs_fulltext`
  ADD CONSTRAINT `fk_bugs_fulltext_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_group_map`
--
ALTER TABLE `bug_group_map`
  ADD CONSTRAINT `fk_bug_group_map_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bug_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_see_also`
--
ALTER TABLE `bug_see_also`
  ADD CONSTRAINT `fk_bug_see_also_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_tag`
--
ALTER TABLE `bug_tag`
  ADD CONSTRAINT `fk_bug_tag_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bug_tag_tag_id_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_user_last_visit`
--
ALTER TABLE `bug_user_last_visit`
  ADD CONSTRAINT `fk_bug_user_last_visit_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bug_user_last_visit_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_group_map`
--
ALTER TABLE `category_group_map`
  ADD CONSTRAINT `fk_category_group_map_category_id_series_categories_id` FOREIGN KEY (`category_id`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cc`
--
ALTER TABLE `cc`
  ADD CONSTRAINT `fk_cc_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cc_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `components`
--
ALTER TABLE `components`
  ADD CONSTRAINT `fk_components_initialowner_profiles_userid` FOREIGN KEY (`initialowner`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_components_initialqacontact_profiles_userid` FOREIGN KEY (`initialqacontact`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_components_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `component_cc`
--
ALTER TABLE `component_cc`
  ADD CONSTRAINT `fk_component_cc_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_component_cc_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dependencies`
--
ALTER TABLE `dependencies`
  ADD CONSTRAINT `fk_dependencies_blocked_bugs_bug_id` FOREIGN KEY (`blocked`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dependencies_dependson_bugs_bug_id` FOREIGN KEY (`dependson`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duplicates`
--
ALTER TABLE `duplicates`
  ADD CONSTRAINT `fk_duplicates_dupe_bugs_bug_id` FOREIGN KEY (`dupe`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_duplicates_dupe_of_bugs_bug_id` FOREIGN KEY (`dupe_of`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_bug_ignore`
--
ALTER TABLE `email_bug_ignore`
  ADD CONSTRAINT `fk_email_bug_ignore_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_email_bug_ignore_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_setting`
--
ALTER TABLE `email_setting`
  ADD CONSTRAINT `fk_email_setting_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fielddefs`
--
ALTER TABLE `fielddefs`
  ADD CONSTRAINT `fk_fielddefs_value_field_id_fielddefs_id` FOREIGN KEY (`value_field_id`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fielddefs_visibility_field_id_fielddefs_id` FOREIGN KEY (`visibility_field_id`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `field_visibility`
--
ALTER TABLE `field_visibility`
  ADD CONSTRAINT `fk_field_visibility_field_id_fielddefs_id` FOREIGN KEY (`field_id`) REFERENCES `fielddefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flagexclusions`
--
ALTER TABLE `flagexclusions`
  ADD CONSTRAINT `fk_flagexclusions_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flagexclusions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flagexclusions_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flaginclusions`
--
ALTER TABLE `flaginclusions`
  ADD CONSTRAINT `fk_flaginclusions_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flaginclusions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flaginclusions_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flags`
--
ALTER TABLE `flags`
  ADD CONSTRAINT `fk_flags_attach_id_attachments_attach_id` FOREIGN KEY (`attach_id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_requestee_id_profiles_userid` FOREIGN KEY (`requestee_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_setter_id_profiles_userid` FOREIGN KEY (`setter_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flagtypes`
--
ALTER TABLE `flagtypes`
  ADD CONSTRAINT `fk_flagtypes_grant_group_id_groups_id` FOREIGN KEY (`grant_group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flagtypes_request_group_id_groups_id` FOREIGN KEY (`request_group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `group_control_map`
--
ALTER TABLE `group_control_map`
  ADD CONSTRAINT `fk_group_control_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_group_control_map_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_group_map`
--
ALTER TABLE `group_group_map`
  ADD CONSTRAINT `fk_group_group_map_grantor_id_groups_id` FOREIGN KEY (`grantor_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_group_group_map_member_id_groups_id` FOREIGN KEY (`member_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keywords`
--
ALTER TABLE `keywords`
  ADD CONSTRAINT `fk_keywords_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_keywords_keywordid_keyworddefs_id` FOREIGN KEY (`keywordid`) REFERENCES `keyworddefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logincookies`
--
ALTER TABLE `logincookies`
  ADD CONSTRAINT `fk_logincookies_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_failure`
--
ALTER TABLE `login_failure`
  ADD CONSTRAINT `fk_login_failure_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `longdescs`
--
ALTER TABLE `longdescs`
  ADD CONSTRAINT `fk_longdescs_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_longdescs_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `longdescs_tags`
--
ALTER TABLE `longdescs_tags`
  ADD CONSTRAINT `fk_longdescs_tags_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `longdescs_tags_activity`
--
ALTER TABLE `longdescs_tags_activity`
  ADD CONSTRAINT `fk_longdescs_tags_activity_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_longdescs_tags_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `milestones`
--
ALTER TABLE `milestones`
  ADD CONSTRAINT `fk_milestones_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `namedqueries`
--
ALTER TABLE `namedqueries`
  ADD CONSTRAINT `fk_namedqueries_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `namedqueries_link_in_footer`
--
ALTER TABLE `namedqueries_link_in_footer`
  ADD CONSTRAINT `fk_namedqueries_link_in_footer_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_namedqueries_link_in_footer_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `namedquery_group_map`
--
ALTER TABLE `namedquery_group_map`
  ADD CONSTRAINT `fk_namedquery_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_namedquery_group_map_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_classification_id_classifications_id` FOREIGN KEY (`classification_id`) REFERENCES `classifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profiles_activity`
--
ALTER TABLE `profiles_activity`
  ADD CONSTRAINT `fk_profiles_activity_fieldid_fielddefs_id` FOREIGN KEY (`fieldid`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profiles_activity_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profiles_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `profile_search`
--
ALTER TABLE `profile_search`
  ADD CONSTRAINT `fk_profile_search_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_setting`
--
ALTER TABLE `profile_setting`
  ADD CONSTRAINT `fk_profile_setting_setting_name_setting_name` FOREIGN KEY (`setting_name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profile_setting_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quips`
--
ALTER TABLE `quips`
  ADD CONSTRAINT `fk_quips_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `fk_series_category_series_categories_id` FOREIGN KEY (`category`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_series_creator_profiles_userid` FOREIGN KEY (`creator`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_series_subcategory_series_categories_id` FOREIGN KEY (`subcategory`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `series_data`
--
ALTER TABLE `series_data`
  ADD CONSTRAINT `fk_series_data_series_id_series_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `setting_value`
--
ALTER TABLE `setting_value`
  ADD CONSTRAINT `fk_setting_value_name_setting_name` FOREIGN KEY (`name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status_workflow`
--
ALTER TABLE `status_workflow`
  ADD CONSTRAINT `fk_status_workflow_new_status_bug_status_id` FOREIGN KEY (`new_status`) REFERENCES `bug_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_status_workflow_old_status_bug_status_id` FOREIGN KEY (`old_status`) REFERENCES `bug_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `fk_tag_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `fk_tokens_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_api_keys`
--
ALTER TABLE `user_api_keys`
  ADD CONSTRAINT `fk_user_api_keys_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_group_map`
--
ALTER TABLE `user_group_map`
  ADD CONSTRAINT `fk_user_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_group_map_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `versions`
--
ALTER TABLE `versions`
  ADD CONSTRAINT `fk_versions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `watch`
--
ALTER TABLE `watch`
  ADD CONSTRAINT `fk_watch_watched_profiles_userid` FOREIGN KEY (`watched`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_watch_watcher_profiles_userid` FOREIGN KEY (`watcher`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whine_events`
--
ALTER TABLE `whine_events`
  ADD CONSTRAINT `fk_whine_events_owner_userid_profiles_userid` FOREIGN KEY (`owner_userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whine_queries`
--
ALTER TABLE `whine_queries`
  ADD CONSTRAINT `fk_whine_queries_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whine_schedules`
--
ALTER TABLE `whine_schedules`
  ADD CONSTRAINT `fk_whine_schedules_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
