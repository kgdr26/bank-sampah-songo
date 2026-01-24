/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 11.8.1-MariaDB : Database - db_bank_sampah_songo
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `mst_anggota` */

insert  into `mst_anggota`(`msa_id`,`msa_user_id`,`msa_norek`,`msa_name`,`msa_no_tlp`,`msa_alamat`,`msa_created_by`,`msa_created_date`,`msa_updated_by`,`msa_updated_date`) values 
(1,NULL,'09102025010001','Winarto (Zaki)',NULL,NULL,1,'2026-01-23 00:11:22',NULL,NULL),
(2,NULL,'09102025010002','Mamah Chika',NULL,NULL,1,'2026-01-23 00:11:56',NULL,NULL),
(3,NULL,'09102025010003','Mamah Pingga',NULL,NULL,1,'2026-01-23 00:12:17',NULL,NULL),
(4,NULL,'09102025010004','Mamah Opang',NULL,NULL,1,'2026-01-23 00:12:42',NULL,NULL),
(5,NULL,'09102025010005','Mamah Atik',NULL,NULL,1,'2026-01-23 00:13:02',NULL,NULL),
(6,NULL,'09102025010006','Alby',NULL,NULL,1,'2026-01-23 00:13:21',NULL,NULL),
(7,NULL,'09102025010007','Mamah Zahra',NULL,NULL,1,'2026-01-23 00:13:43',NULL,NULL),
(8,NULL,'09102025010008','Bu Irwan',NULL,NULL,1,'2026-01-23 00:14:02',NULL,NULL),
(9,NULL,'09102025010009','Pak Yanto',NULL,NULL,1,'2026-01-23 00:14:34',NULL,NULL),
(10,NULL,'09102025010010','Mamah Siti',NULL,NULL,1,'2026-01-23 00:15:03',NULL,NULL),
(11,NULL,'09102025010011','Pak Dudu',NULL,NULL,1,'2026-01-23 00:15:28',NULL,NULL),
(12,NULL,'09102025010012','Sofy',NULL,NULL,1,'2026-01-23 00:15:50',NULL,NULL),
(13,NULL,'09102025010013','Pak Bambang',NULL,NULL,1,'2026-01-23 00:16:16',NULL,NULL),
(14,NULL,'09102025010014','Mamah Rara',NULL,NULL,1,'2026-01-23 00:16:31',NULL,NULL),
(15,NULL,'09102025010015','Mamah Desti',NULL,NULL,1,'2026-01-23 00:16:54',NULL,NULL),
(16,NULL,'09102025010016','Mamah Lena',NULL,NULL,1,'2026-01-23 00:17:53',NULL,NULL),
(17,NULL,'09102025010017','Budeh Angel',NULL,NULL,1,'2026-01-23 00:18:18',NULL,NULL),
(18,NULL,'09102025010018','Mamah Okta',NULL,NULL,1,'2026-01-23 00:18:45',NULL,NULL),
(19,NULL,'09102025010019','Ibu Yosi Ranti',NULL,NULL,1,'2026-01-23 00:19:11',NULL,NULL),
(20,NULL,'09102025010020','Ibu Nurhotimah (Bu RW)',NULL,NULL,1,'2026-01-23 00:21:08',NULL,NULL),
(21,NULL,'09102025010021','Ibu Mujahidin',NULL,NULL,1,'2026-01-23 00:22:23',NULL,NULL),
(22,NULL,'09102025010022','Mamah Aris',NULL,NULL,1,'2026-01-23 00:22:50',NULL,NULL),
(23,NULL,'09102025010023','Mamah Agi',NULL,NULL,1,'2026-01-23 00:23:26',NULL,NULL);

/*Table structure for table `mst_categori_sampah` */

DROP TABLE IF EXISTS `mst_categori_sampah`;

