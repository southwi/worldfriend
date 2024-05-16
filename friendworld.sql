-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: friendworld
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adpass`
--

DROP TABLE IF EXISTS `adpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adpass` (
  `id` char(100) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `password` char(100) DEFAULT '123456',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adpass`
--

LOCK TABLES `adpass` WRITE;
/*!40000 ALTER TABLE `adpass` DISABLE KEYS */;
INSERT INTO `adpass` VALUES ('000000000','admin','123456'),('000000001','无敌暴龙战士','123456'),('000000002','钢铁猪猪侠','123456'),('000000003','火焰小子','123456'),('000000004','冰霜女神','123456'),('000000005','雷霆忍者','123456'),('000000006','热情火箭人','123456'),('000000007','LiLingzhee','123456'),('000000008','test','123456'),('000000010','test1','password1');
/*!40000 ALTER TABLE `adpass` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sync_user_data` AFTER INSERT ON `adpass` FOR EACH ROW BEGIN
    INSERT INTO user (id, name) VALUES (NEW.id, NEW.name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add captcha store',7,'add_captchastore'),(26,'Can change captcha store',7,'change_captchastore'),(27,'Can delete captcha store',7,'delete_captchastore'),(28,'Can view captcha store',7,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_captchastore` (
  `id` int NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (30,'OIBF','oibf','144dbf0f776f00724fa219f806d57ac81bf684a0','2024-04-27 12:29:39.046537'),(31,'RWFP','rwfp','52f10e149749fd68c02bbfb2d2b137a0f99e5cb6','2024-04-27 12:30:12.878352'),(32,'CULY','culy','d5fd404c3bc4a01286c4ccb70331cce1f3b168c7','2024-04-27 13:03:44.213146'),(33,'FJVW','fjvw','d72931da2731178636a86ed2b8dd0e2bd95afef0','2024-04-27 13:03:57.241274'),(34,'GBNN','gbnn','6183a766952b6756a4f145740eeeb0631b2f06c6','2024-04-27 13:04:20.208969'),(35,'KNQO','knqo','f8d55b996b46ccba0a7f3160052ec16b02117217','2024-04-27 13:04:33.354760'),(36,'FXET','fxet','56634026e59e3b57a7e9037b80232f16ace66058','2024-04-27 13:04:43.388649'),(37,'FQYB','fqyb','86428e9a020e2160768d2cc5e801182bfbea81ac','2024-04-27 13:05:03.425306'),(38,'HDHQ','hdhq','42b8e2b7e2be6f600855b7f99eafadb728ae8d2b','2024-04-27 13:05:20.827038'),(39,'OXWZ','oxwz','3ca4052fef46a35c28e77d3df94f3504fc06a324','2024-04-27 13:05:31.478500'),(40,'RKRY','rkry','0deef5b669477f5ae31f7686aa8a5e4e48258329','2024-04-27 13:06:30.481349'),(41,'DEVP','devp','691a05ec9487f28e06466916e2de134cce44733f','2024-04-27 13:07:12.301428'),(42,'DKDV','dkdv','1b664d4a2c7eacc7378aed87c0cac214e105fd07','2024-04-27 13:09:29.477569'),(43,'QWCC','qwcc','3abc204ac5b88cc90d5ae3002f92c24d5f00a0ba','2024-04-27 13:11:20.418943'),(44,'VFCD','vfcd','37321ef4ba9328febb52332054d6c0c28021c00b','2024-04-27 13:13:06.850746'),(45,'ZCAP','zcap','ea29dfee63b1238f85b5411517e32c4d1b4829b8','2024-04-27 13:14:04.235796'),(46,'JNUV','jnuv','bdfde994b283cac1d5afd40dc90be1585d890615','2024-04-27 13:14:22.983536'),(47,'HXCC','hxcc','15797b35c1adfd04a11b07fb14ee391bcfe9a185','2024-04-27 13:14:41.155151'),(48,'MRIO','mrio','3bde669cced7afd51fc9efc99803726d9d7cf414','2024-04-27 13:14:49.353904'),(49,'IDZD','idzd','1d56e16c16ab23ac364c836ef81ecc7e66e477e5','2024-04-27 13:15:01.687072'),(50,'TWJA','twja','4d767e0c64be200acbc22324736d642f2626d9dc','2024-04-27 13:15:16.362734'),(51,'TSVZ','tsvz','d70f39b02a9d21ddb678303932b488cf4a29fa01','2024-04-27 13:16:16.313501'),(52,'FZSX','fzsx','e3741e72912e5a4581d9d7aa8757471c3b91daf6','2024-04-27 13:16:27.245005'),(53,'ZEXB','zexb','96a1af2169fe14981273d0b4b314cb025ccd7169','2024-04-27 13:16:38.673886'),(54,'ILEZ','ilez','b0dce3025d54ee2b90ffed9013b740d3751c0322','2024-04-27 13:16:53.193228'),(55,'XNTF','xntf','9a134aaf32ad1a8d44a77a78f1567e1a94889057','2024-04-27 13:17:30.697693'),(56,'LELT','lelt','61f953701dfdceffb0429c03b58864306344b2ca','2024-04-27 13:17:43.122603'),(57,'FMDI','fmdi','b444234aa75876b1be1eeea6921847827e23b670','2024-04-27 13:18:10.759917'),(58,'XGKB','xgkb','ea5205a0c531412973ff6a020d3d8d64f9890bb1','2024-04-27 14:14:19.117197'),(59,'GTMJ','gtmj','d515aec654022eeb2031ac0e85f63628d5c57ce6','2024-04-27 14:16:13.650635'),(60,'GKGO','gkgo','b46f28f4096ced2b84519a53126720ab0aba6d09','2024-04-27 14:20:52.947684'),(61,'XGRY','xgry','5bf8d6c9283a3f4b292bfd9b781a3c80c21c0bd6','2024-04-27 14:22:04.261025'),(62,'XZWI','xzwi','521c6c7bf2622ccc03aea5a387f95aaca44e2dab','2024-04-27 14:23:45.064249'),(63,'VPXI','vpxi','69b270cde8eef549c7757b0109b5174a42642ed3','2024-04-27 14:24:23.813369'),(64,'XSSS','xsss','93118401cd769a79eb8af853fb40cc9bab8a3a24','2024-04-27 14:29:56.842760'),(65,'PVZO','pvzo','8fdc1d072971fa999ac5685486465d884348dc71','2024-04-27 14:30:46.404415'),(66,'HTSV','htsv','4f4ebeaf1bba31a89b8a20951030c3c42386295d','2024-04-27 14:34:32.991351'),(67,'YGOT','ygot','48c590c957e25700caafdb615d35aa1df1dfcae9','2024-04-27 14:37:26.577417'),(68,'UPRO','upro','6c12e226c80ec1d14e4c9eb0f7aeb22f38a32a5c','2024-04-27 14:39:23.171907'),(69,'VYHS','vyhs','e3bdd7c6d018debd2193f6991bb7db34176fa7c4','2024-04-27 14:51:42.860546'),(70,'LXEG','lxeg','9f81b610cf2e5c4ccae40aa8ece8af5b18811d03','2024-04-27 14:53:51.628633'),(71,'YECR','yecr','c6231e86be5c399336d35af241886beae2c3a7cd','2024-04-27 14:54:07.768390'),(72,'WENZ','wenz','49c682d5634388bbefbc446d298cf5226b2b4b1f','2024-04-27 14:54:13.887188'),(73,'ZHJY','zhjy','9f3a4039d15dfd09baffccbfa5c58a7267d319f3','2024-04-27 14:54:20.804042'),(74,'GNKQ','gnkq','72c2007bb7a062439157a6f24146cf7def3a7577','2024-04-27 14:54:50.248499'),(75,'IFBD','ifbd','8abfa88a818c0af8408421945ace1ae5defdd322','2024-04-27 14:55:38.744536'),(76,'CJZS','cjzs','46892595823f076cb08054d0129a9a5e50d257d7','2024-04-27 14:55:59.756643'),(77,'AEYX','aeyx','420cfa5b5d74741a63849798b10b08eab429e187','2024-04-27 14:58:09.156727'),(78,'UWOS','uwos','290073f8a9725c80b0259c6d7936137ce81777e5','2024-04-27 14:58:52.992781'),(79,'IBVJ','ibvj','482b29f39fefd52320645d75d6ca23c66d52eae0','2024-04-27 14:59:04.729291'),(80,'YJYU','yjyu','f567353af2fef871178b86c2dd8da7b723fda014','2024-04-27 15:10:26.243622'),(81,'NPDA','npda','ae29af08bace9aa0ccb97cc58f4e1cda5082bfdd','2024-04-27 15:15:19.434919'),(82,'LSSA','lssa','653ac8238935443e3e35d54f049c70f38530fbc6','2024-04-27 15:16:28.654176'),(83,'VPOF','vpof','9a552981de2d1d9695230556ebdc512c8d72a8ef','2024-04-27 15:16:54.730726'),(84,'IGOR','igor','1c3e279aac366c65d2855f5abfb414e273c82224','2024-04-27 15:18:53.423099'),(85,'EGJC','egjc','dce841dd1791c0987149a509f678dcb043f4302d','2024-04-27 15:23:50.098934'),(86,'MMMZ','mmmz','6bd83de8fb928afe8eb513fc58050d8e27bf91b0','2024-04-27 15:33:28.898312'),(87,'NBDC','nbdc','ec8f6c0803b356d6c9e7ba1d9ecb1158d22ed0e5','2024-04-27 15:38:30.213317'),(88,'WEDM','wedm','d149bd1c354b6236d11d8475239feb0b6aefd2d1','2024-04-27 15:38:47.075424'),(89,'TTHR','tthr','3bbfa6b14e71f62196a26a2a2784d9322de53c6a','2024-04-27 15:43:05.208321'),(90,'OTFD','otfd','ce10edb21b519a82f443ec2ca60e1154797264f8','2024-04-27 15:45:22.288552'),(91,'ASQS','asqs','647d31923224f4d9bf5698aa67998cb011d9f618','2024-04-27 15:46:30.745027'),(92,'YMJB','ymjb','1169d11f289e0bf6d9718c9eca8832f42cf5be50','2024-04-27 15:46:32.556228'),(93,'JBYK','jbyk','d2331688c957fcb208d3a8702a9fa99429e41a44','2024-04-27 15:46:33.707384'),(94,'FVRN','fvrn','63858772bd857a7c8f8fb5932e6788f443bd8f5f','2024-04-27 15:46:34.787408'),(95,'FRNL','frnl','99304c74d57ddceef11a7503cf8b08c206205d08','2024-04-27 15:46:35.698342'),(96,'NPTX','nptx','e308ac70f21bd34c374c4fe83cd671ac2847d719','2024-04-27 15:47:52.848133'),(97,'FOZZ','fozz','e50cae81fbe4dcae399527b496f7e050658bf0dd','2024-04-27 15:47:53.996545'),(98,'JJFZ','jjfz','4f13a1bc33ef49fe97a45f0adae6b74fa00049ee','2024-04-27 15:47:55.441366'),(99,'FPPB','fppb','1fc38c778b3a3116e6a92934385271583e3c29cc','2024-04-27 15:48:26.679963'),(100,'SFLM','sflm','00c3815f01d3aaa8043e8eaec4e54ceff6f71085','2024-04-27 15:48:27.808338'),(101,'LGFB','lgfb','507c2b2ef190c34b310d1e504112d83f73a8dde6','2024-04-27 15:48:51.675364'),(102,'JEZX','jezx','22bdc50418f18546a50d9e255a03f47b247838af','2024-04-27 15:48:53.400380'),(103,'XLMK','xlmk','2b8cfb3aaa0646bf7cf5023e08f066c7c13701af','2024-04-27 15:49:28.819096'),(104,'RUKD','rukd','83b1eb6ea501142b6a235876d21f1bceb8ed486a','2024-04-27 15:49:30.057977'),(105,'FXJJ','fxjj','fb614516cc8fb590c786b2b0a4893ca4a3527f9e','2024-04-27 15:49:33.426409'),(106,'CMHT','cmht','b1cd30656c351815edef35ed17ece8df1c5f8756','2024-04-27 15:49:46.063557'),(107,'HQDE','hqde','47c9c2bb438365b9c33cf970f5ef17d985040261','2024-04-27 15:49:47.311718'),(108,'DGHP','dghp','b5c6b0128b21f79b2e8db4af7088c781144322ec','2024-04-27 15:50:26.362902'),(109,'ZENV','zenv','b9dddbed915fbe8e5065bf64df54843369e63186','2024-04-27 15:50:27.753316'),(110,'LNQY','lnqy','1aec76fdfb52e26a822f6ef06c6b77e8738c2987','2024-04-27 15:51:29.510052'),(111,'QWFV','qwfv','448edc254725b44cb06554281a49fa3aefdb73a1','2024-04-27 15:51:30.931319'),(112,'CQEA','cqea','bcd9898279d6ea11df6ff6f3be653f916420a6db','2024-04-27 15:51:44.758153'),(113,'FTOM','ftom','f66d40f9ab5857b58eb8b3d938f2e8d462df6fc8','2024-04-27 15:51:45.772402'),(114,'AAIA','aaia','e4d5f76d985e72c08309f18261e7a68b388edd6e','2024-04-27 15:54:17.465292'),(115,'CTEE','ctee','7dd2639fbb898c24dafe69117137e59d5ed09562','2024-04-27 15:54:18.774177'),(116,'TZUV','tzuv','352efc9d578c52c80373941d808d0c7d4161875c','2024-04-27 15:54:19.606489'),(117,'UUGA','uuga','00cc8c6c9b016bf76d4d06d7d4b5ff298aad7f9a','2024-04-27 23:54:52.043004'),(118,'BIWG','biwg','dd75a7de4f572bedc5a41e4a6eee90e8a92210e9','2024-04-27 23:54:55.734725'),(119,'CQKG','cqkg','c3902f0d3796f01cec8505c6970c749026f19144','2024-04-27 23:55:06.335692'),(120,'GFSP','gfsp','bc2a3cab3cdf162f14e8f1beb8bd16f7cb51d942','2024-04-27 23:55:18.928811'),(121,'HTIW','htiw','fecb1630281b05a0a78ab90d9564ccb70f509eb6','2024-04-27 23:55:22.044265'),(122,'WRML','wrml','e95a73566daa167da78770f704f0cd7d485bdb9d','2024-04-27 23:55:23.717283'),(123,'QPAN','qpan','818a6e0ec8f7284d55e3455afe392b8b65803a6c','2024-04-27 23:55:32.720619'),(124,'RCPY','rcpy','22fc87f63f0079eb2c55438e84c0b7619db2796b','2024-04-27 23:55:34.263421'),(125,'OKVT','okvt','eca6f9a2096b2317d635bea67d770f2a3a649318','2024-04-27 23:55:43.849354'),(126,'JVZW','jvzw','747468e63ea576171b98857aa37d2c882f618ffb','2024-04-27 23:57:07.230392'),(127,'USFU','usfu','64463bd636cd75c06ec14db8a7762cf471431033','2024-04-27 23:57:08.509642'),(128,'AJHN','ajhn','fdc978cbc4bbc6f095b413333855d1b2b2aa151c','2024-04-27 23:57:09.951406'),(129,'MACI','maci','c072d72f0380d589e5605b52312bdbf652fc946a','2024-04-27 23:57:11.527576'),(130,'QLJU','qlju','4f6c2d609bfb4e8a395a786a589951bfe69879e1','2024-04-27 23:57:38.128093'),(131,'SSCT','ssct','d4f13592be9c03b690e3e0d7cdd2cea29fdd7c1a','2024-04-27 23:57:39.482452'),(132,'DREO','dreo','5678eda973d3580fb55cf359f65386a719025581','2024-04-27 23:57:40.349719'),(133,'WQAN','wqan','8c48a2b313a6edf0f05f1eb13bca0399bef2f645','2024-04-27 23:57:56.149608'),(134,'JTLZ','jtlz','e054ed93d3af036681f764a959ff5f2b7052a997','2024-04-27 23:57:57.001265'),(135,'JGCI','jgci','052c1c4d527d6538b97e636437f0d1193ea674f1','2024-04-27 23:57:57.927968'),(136,'ATVU','atvu','9f4b56c54b3fe12b1067cc01fa5575ee30d9f1a0','2024-04-27 23:58:13.061420'),(137,'JNUF','jnuf','26e07fed85da491562536661d9d695ff0825464a','2024-04-28 00:05:50.022619'),(138,'EHTH','ehth','ece3c6b0c6c7f234e9775c988b4cba143038a39b','2024-04-28 00:05:51.263062'),(139,'XVSR','xvsr','3f0510af8c4a4d1dfc1c3da11d7adcae5af49820','2024-04-28 00:05:59.208241'),(140,'WCNY','wcny','c3a999011966f222898ffe6e9c318f2e0bf40fd1','2024-04-28 00:06:00.758872'),(141,'YMLY','ymly','379573fb5d0f8660c7f34fd1b1b1a434af5ec815','2024-04-28 00:06:10.926563'),(142,'PKYN','pkyn','d0e2f671f04f65b300498a65bae5c73562243a39','2024-04-28 00:06:25.558194'),(143,'KCET','kcet','baeafe0bbcec23adec26e880d92b0cc394e5def0','2024-04-28 00:06:30.587017'),(144,'KEGA','kega','382979e4fd6287a28fbe941347d961f8f572c310','2024-04-28 00:06:32.197136'),(145,'XHJP','xhjp','5f2a967e5ce31b3bcbec79d8e94bc2174de12aa5','2024-04-28 00:06:40.248580'),(146,'NOTW','notw','b2472a1564b0e40920d1fd7035d7f4af06fb51a2','2024-04-28 00:09:09.425412'),(147,'UOHN','uohn','4c2e3af1fea85f68b051841691681484b0cb6bbc','2024-04-28 00:09:21.202014'),(148,'MZOE','mzoe','0dec14f2b6872579dfa63ee6709d5ac9d39b13bf','2024-04-28 00:09:23.176851'),(149,'NIGG','nigg','f00deaa8e824699de9593b9362335a2ba0635b63','2024-04-28 00:09:28.352806'),(150,'QPUD','qpud','dea1215bcc85f099209e262e38ee1b7d85c30ae1','2024-04-28 00:09:31.870083'),(151,'IFBN','ifbn','2b09f7fb01e9c464425620d1917ed7dcf30e1621','2024-04-28 00:14:45.061167'),(152,'FZJT','fzjt','e3f869f41314f6bf9ea60370f6e54e056b27f6ca','2024-04-28 00:14:46.166731'),(153,'XUXT','xuxt','06fa61783c67b67228f018634881ecb7237b5005','2024-04-28 00:14:46.979803'),(154,'ITSN','itsn','5381759910f4d615296eb956df1610d4df621244','2024-04-28 00:14:47.399643'),(155,'YFZB','yfzb','82dcf2f27e4cf411649d6769017a3efc16a95b51','2024-04-28 00:32:27.443664'),(156,'CWPT','cwpt','1b3d1d41447c3b1256f1b821688ba3c318e45d99','2024-04-28 00:32:28.791869'),(157,'JHWQ','jhwq','98cc80774e8bd647c5ef96b8e74242a472fe1e13','2024-04-28 00:32:36.787881'),(158,'SIAF','siaf','44357fc13a3f9b5c6a3c776ee9a713258aee983c','2024-04-28 00:49:13.156312'),(159,'SQRA','sqra','5d8826a50428870d90ff79203f01812714a51621','2024-04-28 00:49:16.769531'),(161,'GCDZ','gcdz','d770a3919996d636dec2150a7745cfae0df3b4aa','2024-04-28 00:50:04.572555'),(163,'USMK','usmk','397f7e51a5c71feef55f1b8dc0a26415cf809980','2024-04-28 00:54:46.005779'),(164,'YOOE','yooe','d58a327301b1521bc8090662e990ec109faae7c2','2024-04-28 00:54:49.963326'),(165,'EASD','easd','d68470c013e89be963603ae5efadb74cf0f5ed4a','2024-04-28 00:54:51.143476'),(166,'ECHO','echo','d59cd8b61416ccb40aa8d5fad143c3ad2f2c0cbe','2024-04-28 00:54:52.186503'),(167,'IPDC','ipdc','3f357c1569e559cfbbde662ff94fa3cb8f86dcf8','2024-04-28 00:56:27.997565'),(168,'NUHS','nuhs','f6e4ec29c2bd19b6d57769abde507345c4575cd9','2024-04-28 00:56:29.582863'),(169,'VFYE','vfye','adf9d4e6c9979b90555f45c34a5a59b9043b77b6','2024-04-28 00:56:40.070002'),(170,'WYJL','wyjl','36f58ee4bf355b0f498a0c50bbc72d2f12cfe162','2024-04-28 00:56:42.359385'),(171,'WIVA','wiva','cd6cde112aba28ebd4913f315d5ab5a32684e444','2024-04-28 00:56:47.939765'),(172,'LJFK','ljfk','a1c3e6ce9aa5b0a22048dbc5e8b1555085d903bb','2024-04-28 00:56:57.213833'),(173,'KZBN','kzbn','0acd3fbb2d41d7e880fa4ebe1aa295a81b243721','2024-04-28 00:57:06.896249'),(174,'DCOJ','dcoj','af23f8ffe2573cf037307012f87c2f7cd74e8fe3','2024-04-28 00:57:09.780803'),(175,'IMTU','imtu','8fba68f598c8d66231e47752ac15be6840085e85','2024-04-28 00:57:16.309516'),(176,'IVEK','ivek','1dd2260664ad14d64f48cac643367cceb1553de6','2024-04-28 00:57:21.109200'),(177,'NTTQ','nttq','2fc1ac21f7b5f1f96f062065b9ae3128cbe5adf8','2024-04-28 00:57:23.641597'),(178,'UDPJ','udpj','073a6829fa1350fafbe0cc9b835a38dbc0af4c09','2024-04-28 00:57:28.465400'),(179,'EMUF','emuf','e21a8474d7b9b0d9e03b1dd36212db73398a54ae','2024-04-28 00:57:30.751169'),(180,'POIO','poio','1b5f64b75408a0f0b4900e5d9c4089f11e94d7f8','2024-04-28 00:57:31.639514'),(181,'GDNZ','gdnz','7a2bc01a5ce84d7323a48ec0ef088e3839192932','2024-04-28 00:57:44.331465'),(182,'ZFJD','zfjd','adc2aafdf25a2b9743d50c80bcf11c6f85d08d43','2024-04-28 00:58:30.762393'),(183,'CEKA','ceka','b8ea674702f116a93703c412b4fd56b33ed577b5','2024-04-28 00:58:32.013164'),(184,'GCHI','gchi','d708ceb048117cfe910e1240d18ac9e15fff2ddb','2024-04-28 00:58:33.266071'),(185,'HDOJ','hdoj','da25b172de3f2c205be8424c0c7ba27215c179b9','2024-04-28 01:00:42.341980'),(186,'ZOOK','zook','2e01ac57757cd740fbc670a9dbf67fce6d929908','2024-04-28 01:00:43.675191'),(187,'MPWS','mpws','feeb3ada9c6273cd2dc2057f76abeb4a1a9f7f88','2024-04-28 01:00:51.064471'),(188,'RJRH','rjrh','1e7ac469e6b9565666454a93b67aae6b4029c545','2024-04-28 01:00:55.185782'),(189,'WUOL','wuol','8080b25b81462c0eb89b8709afbe8bd269977d97','2024-04-28 01:00:56.302075'),(190,'NGKW','ngkw','6483f4d85995bd33b3ff04b070aadbb27bbb17f0','2024-04-28 01:00:56.660476'),(191,'XCQZ','xcqz','a54a80bbf3a2fb4c47b3226099d0ac0647417574','2024-04-28 01:00:57.185241'),(192,'MBNA','mbna','ef542cb11963e61885d2041ee844d60ab3fba42b','2024-04-28 01:01:03.500878'),(193,'ZMKT','zmkt','e821ff73feb66375a79c943dcb1fe477939fbb67','2024-04-28 01:16:56.801420'),(194,'GZXV','gzxv','7341358d7b1170d3c2b0d09dc8ac1970311fb448','2024-04-28 01:18:11.086865'),(195,'CEMG','cemg','2255e36dbdd1572e1669f3bc5b4e8b169fc82f2d','2024-04-28 01:19:28.341888'),(196,'PTYC','ptyc','0076451fed8e56fc57f3e8e416520c28a7c0b09c','2024-04-28 01:19:45.718327'),(197,'MBPP','mbpp','3c4f7d693f8964156b1542fe5e360e1480c875b1','2024-04-28 01:49:05.642490'),(198,'OYTR','oytr','e10e4b07055cc2d4654f84df438c052398c0e8f8','2024-04-28 01:49:07.911836'),(199,'FOXC','foxc','932ed5e2a9915c33fbfb066598c440877330655f','2024-04-28 01:49:20.436678'),(200,'RKOO','rkoo','2bef266624976933fa16d35849155452414224e3','2024-04-28 01:49:54.399535'),(201,'DWXN','dwxn','9bc6397de4743facc84a9dd7b6e99acd308f88b3','2024-04-28 01:50:02.375334'),(202,'FKIE','fkie','99fc7ae599c0174a577ff78adef0efe8a32136f1','2024-04-28 01:50:12.812320'),(203,'SCFX','scfx','22dbd4c3d8ed49a0084127f11aaa6e06ddfdf26c','2024-04-28 01:50:20.392022'),(204,'AXCH','axch','76cd45a661add4731fe12a84769db958709f3587','2024-04-28 02:55:40.956494'),(205,'HBWK','hbwk','e312ae892684e805b87bb4346fc999dcdafbaa0e','2024-04-28 02:57:36.074673'),(206,'KSNM','ksnm','75a160d8c7508a6e09934846202df8e3d979d9df','2024-04-28 02:57:56.370459'),(207,'RBSJ','rbsj','403892ea5b63fdb599d4c018b3644fadd284ffc8','2024-04-28 06:29:09.342271'),(208,'WBLQ','wblq','c326cfc8442a17055972a8008d08fe34abd484be','2024-04-28 09:33:53.173537'),(209,'HVDB','hvdb','79b26d6625f6387c6a2ce611b2726c54b7b9b508','2024-04-28 09:33:59.968088'),(210,'YEKP','yekp','f466d0c715b3e0b5d3144c6beb7265b22e9fa7be','2024-04-28 09:34:22.291820'),(211,'QYCI','qyci','9e56ee17bce22a79ec2fa90c149a4fc1030dd415','2024-04-28 09:34:22.309565'),(212,'VIJX','vijx','0586548b16483768c11c5a2baf2777b40302dea3','2024-04-28 09:34:34.053377'),(213,'KBKS','kbks','1ad771898f3b8ba475e10828935def7a692eff35','2024-04-28 09:34:43.927115'),(214,'XGOU','xgou','b92b2e2067c2d1898b24bb59fe225813f4b2bde0','2024-04-28 09:34:43.941137'),(215,'XQWD','xqwd','b1a431e42e17d6c329b7076e11d1fceb4f252b0f','2024-04-28 09:34:50.730681'),(216,'AFGL','afgl','cededc6379f94e2f46beaf272719a1e0d2124810','2024-04-28 09:35:26.246325'),(217,'NXZT','nxzt','36944e204806be2cf8209088eb49173875fa1bcd','2024-04-28 09:35:37.414644'),(218,'BYPM','bypm','16303762a53228fcbdfa8a0786d4229d3ce18d78','2024-04-28 09:35:46.203721'),(219,'WRYH','wryh','c8c01a4c74b9a72e27ff46c2e699467f13492692','2024-04-28 09:35:46.221764'),(220,'RDVC','rdvc','ec63224956b3c620b0119c3e281758dbc8078229','2024-04-28 09:36:04.221966'),(221,'AHCZ','ahcz','a3d17414632a4c7be0f345e9a2f387f70f9b08fb','2024-04-28 09:36:50.684500'),(222,'XITK','xitk','b36d79459dd8f1dbe89174cddceb11e0c501a2df','2024-04-28 09:37:03.759103'),(223,'LKZK','lkzk','af8e9d45e0a25284a2391a11fbf37b6b7c922007','2024-04-28 09:37:13.481450'),(224,'GVDZ','gvdz','da34c50a4ee186417527eeea9f5605e4d433526a','2024-04-28 09:37:15.820921'),(225,'EUDF','eudf','66b8bf333308c91124a76050e0d548f44ecf0811','2024-04-28 09:38:31.148429'),(226,'QGJK','qgjk','bed7e4af2cd3e2d2d7573d20843611d65fea40e3','2024-04-28 09:38:43.735724'),(227,'BSOQ','bsoq','8749d703f687a1b87632c76fe67e7d9bbdfbc5f7','2024-04-28 09:38:43.756651'),(228,'SCNA','scna','dea144fc5613f13fa1ee40a41d88f09686cc0802','2024-04-28 09:38:52.582161'),(229,'VVOM','vvom','560d85bd1c10b714356d5f98c23832f22395d48d','2024-04-28 09:39:02.277750'),(230,'JZYM','jzym','dc03701940dbc0e161b7eb1ff24ce490c0654423','2024-04-28 09:39:02.292862'),(231,'OKLW','oklw','1bdb478a44f86d161dcc8ec1c9e419145aab112c','2024-04-28 09:40:03.129964'),(232,'TWMX','twmx','11960700bcf53f997e6729477c82a298e22fee94','2024-04-28 09:40:11.592793'),(233,'UQSU','uqsu','93226be90927862293de804c78dc97e1d88330a8','2024-04-28 09:40:22.422502'),(234,'BMAV','bmav','b43159450ca1182b4e17177dfa24107d045cd365','2024-04-28 09:40:22.438010'),(235,'FGJW','fgjw','38748e3f20adc4682b47f1a04dc907670884eab0','2024-04-28 09:41:36.449912'),(236,'PPMR','ppmr','bb5944ec014523125dc6c9e63aae3375494341e6','2024-04-28 09:41:45.763751'),(237,'RVYI','rvyi','3a635f39190355632c32c8c6edcfbf285a72ba4f','2024-04-28 09:41:53.560655'),(238,'EWNP','ewnp','6eeaaab7c3edb9dac6162ff5047d80d70770b3bf','2024-04-28 09:42:10.074224'),(239,'VMGS','vmgs','265816a701e0bd93596c0c75f039451bbaebf43a','2024-04-28 09:42:17.439735'),(240,'GGDU','ggdu','15dff54058961051119864ab7005a3ee8859a33e','2024-04-28 09:43:59.866149'),(241,'TXSU','txsu','f8f703d1c6a2852500ab45105d187a3a870bc51b','2024-04-28 09:44:07.496934'),(242,'NOUK','nouk','4745c4b9da28c82842267ac09a0106c73b5111bf','2024-04-28 09:44:19.283764'),(243,'TFOL','tfol','450e2a1d5d9dca8230870ee47a1f8fe3b0bb8204','2024-04-28 09:44:19.302582'),(244,'GDHT','gdht','b44e87f4f257f1ce6cb4ae7ee7fa1413437619ae','2024-04-28 09:48:09.195491'),(245,'TPCM','tpcm','65d56680f689ec45a43c9fa27cc41b49983a5c67','2024-04-28 09:48:20.564475'),(246,'PZIN','pzin','ad754d4fc6bbd436651dcf967bde1c6a6c005664','2024-04-28 09:48:20.578418'),(247,'FWGP','fwgp','433a12a9446cee2988de4ab6a1a40ce6de3c0243','2024-04-28 09:48:52.736247'),(248,'KPQV','kpqv','d83ee394b67aeccc9d8cb83f7d7ca7e580c5c95d','2024-04-28 09:48:54.864761'),(249,'QKBM','qkbm','37b28bef77c9472f021d2018a038e48ce8f76183','2024-04-28 09:48:59.091419'),(250,'ZLZG','zlzg','f2590a6f4eaa7f077ddbc59aae00a06ef7d96962','2024-04-28 09:49:13.652231'),(251,'ZGNJ','zgnj','dc3ba9e1ef7fbb70907cb2e75216d302fa2fe27c','2024-04-28 09:49:17.431867'),(252,'AGXQ','agxq','0ce5cca399249d99d1b9310fe489d7282ac337d2','2024-04-28 09:51:09.440647'),(253,'UMAH','umah','cc568677391983541ceee0250d9d7ad804a3069d','2024-04-28 09:51:18.824941'),(254,'WEAF','weaf','d2017e6b8a1eb50fc236ea1fec66c8e392b22450','2024-04-28 09:51:25.687053'),(255,'NADV','nadv','422fc9effc7092b5bffa2730cbdc7b9b02ad760e','2024-04-28 09:51:25.702022'),(256,'ZKFE','zkfe','9463a28a2caeef02570030fcd792d5a632d3f0a7','2024-04-28 09:57:34.581790'),(257,'BVAG','bvag','e5a23fb5222161460bb39940d27ce418ecff1f84','2024-04-28 09:57:44.996799'),(258,'LQDT','lqdt','4db6e84edc171ac5832f459e578612dff0b04f00','2024-04-28 09:57:45.269375'),(259,'JHLA','jhla','d351967f27b4a71895803988d3b36529c97b4836','2024-04-28 09:58:24.648754'),(260,'EQVD','eqvd','8db2745f95c08bd8851b88dceb3b1d087bf40fad','2024-04-28 09:58:42.069095'),(261,'GFNN','gfnn','7c3bca5fe8a30aad5cff843eb6ac6e1d8fac6146','2024-04-28 09:58:52.790429'),(262,'TBHW','tbhw','5027e107db790fbc484aee4538da2947fb99defa','2024-04-28 09:58:53.077742'),(263,'UMLN','umln','dac8575e35772761a0a331cb5e26a68f2177bd0e','2024-04-28 10:01:29.243986'),(264,'OZYQ','ozyq','d3bd121fa398fef05afbb81a28c5f7fd11405c07','2024-04-28 10:01:37.366202'),(265,'HHDR','hhdr','158ea505ccac27b053edac5e2a9a2275680e2e34','2024-04-28 10:01:37.661267'),(266,'XHYU','xhyu','add4eb7e4122ca10bfc66113c702825d26e0cc4f','2024-04-28 10:02:14.565500'),(267,'QRSV','qrsv','6f65d1b9dfe2d4932994d5160abc91dc26cec0d3','2024-04-28 10:02:20.594628'),(268,'WXLU','wxlu','711695cea346444218801452a27ebd7674b67e9f','2024-04-28 10:02:20.866155'),(269,'ODUY','oduy','9738799e8a4944d09c97780e7f214de7d1e8b04e','2024-04-28 10:03:27.332568'),(270,'BKIN','bkin','75ac3182a9b5c176dd12a30f3c85ad6e10b39b5a','2024-04-28 10:08:42.009918'),(271,'EZHY','ezhy','3271b5d94496af959c6a5c4e47d3f055ad676456','2024-04-28 10:08:48.820672'),(272,'WIGP','wigp','63f69586143a692a010365f0a3ec8f5096bc0fc6','2024-04-28 10:10:52.139237'),(273,'SNZC','snzc','66fbd018a95aa9e7c1703e25378bc326c8c385e3','2024-04-28 10:10:59.158840'),(274,'YKPW','ykpw','c9aaa5154b59b894c845a046d7a1a15e6c9056fb','2024-04-28 10:11:05.543702'),(275,'KKKQ','kkkq','160a5e60115c2765b89aa1095b10fc69321aa832','2024-04-28 10:12:42.684771'),(276,'RMNZ','rmnz','f8264418084c1817eebc8698e39447961f368d4f','2024-04-28 10:12:48.745557'),(277,'HWNO','hwno','3fd7facf635fc3f7e0e63914ab7ec4845b99c204','2024-04-28 10:13:15.985852'),(278,'XMLZ','xmlz','7f27f2ac4bd22c8a383dc9cb51d85e7f4ba4eda9','2024-04-28 10:13:20.792013'),(279,'UNXO','unxo','89398ddcec74446914635a7b21b170c38ca21e33','2024-04-28 10:13:27.533689'),(280,'WDEM','wdem','1037ce96100a6032372e86ef20ee456eb0b79678','2024-04-28 10:14:15.112742'),(281,'NAOK','naok','d4e7611e70cd6c30bdcfe4d1f901171bb74784e3','2024-04-28 10:14:20.301924'),(282,'JRGI','jrgi','a1697d375bb52f72b69037047ed4fd0497c2b9a1','2024-04-28 10:21:47.079318'),(283,'IAAU','iaau','14271bc28432842fb7f835a99e82fd947159710a','2024-04-28 10:21:59.385654'),(284,'RNBW','rnbw','505879ff3d430ba2ab75a8e518f21494ea37dd05','2024-04-28 10:22:06.838610'),(285,'BMJY','bmjy','dc574b2a9f136e0039e3d0d2b8bb34282b83e9b6','2024-04-28 10:22:16.657737'),(286,'CPIH','cpih','767305d6b25192630c69fb0ff63bbcc94cfa9a13','2024-04-28 10:22:16.678953'),(287,'GCLO','gclo','f8d6b29e3a711b8c1c6d72c0c087a69abaa1edfb','2024-04-28 10:27:07.008109'),(288,'YRAA','yraa','812af0d166e180e28cf0929471868f3b775d368f','2024-04-28 10:29:53.162820'),(289,'NUYV','nuyv','e28df040bd775c129470eb988292ffceb1eaf812','2024-04-28 10:30:02.984989'),(290,'YHRB','yhrb','01648dba476852115bbf228ed919a270f457264a','2024-04-28 10:30:08.978413'),(291,'RTJQ','rtjq','4e2466e6ec0c594cd88b226e7018296115e1ba01','2024-04-28 10:30:19.551416'),(292,'LMNC','lmnc','d4f1efd9fab3430e363e730330e4bc3e0655a3a6','2024-04-28 10:33:38.416809'),(293,'HRPS','hrps','49d25b3c94118af30bd0446b3a4194b777b55bb8','2024-04-28 10:58:29.044452'),(294,'UYZN','uyzn','860296182770080c53985bffce9ae935bc840648','2024-04-28 10:58:38.227249'),(295,'NSJK','nsjk','7010b58f5517637b142514cb6d8743942866248a','2024-04-28 11:00:33.628226'),(296,'VPHD','vphd','7780a58d18da98b0e80eb8424928732943866dc7','2024-04-28 11:00:40.440062'),(297,'MHNV','mhnv','27eddb9a254b7665735a4ade8de08d5bba949128','2024-04-28 11:10:07.729990'),(298,'WWUD','wwud','764e5a35af28e311e0baf3c09b22c9693b34efaf','2024-04-28 11:10:19.526293'),(299,'PLRK','plrk','0f5cd55a8765bb5e1954a4f336f9c7330d36cb21','2024-04-28 11:10:20.714098'),(300,'DABP','dabp','944bf76054e32bdaa78da5e70b1f70efc5a995a6','2024-04-28 11:10:32.055384'),(301,'IOCK','iock','6fe4c91f19e47566a1f2aed1d8158c484155f7fc','2024-04-28 11:28:16.141799'),(302,'SONB','sonb','211304d279c5725fc91165f6156566fdf016ec23','2024-04-28 11:28:24.390267'),(303,'TKKE','tkke','99bfe73fca74e4b0b41f0aeebc19a0c6209ddd3b','2024-04-28 11:28:24.412284'),(304,'XOEZ','xoez','aff06c6c9feac4921f9cdc425968b65f57c1c746','2024-04-28 11:30:04.532255'),(305,'RXDV','rxdv','476e8808c20e0c933e6da91422e54ff06851a196','2024-04-28 11:30:12.904160'),(306,'MSDS','msds','127ed7e4d3dea7e3caa802487f8e42e807a9db12','2024-04-28 11:30:12.925848'),(307,'ATES','ates','a0576f12da22527e2c4e1b18e575b082866582d8','2024-04-28 11:31:19.428424'),(308,'LMPI','lmpi','cce3a4f444fe6e4cecd1a3e9ead95ef38a6efe96','2024-04-28 11:32:09.491307'),(309,'NDMX','ndmx','e3657d642c70ab801690b294b57d6812f5311f25','2024-04-28 11:32:16.889149'),(310,'ATTL','attl','977e62437d2e52ca7e1c8c0e35c35adc2566570f','2024-04-28 11:39:15.724690'),(311,'TKMD','tkmd','7ba95de1b82e530b6fc73ed9336dcba7347518ec','2024-04-28 11:39:27.720259'),(312,'LDWX','ldwx','9e5c79401e40e93231f8bdd49e8289e47190e88a','2024-04-28 11:40:15.367466'),(313,'NHSL','nhsl','d5d1925a3bbf4332d2006b1b532090ffc3a71af9','2024-04-28 11:40:22.098525'),(314,'RQJM','rqjm','f40232f7326a2bea0f1baa03a54ad7fc4b53782e','2024-04-28 11:40:29.098444'),(315,'TYIN','tyin','6476c71f5631ae58375f8b21c3bda62dd00a26af','2024-04-28 11:42:58.113199'),(316,'ZVOF','zvof','ae0207cd6e0800bf12d3a744f2b14b96e75a95ee','2024-04-28 11:43:04.103312'),(317,'PQLC','pqlc','8fa25e9ca6022b0df5ff63bed16bc2cb715ad86e','2024-04-28 12:36:02.961782'),(318,'GSUU','gsuu','611bd98295de34a84eaeedd40042dfe2a334e0d1','2024-04-28 13:30:27.880350'),(319,'WKUA','wkua','08e3df3185f94433e690044fe6c68e07fb57b013','2024-04-28 13:33:01.513724'),(320,'XNDB','xndb','e797a7b37807678af4a10c257b734676184dc937','2024-04-28 13:33:49.392741'),(321,'YDSG','ydsg','02b4d99d8cf34ac5a37aa8b957dd50611b955faa','2024-04-28 13:33:50.784668'),(322,'ARYW','aryw','e7815772e9e3be38169cee571c94ee3bfa863187','2024-04-28 13:33:57.771050'),(323,'YDON','ydon','763bb327e23d46be57243d97576a9d31fee0ab9f','2024-04-29 02:35:06.675353'),(324,'VSLB','vslb','39161fd185fc1f403cb8332618e7a2b6160f17f2','2024-04-29 03:12:18.817846'),(325,'ICFQ','icfq','0b8428c831722d13a94f47bad82fcefb3b3b50b2','2024-04-29 03:12:32.900429'),(326,'LDRP','ldrp','ed221aab086e460b8e6c1f26462a996b3d3eaf9d','2024-04-29 03:13:19.072210'),(327,'AVVK','avvk','c816edf87ba393896e495ec29540d83e8e4a94ab','2024-04-29 03:13:25.708777'),(328,'BATJ','batj','111aaa9f55ec21f85989bd618321f6433fc6d3b5','2024-04-29 03:16:01.409663'),(329,'RBFN','rbfn','453140760a2ae49181c6e3fb1d63c04abdfdf48d','2024-04-29 03:16:09.373862'),(330,'GPNZ','gpnz','21eaadffbce61ed757bfc2f93358c67b414f728f','2024-04-29 03:21:00.786080'),(331,'ULEK','ulek','56bf7cd24a79bc7535d97bb642330e322168e24b','2024-04-29 03:21:08.254663'),(332,'FMKA','fmka','bc19a9f30242e91d858af3dbd7eb9e4f9ce24270','2024-04-29 03:34:27.950771'),(333,'XDZB','xdzb','dd7775f0bfe954bb846d4252607b07b8c9d5fea3','2024-04-29 03:34:38.017132'),(334,'LZTZ','lztz','2c909bc8f134131245a42ced42ce1d689dd723d0','2024-04-29 03:55:38.620251'),(335,'SRQV','srqv','469750e2ab20dfc8d7ca0a74051b787bdeb209f2','2024-04-29 03:55:50.546968'),(336,'DPDV','dpdv','54faf6217c3c2d8a6d6f22fd85091d0260a3688f','2024-04-29 03:57:02.315962'),(337,'FQVI','fqvi','8d89afd5c165271433caa0608a383c5cf035d7e0','2024-04-29 03:57:10.583194'),(338,'KYHE','kyhe','39f0b15ec0dd88cbe2704c84245bc4589089f8f1','2024-04-29 03:59:41.701618'),(339,'CAEV','caev','da490aeae2bc86f0002f6a140ee9d7f8e07098ec','2024-04-29 03:59:54.799814'),(340,'JYKE','jyke','0b79127776a25a75402e1fb7fcc0362cb8583989','2024-04-29 04:00:01.522230'),(341,'YIBK','yibk','f17a9cef28e495c32941a08d29307c1fe445345e','2024-04-29 04:02:51.269434'),(342,'DIJV','dijv','6cf82fe713ca240d72fa4e1f50fbd67f96196ac9','2024-04-29 04:03:01.237452'),(343,'AJAA','ajaa','887bbdaa25a684e5ecc78c3ff2c47721695bb78c','2024-04-30 12:22:41.407726'),(344,'JKUU','jkuu','d8e8a457b510a7023ab04add2918e026e3912bd0','2024-04-30 12:22:48.232273'),(345,'BCFR','bcfr','5c3a7883d53447cee69baa67136d209d96a9e02d','2024-04-30 12:23:55.048050'),(346,'PGKM','pgkm','171948ab445a54220efbfbc44de03481601cc760','2024-04-30 12:27:09.673170'),(347,'CSHL','cshl','e5c470afc449677a1c3ec9c0bf3a208a1097a699','2024-04-30 12:27:17.657614'),(348,'MWRU','mwru','f65341b99f28b07ef81c5bcca7cebe8f9e83166e','2024-04-30 12:48:04.857122'),(349,'RNJW','rnjw','512bbf18dbf6fe66c703100a263e453c3c3181be','2024-04-30 12:48:13.804251'),(350,'EKIB','ekib','fd8124477706360b78010bf467d25a8e7f5f678a','2024-04-30 12:48:22.479263'),(351,'BETU','betu','78cda736a8e9d782f03b586c02ed33a403101d47','2024-04-30 12:50:13.736672'),(352,'HGYX','hgyx','c6b298140b58886a009d077bc4abc1d027675149','2024-04-30 12:50:23.097493'),(353,'AKNM','aknm','d309c895178a4035372569d8a1a04cdf895f6d74','2024-04-30 12:51:15.669540'),(354,'CLPS','clps','0f41c0bffded99e570dc50ccf4c2ec40fe7322c2','2024-04-30 12:51:22.933243'),(355,'BTTW','bttw','651dda4586e2debac9c72a2425fb4b4fead9f198','2024-04-30 13:16:53.244108'),(356,'JZTQ','jztq','9ae56ab5dc8fb1e3916672894c278b27235bdf66','2024-04-30 13:17:06.166120'),(357,'QLSP','qlsp','ebb06c8191ea1f331d6934c53b6ecce7a5614eeb','2024-04-30 13:17:16.130684'),(358,'TSJB','tsjb','f3885b34e69ecae4540f0a90cd7c74af422864d2','2024-04-30 14:45:52.510985'),(359,'LAUP','laup','1dc967911a0902ab951c2358af4b847253856aca','2024-04-30 14:45:59.519666'),(360,'YOKR','yokr','c8be12a495f610da1280f921eb7fde6a28b3230d','2024-05-01 06:56:35.373660'),(361,'JOUE','joue','110b173d944f938f2ccf8586e8f4a5ce99dfb8a0','2024-05-01 06:56:58.523989'),(362,'VHDA','vhda','6c6bcf5dad2c3c1e9b1275a511b957827d2622bf','2024-05-01 06:58:45.475952'),(363,'TXDY','txdy','74f0d62ffb8e729182e64fdd36e46eff27723480','2024-05-01 06:58:51.316427'),(364,'NZTJ','nztj','8dd832289353fba1fdc77c5ec147ae034b4a8665','2024-05-01 12:52:16.591560'),(365,'EZQQ','ezqq','4c144e9921de6fdd3861c2fa9e36b37668b4dd7b','2024-05-01 12:52:26.150558'),(366,'NMCF','nmcf','dd53362e2f069ade9133a97d687b2bea9a377f0b','2024-05-03 01:33:20.354763'),(367,'IWEB','iweb','08ca69b5aece00cdead2d9ab6d7786b8073fd44c','2024-05-03 01:34:53.773763'),(368,'BQXN','bqxn','270f75d60f66664bd1f7fbd37c30ba58c6377e15','2024-05-03 01:35:06.272634'),(369,'ZEFX','zefx','630eff884e0c5cee51f70f2b9d8ce56c399fe889','2024-05-03 01:36:54.487457'),(370,'JFNF','jfnf','68e93625b7d3872c8b08533f337bc6c9e75a3dce','2024-05-03 01:48:59.108389'),(371,'TAXA','taxa','d49fd341d35bbda64e1d4330ef0153d75408f48c','2024-05-03 01:50:24.413534'),(372,'KQLW','kqlw','f1dc0d23bd2edd80df5074f32680427411da72f8','2024-05-03 01:51:22.956655'),(373,'OKZK','okzk','88d858e3509f664d0331870e7e0af4e5e8add8f4','2024-05-03 01:51:23.532099'),(374,'BEBN','bebn','24ada287314841bde917c7c994d9547bbd7e2e4d','2024-05-03 01:53:19.738458'),(375,'OOON','ooon','ceff1c3b9b5ae153713ffda0421f86d28c7904a9','2024-05-03 01:57:12.573155'),(376,'KIGJ','kigj','edfacb2345a10e9b428d81e101893c60964e4604','2024-05-03 01:57:22.321436'),(377,'TICL','ticl','15c2d678e21eb37014b5470db859833b244d28bc','2024-05-03 01:57:32.449895'),(378,'ZAQE','zaqe','aa1a99200e43b200f41de03c67f1d762be9f9955','2024-05-03 01:57:41.357119'),(379,'WTSF','wtsf','d9e544f2127671269c935097e14f66412a0fbfae','2024-05-03 01:57:54.978968'),(380,'NANT','nant','0a4eb29e8ac60f0f94b0a86d944c2f28aadec4b3','2024-05-04 05:34:13.199776'),(381,'XFKZ','xfkz','728720a44a919d61d6a8c5ca0787ce0e4b193294','2024-05-04 05:34:27.809316'),(382,'UFFO','uffo','c524031e1b5cfabbd84d568c9686e915d63ed07e','2024-05-04 05:34:36.453445'),(383,'OXVO','oxvo','1fb9f0b51f7ff41f9d1456843ce5500dfbca58a3','2024-05-04 14:21:51.244055'),(384,'ASVH','asvh','4c97f3efdf68131d483aebd52c5220fbd9d264bd','2024-05-04 14:21:59.647088'),(385,'IZCT','izct','3acbf576e5d973f2065a4a23964df5b7c849d110','2024-05-06 02:06:38.529171'),(386,'XSYN','xsyn','65e6051b7c8d4e6fa14ab91078dc06b5fe74280b','2024-05-06 02:06:48.634385'),(387,'MOIG','moig','a7a755378d3bfe8ce8ff1d66d5a6d084fe9b6e7c','2024-05-06 02:08:50.071805'),(388,'JKMS','jkms','35f068f6f7770569fc2683e666095727ec132997','2024-05-06 02:08:58.035753'),(389,'NQRV','nqrv','ba92550a2bf3ddd00d2f62d6b53eeb3d577277e7','2024-05-06 02:09:26.719188'),(390,'GSRI','gsri','b869fc117cec55c5758dba6123244f3155bb6a43','2024-05-06 02:19:30.383266'),(391,'ZULO','zulo','e9d3123d548ae4ec28f601163d999c9784498619','2024-05-06 02:23:23.478950'),(392,'YRZG','yrzg','35e923425623bbd428c828eb3c258a20a56a5889','2024-05-06 02:23:49.369556'),(393,'FPBE','fpbe','797704bd0fa7af4b72caff308065429edbfa2344','2024-05-06 02:27:11.114397'),(394,'KFTQ','kftq','0629e5bacd03fe05d7fedc01e5bab59b59a71ba0','2024-05-06 02:27:25.600488'),(395,'AVXY','avxy','a0ec009c79f0d2e9e00c34b5e2fb0a12a10677ce','2024-05-07 13:19:35.608698'),(396,'GPQB','gpqb','c85d1f2a558c1d9ebfea182c836f6129abc77ffc','2024-05-07 13:19:45.145178'),(397,'BYPN','bypn','ae364397905368f6b8facc49ffdb911c2ab1f0d8','2024-05-07 13:20:05.972888'),(398,'WKOO','wkoo','ddc3a776c028e089ce94867ecb6ff2eb09ce30b2','2024-05-08 00:40:45.554801'),(399,'NSLP','nslp','91c705ed325e6f5c438886168dfb3267b4867e1b','2024-05-08 00:40:55.387558'),(400,'LKGK','lkgk','53c648095945429fe31d2b454becf1779cfdce71','2024-05-08 00:41:04.407264'),(401,'USUF','usuf','4c9f5b34f9bb7197be25b062c204e1dc6c2cb7ad','2024-05-08 00:42:22.039614'),(402,'ROMK','romk','a3e19b0cc59d512ce590c2c4c7b5630c22aa1bd1','2024-05-08 00:44:01.844464'),(403,'GRJY','grjy','1adad46e6a8dc79f845a67c8e6675e8b13be187f','2024-05-11 08:21:43.644899'),(404,'JIIU','jiiu','940ba6a8437a1ad32c44aff654be94317e793981','2024-05-12 04:24:12.482951'),(405,'ICNN','icnn','751bd250e5de79069f8a247ec65df3fd2e079ef1','2024-05-12 04:24:21.670890'),(406,'YXOL','yxol','f24a9a811ad708fca3e8ad340dc158bb34c28c63','2024-05-12 04:24:24.577688'),(407,'NKKZ','nkkz','4bb75358f8475557da953904004162dc5c2c4156','2024-05-12 04:58:06.009766'),(408,'WHGQ','whgq','6f5fe0789f6ad839c3154a0e7c3c7e283d63f508','2024-05-12 04:58:19.323789'),(409,'GWMB','gwmb','6f547878796ebef2f27aa8e47415cd60a23e22cc','2024-05-13 02:20:44.613500'),(410,'NOEL','noel','212d62ea7f8a37aa060adac839db79693c13f6d7','2024-05-13 02:20:56.141123'),(411,'YVOI','yvoi','4109f992eb1b63c38eca51ab8c4f36753f577855','2024-05-13 02:21:05.847362'),(412,'LSDV','lsdv','784903a9e87f3351ff100fc27cbe602a1c7e1a1b','2024-05-13 02:21:40.731154');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `comment_length_view`
--

DROP TABLE IF EXISTS `comment_length_view`;
/*!50001 DROP VIEW IF EXISTS `comment_length_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comment_length_view` AS SELECT 
 1 AS `username`,
 1 AS `text`,
 1 AS `text_length`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `userid` char(15) NOT NULL,
  `essayid` char(15) NOT NULL,
  `textid` char(15) NOT NULL,
  `text` char(100) NOT NULL,
  `saytime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`textid`),
  KEY `idx_comments_userid_essayid` (`userid`,`essayid`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `check_textid` CHECK (regexp_like(`textid`,_gbk'^2[0-9]{8}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('000000001','100000002','200000001','谢谢钢铁猪猪侠送来的钢铁棒棒糖！','2024-03-22 14:25:06'),('000000002','100000001','200000002','哇真的是你呀，下次一定要继续玩。','2024-03-22 14:20:06'),('000000006','100000002','200000003','这是一个测试','2024-05-12 10:51:39');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'captcha','captchastore'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-27 10:35:07.500547'),(2,'auth','0001_initial','2024-04-27 10:35:07.833570'),(3,'admin','0001_initial','2024-04-27 10:35:07.956383'),(4,'admin','0002_logentry_remove_auto_add','2024-04-27 10:35:07.962394'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-27 10:35:07.966628'),(6,'contenttypes','0002_remove_content_type_name','2024-04-27 10:35:08.005910'),(7,'auth','0002_alter_permission_name_max_length','2024-04-27 10:35:08.054022'),(8,'auth','0003_alter_user_email_max_length','2024-04-27 10:35:08.065976'),(9,'auth','0004_alter_user_username_opts','2024-04-27 10:35:08.069981'),(10,'auth','0005_alter_user_last_login_null','2024-04-27 10:35:08.124971'),(11,'auth','0006_require_contenttypes_0002','2024-04-27 10:35:08.127966'),(12,'auth','0007_alter_validators_add_error_messages','2024-04-27 10:35:08.137971'),(13,'auth','0008_alter_user_username_max_length','2024-04-27 10:35:08.179824'),(14,'auth','0009_alter_user_last_name_max_length','2024-04-27 10:35:08.224940'),(15,'auth','0010_alter_group_name_max_length','2024-04-27 10:35:08.235939'),(16,'auth','0011_update_proxy_permissions','2024-04-27 10:35:08.240939'),(17,'auth','0012_alter_user_first_name_max_length','2024-04-27 10:35:08.281059'),(18,'captcha','0001_initial','2024-04-27 10:35:08.294963'),(19,'captcha','0002_alter_captchastore_id','2024-04-27 10:35:08.295649'),(20,'sessions','0001_initial','2024-04-27 10:35:08.317165');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6sf86gsy6ptotwyt532p2q538t0j5cjc','e30:1s12Fw:7Zxw7klfGtpoyqMfxNbeVHwlWcSH7lFufv06UmQcBaw','2024-05-12 10:59:40.729125'),('81uykbxrpdjokmraoqj5gc337sx71v9m','e30:1s11X6:29uu0GRk71YVatMls4WWoAY3M_OyQ_eTWaekg8qByAs','2024-05-12 10:13:20.311229'),('95c358a51safnoqczju0e07pjs7vdesd','eyJ1c2VybmFtZSI6InRlc3QifQ:1s12Dy:-5ljgQ0SxRqy8iF6da3L_dvr6EKgy7_u8WvCuKdbUUs','2024-05-12 10:57:38.236759'),('gjux3icm0n95sd4aonh056k3a4mgv93f','e30:1s11Rk:OUYQQQSZFmW3JldPcTq9clnod1tdpHUsFDlclsAAiLM','2024-05-12 10:07:48.828730'),('l5vd7mfzjzk80kvbgkfoogn8t09l90t8','e30:1s11Tx:UQAC55gQ2qANME3Cz5T-AUlxjAz17VNGayGN-nXuYto','2024-05-12 10:10:05.552416'),('unnu5jvgccf897fh28jdcywfqs6y1hwb','e30:1s11MZ:Usle83qBiwarn7zZS9Ol3VJ7HG3xVczvupBTfanQCRw','2024-05-12 10:02:27.605428');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `essay_owners`
--

DROP TABLE IF EXISTS `essay_owners`;
/*!50001 DROP VIEW IF EXISTS `essay_owners`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `essay_owners` AS SELECT 
 1 AS `owner_name`,
 1 AS `essayid`,
 1 AS `support_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `omnerid` char(15) NOT NULL,
  `essayid` char(15) NOT NULL,
  `sptid` char(15) NOT NULL,
  `spttime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sptavatar` char(100) NOT NULL,
  PRIMARY KEY (`sptid`),
  KEY `omnerid` (`omnerid`),
  CONSTRAINT `support_ibfk_1` FOREIGN KEY (`omnerid`) REFERENCES `user` (`id`),
  CONSTRAINT `check_sptid` CHECK (regexp_like(`sptid`,_gbk'^3[0-9]{8}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
INSERT INTO `support` VALUES ('000000001','100000002','300000001','2024-03-22 14:19:20','user/photo/myphoto.png'),('000000002','100000001','300000002','2024-03-22 14:18:20','user/photo/zzxphoto.png'),('000000003','100000001','300000003','2024-04-01 12:39:45','user/photo/hyxzphoto.png'),('000000002','100000003','300000004','2027-04-07 22:00:25','user/photo/zzxphoto.png');
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `name` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user',
  `signature` char(100) DEFAULT NULL,
  `avatar` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty/empty.jpg',
  PRIMARY KEY (`id` DESC) USING BTREE,
  UNIQUE KEY `unique_id` (`id`),
  CONSTRAINT `fk_adpass_id` FOREIGN KEY (`id`) REFERENCES `adpass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `check_id_format` CHECK (regexp_like(`id`,_utf8mb4'^0[0-9]{8}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('000000010','test1','','empty/empty.jpg'),('000000008','test',NULL,'user/empty/empty.jpg'),('000000007','LiLingzhee',NULL,'user/empty/empty.jpg'),('000000006','热情火箭人','烈火燃烧，燃尽一切阻碍','user/photo/rqphoto.jpg'),('000000005','雷霆忍者','闪电迅雷，刀刃无声','user/photo/rtphoto.jpg'),('000000004','寒冰射手','一颗冰蓝色的豌豆','user/photo/bsnsgphoto.jpg'),('000000003','火焰小子','烈火燃烧，无所畏惧','user/photo/hyxzphoto.jpg'),('000000002','钢铁猪猪侠','jjb超级变身','user/photo/zzxphoto.jpg'),('000000001','无敌暴龙战士','12345678','user/photo/myphoto.jpg'),('000000000','admin',NULL,'empty.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_adpass_name` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
    UPDATE adpass SET name = NEW.name WHERE id = NEW.id;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_DeleteWhosays` AFTER DELETE ON `user` FOR EACH ROW BEGIN
    DECLARE msg VARCHAR(255);
DELETE FROM whosays WHERE ownerid = OLD.id;
SET msg = CONCAT('Deleted user ID: ', OLD.id);
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `user_subset_view`
--

DROP TABLE IF EXISTS `user_subset_view`;
/*!50001 DROP VIEW IF EXISTS `user_subset_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_subset_view` AS SELECT 
 1 AS `id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `whosays`
--

DROP TABLE IF EXISTS `whosays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whosays` (
  `ownerid` char(15) DEFAULT NULL,
  `essayid` char(15) NOT NULL,
  `text` char(250) DEFAULT NULL,
  `saytime` datetime DEFAULT NULL,
  `pictureway` char(100) DEFAULT NULL,
  PRIMARY KEY (`essayid`),
  KEY `fk_ownerid_user_id` (`ownerid`),
  CONSTRAINT `fk_ownerid_user_id` FOREIGN KEY (`ownerid`) REFERENCES `user` (`id`),
  CONSTRAINT `check_essayid` CHECK (regexp_like(`essayid`,_gbk'^1[0-9]{8}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whosays`
--

LOCK TABLES `whosays` WRITE;
/*!40000 ALTER TABLE `whosays` DISABLE KEYS */;
INSERT INTO `whosays` VALUES ('000000001','100000001','今天碰到了钢铁猪猪侠，真开心！','2024-03-22 14:00:05','whosays/essayt3.jpg'),('000000002','100000002','今天碰到了无敌暴龙战士，真开心！','2024-03-22 14:08:05','whosays/essay1.jpg'),('000000001','100000003','这是一个测试','2024-04-06 14:25:23',''),('000000007','100000004','李灵哲发出了第一个朋友圈','2024-05-10 15:11:22','whosays/essay1.jpg'),('000000008','100000005','大家好，我创建了一个朋友圈。','2024-05-12 16:58:12','whosays/essay1.jpg');
/*!40000 ALTER TABLE `whosays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `comment_length_view`
--

/*!50001 DROP VIEW IF EXISTS `comment_length_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comment_length_view` AS select `u`.`name` AS `username`,`c`.`text` AS `text`,length(`c`.`text`) AS `text_length` from (`comments` `c` join `user` `u` on((`c`.`userid` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `essay_owners`
--

/*!50001 DROP VIEW IF EXISTS `essay_owners`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `essay_owners` AS select `u`.`name` AS `owner_name`,`w`.`essayid` AS `essayid`,count(`s`.`essayid`) AS `support_count` from ((`whosays` `w` join `user` `u` on((`w`.`ownerid` = `u`.`id`))) left join `support` `s` on((`w`.`essayid` = `s`.`essayid`))) group by `w`.`essayid`,`u`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_subset_view`
--

/*!50001 DROP VIEW IF EXISTS `user_subset_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_subset_view` AS select `user`.`id` AS `id`,`user`.`name` AS `name` from `user` */;
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

-- Dump completed on 2024-05-16 10:18:03
