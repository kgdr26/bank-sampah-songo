/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 11.8.3-MariaDB-ubu2404 : Database - db_bank_sampah_songo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_bank_sampah_songo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `db_bank_sampah_songo`;

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

/*Table structure for table `cache_locks` */

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache_locks` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `job_batches` */

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `job_batches` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1);

/*Table structure for table `mst_anggota` */

DROP TABLE IF EXISTS `mst_anggota`;

CREATE TABLE `mst_anggota` (
  `msa_id` int(11) NOT NULL AUTO_INCREMENT,
  `msa_user_id` int(11) DEFAULT NULL,
  `msa_norek` varchar(255) DEFAULT NULL,
  `msa_name` varchar(255) DEFAULT NULL,
  `msa_no_tlp` varchar(255) DEFAULT NULL,
  `msa_alamat` text DEFAULT NULL,
  `msa_created_by` int(11) DEFAULT NULL,
  `msa_created_date` datetime DEFAULT NULL,
  `msa_updated_by` int(11) DEFAULT NULL,
  `msa_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`msa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `mst_anggota` */

insert  into `mst_anggota`(`msa_id`,`msa_user_id`,`msa_norek`,`msa_name`,`msa_no_tlp`,`msa_alamat`,`msa_created_by`,`msa_created_date`,`msa_updated_by`,`msa_updated_date`) values 
(1,NULL,'09102026010001','Winarto (Zaki)',NULL,NULL,1,'2026-01-23 00:11:22',NULL,NULL),
(2,NULL,'09102026010002','Mamah Chika','081574986031','Blok Eb 5 no.9',1,'2026-01-23 00:11:56',1,'2026-01-25 03:28:18'),
(3,NULL,'09102026010003','Mamah Pingga','0821-1237-8356','Blok Eb1 no.5',1,'2026-01-23 00:12:17',1,'2026-01-25 03:26:39'),
(4,NULL,'09102026010004','Mamah Opang','0813-1478-0617','Blok Eb3 no.11A',1,'2026-01-23 00:12:42',1,'2026-01-25 05:07:03'),
(5,NULL,'09102026010005','Mamah Atiq','081384260940','Blok Eb4 no.14',1,'2026-01-23 00:13:02',1,'2026-01-25 03:18:48'),
(6,NULL,'09102026010006','Albi','085711006751','Blok Eb 3 no.3',1,'2026-01-23 00:13:21',1,'2026-01-25 03:10:09'),
(7,NULL,'09102026010007','Mamah Zahra','0821-7882-0788','Blok Eb3 no.11',1,'2026-01-23 00:13:43',1,'2026-01-25 03:34:17'),
(8,NULL,'09102026010008','Bu Irwan',NULL,NULL,1,'2026-01-23 00:14:02',NULL,NULL),
(9,NULL,'09102026010009','Pak Yanto',NULL,NULL,1,'2026-01-23 00:14:34',NULL,NULL),
(10,NULL,'09102026010010','Mamah Siti','0852-1595-0985','Blok Eb3 no.23',1,'2026-01-23 00:15:03',1,'2026-01-25 03:38:23'),
(11,NULL,'09102026010011','Pak Dudu','0897-7672-225','Blok EB3 No. 6',1,'2026-01-23 00:15:28',1,'2026-01-25 02:41:17'),
(12,NULL,'09102026010012','Akang Wafiq','0812-1115-9962','Blok EB 1 No 19',1,'2026-01-23 00:15:50',1,'2026-01-24 19:06:51'),
(13,NULL,'09102026010013','Pak Bambang',NULL,NULL,1,'2026-01-23 00:16:16',NULL,NULL),
(14,NULL,'09102026010014','Mamah Rara',NULL,NULL,1,'2026-01-23 00:16:31',NULL,NULL),
(15,NULL,'09102026010015','Mamah Desti',NULL,NULL,1,'2026-01-23 00:16:54',NULL,NULL),
(16,NULL,'09102026010016','Mamah Lena',NULL,NULL,1,'2026-01-23 00:17:53',NULL,NULL),
(17,NULL,'09102026010017','Budeh Angel',NULL,NULL,1,'2026-01-23 00:18:18',NULL,NULL),
(18,NULL,'09102026010018','Mamah Okta','0857-1456-3591','Blok Eb5 no.8',1,'2026-01-23 00:18:45',1,'2026-01-25 04:03:20'),
(19,NULL,'09102026010019','Ibu Yosi Ranti',NULL,NULL,1,'2026-01-23 00:19:11',NULL,NULL),
(20,NULL,'09102026010020','Ibu Nurhotimah (Bu RW)',NULL,NULL,1,'2026-01-23 00:21:08',NULL,NULL),
(21,NULL,'09102026010021','Ibu Mujahidin','0813-1090-1151','Blok Eb4 no.16',1,'2026-01-23 00:22:23',1,'2026-01-25 03:29:58'),
(22,NULL,'09102026010022','Mamah Aris',NULL,NULL,1,'2026-01-23 00:22:50',NULL,NULL),
(23,NULL,'09102026010023','Mamah Agi',NULL,NULL,1,'2026-01-23 00:23:26',NULL,NULL),
(24,NULL,'09102026010024','Drs. Antonius Sugianto','0878-8515-5658','-',1,'2026-01-24 19:38:20',NULL,NULL),
(25,NULL,'09102026010025','KGR 1','01','Blk',1,'2026-01-24 19:43:28',1,'2026-01-24 19:48:49'),
(26,NULL,'09102026010026','Kgdr2','2','2',1,'2026-01-24 19:47:05',NULL,NULL),
(27,NULL,'09102026010027','Pak Fuad',NULL,NULL,1,'2026-01-25 03:07:28',NULL,NULL),
(28,NULL,'09102026010028','Pak Dede Rukmana',NULL,NULL,1,'2026-01-25 03:13:19',NULL,NULL),
(29,NULL,'09102026010029','Mamah Oza','0821-1479-3243','Blok Eb1 no.11',1,'2026-01-25 03:42:43',NULL,NULL),
(30,NULL,'09102026010030','Pak Edi Gondrong',NULL,NULL,1,'2026-01-25 03:45:41',NULL,NULL);

/*Table structure for table `mst_categori_sampah` */

DROP TABLE IF EXISTS `mst_categori_sampah`;

CREATE TABLE `mst_categori_sampah` (
  `mcs_id` int(11) NOT NULL AUTO_INCREMENT,
  `mcs_code` varchar(255) DEFAULT NULL,
  `mcs_name` varchar(255) DEFAULT NULL,
  `mcs_satuan` varchar(255) DEFAULT NULL,
  `mcs_active` int(11) DEFAULT NULL,
  `mcs_created_by` int(11) DEFAULT NULL,
  `mcs_created_date` datetime DEFAULT NULL,
  `mcs_updated_by` int(11) DEFAULT NULL,
  `mcs_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`mcs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `mst_categori_sampah` */

insert  into `mst_categori_sampah`(`mcs_id`,`mcs_code`,`mcs_name`,`mcs_satuan`,`mcs_active`,`mcs_created_by`,`mcs_created_date`,`mcs_updated_by`,`mcs_updated_date`) values 
(1,'001','Botol Plastick','Kg',1,1,'2026-01-22 23:17:35',NULL,NULL),
(2,'002','Gelas Plastick Bening','Kg',1,1,'2026-01-22 23:18:10',NULL,NULL),
(3,'003','Gelas Plastick Warna','Kg',1,1,'2026-01-22 23:18:29',NULL,NULL),
(4,'004','Minyak Jelantah','L',1,1,'2026-01-22 23:18:50',NULL,NULL),
(5,'005','Tutup Galon','Kg',1,1,'2026-01-22 23:19:26',NULL,NULL),
(6,'006','Baja Ringan','Kg',1,1,'2026-01-22 23:22:04',NULL,NULL),
(7,'007','Besi Asli','Kg',1,1,'2026-01-22 23:22:23',NULL,NULL),
(8,'008','Logam Tembaga','Kg',1,1,'2026-01-22 23:22:43',NULL,NULL),
(9,'009','Kardus','Kg',1,1,'2026-01-22 23:22:52',NULL,NULL),
(10,'010','Kertas HVS','Kg',1,1,'2026-01-22 23:23:06',NULL,NULL),
(11,'011','Gabrukan','Kg',1,1,'2026-01-22 23:23:34',NULL,NULL),
(12,'012','Besi Seng','Kg',1,1,'2026-01-22 23:25:56',NULL,NULL),
(13,'013','Tutup Botol','Kg',1,1,'2026-01-23 00:44:48',NULL,NULL),
(14,'014','Duplek','Kg',1,1,'2026-01-23 00:45:03',NULL,NULL),
(15,'015','Almunium','Kg',1,1,'2026-01-23 00:59:06',NULL,NULL),
(16,'016','Beling','Kg',1,1,'2026-01-23 01:11:39',NULL,NULL),
(17,'017','Buku','Kgf',1,1,'2026-01-25 11:37:25',NULL,NULL);

/*Table structure for table `mst_status` */

DROP TABLE IF EXISTS `mst_status`;

CREATE TABLE `mst_status` (
  `mss_id` int(11) NOT NULL AUTO_INCREMENT,
  `mss_code_id` int(11) DEFAULT NULL,
  `mss_code` varchar(255) DEFAULT NULL,
  `mss_name` varchar(255) DEFAULT NULL,
  `mss_class` varchar(255) DEFAULT NULL,
  `mss_created_by` int(11) DEFAULT NULL,
  `mss_created_date` datetime DEFAULT NULL,
  `mss_updated_by` int(11) DEFAULT NULL,
  `mss_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`mss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `mst_status` */

insert  into `mst_status`(`mss_id`,`mss_code_id`,`mss_code`,`mss_name`,`mss_class`,`mss_created_by`,`mss_created_date`,`mss_updated_by`,`mss_updated_date`) values 
(1,1,'status_setor','Terkumpul','bg-primary',1,'2026-01-23 13:25:38',NULL,NULL),
(2,2,'status_setor','Terjual','bg-success',1,'2026-01-23 13:26:13',NULL,NULL);

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values 
('D2PEZvEqC8BQVMamKGTqrAXYYlSwgeQ33AwJq2i0',NULL,'34.170.93.22','Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWN0TnlQQXpzSUgzbFBtQUlhVlhYV2UyMVlKTUZYczZ4M0Y2U1NHeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1770225006),
('D9CVm0ZT4K8gkRmAN2m3aMDAyObJyG7IVFYDrF1O',NULL,'34.170.93.22','Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2R3b21rM08zTVBwQmExSlRzTG1TeVJFdmdod2NodlE5SjVmSkwwUyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4vaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770225007),
('k2Y9QyBLz4V5rvylswqUFUQHFQXFoHEAZ18euRRm',NULL,'149.57.180.133','Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTE0RmhtZjFkR3hiWTRMaGcxVUNJWU1VbVB4allJUUdMM01kTmZYaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4vaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770178116),
('N9biyf0TXFGbuyXKj4SznxuR1DopUxjTMzlSclMb',NULL,'198.235.24.136','Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXE4MkcxcXlVR0J1enVZaXNoelpBdWhWSmlFYmZZM2ZQbGN3ZUJGTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4vaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770085501),
('NwWPcCP00dBMBq1RYBgAUxJx0Do7z8YlKU2UjVSu',NULL,'81.217.133.44','Mozilla/5.0 (iPhone; CPU iPhone OS 17_7_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Mobile/15E148 Safari/604.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEhBZXV4S3Nhanc5S1lJQmtIa0VoSEIyQjM5SmZ2alNUd0lrTTdKUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1770180684),
('rCSwZV1BFtR1kB9zDpeDIBUUfS3jNhd0B94Yfjco',NULL,'34.22.235.145','Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGhhWFlBcmRiQnd2bWdiSlRVcnZCR3JTcm1yQ0lFcnZQVk01U2Y0QiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1770199381),
('rUFf9cS9e6vdUmElndvamzFilsz7O8EgbJwxLlkU',NULL,'149.57.180.106','Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHFkY2xwdkpJMHlzRXBsZktCaGtHenEzZlNHY01RSnJMOWtWdEhacCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4vaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770184604),
('tgqZKFUBFtaXZl0YWmmOJMYJDj9WqzpYImzdcb4C',NULL,'198.235.24.136','Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSElOU1RQTXI4NWN3bE54YlplV05Vb1pvb1M3Zmx0MHFMazhRN3ljayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4iO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1770085501),
('UzqqIrmO4WQDxcWxzQrUlKwNFhMfqOprjSU18yPe',NULL,'34.22.235.145','Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmRwVWVpTFJrekQxclcxb0hQSmdqT2ZMUld5ZXpndEd4a2hDVm1UZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ua2FuZ2RydS5mdW4vaG9tZSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1770199381);

/*Table structure for table `trx_harga_sampah` */

DROP TABLE IF EXISTS `trx_harga_sampah`;

CREATE TABLE `trx_harga_sampah` (
  `ths_id` int(11) NOT NULL AUTO_INCREMENT,
  `ths_tps_id` int(11) DEFAULT NULL,
  `ths_harga_anggota` int(11) DEFAULT NULL,
  `ths_harga_kartar` int(11) DEFAULT NULL,
  `ths_created_by` int(11) DEFAULT NULL,
  `ths_created_date` datetime DEFAULT NULL,
  `ths_updated_by` int(11) DEFAULT NULL,
  `ths_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ths_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `trx_harga_sampah` */

