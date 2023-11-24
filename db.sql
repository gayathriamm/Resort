/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - resort
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`resort` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `resort`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add booking_table',7,'add_booking_table'),
(26,'Can change booking_table',7,'change_booking_table'),
(27,'Can delete booking_table',7,'delete_booking_table'),
(28,'Can view booking_table',7,'view_booking_table'),
(29,'Can add login_table',8,'add_login_table'),
(30,'Can change login_table',8,'change_login_table'),
(31,'Can delete login_table',8,'delete_login_table'),
(32,'Can view login_table',8,'view_login_table'),
(33,'Can add resort_table',9,'add_resort_table'),
(34,'Can change resort_table',9,'change_resort_table'),
(35,'Can delete resort_table',9,'delete_resort_table'),
(36,'Can view resort_table',9,'view_resort_table'),
(37,'Can add user_table',10,'add_user_table'),
(38,'Can change user_table',10,'change_user_table'),
(39,'Can delete user_table',10,'delete_user_table'),
(40,'Can view user_table',10,'view_user_table'),
(41,'Can add room_table',11,'add_room_table'),
(42,'Can change room_table',11,'change_room_table'),
(43,'Can delete room_table',11,'delete_room_table'),
(44,'Can view room_table',11,'view_room_table'),
(45,'Can add rating_table',12,'add_rating_table'),
(46,'Can change rating_table',12,'change_rating_table'),
(47,'Can delete rating_table',12,'delete_rating_table'),
(48,'Can view rating_table',12,'view_rating_table'),
(49,'Can add payment_table',13,'add_payment_table'),
(50,'Can change payment_table',13,'change_payment_table'),
(51,'Can delete payment_table',13,'delete_payment_table'),
(52,'Can view payment_table',13,'view_payment_table'),
(53,'Can add facilities_table',14,'add_facilities_table'),
(54,'Can change facilities_table',14,'change_facilities_table'),
(55,'Can delete facilities_table',14,'delete_facilities_table'),
(56,'Can view facilities_table',14,'view_facilities_table'),
(57,'Can add complaint_table',15,'add_complaint_table'),
(58,'Can change complaint_table',15,'change_complaint_table'),
(59,'Can delete complaint_table',15,'delete_complaint_table'),
(60,'Can view complaint_table',15,'view_complaint_table'),
(61,'Can add chat_table',16,'add_chat_table'),
(62,'Can change chat_table',16,'change_chat_table'),
(63,'Can delete chat_table',16,'delete_chat_table'),
(64,'Can view chat_table',16,'view_chat_table'),
(65,'Can add location',17,'add_location'),
(66,'Can change location',17,'change_location'),
(67,'Can delete location',17,'delete_location'),
(68,'Can view location',17,'view_location'),
(69,'Can add roomalocation_table',18,'add_roomalocation_table'),
(70,'Can change roomalocation_table',18,'change_roomalocation_table'),
(71,'Can delete roomalocation_table',18,'delete_roomalocation_table'),
(72,'Can view roomalocation_table',18,'view_roomalocation_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$OB2IicnCGxJBUgFtOxGDiT$Jly6AzxrXZ2dEt5jf6tAuyiGuy0mBC5z2xuTO2FmgAM=','2023-11-19 10:15:58.291979',1,'admin','','','admin@gmail.com',1,1,'2023-11-10 08:41:08.354813');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'sapp','booking_table'),
(16,'sapp','chat_table'),
(15,'sapp','complaint_table'),
(14,'sapp','facilities_table'),
(17,'sapp','location'),
(8,'sapp','login_table'),
(13,'sapp','payment_table'),
(12,'sapp','rating_table'),
(9,'sapp','resort_table'),
(11,'sapp','room_table'),
(18,'sapp','roomalocation_table'),
(10,'sapp','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-11-06 16:02:18.953479'),
(2,'auth','0001_initial','2023-11-06 16:02:20.015954'),
(3,'admin','0001_initial','2023-11-06 16:02:21.187798'),
(4,'admin','0002_logentry_remove_auto_add','2023-11-06 16:02:21.203423'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-11-06 16:02:21.219048'),
(6,'contenttypes','0002_remove_content_type_name','2023-11-06 16:02:21.390918'),
(7,'auth','0002_alter_permission_name_max_length','2023-11-06 16:02:21.500290'),
(8,'auth','0003_alter_user_email_max_length','2023-11-06 16:02:21.547164'),
(9,'auth','0004_alter_user_username_opts','2023-11-06 16:02:21.562789'),
(10,'auth','0005_alter_user_last_login_null','2023-11-06 16:02:21.656537'),
(11,'auth','0006_require_contenttypes_0002','2023-11-06 16:02:21.656537'),
(12,'auth','0007_alter_validators_add_error_messages','2023-11-06 16:02:21.672168'),
(13,'auth','0008_alter_user_username_max_length','2023-11-06 16:02:21.765912'),
(14,'auth','0009_alter_user_last_name_max_length','2023-11-06 16:02:21.875285'),
(15,'auth','0010_alter_group_name_max_length','2023-11-06 16:02:21.906531'),
(16,'auth','0011_update_proxy_permissions','2023-11-06 16:02:21.922158'),
(17,'auth','0012_alter_user_first_name_max_length','2023-11-06 16:02:22.031527'),
(18,'sapp','0001_initial','2023-11-06 16:02:23.547114'),
(19,'sessions','0001_initial','2023-11-06 16:02:23.687738'),
(20,'sapp','0002_rating_table_feedback','2023-11-06 16:49:10.429823'),
(21,'sapp','0003_chat_table','2023-11-06 23:00:55.477939'),
(22,'sapp','0004_user_table_image','2023-11-06 23:57:59.281707'),
(23,'sapp','0005_location','2023-11-07 23:33:26.442635'),
(24,'sapp','0006_alter_location_latitude','2023-11-07 23:34:47.791338'),
(25,'sapp','0007_delete_location','2023-11-07 23:41:56.528713'),
(26,'sapp','0008_auto_20231109_1606','2023-11-10 00:07:00.942529'),
(27,'sapp','0009_auto_20231109_1616','2023-11-10 00:16:55.643231'),
(28,'sapp','0010_remove_booking_table_nohours','2023-11-10 07:52:23.841392'),
(29,'sapp','0011_auto_20231110_1525','2023-11-10 09:55:22.395502');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('62pgtdt4wwqkylxuhn1s0gto8jlncz6e','eyJsaWQiOjF9:1r1JBB:rxV8kPxEQy324rqEqD4pUjQYMAWiv8wrdTbnhwB77Bc','2023-11-24 04:31:37.467661'),
('8uu846xh6eu6ipjewy0mpdq99tf8gzi8','eyJsaWQiOjF9:1r1CRD:2lwx1tmtaMqMveJXTuGbwVrGqnVLikdTuQeqq4aP7mo','2023-11-23 21:19:43.643322'),
('at7834dtt6v7rmauubstc5m25v1k61hl','eyJsaWQiOjF9:1r03Ee:TsCcMyNbHH_2_OexPRV60SgqxioDcdhYaKeRDp1DzjM','2023-11-20 17:18:00.698891'),
('it61j98w8ugaiauj26yc7cqvss7lapwy','eyJsaWQiOjF9:1r1AdG:KrqV8fZdMKhNXOm5np8StqTSq64FLp9aXqAQUNLmz5w','2023-11-23 19:24:02.409156'),
('jq299d5fzy6y8uh0wcpabv9e6lhk83oc','eyJsaWQiOjJ9:1r04MA:PmxAgkmPjU6IVSMHnLWVX9xVjjxMIKeMaElxQNQ6dUU','2023-11-20 18:29:50.591437'),
('olnwrrdl1slnik68uj7i9zvfp2ohqs4o','.eJxVjrsOwyAUQ_-FOUK8wqNj934DusClSRMFKSRT1X8vSBnazbKPLb-Jh_OY_Flx93MiN8LJ8OsFiAtuPUgv2J6FxrId-xxoR-iVVvooCdf7xf4NTFCn1g5OInAtnDbRWmSSZwnS8iSMU4GhYTaOo1YoDJcgEtPKppiFa0hmmrXRtf8TAwmlLF1y-fkCQoM8gA:1r1PGI:b7_QSbxwGtpZ1MFTSZ_PjB2XFQZn_EwnqiesLkDhy1M','2023-11-24 11:01:18.784331'),
('ripvkwpwuetiilrxhiqu7eoaj6hs44m4','eyJsaWQiOjEsInJpZCI6NSwiZmlkIjozfQ:1r0baq:5T_x73i00Zi8GYWbO3C2FH8S7cTnJEF2KQ0nnNHphEY','2023-11-22 05:59:12.966526'),
('rs8bf0tgllmoxtj10k3kr5uhjkujtbso','.eJxVjssOwiAURP-FtSG8ysOle7-BXOAi1YYmpV0Z_11IutDtnDOTeRMPx1780XDzcyJXwsnlNwsQX1gHSE-oj5XGte7bHOhQ6Ekbva8Jl9vp_g0UaKW3g5MIXAunTbQWmeRZgrQ8CeNUYGiYjdOkFQrDJYjEtLIpZuG6kplmfXQZ_8TnC4EZOPo:1r4eqM:Kqad1llaQruZyWSGyACStHQM9Mm72LrCK9fcEVIa27s','2023-12-03 10:15:58.297024'),
('sk447vvnbmj4tf1xnp3pihrqj829gh65','eyJsaWQiOjF9:1r1Jbd:MFASn_dkqBkTlcQ8rU61mz4iA6xDbeeVrX4cZeoB1Pw','2023-11-24 04:58:57.255200'),
('tqunl4s07xeeacn90l3ytbotms2oehxa','eyJsaWQiOjUsInJpZCI6NX0:1r1MMC:V9qh4AhvXPr3JX4tujIJPi7MDwqwgXh2nMZemMPvwoE','2023-11-24 07:55:12.092156'),
('va5odid50z0eae2aobqrs78126diel8d','eyJsaWQiOjF9:1r1J3d:d5SVQptTdLCnanvi94X0aouXWRovHAWa0lgjTUJ1JBs','2023-11-24 04:23:49.827322'),
('z19k355klujvsas2aiizd8ib26dz1n89','eyJsaWQiOjF9:1r1Mqh:yjhI2P7z1uywkTnnHss950l7u44I-MmWTtsefthmHas','2023-11-24 08:26:43.207695');

/*Table structure for table `sapp_booking_table` */

DROP TABLE IF EXISTS `sapp_booking_table`;

CREATE TABLE `sapp_booking_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(90) NOT NULL,
  `date` date NOT NULL,
  `RESORT_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_booking_table_RESORT_id_0d3f0100_fk_sapp_resort_table_id` (`RESORT_id`),
  KEY `sapp_booking_table_USER_id_61a87290_fk_sapp_user_table_id` (`USER_id`),
  CONSTRAINT `sapp_booking_table_RESORT_id_0d3f0100_fk_sapp_resort_table_id` FOREIGN KEY (`RESORT_id`) REFERENCES `sapp_resort_table` (`id`),
  CONSTRAINT `sapp_booking_table_USER_id_61a87290_fk_sapp_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `sapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_booking_table` */

insert  into `sapp_booking_table`(`id`,`status`,`date`,`RESORT_id`,`USER_id`) values 
(26,'PAID','2023-11-19',1,6),
(27,'PAID','2023-11-19',1,5),
(28,'accept','2023-11-19',1,3),
(29,'PAID','2023-11-19',2,6),
(30,'accept','2023-11-19',2,6),
(31,'accept','2023-11-19',1,6),
(32,'accept','2023-11-19',1,6);

/*Table structure for table `sapp_chat_table` */

DROP TABLE IF EXISTS `sapp_chat_table`;

CREATE TABLE `sapp_chat_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(90) NOT NULL,
  `date` date NOT NULL,
  `fromid_id` bigint NOT NULL,
  `toid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_chat_table_fromid_id_cde1090b_fk_sapp_login_table_id` (`fromid_id`),
  KEY `sapp_chat_table_toid_id_fcced9c9_fk_sapp_login_table_id` (`toid_id`),
  CONSTRAINT `sapp_chat_table_fromid_id_cde1090b_fk_sapp_login_table_id` FOREIGN KEY (`fromid_id`) REFERENCES `sapp_login_table` (`id`),
  CONSTRAINT `sapp_chat_table_toid_id_fcced9c9_fk_sapp_login_table_id` FOREIGN KEY (`toid_id`) REFERENCES `sapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_chat_table` */

insert  into `sapp_chat_table`(`id`,`message`,`date`,`fromid_id`,`toid_id`) values 
(1,'hai','2023-11-06',2,3),
(2,'hello','2023-11-05',6,5),
(3,'vgf','2023-11-09',6,3),
(4,'vgf','2023-11-09',6,3),
(5,'vgf','2023-11-09',6,3),
(6,'jghg','2023-12-06',3,6),
(7,'g','2023-11-09',6,3),
(8,'hi','2023-11-10',6,3),
(9,'hi','2023-11-10',6,2),
(10,'hi','2023-11-10',6,2),
(11,'hi','2023-11-10',6,2),
(12,'hi','2023-11-10',6,2),
(13,'hi','2023-11-10',6,2),
(14,'hi','2023-11-10',2,6),
(15,'hi','2023-11-10',2,6),
(16,'hlo','2023-11-10',2,3),
(17,'HLO','2023-11-11',2,3),
(18,'hi','2023-11-11',9,1),
(19,'hi','2023-11-11',9,1),
(20,'hii','2023-11-11',2,9),
(21,'hiii','2023-11-11',2,9),
(22,'hlo','2023-11-11',9,1),
(23,'sryhfhfbf','2023-11-11',9,2),
(24,'hi','2023-11-11',9,1),
(25,'hi','2023-11-11',9,1),
(26,'hi','2023-11-11',9,1),
(27,'hi','2023-11-11',9,1),
(28,'hlo','2023-11-11',9,1),
(29,'hloi','2023-11-11',9,1),
(30,'hloi','2023-11-11',9,1),
(31,'hloi','2023-11-11',9,1),
(32,'hloi','2023-11-11',9,1),
(33,'hloi','2023-11-11',9,1),
(34,'hloi','2023-11-11',9,1),
(35,'fgh','2023-11-11',9,2),
(36,'gggg','2023-11-11',2,9),
(37,'gu','2023-11-11',9,2),
(38,'gu','2023-11-11',9,2),
(39,'ft','2023-11-11',9,2),
(40,'ok','2023-11-11',2,9),
(41,'hi','2023-11-11',3,2),
(42,'hi','2023-11-12',9,2),
(43,'hlo','2023-11-18',5,3),
(44,'hi','2023-11-18',3,2),
(45,'night','2023-11-18',3,2),
(46,'hi','2023-11-19',12,2),
(47,'hi','2023-11-19',12,5),
(48,'hi','2023-11-19',12,5),
(49,'hi','2023-11-19',5,9),
(50,'hi','2023-11-19',12,2),
(51,'hi','2023-11-19',12,2),
(52,'hlo','2023-11-19',12,2),
(53,'hlo','2023-11-19',12,2),
(54,'hi','2023-11-19',2,9),
(55,'hlo','2023-11-19',2,9),
(56,'ff','2023-11-19',12,2),
(57,'jll','2023-11-19',2,9),
(58,'fgg','2023-11-19',12,2),
(59,'ok','2023-11-19',2,12);

/*Table structure for table `sapp_complaint_table` */

DROP TABLE IF EXISTS `sapp_complaint_table`;

CREATE TABLE `sapp_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `compaint` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(500) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_complaint_table_USER_id_9cee254e_fk_sapp_user_table_id` (`USER_id`),
  CONSTRAINT `sapp_complaint_table_USER_id_9cee254e_fk_sapp_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `sapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_complaint_table` */

insert  into `sapp_complaint_table`(`id`,`compaint`,`date`,`reply`,`USER_id`) values 
(1,'Fesility issues','2023-11-06','ok fine',1),
(2,'','2023-11-09','hh',2),
(3,'hhh','2023-11-10','pending',2),
(4,'bad','2023-11-11','pending',3),
(5,'good','2023-11-18','pending',1);

/*Table structure for table `sapp_facilities_table` */

DROP TABLE IF EXISTS `sapp_facilities_table`;

CREATE TABLE `sapp_facilities_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `facilities` longtext NOT NULL,
  `RESORT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_facilities_table_RESORT_id_06e86106_fk_sapp_resort_table_id` (`RESORT_id`),
  CONSTRAINT `sapp_facilities_table_RESORT_id_06e86106_fk_sapp_resort_table_id` FOREIGN KEY (`RESORT_id`) REFERENCES `sapp_resort_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_facilities_table` */

insert  into `sapp_facilities_table`(`id`,`image`,`facilities`,`RESORT_id`) values 
(2,'bnnr.jpg','Swimming pool ',1),
(3,'bnnr.jpg','Medical store facilities',1),
(4,'bnnr.jpg','Swimming pool ',1),
(6,'bnnr.jpg','Swimming pools',1);

/*Table structure for table `sapp_login_table` */

DROP TABLE IF EXISTS `sapp_login_table`;

CREATE TABLE `sapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `type` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_login_table` */

insert  into `sapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin@12345A','admin'),
(2,'green','green@123456A','Resort'),
(3,'aks','aks','user'),
(5,'mi','mithra@1234A','Resort'),
(6,'aksss','aksss','user'),
(7,'akhila','akhila@123A','Resort'),
(8,'','','Blocked'),
(9,'gayathri ','gayathri','user'),
(11,'ambika','ambika123','user'),
(12,'gayathri','gayathri18','user');

/*Table structure for table `sapp_payment_table` */

DROP TABLE IF EXISTS `sapp_payment_table`;

CREATE TABLE `sapp_payment_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` time(6) NOT NULL,
  `payment` double NOT NULL,
  `date` date NOT NULL,
  `BOOKING_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_payment_table_BOOKING_id_b1cb692d_fk_sapp_booking_table_id` (`BOOKING_id`),
  CONSTRAINT `sapp_payment_table_BOOKING_id_b1cb692d_fk_sapp_booking_table_id` FOREIGN KEY (`BOOKING_id`) REFERENCES `sapp_booking_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_payment_table` */

insert  into `sapp_payment_table`(`id`,`time`,`payment`,`date`,`BOOKING_id`) values 
(9,'11:28:17.214441',1000,'2023-11-19',26),
(10,'11:29:48.344068',1000,'2023-11-19',26),
(11,'13:31:26.887218',1000,'2023-11-19',27),
(12,'15:01:56.191140',1000,'2023-11-19',29);

/*Table structure for table `sapp_rating_table` */

DROP TABLE IF EXISTS `sapp_rating_table`;

CREATE TABLE `sapp_rating_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL,
  `date` date NOT NULL,
  `RESORT_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  `feedback` varchar(90) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_rating_table_RESORT_id_7a36049b_fk_sapp_resort_table_id` (`RESORT_id`),
  KEY `sapp_rating_table_USER_id_c0679e21_fk_sapp_user_table_id` (`USER_id`),
  CONSTRAINT `sapp_rating_table_RESORT_id_7a36049b_fk_sapp_resort_table_id` FOREIGN KEY (`RESORT_id`) REFERENCES `sapp_resort_table` (`id`),
  CONSTRAINT `sapp_rating_table_USER_id_c0679e21_fk_sapp_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `sapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_rating_table` */

insert  into `sapp_rating_table`(`id`,`rate`,`date`,`RESORT_id`,`USER_id`,`feedback`) values 
(1,6,'2023-11-06',1,1,'Good'),
(2,3,'2023-11-05',2,1,'Bad'),
(3,2,'2023-11-10',2,2,'chhbxdg\n'),
(4,0,'2023-11-11',1,3,'6'),
(5,0,'2023-11-11',1,3,'6');

/*Table structure for table `sapp_resort_table` */

DROP TABLE IF EXISTS `sapp_resort_table`;

CREATE TABLE `sapp_resort_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resortname` varchar(90) NOT NULL,
  `place` varchar(90) NOT NULL,
  `image` varchar(100) NOT NULL,
  `post` varchar(90) NOT NULL,
  `pin` int NOT NULL,
  `lattitude` double NOT NULL,
  `longitude` double NOT NULL,
  `email` varchar(90) NOT NULL,
  `phone` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_resort_table_LOGIN_id_0fc5c20e_fk_sapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `sapp_resort_table_LOGIN_id_0fc5c20e_fk_sapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `sapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_resort_table` */

insert  into `sapp_resort_table`(`id`,`resortname`,`place`,`image`,`post`,`pin`,`lattitude`,`longitude`,`email`,`phone`,`LOGIN_id`) values 
(1,'Green','Wayanad','libbb.jpg','Wayanad',674536,11.258809,75.7952727,'green@gmail.com',9188796329,2),
(2,'Mizhi','kozhikkode','bnnr.jpg','vatakara',673106,11.258809,75.7952727,'mi@gmail.com',9678382929,5),
(3,'yoyo turf','tgtrgrtg','outdoor-luxury-hotel-water-sea.jpg','gtrgrt',898989,11.258809,75.7952727,'yoyo@gmail.com',9876545644,7);

/*Table structure for table `sapp_room_table` */

DROP TABLE IF EXISTS `sapp_room_table`;

CREATE TABLE `sapp_room_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` varchar(90) NOT NULL,
  `image` varchar(100) NOT NULL,
  `roomno` varchar(90) NOT NULL,
  `type` varchar(90) NOT NULL,
  `rate` double NOT NULL,
  `RESORT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_room_table_RESORT_id_cec6ab51_fk_sapp_resort_table_id` (`RESORT_id`),
  CONSTRAINT `sapp_room_table_RESORT_id_cec6ab51_fk_sapp_resort_table_id` FOREIGN KEY (`RESORT_id`) REFERENCES `sapp_resort_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_room_table` */

insert  into `sapp_room_table`(`id`,`status`,`image`,`roomno`,`type`,`rate`,`RESORT_id`) values 
(5,'bb','updt_mYq6sxT.jpg','34','ac',34,1),
(12,'b','01_CozyHotelLibraries__BakersCayResort_1-Costland-hilton-bakers-cay-124_bF1VccU.jpg','1','c',2000,2),
(13,'a','01_CozyHotelLibraries__BakersCayResort_1-Costland-hilton-bakers-cay-124_tcdQb1W.jpg','35','b',900,2);

/*Table structure for table `sapp_roomalocation_table` */

DROP TABLE IF EXISTS `sapp_roomalocation_table`;

CREATE TABLE `sapp_roomalocation_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `BOOKING_id` bigint NOT NULL,
  `ROOM_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_roomalocation_t_BOOKING_id_0a159fc0_fk_sapp_book` (`BOOKING_id`),
  KEY `sapp_roomalocation_table_ROOM_id_403f4703_fk_sapp_room_table_id` (`ROOM_id`),
  CONSTRAINT `sapp_roomalocation_t_BOOKING_id_0a159fc0_fk_sapp_book` FOREIGN KEY (`BOOKING_id`) REFERENCES `sapp_booking_table` (`id`),
  CONSTRAINT `sapp_roomalocation_table_ROOM_id_403f4703_fk_sapp_room_table_id` FOREIGN KEY (`ROOM_id`) REFERENCES `sapp_room_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_roomalocation_table` */

insert  into `sapp_roomalocation_table`(`id`,`date`,`BOOKING_id`,`ROOM_id`) values 
(7,'2023-11-19',26,5),
(11,'2023-11-19',32,5);

/*Table structure for table `sapp_user_table` */

DROP TABLE IF EXISTS `sapp_user_table`;

CREATE TABLE `sapp_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(90) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(90) NOT NULL,
  `post` varchar(90) NOT NULL,
  `pin` int NOT NULL,
  `email` varchar(90) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sapp_user_table_LOGIN_id_da88de14_fk_sapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `sapp_user_table_LOGIN_id_da88de14_fk_sapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `sapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sapp_user_table` */

insert  into `sapp_user_table`(`id`,`username`,`phone`,`place`,`post`,`pin`,`email`,`LOGIN_id`,`image`) values 
(1,'akss',9876545678,'kzd','kzd',987678,'aks@gmail.com',3,'img'),
(2,'Akshaya ',9485638968,'Kozhikode ','vatakara',673106,'akss@gmail.com',6,'IMG-20231107-WA0000.jpg'),
(3,'Gayathri',7025233427,'palakkad','pattambi',679304,'gayathriunnikrishna@gmail.com',9,'IMG_20231111_113129.jpg'),
(5,'ambika',7025233427,'chembra ','chembra',679304,'gayathriunnikrishnan18@gmail.com',11,'IMG-20231115-WA0000.jpg'),
(6,'gayathri ',7025233427,'Chembra ','chembra',679304,'gayathriunnikrishnan18@gmail.com',12,'IMG-20231117-WA0001.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