CREATE TABLE `mst_categori_sampah` (
  `mcs_id` int(11) NOT NULL AUTO_INCREMENT,
  `mcs_name` varchar(255) DEFAULT NULL,
  `mcs_satuan` varchar(255) DEFAULT NULL,
  `mcs_active` int(11) DEFAULT NULL,
  `mcs_created_by` int(11) DEFAULT NULL,
  `mcs_created_date` datetime DEFAULT NULL,
  `mcs_updated_by` int(11) DEFAULT NULL,
  `mcs_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`mcs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `mst_categori_sampah` */

insert  into `mst_categori_sampah`(`mcs_id`,`mcs_name`,`mcs_satuan`,`mcs_active`,`mcs_created_by`,`mcs_created_date`,`mcs_updated_by`,`mcs_updated_date`) values 
(1,'Botol Plastick','Kg',1,1,'2026-01-22 23:17:35',NULL,NULL),
(2,'Gelas Plastick Bening','Kg',1,1,'2026-01-22 23:18:10',NULL,NULL),
(3,'Gelas Plastick Warna','Kg',1,1,'2026-01-22 23:18:29',NULL,NULL),
(4,'Minyak Jelantah','L',1,1,'2026-01-22 23:18:50',NULL,NULL),
(5,'Tutup Galon','Kg',1,1,'2026-01-22 23:19:26',NULL,NULL),
(6,'Baja Ringan','Kg',1,1,'2026-01-22 23:22:04',NULL,NULL),
(7,'Besi Asli','Kg',1,1,'2026-01-22 23:22:23',NULL,NULL),
(8,'Logam Tembaga','Kg',1,1,'2026-01-22 23:22:43',NULL,NULL),
(9,'Kardus','Kg',1,1,'2026-01-22 23:22:52',NULL,NULL),
(10,'Kertas HVS','Kg',1,1,'2026-01-22 23:23:06',NULL,NULL),
(11,'Gabrukan','Kg',1,1,'2026-01-22 23:23:34',NULL,NULL),
(12,'Besi Seng','Kg',1,1,'2026-01-22 23:25:56',NULL,NULL),
(13,'Tutup Botol','Kg',1,1,'2026-01-23 00:44:48',NULL,NULL),
(14,'Duplek','Kg',1,1,'2026-01-23 00:45:03',NULL,NULL),
(15,'Almunium','Kg',1,1,'2026-01-23 00:59:06',NULL,NULL),
(16,'Beling','Kg',1,1,'2026-01-23 01:11:39',NULL,NULL);

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
('aO5EoCsMigl82O3Z84yYnjVRkptTDx6Qf6QhmeyP',NULL,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXc4UmtQejdqTEdEcnRKaUFnOU1WOHFEV3hxb0xSSzkzMFRycnMzTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ubG9jYWwta2dkci9ob21lIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767419826),
('mSIzM18NxNEioETo8pDMN9kJUcwFeGMGIJEYuoKB',NULL,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0ZrY2c1WDlEY2tnNkZpN2Y4Wk5WNFVwZkJ3VnBtOWVpcVk0WHVPWSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ubG9jYWwta2dkci9ob21lIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767327651),
('P4ePia5kcfAQShimbzRiXJoiT6ICAqwzHK96VWN4',NULL,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzk2REFqZ0xCemFuUmZKQnRVNTJmcUd4dVoxUnBobmVHbnRTT3VvaCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ubG9jYWwta2dkciI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769089089),
('SaI2WAEQkVvAtYwCBeDInopPc03tACQA2oPFmBOT',NULL,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0hGT3ZJend4MXlWZHZBdjFQZWRCbVRhdFBNQWhMbFdxV0VWSTg5diI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ubG9jYWwta2dkci9ob21lIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1769098194),
('TaKtAaIg6NTlXmHWyhqEXYhKC3rpvnjYov4Rxtaj',NULL,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTg1NjJ3OW1IRXdZcU9uQm83SU5RRlNvcUhza2I4S3ZMc0NUY3c2WSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ubG9jYWwta2dkciI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1769089089),
('zasgwVkwW0eWNZhlZQ7fpOQYljqGcyzQMWXSjrWZ',NULL,'172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEJJdVJmdWpUTVp1UzhxcjhoOXFhMUpma2M1d2tmRUFLWnRjOW9BRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vYmFuay1zYW1wYWgtc29uZ28ubG9jYWwta2dkci9ob21lIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767365737);

/*Table structure for table `trx_harga_sampah` */

DROP TABLE IF EXISTS `trx_harga_sampah`;

CREATE TABLE `trx_harga_sampah` (
  `ths_id` int(11) NOT NULL AUTO_INCREMENT,
  `ths_mcs_id` int(11) DEFAULT NULL,
  `ths_harga_asli` int(11) DEFAULT NULL,
  `ths_harga_anggota` int(11) DEFAULT NULL,
  `ths_harga_kartar` int(11) DEFAULT NULL,
  `ths_created_by` int(11) DEFAULT NULL,
  `ths_created_date` datetime DEFAULT NULL,
  `ths_updated_by` int(11) DEFAULT NULL,
  `ths_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ths_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `trx_harga_sampah` */

/*Table structure for table `trx_transaksi_setor` */

DROP TABLE IF EXISTS `trx_transaksi_setor`;

CREATE TABLE `trx_transaksi_setor` (
  `tts_id` int(11) NOT NULL AUTO_INCREMENT,
  `tts_msa_id` int(11) DEFAULT NULL,
  `tts_mcs_id` int(11) DEFAULT NULL,
  `tts_setor_date` date DEFAULT NULL,
  `tts_berat_sampah` decimal(10,2) DEFAULT NULL,
  `tts_status` int(11) DEFAULT NULL,
  `tts_created_by` int(11) DEFAULT NULL,
  `tts_created_date` datetime DEFAULT NULL,
  `tts_updated_by` int(11) DEFAULT NULL,
  `tts_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

/*Data for the table `trx_transaksi_setor` */

insert  into `trx_transaksi_setor`(`tts_id`,`tts_msa_id`,`tts_mcs_id`,`tts_setor_date`,`tts_berat_sampah`,`tts_status`,`tts_created_by`,`tts_created_date`,`tts_updated_by`,`tts_updated_date`) values 
(1,1,4,'2026-01-04',4.44,1,1,'2026-01-23 00:55:02',NULL,NULL),
(2,2,1,'2026-01-04',2.64,1,1,'2026-01-23 00:55:51',NULL,NULL),
(3,3,1,'2026-01-04',0.34,1,1,'2026-01-23 00:56:40',NULL,NULL),
(4,3,4,'2026-01-04',9.00,1,1,'2026-01-23 00:57:14',NULL,NULL),
(5,4,1,'2026-01-04',1.74,1,1,'2026-01-23 00:58:21',NULL,NULL),
(6,4,15,'2026-01-04',1.20,1,1,'2026-01-23 00:59:40',NULL,NULL),
(7,5,1,'2026-01-04',2.32,1,1,'2026-01-23 01:09:22',NULL,NULL),
(8,6,1,'2026-01-04',0.74,1,1,'2026-01-23 01:09:59',NULL,NULL),
(9,6,14,'2026-01-04',1.20,1,1,'2026-01-23 01:10:35',NULL,NULL),
(10,7,10,'2026-01-04',5.92,1,1,'2026-01-23 01:11:18',NULL,NULL),
(11,8,9,'2026-01-04',4.30,1,1,'2026-01-23 01:12:37',NULL,NULL),
(12,8,1,'2026-01-04',0.86,1,1,'2026-01-23 01:13:30',NULL,NULL),
(13,8,11,'2026-01-04',2.80,1,1,'2026-01-23 01:14:03',NULL,NULL),
(14,8,4,'2026-01-04',8.00,1,1,'2026-01-23 01:14:42',NULL,NULL),
(15,8,16,'2026-01-04',1.70,1,1,'2026-01-23 01:15:46',NULL,NULL),
(16,9,1,'2026-01-04',0.86,1,1,'2026-01-23 01:15:48',NULL,NULL),
(17,9,10,'2026-01-04',6.60,1,1,'2026-01-23 01:17:09',NULL,NULL),
(18,9,9,'2026-01-04',1.80,1,1,'2026-01-23 01:17:11',NULL,NULL),
(19,10,1,'2026-01-04',0.50,1,1,'2026-01-23 01:17:57',NULL,NULL),
(20,10,4,'2026-01-04',2.60,1,1,'2026-01-23 01:18:59',NULL,NULL),
(21,11,4,'2026-01-04',4.00,1,1,'2026-01-23 09:33:20',NULL,NULL),
(22,11,1,'2026-01-04',0.60,1,1,'2026-01-23 09:33:54',NULL,NULL),
(23,6,1,'2026-01-04',0.60,1,1,'2026-01-23 09:34:27',NULL,NULL),
(24,12,9,'2026-01-04',5.80,1,1,'2026-01-23 09:35:11',NULL,NULL),
(25,12,1,'2026-01-04',1.10,1,1,'2026-01-23 09:35:41',NULL,NULL),
(26,13,1,'2026-01-04',1.70,1,1,'2026-01-23 09:36:17',NULL,NULL),
(27,14,10,'2026-01-04',1.80,1,1,'2026-01-23 09:37:04',NULL,NULL),
(28,15,1,'2026-01-04',0.50,1,1,'2026-01-23 09:37:38',NULL,NULL),
(29,12,4,'2026-01-04',2.00,1,1,'2026-01-23 09:38:24',NULL,NULL),
(30,16,7,'2026-01-04',2.30,1,1,'2026-01-23 09:39:09',NULL,NULL),
(31,16,1,'2026-01-04',1.40,1,1,'2026-01-23 09:39:32',NULL,NULL),
(32,16,9,'2026-01-04',1.60,1,1,'2026-01-23 09:40:51',NULL,NULL),
(33,17,1,'2026-01-04',0.70,1,1,'2026-01-23 09:41:32',NULL,NULL),
(34,18,1,'2026-01-04',3.20,1,1,'2026-01-23 09:42:26',NULL,NULL),
(35,18,4,'2026-01-04',27.60,1,1,'2026-01-23 09:43:17',NULL,NULL),
(36,18,10,'2026-01-04',10.20,1,1,'2026-01-23 09:45:00',NULL,NULL),
(37,18,11,'2026-01-04',1.20,1,1,'2026-01-23 09:45:29',NULL,NULL),
(38,19,9,'2026-01-04',3.40,1,1,'2026-01-23 09:46:31',NULL,NULL),
(39,16,9,'2026-01-04',7.50,1,1,'2026-01-23 09:47:09',NULL,NULL),
(40,20,1,'2026-01-04',1.30,1,1,'2026-01-23 09:47:45',NULL,NULL),
(41,20,4,'2026-01-04',6.00,1,1,'2026-01-23 09:51:38',NULL,NULL),
(42,21,1,'2026-01-04',0.80,1,1,'2026-01-23 09:52:08',NULL,NULL),
(43,21,9,'2026-01-04',1.30,1,1,'2026-01-23 09:52:41',NULL,NULL),
(44,22,12,'2026-01-04',16.50,1,1,'2026-01-23 09:53:28',NULL,NULL),
(45,23,4,'2026-01-04',6.00,1,1,'2026-01-23 09:53:58',NULL,NULL);

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