insert  into `trx_harga_sampah`(`ths_id`,`ths_tps_id`,`ths_harga_anggota`,`ths_harga_kartar`,`ths_created_by`,`ths_created_date`,`ths_updated_by`,`ths_updated_date`) values 
(1,1,5000,1000,1,'2026-01-23 15:47:29',NULL,NULL);

/*Table structure for table `trx_penjualan_sampah` */

DROP TABLE IF EXISTS `trx_penjualan_sampah`;

CREATE TABLE `trx_penjualan_sampah` (
  `tps_id` int(11) NOT NULL AUTO_INCREMENT,
  `tps_mcs_id` int(11) DEFAULT NULL,
  `tps_date_setor` date DEFAULT NULL,
  `tps_date_jual` date DEFAULT NULL,
  `tps_harga_perberat` int(11) DEFAULT NULL,
  `tps_total_berat` decimal(10,2) DEFAULT NULL,
  `tps_satuan` varchar(255) DEFAULT NULL,
  `tps_created_by` int(11) DEFAULT NULL,
  `tps_created_date` datetime DEFAULT NULL,
  `tps_updated_by` int(11) DEFAULT NULL,
  `tps_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `trx_penjualan_sampah` */

insert  into `trx_penjualan_sampah`(`tps_id`,`tps_mcs_id`,`tps_date_setor`,`tps_date_jual`,`tps_harga_perberat`,`tps_total_berat`,`tps_satuan`,`tps_created_by`,`tps_created_date`,`tps_updated_by`,`tps_updated_date`) values 
(1,4,'2026-01-04','2026-01-05',6000,67.00,'L',1,'2026-01-23 15:15:07',NULL,NULL),
(2,9,'2026-01-04','2026-01-04',1800,NULL,'Kg',1,'2026-01-23 21:25:35',NULL,NULL),
(3,10,'2026-01-04','2026-01-04',1500,NULL,'Kg',1,'2026-01-23 21:29:44',NULL,NULL),
(4,11,'2026-01-04','2026-01-04',1500,NULL,'Kg',1,'2026-01-23 21:33:50',NULL,NULL),
(5,12,'2026-01-04','2026-01-04',3500,NULL,'Kg',1,'2026-01-23 22:02:13',NULL,NULL);

/*Table structure for table `trx_transaksi_setor` */

DROP TABLE IF EXISTS `trx_transaksi_setor`;

CREATE TABLE `trx_transaksi_setor` (
  `tts_id` int(11) NOT NULL AUTO_INCREMENT,
  `tts_msa_id` int(11) DEFAULT NULL,
  `tts_mcs_id` int(11) DEFAULT NULL,
  `tts_setor_date` date DEFAULT NULL,
  `tts_berat_sampah` decimal(10,2) DEFAULT NULL,
  `tts_harga_perberat` int(11) DEFAULT NULL,
  `tts_status` int(11) DEFAULT NULL,
  `tts_created_by` int(11) DEFAULT NULL,
  `tts_created_date` datetime DEFAULT NULL,
  `tts_updated_by` int(11) DEFAULT NULL,
  `tts_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `trx_transaksi_setor` */

insert  into `trx_transaksi_setor`(`tts_id`,`tts_msa_id`,`tts_mcs_id`,`tts_setor_date`,`tts_berat_sampah`,`tts_harga_perberat`,`tts_status`,`tts_created_by`,`tts_created_date`,`tts_updated_by`,`tts_updated_date`) values 
(1,1,4,'2026-01-04',4.44,5000,2,1,'2026-01-23 00:55:02',NULL,NULL),
(2,2,1,'2026-01-04',2.64,NULL,1,1,'2026-01-23 00:55:51',NULL,NULL),
(3,3,1,'2026-01-04',0.34,NULL,1,1,'2026-01-23 00:56:40',NULL,NULL),
(4,3,4,'2026-01-04',9.00,5000,2,1,'2026-01-23 00:57:14',NULL,NULL),
(5,4,1,'2026-01-04',1.74,NULL,1,1,'2026-01-23 00:58:21',NULL,NULL),
(6,4,15,'2026-01-04',1.20,NULL,1,1,'2026-01-23 00:59:40',NULL,NULL),
(7,5,1,'2026-01-04',2.32,NULL,1,1,'2026-01-23 01:09:22',NULL,NULL),
(8,6,1,'2026-01-04',0.74,NULL,1,1,'2026-01-23 01:09:59',NULL,NULL),
(9,6,14,'2026-01-04',1.20,NULL,0,1,'2026-01-23 01:10:35',NULL,NULL),
(10,7,10,'2026-01-04',5.92,1000,2,1,'2026-01-23 01:11:18',NULL,NULL),
(11,8,9,'2026-01-04',4.30,1260,2,1,'2026-01-23 01:12:37',NULL,NULL),
(12,8,1,'2026-01-04',0.86,NULL,1,1,'2026-01-23 01:13:30',NULL,NULL),
(13,8,11,'2026-01-04',2.80,1000,2,1,'2026-01-23 01:14:03',NULL,NULL),
(14,8,4,'2026-01-04',8.00,5000,2,1,'2026-01-23 01:14:42',NULL,NULL),
(15,8,16,'2026-01-04',1.70,NULL,1,1,'2026-01-23 01:15:46',NULL,NULL),
(16,9,1,'2026-01-04',0.86,NULL,1,1,'2026-01-23 01:15:48',NULL,NULL),
(17,9,10,'2026-01-04',6.60,1000,2,1,'2026-01-23 01:17:09',NULL,NULL),
(18,9,9,'2026-01-04',1.80,1260,2,1,'2026-01-23 01:17:11',NULL,NULL),
(19,10,1,'2026-01-04',0.50,NULL,1,1,'2026-01-23 01:17:57',NULL,NULL),
(20,10,4,'2026-01-04',2.60,5000,2,1,'2026-01-23 01:18:59',NULL,NULL),
(21,11,4,'2026-01-04',4.00,5000,2,1,'2026-01-23 09:33:20',NULL,NULL),
(22,11,1,'2026-01-04',0.60,NULL,1,1,'2026-01-23 09:33:54',NULL,NULL),
(23,6,1,'2026-01-04',0.60,NULL,1,1,'2026-01-23 09:34:27',NULL,NULL),
(24,12,9,'2026-01-04',5.80,1260,2,1,'2026-01-23 09:35:11',NULL,NULL),
(25,12,1,'2026-01-04',1.10,NULL,1,1,'2026-01-23 09:35:41',NULL,NULL),
(26,13,1,'2026-01-04',1.70,NULL,1,1,'2026-01-23 09:36:17',NULL,NULL),
(27,14,10,'2026-01-04',1.80,1000,2,1,'2026-01-23 09:37:04',NULL,NULL),
(28,15,1,'2026-01-04',0.50,NULL,1,1,'2026-01-23 09:37:38',NULL,NULL),
(29,12,4,'2026-01-04',2.00,5000,2,1,'2026-01-23 09:38:24',NULL,NULL),
(30,16,7,'2026-01-04',2.30,NULL,1,1,'2026-01-23 09:39:09',NULL,NULL),
(31,16,1,'2026-01-04',1.40,NULL,1,1,'2026-01-23 09:39:32',NULL,NULL),
(32,16,9,'2026-01-04',1.60,1260,2,1,'2026-01-23 09:40:51',NULL,NULL),
(33,17,1,'2026-01-04',0.70,NULL,1,1,'2026-01-23 09:41:32',NULL,NULL),
(34,18,1,'2026-01-04',3.20,NULL,1,1,'2026-01-23 09:42:26',NULL,NULL),
(35,18,4,'2026-01-04',27.60,5000,2,1,'2026-01-23 09:43:17',NULL,NULL),
(36,18,10,'2026-01-04',10.20,1000,2,1,'2026-01-23 09:45:00',NULL,NULL),
(37,18,11,'2026-01-04',1.20,1000,2,1,'2026-01-23 09:45:29',NULL,NULL),
(38,19,9,'2026-01-04',3.40,1260,2,1,'2026-01-23 09:46:31',NULL,NULL),
(39,16,9,'2026-01-04',7.50,1260,2,1,'2026-01-23 09:47:09',NULL,NULL),
(40,20,1,'2026-01-04',1.30,NULL,1,1,'2026-01-23 09:47:45',NULL,NULL),
(41,20,4,'2026-01-04',6.00,5000,2,1,'2026-01-23 09:51:38',NULL,NULL),
(42,21,1,'2026-01-04',0.80,NULL,1,1,'2026-01-23 09:52:08',NULL,NULL),
(43,21,9,'2026-01-04',1.30,1260,2,1,'2026-01-23 09:52:41',NULL,NULL),
(44,22,12,'2026-01-04',16.50,2450,2,1,'2026-01-23 09:53:28',NULL,NULL),
(45,23,4,'2026-01-04',6.00,5000,2,1,'2026-01-23 09:53:58',NULL,NULL),
(46,26,1,'2026-01-25',2.00,NULL,1,1,'2026-01-24 21:39:39',NULL,NULL),
(47,11,11,'2026-01-25',3.00,NULL,1,1,'2026-01-25 03:03:34',NULL,NULL),
(48,11,11,'2026-01-25',3.00,NULL,1,1,'2026-01-25 03:04:21',NULL,NULL),
(49,11,4,'2026-01-25',1.50,NULL,1,1,'2026-01-25 03:05:59',NULL,NULL),
(50,27,11,'2026-01-25',3.00,NULL,1,1,'2026-01-25 03:09:56',NULL,NULL),
(51,27,9,'2026-01-25',1.90,NULL,1,1,'2026-01-25 03:11:56',NULL,NULL),
(52,28,11,'2026-01-25',1.00,NULL,1,1,'2026-01-25 03:14:43',NULL,NULL),
(53,28,11,'2026-01-25',1.80,NULL,1,1,'2026-01-25 03:17:56',NULL,NULL),
(54,27,4,'2026-01-25',6.00,NULL,1,1,'2026-01-25 03:18:28',NULL,NULL),
(55,18,11,'2026-01-25',9.50,NULL,1,1,'2026-01-25 03:19:25',NULL,NULL),
(56,18,1,'2026-01-25',1.00,NULL,1,1,'2026-01-25 03:19:45',NULL,NULL),
(57,18,9,'2026-01-25',1.40,NULL,1,1,'2026-01-25 03:20:12',NULL,NULL),
(58,16,1,'2026-01-25',7.40,NULL,1,1,'2026-01-25 03:21:16',NULL,NULL),
(59,16,1,'2026-01-25',1.20,NULL,1,1,'2026-01-25 03:22:32',NULL,NULL),
(60,16,9,'2026-01-25',5.60,NULL,1,1,'2026-01-25 03:24:40',NULL,NULL),
(61,16,7,'2026-01-25',1.40,NULL,1,1,'2026-01-25 03:26:09',NULL,NULL),
(62,6,11,'2026-01-25',2.20,NULL,1,1,'2026-01-25 03:28:26',NULL,NULL),
(63,6,11,'2026-01-25',2.00,NULL,1,1,'2026-01-25 03:29:04',NULL,NULL),
(64,7,4,'2026-01-25',2.00,NULL,1,1,'2026-01-25 03:30:37',NULL,NULL),
(65,7,1,'2026-01-25',0.70,NULL,1,1,'2026-01-25 03:32:29',NULL,NULL),
(66,22,9,'2026-01-25',13.50,NULL,1,1,'2026-01-25 03:40:35',NULL,NULL),
(67,19,11,'2026-01-25',1.70,NULL,1,1,'2026-01-25 03:44:34',NULL,NULL),
(68,30,1,'2026-01-25',1.20,NULL,1,1,'2026-01-25 03:46:41',NULL,NULL),
(69,29,1,'2026-01-25',1.00,NULL,1,1,'2026-01-25 03:51:16',NULL,NULL),
(70,29,7,'2026-01-25',3.60,NULL,1,1,'2026-01-25 03:51:34',NULL,NULL),
(71,29,11,'2026-01-25',4.50,NULL,1,1,'2026-01-25 03:51:49',NULL,NULL),
(72,4,1,'2026-01-25',2.50,NULL,1,1,'2026-01-25 05:16:16',NULL,NULL),
(73,4,4,'2026-01-25',5.00,NULL,1,1,'2026-01-25 05:16:38',NULL,NULL),
(74,12,1,'2026-01-25',0.90,NULL,1,1,'2026-01-25 05:37:32',NULL,NULL),
(75,12,11,'2026-01-25',9.50,NULL,1,1,'2026-01-25 05:38:31',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Test User','test@example.com','2026-01-02 02:27:17','$2y$12$2qmG1VSQ/O9C2AZVbs3VPu4qJKxmnb6gsgvIUozO/ZzYDaIPcvuui','ICPzSbG7mq','2026-01-02 02:27:18','2026-01-02 02:27:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
