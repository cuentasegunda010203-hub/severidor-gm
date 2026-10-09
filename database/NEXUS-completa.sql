-- MariaDB dump 10.19-11.4.5-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: gzrp
-- ------------------------------------------------------
-- Server version	11.4.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` int(11) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Nombre_Jugador` varchar(32) NOT NULL,
  `Valor` int(11) NOT NULL DEFAULT 0,
  `Progreso` int(11) NOT NULL DEFAULT 0,
  `Completado` int(11) NOT NULL DEFAULT 0,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `EstadoRAID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=80565 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES
(80553,1,'Nivel 4','Alcanza el nivel 4','Williangel_Vera',0,0,0,'2026-10-05 08:55:31',0),
(80560,4,'Adicto al crack','Consume gramos de crack','Williangel_Vera',0,3,0,'2026-10-06 00:52:22',0),
(80561,1,'Nivel 4','Alcanza el nivel 4','Shadows_Dzxx',0,0,0,'2026-10-06 16:35:01',0),
(80562,3,'Automedicado','Consume medicamentos','Williangel_Vera',0,5,0,'2026-10-07 07:37:17',0),
(80563,1,'Nivel 4','Alcanza el nivel 4','Williangel_Verass',0,0,0,'2026-10-07 21:21:47',0),
(80564,2,'Sobre ruedas','Compra su primer vehiculo','Williangel_Vera',0,0,0,'2026-10-08 23:46:37',0);
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_queue`
--

DROP TABLE IF EXISTS `action_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_queue` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `faccj` int(11) NOT NULL DEFAULT 0,
  `user_ses` varchar(24) NOT NULL DEFAULT 'Nadie',
  `jugname` varchar(24) NOT NULL DEFAULT 'Nadie',
  `queue_params` varchar(24) NOT NULL DEFAULT 'nada',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 sin atender, 1 atendido, 2 error',
  `type` int(11) NOT NULL DEFAULT 0,
  `razon` varchar(128) NOT NULL DEFAULT 'Ninguna',
  `TiempoJail` int(11) NOT NULL DEFAULT 0,
  `NRango` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_queue`
--

LOCK TABLES `action_queue` WRITE;
/*!40000 ALTER TABLE `action_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_queue_discord`
--

DROP TABLE IF EXISTS `action_queue_discord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_queue_discord` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `UserID` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ADM` int(11) NOT NULL DEFAULT 0,
  `SAPD` int(11) NOT NULL DEFAULT 0,
  `UID` int(11) NOT NULL,
  `Nivel` int(11) DEFAULT NULL,
  `Registro` text NOT NULL,
  `Pais` varchar(32) NOT NULL DEFAULT 'Unknow',
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1551 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_queue_discord`
--

LOCK TABLES `action_queue_discord` WRITE;
/*!40000 ALTER TABLE `action_queue_discord` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_queue_discord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actores_tiendas`
--

DROP TABLE IF EXISTS `actores_tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores_tiendas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Skin` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `A` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VW` int(11) NOT NULL,
  `Localidad` varchar(32) NOT NULL DEFAULT 'Los Santos',
  `EntradaLocalX` float NOT NULL,
  `EntradaLocalY` float NOT NULL,
  `EntradaLocalZ` float NOT NULL,
  `EnUso` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores_tiendas`
--

LOCK TABLES `actores_tiendas` WRITE;
/*!40000 ALTER TABLE `actores_tiendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores_tiendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_names`
--

DROP TABLE IF EXISTS `admin_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_names` (
  `#_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nickname` varchar(128) NOT NULL DEFAULT 'Ninguno',
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`#_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4058 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_names`
--

LOCK TABLES `admin_names` WRITE;
/*!40000 ALTER TABLE `admin_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aka`
--

DROP TABLE IF EXISTS `aka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `aka` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAMES` varchar(128) NOT NULL DEFAULT '',
  `IP` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50992 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aka`
--

LOCK TABLES `aka` WRITE;
/*!40000 ALTER TABLE `aka` DISABLE KEYS */;
INSERT INTO `aka` VALUES
(50988,'Williangel_Vera','127.0.0.1'),
(50989,'Shadows_Dzxx','127.0.0.1'),
(50990,'Williangel_Veras','127.0.0.1'),
(50991,'Williangel_Verass','127.0.0.1');
/*!40000 ALTER TABLE `aka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedentes`
--

DROP TABLE IF EXISTS `antecedentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `antecedentes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Cargos` text NOT NULL,
  `Condena` varchar(24) NOT NULL,
  `Oficial` int(11) NOT NULL,
  `Datos` text NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedentes`
--

LOCK TABLES `antecedentes` WRITE;
/*!40000 ALTER TABLE `antecedentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anti_spam`
--

DROP TABLE IF EXISTS `anti_spam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `anti_spam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Bloqueada` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anti_spam`
--

LOCK TABLES `anti_spam` WRITE;
/*!40000 ALTER TABLE `anti_spam` DISABLE KEYS */;
/*!40000 ALTER TABLE `anti_spam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anticheats`
--

DROP TABLE IF EXISTS `anticheats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `anticheats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `JUGADOR` varchar(128) NOT NULL DEFAULT '',
  `RAZON` varchar(64) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IDPLAYER` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7846 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anticheats`
--

LOCK TABLES `anticheats` WRITE;
/*!40000 ALTER TABLE `anticheats` DISABLE KEYS */;
INSERT INTO `anticheats` VALUES
(7845,'Williangel_Veras','Invisible','2026-10-07 21:13:27',36988);
/*!40000 ALTER TABLE `anticheats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antidos_logs`
--

DROP TABLE IF EXISTS `antidos_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `antidos_logs` (
  `ip` varchar(15) NOT NULL,
  `first` int(11) NOT NULL,
  `last` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antidos_logs`
--

LOCK TABLES `antidos_logs` WRITE;
/*!40000 ALTER TABLE `antidos_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `antidos_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backpack`
--

DROP TABLE IF EXISTS `backpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backpack` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Objeto` text NOT NULL,
  `Cantidad` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1348 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backpack`
--

LOCK TABLES `backpack` WRITE;
/*!40000 ALTER TABLE `backpack` DISABLE KEYS */;
/*!40000 ALTER TABLE `backpack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Dia` int(11) NOT NULL,
  `Mes` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Admin` varchar(50) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `calificado` int(11) NOT NULL,
  `calificador` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canal_admin`
--

DROP TABLE IF EXISTS `canal_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal_admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(64) NOT NULL DEFAULT 'Ninguno',
  `Mensaje` varchar(128) NOT NULL DEFAULT 'Vacio',
  `IDJugador` int(11) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal_admin`
--

LOCK TABLES `canal_admin` WRITE;
/*!40000 ALTER TABLE `canal_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `canal_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canal_anuncios`
--

DROP TABLE IF EXISTS `canal_anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal_anuncios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(64) NOT NULL DEFAULT 'Ninguno',
  `Mensaje` varchar(128) NOT NULL DEFAULT 'Vacio',
  `IDJugador` int(11) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 0,
  `Tipo` int(11) NOT NULL DEFAULT 1,
  `Fecha` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal_anuncios`
--

LOCK TABLES `canal_anuncios` WRITE;
/*!40000 ALTER TABLE `canal_anuncios` DISABLE KEYS */;
/*!40000 ALTER TABLE `canal_anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canal_dudas`
--

DROP TABLE IF EXISTS `canal_dudas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal_dudas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(64) NOT NULL DEFAULT 'Ninguno',
  `Mensaje` varchar(128) NOT NULL DEFAULT 'Vacio',
  `IDJugador` int(11) NOT NULL,
  `Estado` int(11) NOT NULL DEFAULT 0,
  `UserID` int(11) NOT NULL DEFAULT 56,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal_dudas`
--

LOCK TABLES `canal_dudas` WRITE;
/*!40000 ALTER TABLE `canal_dudas` DISABLE KEYS */;
/*!40000 ALTER TABLE `canal_dudas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigos_ropas`
--

DROP TABLE IF EXISTS `codigos_ropas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigos_ropas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(8) NOT NULL DEFAULT '',
  `SkinID` int(11) NOT NULL DEFAULT 250,
  `Precio` int(11) NOT NULL,
  `Sexo` int(11) NOT NULL DEFAULT 1,
  `Tienda` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigos_ropas`
--

LOCK TABLES `codigos_ropas` WRITE;
/*!40000 ALTER TABLE `codigos_ropas` DISABLE KEYS */;
/*!40000 ALTER TABLE `codigos_ropas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_paypal`
--

DROP TABLE IF EXISTS `compras_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_paypal` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Producto` text NOT NULL,
  `Jugador` int(11) NOT NULL,
  `Fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `Precio` float NOT NULL,
  `Webhook` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_paypal`
--

LOCK TABLES `compras_paypal` WRITE;
/*!40000 ALTER TABLE `compras_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condecoraciones`
--

DROP TABLE IF EXISTS `condecoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `condecoraciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PoliciaID` int(11) NOT NULL,
  `Medalla` int(11) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condecoraciones`
--

LOCK TABLES `condecoraciones` WRITE;
/*!40000 ALTER TABLE `condecoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `condecoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contadores_carreras`
--

DROP TABLE IF EXISTS `contadores_carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contadores_carreras` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Corredor` varchar(64) NOT NULL,
  `Posicion` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contadores_carreras`
--

LOCK TABLES `contadores_carreras` WRITE;
/*!40000 ALTER TABLE `contadores_carreras` DISABLE KEYS */;
/*!40000 ALTER TABLE `contadores_carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum_table`
--

DROP TABLE IF EXISTS `curriculum_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum_table` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(24) NOT NULL,
  `ID_DB` int(11) NOT NULL,
  `CV_ESTADO` int(11) NOT NULL,
  `PREGUNTA_1` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_2` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_3` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_4` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_5` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_6` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_7` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_8` varchar(200) NOT NULL DEFAULT 'Ninguno',
  `PREGUNTA_9` varchar(200) NOT NULL DEFAULT 'Ninguno',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum_table`
--

LOCK TABLES `curriculum_table` WRITE;
/*!40000 ALTER TABLE `curriculum_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discord`
--

DROP TABLE IF EXISTS `discord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `discord` (
  `iD` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `Nombre` varchar(64) NOT NULL,
  `Token` int(11) NOT NULL,
  `Fechaverif` datetime DEFAULT current_timestamp(),
  `Discordtag` varchar(255) DEFAULT NULL,
  `DiscordID` varchar(20) NOT NULL,
  `Nivel` int(11) NOT NULL,
  `EstadoRAID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iD`)
) ENGINE=InnoDB AUTO_INCREMENT=1173 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discord`
--

LOCK TABLES `discord` WRITE;
/*!40000 ALTER TABLE `discord` DISABLE KEYS */;
/*!40000 ALTER TABLE `discord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doors`
--

DROP TABLE IF EXISTS `doors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `doors` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` int(11) NOT NULL DEFAULT 1 COMMENT '1=Franquicias | 2=Gobierno | 3=Normales | 4=Normales Y',
  `Pickup` int(11) NOT NULL DEFAULT 1318,
  `Nombre` varchar(64) NOT NULL DEFAULT '24/7',
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Propietario` varchar(32) NOT NULL DEFAULT 'Ninguno',
  `Extra` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doors`
--

LOCK TABLES `doors` WRITE;
/*!40000 ALTER TABLE `doors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacionamientos`
--

DROP TABLE IF EXISTS `estacionamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estacionamientos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnUso` int(11) NOT NULL DEFAULT 0,
  `Propietario` int(11) NOT NULL DEFAULT -1,
  `EntradaX` float NOT NULL,
  `EntradaY` float NOT NULL,
  `EntradaZ` float NOT NULL,
  `EntradaA` float NOT NULL,
  `SalidaX` float NOT NULL,
  `SalidaY` float NOT NULL,
  `SalidaZ` float NOT NULL,
  `SalidaA` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Nivel` int(11) NOT NULL DEFAULT 5,
  `Precio` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacionamientos`
--

LOCK TABLES `estacionamientos` WRITE;
/*!40000 ALTER TABLE `estacionamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estacionamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_server`
--

DROP TABLE IF EXISTS `estadisticas_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas_server` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Conectados_Simultaneamente` int(11) NOT NULL DEFAULT 0,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_server`
--

LOCK TABLES `estadisticas_server` WRITE;
/*!40000 ALTER TABLE `estadisticas_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadisticas_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_vehicles`
--

DROP TABLE IF EXISTS `f_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `f_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propietario` varchar(25) DEFAULT 'Gobierno',
  `modelo` int(11) NOT NULL,
  `Servidor` int(11) NOT NULL DEFAULT 1,
  `precio` int(11) NOT NULL DEFAULT 10,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `a` float NOT NULL,
  `color1` int(11) NOT NULL DEFAULT 3,
  `color2` int(11) NOT NULL DEFAULT 3,
  `comprable` int(11) NOT NULL DEFAULT 0,
  `moneda` int(11) NOT NULL DEFAULT 0,
  `faccion` int(11) NOT NULL DEFAULT 0,
  `trabajo` int(11) NOT NULL DEFAULT 0,
  `Vida` float NOT NULL DEFAULT 1000,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Capo` int(11) NOT NULL DEFAULT 0,
  `Puertas` int(11) NOT NULL DEFAULT 0,
  `vfaccion` int(11) NOT NULL DEFAULT 0,
  `Seguro` int(11) DEFAULT 0,
  `rango` int(11) DEFAULT 0,
  `Combustible` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_vehicles`
--

LOCK TABLES `f_vehicles` WRITE;
/*!40000 ALTER TABLE `f_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricas`
--

DROP TABLE IF EXISTS `fabricas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BandaID` int(11) NOT NULL DEFAULT 0,
  `Localizacion` varchar(64) NOT NULL DEFAULT 'Ninguna',
  `EntradaX` float NOT NULL,
  `EntradaY` float NOT NULL,
  `EntradaZ` float NOT NULL,
  `EntradaA` float NOT NULL,
  `GarajeE_X` float NOT NULL,
  `GarajeE_Y` float NOT NULL,
  `GarajeE_Z` float NOT NULL,
  `GarajeE_A` float NOT NULL,
  `Tanque1Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque2Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque3Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque4Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque5Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque6Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque7Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque8Contenido` int(11) NOT NULL DEFAULT 0,
  `Tanque9Contenido` int(11) NOT NULL DEFAULT 0,
  `Almacen1` int(11) NOT NULL DEFAULT 0,
  `Almacen2` int(11) NOT NULL DEFAULT 0,
  `Almacen3` int(11) NOT NULL DEFAULT 0,
  `Almacen4` int(11) NOT NULL DEFAULT 0,
  `Almacen5` int(11) NOT NULL DEFAULT 0,
  `Almacen6` int(11) NOT NULL DEFAULT 0,
  `Almacen7` int(11) NOT NULL DEFAULT 0,
  `Almacen8` int(11) NOT NULL DEFAULT 0,
  `Almacen9` int(11) NOT NULL DEFAULT 0,
  `Almacen10` int(11) NOT NULL DEFAULT 0,
  `Soborno` int(11) NOT NULL DEFAULT 0,
  `EnVenta` int(11) NOT NULL,
  `MContra` int(11) NOT NULL DEFAULT 0,
  `PorcentajeLleno1` int(11) NOT NULL DEFAULT 0,
  `PorcentajeLleno2` int(11) NOT NULL DEFAULT 0,
  `PorcentajeLleno3` int(11) NOT NULL DEFAULT 0,
  `ProgresoC1` int(11) NOT NULL DEFAULT 0,
  `ProgresoC2` int(11) NOT NULL DEFAULT 0,
  `ProgresoC3` int(11) NOT NULL DEFAULT 0,
  `ProgresoC4` int(11) NOT NULL DEFAULT 0,
  `ProgresoC5` int(11) NOT NULL DEFAULT 0,
  `EstadoC1` int(11) NOT NULL,
  `EstadoC2` int(11) NOT NULL DEFAULT 0,
  `EstadoC3` int(11) NOT NULL DEFAULT 0,
  `EstadoC4` int(11) NOT NULL DEFAULT 0,
  `EstadoC5` int(11) NOT NULL DEFAULT 0,
  `TieneMoledor1` int(11) NOT NULL,
  `TieneMoledor2` int(11) NOT NULL,
  `TieneMoledor3` int(11) NOT NULL,
  `TieneMoledor4` int(11) NOT NULL,
  `TieneMoledor5` int(11) NOT NULL,
  `Guardia1` int(11) NOT NULL DEFAULT 0,
  `Guardia2` int(11) NOT NULL DEFAULT 0,
  `Guardia3` int(11) NOT NULL DEFAULT 0,
  `Guardia4` int(11) NOT NULL DEFAULT 0,
  `Guardia5` int(11) NOT NULL DEFAULT 0,
  `Sniper` int(11) NOT NULL DEFAULT 0,
  `DineroAlmacenado` int(11) NOT NULL DEFAULT 0,
  `Chalecos` int(11) NOT NULL DEFAULT 0,
  `Tec9` int(11) NOT NULL DEFAULT 0,
  `Uzi` int(11) NOT NULL DEFAULT 0,
  `Recortada` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricas`
--

LOCK TABLES `fabricas` WRITE;
/*!40000 ALTER TABLE `fabricas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fabricas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facciones`
--

DROP TABLE IF EXISTS `facciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `facciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(32) NOT NULL DEFAULT '01/01/2016',
  `Nombre` varchar(40) NOT NULL,
  `Integrantes` int(11) NOT NULL DEFAULT 0,
  `Lider` varchar(32) NOT NULL,
  `Rango1` varchar(32) NOT NULL DEFAULT 'Iniciado',
  `Rango2` varchar(32) NOT NULL DEFAULT 'Nuevo rango',
  `Rango3` varchar(32) NOT NULL DEFAULT 'Nuevo rango',
  `Rango4` varchar(32) NOT NULL DEFAULT 'Nuevo rango',
  `Rango5` varchar(32) NOT NULL DEFAULT 'Nuevo rango',
  `Rango6` varchar(32) NOT NULL DEFAULT 'Nuevo rango',
  `Rango7` varchar(32) NOT NULL DEFAULT 'Nuevo rango',
  `Rango8` varchar(32) NOT NULL DEFAULT 'Lider',
  `Fabrica` int(11) NOT NULL DEFAULT 0,
  `tipobanda` varchar(32) NOT NULL,
  `imgbanda` varchar(128) NOT NULL DEFAULT './imagenes/mafiabg.jpg',
  `territorio` varchar(32) NOT NULL DEFAULT 'Ninguno',
  `MaxIntegrantes` int(11) NOT NULL DEFAULT 20,
  `Rango7Inv` int(11) NOT NULL DEFAULT 1,
  `Rango7Exp` int(11) NOT NULL DEFAULT 1,
  `Rango7Edi` int(11) NOT NULL DEFAULT 1,
  `Rango6Inv` int(11) NOT NULL DEFAULT 0,
  `Rango6Exp` int(11) NOT NULL DEFAULT 0,
  `Rango6Edi` int(11) NOT NULL DEFAULT 0,
  `Rango5Inv` int(11) NOT NULL DEFAULT 0,
  `Rango5Exp` int(11) NOT NULL DEFAULT 0,
  `Rango5Edi` int(11) NOT NULL DEFAULT 0,
  `Rango4Inv` int(11) NOT NULL DEFAULT 0,
  `Rango4Exp` int(11) NOT NULL DEFAULT 0,
  `Rango4Edi` int(11) NOT NULL DEFAULT 0,
  `Rango3Inv` int(11) NOT NULL DEFAULT 0,
  `Rango3Exp` int(11) NOT NULL DEFAULT 0,
  `Rango3Edi` int(11) NOT NULL DEFAULT 0,
  `Rango2Inv` int(11) NOT NULL DEFAULT 0,
  `Rango2Exp` int(11) NOT NULL DEFAULT 0,
  `Rango2Edi` int(11) NOT NULL DEFAULT 0,
  `Rango1Inv` int(11) NOT NULL DEFAULT 0,
  `Rango1Exp` int(11) NOT NULL DEFAULT 0,
  `Rango1Edi` int(11) NOT NULL DEFAULT 0,
  `RangoCreado1` int(11) NOT NULL DEFAULT 1,
  `RangoCreado2` int(11) NOT NULL DEFAULT 0,
  `RangoCreado3` int(11) NOT NULL DEFAULT 0,
  `RangoCreado4` int(11) NOT NULL DEFAULT 0,
  `RangoCreado5` int(11) NOT NULL DEFAULT 0,
  `RangoCreado6` int(11) NOT NULL DEFAULT 0,
  `RangoCreado7` int(11) NOT NULL DEFAULT 0,
  `RangoCreado8` int(11) NOT NULL DEFAULT 1,
  `FabricaM` int(11) NOT NULL,
  `EnUso` int(11) NOT NULL DEFAULT 0,
  `Color` int(11) NOT NULL DEFAULT 0,
  `Veh1` int(11) NOT NULL,
  `Veh2` int(11) NOT NULL,
  `Veh3` int(11) NOT NULL,
  `Veh4` int(11) NOT NULL,
  `Veh5` int(11) NOT NULL,
  `Cs1` int(11) NOT NULL,
  `Cs2` int(11) NOT NULL,
  `Cs3` int(11) NOT NULL,
  `Cs4` int(11) NOT NULL,
  `Cs5` int(11) NOT NULL,
  `Cs6` int(11) NOT NULL,
  `Cs7` int(11) NOT NULL,
  `cuentaterris` int(11) NOT NULL,
  `skin1` int(11) NOT NULL DEFAULT 250,
  `skin2` int(11) NOT NULL DEFAULT 11,
  `PaseRopa` int(11) NOT NULL DEFAULT 0,
  `Webhook` varchar(400) NOT NULL,
  `Mejoras` int(11) NOT NULL,
  `DiscordInv` varchar(100) NOT NULL DEFAULT 'https://discord.gzrp.net',
  UNIQUE KEY `id_2` (`id`,`fecha`,`Nombre`,`Integrantes`,`Lider`,`Rango1`,`Rango2`,`Rango3`,`Rango4`,`Rango5`,`Rango6`,`Rango7`,`Rango8`,`Fabrica`,`tipobanda`,`imgbanda`),
  KEY `id` (`id`) USING BTREE,
  KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facciones`
--

LOCK TABLES `facciones` WRITE;
/*!40000 ALTER TABLE `facciones` DISABLE KEYS */;
INSERT INTO `facciones` VALUES
(1,'01/01/2016','San Andreas Police Department',0,'Gobierno','Cadete','Oficial','Cabo','Sargento','Teniente','Capitan','Subjefe','Jefe de Policia',0,'Gobierno','./imagenes/mafiabg.jpg','Ninguno',100,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,865730559,0,0,0,0,0,0,0,0,0,0,0,0,0,250,11,0,'',0,'https://discord.gzrp.net'),
(2,'01/01/2016','Ejercito de San Andreas',0,'Gobierno','Recluta','Soldado','Cabo','Sargento','Teniente','Capitan','Coronel','General',0,'Gobierno','./imagenes/mafiabg.jpg','Ninguno',100,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,-1250477313,0,0,0,0,0,0,0,0,0,0,0,0,0,250,11,0,'',0,'https://discord.gzrp.net'),
(3,'01/01/2016','San Andreas Fire Department',0,'Gobierno','Aspirante','Bombero','Conductor','Cabo','Sargento','Teniente','Subjefe','Jefe de Bomberos',0,'Gobierno','./imagenes/mafiabg.jpg','Ninguno',100,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,-1237238017,0,0,0,0,0,0,0,0,0,0,0,0,0,250,11,0,'',0,'https://discord.gzrp.net');
/*!40000 ALTER TABLE `facciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasolineras`
--

DROP TABLE IF EXISTS `gasolineras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gasolineras` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DuenoID` int(11) NOT NULL,
  `Precio` int(11) NOT NULL,
  `PrecioL` int(11) NOT NULL DEFAULT 100,
  `Nivel` int(11) NOT NULL DEFAULT 3,
  `Gasolina` int(11) NOT NULL DEFAULT 1400,
  `MaxGasolina` int(11) NOT NULL DEFAULT 1400,
  `EnUso` int(11) NOT NULL DEFAULT 1,
  `Nombre` varchar(25) NOT NULL DEFAULT 'Nadie',
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `EcharX` float NOT NULL,
  `EcharY` float NOT NULL,
  `EcharZ` float NOT NULL,
  `Ganancias` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasolineras`
--

LOCK TABLES `gasolineras` WRITE;
/*!40000 ALTER TABLE `gasolineras` DISABLE KEYS */;
INSERT INTO `gasolineras` VALUES
(13,36980,0,100,4,1400,1400,1,'Williangel_Vera',1929.7,-1783.47,13.547,1942.99,-1772.77,13.391,0),
(14,0,80,100,3,1400,1400,1,'Nadie',1003.91,-930.585,42.3281,1003.75,-940.596,42.1797,0),
(15,0,80,100,3,1400,1400,1,'Nadie',-79.7592,-1171.72,2.14642,-90.81,-1169.37,2.41452,0),
(16,0,80,100,3,1400,1400,1,'Nadie',-1137.67,-175.177,14.1484,-1116.87,-175.019,14.144,0),
(17,0,80,100,3,1400,1400,1,'Nadie',-1679.24,428.455,7.17969,-1675.61,413.254,7.17969,0),
(18,0,80,100,3,1400,1400,1,'Nadie',-2023.14,-207.929,35.3203,-2031.36,-204.168,35.3203,0),
(19,0,80,100,3,1400,1400,1,'Nadie',-2034.86,148.629,28.8359,-2024.03,155.653,28.8359,0),
(20,0,80,100,3,1400,1400,1,'Nadie',-1322.7,2696.77,50.2663,-1328.63,2677.48,50.0625,0),
(21,0,80,100,3,1400,1400,1,'Nadie',762.089,-1032.07,23.9393,762.25,-1037.96,23.9117,0),
(22,0,80,100,3,1400,1400,1,'Nadie',641.693,1686.2,7.1875,615.742,1690.2,6.99219,0),
(23,0,80,100,3,1400,1400,1,'Nadie',2188.42,2472.71,11.2422,2202.86,2474.54,10.8203,0),
(24,0,80,100,3,1400,1400,1,'Nadie',2120.26,898.422,11.1797,2115.27,920.021,10.8203,0),
(25,0,80,100,3,1400,1400,1,'Nadie',2631.99,1128.36,11.1797,2639.35,1106.24,10.8203,0),
(26,0,80,100,3,1400,1400,1,'Nadie',1323.3,1529.77,10.8203,1332.06,1539.76,10.8203,0),
(27,0,80,100,3,1400,1400,1,'Nadie',59.6322,1213.77,18.8422,70.8176,1220.03,18.8121,0),
(28,0,80,100,3,1400,1400,1,'Nadie',660.33,-554.236,16.3359,653.099,-565.108,16.3359,0),
(29,0,80,100,3,1400,1400,1,'Nadie',866.308,-1074.55,24.3393,858.198,-1091.53,24.2969,0),
(30,0,80,100,3,1400,1400,1,'Nadie',-1477.89,1873.37,32.6328,-1478.34,1863.51,32.6328,0),
(31,0,80,100,3,1400,1400,1,'Nadie',1125.95,1282.12,10.9784,1133.84,1277.52,10.9514,0),
(32,0,80,100,3,1400,1400,1,'Nadie',1596.05,2217.75,11.0625,1597.77,2199.14,10.8203,0),
(33,0,80,100,3,1400,1400,1,'Nadie',2013.15,-1048.36,24.6705,2004.63,-1052.13,24.6003,0),
(34,0,80,100,3,1400,1400,1,'Nadie',-1700.41,-1508.17,35.2812,-1692.62,-1501.66,35.1427,0),
(35,0,80,100,3,1400,1400,1,'Nadie',2342.69,589.655,11.2078,2320.68,581.611,10.8554,0),
(36,0,80,100,3,1400,1400,1,'Nadie',951.24,-2261.53,4.38431,950.903,-2247.51,-0.573036,0),
(37,0,80,100,3,1400,1400,1,'Nadie',781.578,-1302.88,13.5583,771.898,-1293.03,13.5625,0),
(38,0,80,100,3,1400,1400,1,'Nadie',1638.42,665.63,10.8507,1645.81,683.793,10.8203,0);
/*!40000 ALTER TABLE `gasolineras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grafitis`
--

DROP TABLE IF EXISTS `grafitis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `grafitis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDB` int(11) NOT NULL,
  `NombreBanda` varchar(50) NOT NULL,
  `GX` float NOT NULL,
  `GY` float NOT NULL,
  `GZ` float NOT NULL,
  `GRX` float NOT NULL,
  `GRY` float NOT NULL,
  `GRZ` float NOT NULL,
  `Tiempo` int(11) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `PX` float NOT NULL,
  `PY` float NOT NULL,
  `PZ` float NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grafitis`
--

LOCK TABLES `grafitis` WRITE;
/*!40000 ALTER TABLE `grafitis` DISABLE KEYS */;
INSERT INTO `grafitis` VALUES
(54,0,'LIBRE',2115,-1747.2,14.3,0,0,90,1791765120,'LS - Idlewood',2115,-1749,13.55),
(55,0,'LIBRE',-2021.8,145,29.59,0,0,180,0,'SF - Doherty',-2020,145,28.84),
(56,0,'LIBRE',1690,1448.8,11.57,0,0,90,0,'LV - Aeropuerto',1690,1447,10.82),
(57,0,'LIBRE',2487.8,-1670,14.09,0,0,0,0,'LS - Ganton',2486,-1670,13.34),
(58,0,'LIBRE',-2408,-596.2,133.4,0,0,90,0,'SF - Garcia',-2408,-598,132.65),
(59,0,'LIBRE',2082.2,2070,11.57,0,0,180,0,'LV - Redsands East',2084,2070,10.82),
(60,0,'LIBRE',2422.2,-2110,14.3,0,0,180,0,'LS - Willowfield',2424,-2110,13.55),
(61,0,'LIBRE',-2690.2,-278,7.75,0,0,0,0,'SF - Ocean Flats',-2692,-278,7),
(62,0,'LIBRE',1593,2216.8,11.57,0,0,90,0,'LV - Redsands West',1593,2215,10.82),
(63,0,'LIBRE',1881.8,-2025,14.3,0,0,0,0,'LS - El Corona',1880,-2025,13.55),
(64,0,'LIBRE',-1711.8,1343,7.94,0,0,180,0,'SF - Esplanade',-1710,1343,7.19),
(65,0,'LIBRE',2815.8,2235,11.57,0,0,0,0,'LV - Creek',2814,2235,10.82),
(66,0,'LIBRE',2725,-2028.2,14.3,0,0,90,0,'LS - Playa del Seville',2725,-2030,13.55),
(67,0,'LIBRE',-1640,16.8,4.3,0,0,90,0,'SF - Easter Basin',-1640,15,3.55),
(68,0,'LIBRE',1096.2,2045,11.57,0,0,180,0,'LV - Whitewood Estates',1098,2045,10.82),
(69,0,'LIBRE',2783.8,-2416,14.38,0,0,0,0,'LS - Ocean Docks',2782,-2416,13.63),
(70,0,'LIBRE',-2634,1371.8,7.86,0,0,90,0,'SF - Battery Point',-2634,1370,7.11),
(71,0,'LIBRE',2536.8,700,11.57,0,0,0,0,'LV - Rockshore East',2535,700,10.82);
/*!40000 ALTER TABLE `grafitis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitaciones`
--

DROP TABLE IF EXISTS `invitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Activo` varchar(3) NOT NULL DEFAULT '1',
  `Invitador` varchar(26) NOT NULL,
  `Invitado` varchar(26) NOT NULL,
  `BandaID` int(11) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4451 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitaciones`
--

LOCK TABLES `invitaciones` WRITE;
/*!40000 ALTER TABLE `invitaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs_record_state`
--

DROP TABLE IF EXISTS `jobs_record_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs_record_state` (
  `id` tinyint(4) NOT NULL,
  `last_reset` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs_record_state`
--

LOCK TABLES `jobs_record_state` WRITE;
/*!40000 ALTER TABLE `jobs_record_state` DISABLE KEYS */;
INSERT INTO `jobs_record_state` VALUES
(1,1791421990);
/*!40000 ALTER TABLE `jobs_record_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_arrestos`
--

DROP TABLE IF EXISTS `log_arrestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_arrestos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Player` int(11) NOT NULL,
  `Fecha` timestamp(6) NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_arrestos`
--

LOCK TABLES `log_arrestos` WRITE;
/*!40000 ALTER TABLE `log_arrestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_arrestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_direccionesip`
--

DROP TABLE IF EXISTS `log_direccionesip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_direccionesip` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DireccionIP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50404 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_direccionesip`
--

LOCK TABLES `log_direccionesip` WRITE;
/*!40000 ALTER TABLE `log_direccionesip` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_direccionesip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ingresos`
--

DROP TABLE IF EXISTS `log_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ingresos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(32) NOT NULL,
  `Pais` varchar(32) NOT NULL,
  `IP` varchar(32) NOT NULL,
  `Fecha` varchar(32) NOT NULL,
  `Host` varchar(64) NOT NULL,
  `accountID` int(11) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=294020 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ingresos`
--

LOCK TABLES `log_ingresos` WRITE;
/*!40000 ALTER TABLE `log_ingresos` DISABLE KEYS */;
INSERT INTO `log_ingresos` VALUES
(293935,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 04:54:52','localhost',36980,'Localhost'),
(293936,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 04:54:52','localhost',36980,'Localhost'),
(293937,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 05:15:25','localhost',36980,'Localhost'),
(293938,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 05:33:28','localhost',36980,'Localhost'),
(293939,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 05:43:04','localhost',36980,'Localhost'),
(293940,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 05:49:17','localhost',36980,'Localhost'),
(293941,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 06:12:03','localhost',36980,'Localhost'),
(293942,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 14:10:25','localhost',36980,'Localhost'),
(293943,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 15:02:55','localhost',36980,'Localhost'),
(293944,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 15:31:43','localhost',36980,'Localhost'),
(293945,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 15:41:49','localhost',36980,'Localhost'),
(293946,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 15:49:41','localhost',36980,'Localhost'),
(293947,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 16:03:41','localhost',36980,'Localhost'),
(293948,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 17:20:57','localhost',36980,'Localhost'),
(293949,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 17:33:50','localhost',36980,'Localhost'),
(293950,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 17:51:25','localhost',36980,'Localhost'),
(293951,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 19:33:40','localhost',36980,'Localhost'),
(293952,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 20:51:22','localhost',36980,'Localhost'),
(293953,'Williangel_Vera','Localhost','127.0.0.1','2026/10/05 21:54:34','localhost',36980,'Localhost'),
(293954,'Shadows_Dzxx','Localhost','127.0.0.1','2026/10/06 12:34:22','localhost',36987,'Localhost'),
(293955,'Shadows_Dzxx','Localhost','127.0.0.1','2026/10/06 12:34:22','localhost',36987,'Localhost'),
(293956,'Williangel_vera','Localhost','127.0.0.1','2026/10/06 12:52:07','localhost',36980,'Localhost'),
(293957,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 12:57:11','localhost',36980,'Localhost'),
(293958,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 13:11:32','localhost',36980,'Localhost'),
(293959,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 13:23:20','localhost',36980,'Localhost'),
(293960,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 13:32:24','localhost',36980,'Localhost'),
(293961,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 15:18:01','localhost',36980,'Localhost'),
(293962,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 15:42:23','localhost',36980,'Localhost'),
(293963,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 15:51:12','localhost',36980,'Localhost'),
(293964,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 15:55:15','localhost',36980,'Localhost'),
(293965,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 15:58:21','localhost',36980,'Localhost'),
(293966,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:00:46','localhost',36980,'Localhost'),
(293967,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:05:14','localhost',36980,'Localhost'),
(293968,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:11:14','localhost',36980,'Localhost'),
(293969,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:15:47','localhost',36980,'Localhost'),
(293970,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:22:06','localhost',36980,'Localhost'),
(293971,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:24:23','localhost',36980,'Localhost'),
(293972,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:27:45','localhost',36980,'Localhost'),
(293973,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:32:00','localhost',36980,'Localhost'),
(293974,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:35:27','localhost',36980,'Localhost'),
(293975,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:38:02','localhost',36980,'Localhost'),
(293976,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:48:18','localhost',36980,'Localhost'),
(293977,'Williangel_Vera','Localhost','127.0.0.1','2026/10/06 16:52:06','localhost',36980,'Localhost'),
(293978,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 01:25:20','localhost',36980,'Localhost'),
(293979,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 01:39:43','localhost',36980,'Localhost'),
(293980,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 02:03:36','localhost',36980,'Localhost'),
(293981,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 02:24:35','localhost',36980,'Localhost'),
(293982,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 02:34:14','localhost',36980,'Localhost'),
(293983,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 02:44:20','localhost',36980,'Localhost'),
(293984,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 03:36:30','localhost',36980,'Localhost'),
(293985,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 04:00:57','localhost',36980,'Localhost'),
(293986,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 10:44:18','localhost',36980,'Localhost'),
(293987,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 10:59:38','localhost',36980,'Localhost'),
(293988,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 11:06:52','localhost',36980,'Localhost'),
(293989,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 11:14:01','localhost',36980,'Localhost'),
(293990,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 11:29:02','localhost',36980,'Localhost'),
(293991,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 11:32:24','localhost',36980,'Localhost'),
(293992,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 12:23:11','localhost',36980,'Localhost'),
(293993,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 12:56:48','localhost',36980,'Localhost'),
(293994,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 13:03:19','localhost',36980,'Localhost'),
(293995,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 15:13:59','localhost',36980,'Localhost'),
(293996,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 15:30:58','localhost',36980,'Localhost'),
(293997,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 15:56:40','localhost',36980,'Localhost'),
(293998,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 17:09:45','localhost',36980,'Localhost'),
(293999,'Williangel_Veras','Localhost','127.0.0.1','2026/10/07 17:13:05','localhost',36988,'Localhost'),
(294000,'Williangel_Veras','Localhost','127.0.0.1','2026/10/07 17:13:05','localhost',36988,'Localhost'),
(294001,'Williangel_Verass','Localhost','127.0.0.1','2026/10/07 17:21:11','localhost',36989,'Localhost'),
(294002,'Williangel_Verass','Localhost','127.0.0.1','2026/10/07 17:21:11','localhost',36989,'Localhost'),
(294003,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 17:29:04','localhost',36980,'Localhost'),
(294004,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 18:21:17','localhost',36980,'Localhost'),
(294005,'Williangel_Vera','Localhost','127.0.0.1','2026/10/07 23:46:52','localhost',36980,'Localhost'),
(294006,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 00:05:58','localhost',36980,'Localhost'),
(294007,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 00:14:20','localhost',36980,'Localhost'),
(294008,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 00:33:18','localhost',36980,'Localhost'),
(294009,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 00:43:27','localhost',36980,'Localhost'),
(294010,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 00:55:37','localhost',36980,'Localhost'),
(294011,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 02:17:40','localhost',36980,'Localhost'),
(294012,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 03:07:18','localhost',36980,'Localhost'),
(294013,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 03:36:51','localhost',36980,'Localhost'),
(294014,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 04:23:55','localhost',36980,'Localhost'),
(294015,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 05:18:21','localhost',36980,'Localhost'),
(294016,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 05:54:41','localhost',36980,'Localhost'),
(294017,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 11:52:14','localhost',36980,'Localhost'),
(294018,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 12:53:49','localhost',36980,'Localhost'),
(294019,'Williangel_Vera','Localhost','127.0.0.1','2026/10/08 21:24:13','localhost',36980,'Localhost');
/*!40000 ALTER TABLE `log_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ingresosweb`
--

DROP TABLE IF EXISTS `log_ingresosweb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ingresosweb` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CookieU` text NOT NULL,
  `CookieC` text NOT NULL,
  `DireccionIP` text DEFAULT NULL,
  `Fecha` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2204 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ingresosweb`
--

LOCK TABLES `log_ingresosweb` WRITE;
/*!40000 ALTER TABLE `log_ingresosweb` DISABLE KEYS */;
INSERT INTO `log_ingresosweb` VALUES
(2203,'Williangel_Vera','n19N6vNeMUAbkm$60E','127.0.0.1','2026-10-07 01:30:05');
/*!40000 ALTER TABLE `log_ingresosweb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_nombres`
--

DROP TABLE IF EXISTS `log_nombres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_nombres` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NombreAntiguo` varchar(50) NOT NULL DEFAULT 'Ninguno',
  `NombreNuevo` varchar(50) NOT NULL DEFAULT 'Ninguno',
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_nombres`
--

LOCK TABLES `log_nombres` WRITE;
/*!40000 ALTER TABLE `log_nombres` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_nombres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_suspensiones`
--

DROP TABLE IF EXISTS `log_suspensiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_suspensiones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PoliciaID` int(11) DEFAULT 0,
  `Sancionador` int(11) NOT NULL DEFAULT 0,
  `Razon` varchar(128) NOT NULL DEFAULT 'Ninguna',
  `Tiempo` varchar(128) NOT NULL DEFAULT '0',
  `Fecha` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_suspensiones`
--

LOCK TABLES `log_suspensiones` WRITE;
/*!40000 ALTER TABLE `log_suspensiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_suspensiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_transacciones`
--

DROP TABLE IF EXISTS `log_transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_transacciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` varchar(32) NOT NULL,
  `Enviador` varchar(32) NOT NULL,
  `Receptor` varchar(32) NOT NULL,
  `Monto` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_transacciones`
--

LOCK TABLES `log_transacciones` WRITE;
/*!40000 ALTER TABLE `log_transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ventas`
--

DROP TABLE IF EXISTS `log_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Vendedor` varchar(30) NOT NULL,
  `arma` int(11) NOT NULL DEFAULT 0,
  `precio` int(11) NOT NULL DEFAULT 0,
  `comprador` varchar(50) NOT NULL,
  `item` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10152 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ventas`
--

LOCK TABLES `log_ventas` WRITE;
/*!40000 ALTER TABLE `log_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marihuana`
--

DROP TABLE IF EXISTS `marihuana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marihuana` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner` varchar(128) NOT NULL DEFAULT 'Ninguno',
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Estado` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  `Creado` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marihuana`
--

LOCK TABLES `marihuana` WRITE;
/*!40000 ALTER TABLE `marihuana` DISABLE KEYS */;
/*!40000 ALTER TABLE `marihuana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercados`
--

DROP TABLE IF EXISTS `mercados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mercados` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DuenoN` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Nadie',
  `BandaN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Nadie',
  `DuenoID` int(11) NOT NULL,
  `BandaID` int(11) NOT NULL,
  `EstaAbierto` int(11) NOT NULL,
  `Valor` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Dinero` int(11) NOT NULL,
  `Pistolas` int(11) NOT NULL,
  `DK` int(11) NOT NULL,
  `M4` int(11) NOT NULL,
  `EDC` int(11) NOT NULL,
  `Medis` int(11) NOT NULL,
  `Crack` int(11) NOT NULL,
  `EnVenta` int(11) NOT NULL DEFAULT 1,
  `EnUso` int(11) NOT NULL,
  `Piezas` int(11) NOT NULL,
  `Spray` int(11) NOT NULL,
  `Mascaras` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercados`
--

LOCK TABLES `mercados` WRITE;
/*!40000 ALTER TABLE `mercados` DISABLE KEYS */;
INSERT INTO `mercados` VALUES
(1,'Nadie','Nadie',0,0,1,1000000,2454.18,-965.036,80.0731,5000,10,10,10,10,200,100,1,1,20000,100,50),
(9,'Nadie','Publico Idlewood',0,0,1,0,2103,-1690,13.55,55000,10,10,10,10,200,100,0,1,20000,100,49);
/*!40000 ALTER TABLE `mercados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nexus_graffiti_catalog`
--

DROP TABLE IF EXISTS `nexus_graffiti_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nexus_graffiti_catalog` (
  `seed_key` varchar(24) NOT NULL,
  `graffiti_id` int(11) NOT NULL,
  PRIMARY KEY (`seed_key`),
  UNIQUE KEY `graffiti_id` (`graffiti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nexus_graffiti_catalog`
--

LOCK TABLES `nexus_graffiti_catalog` WRITE;
/*!40000 ALTER TABLE `nexus_graffiti_catalog` DISABLE KEYS */;
INSERT INTO `nexus_graffiti_catalog` VALUES
('ls_idlewood',54),
('sf_doherty',55),
('lv_airport',56),
('ls_ganton',57),
('sf_garcia',58),
('lv_redeast',59),
('ls_willowfield',60),
('sf_oceanflats',61),
('lv_redewest',62),
('ls_elcorona',63),
('sf_esplanade',64),
('lv_creek',65),
('ls_seville',66),
('sf_easterbasin',67),
('lv_whitewood',68),
('ls_oceandocks',69),
('sf_battery',70),
('lv_rockshore',71);
/*!40000 ALTER TABLE `nexus_graffiti_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nexus_graffiti_state`
--

DROP TABLE IF EXISTS `nexus_graffiti_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nexus_graffiti_state` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `deadline` int(11) NOT NULL DEFAULT 0,
  `next_at` int(11) NOT NULL DEFAULT 0,
  `b1` int(11) NOT NULL DEFAULT 0,
  `b2` int(11) NOT NULL DEFAULT 0,
  `b3` int(11) NOT NULL DEFAULT 0,
  `b4` int(11) NOT NULL DEFAULT 0,
  `p1` int(11) NOT NULL DEFAULT 0,
  `p2` int(11) NOT NULL DEFAULT 0,
  `p3` int(11) NOT NULL DEFAULT 0,
  `p4` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nexus_graffiti_state`
--

LOCK TABLES `nexus_graffiti_state` WRITE;
/*!40000 ALTER TABLE `nexus_graffiti_state` DISABLE KEYS */;
INSERT INTO `nexus_graffiti_state` VALUES
(54,0,0,0,1791765120,0,0,0,0,0,0,0,0),
(55,0,2,1791509520,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `nexus_graffiti_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nexus_pass_claims`
--

DROP TABLE IF EXISTS `nexus_pass_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nexus_pass_claims` (
  `account` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `claimed` int(11) NOT NULL,
  PRIMARY KEY (`account`,`season`,`track`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nexus_pass_claims`
--

LOCK TABLES `nexus_pass_claims` WRITE;
/*!40000 ALTER TABLE `nexus_pass_claims` DISABLE KEYS */;
INSERT INTO `nexus_pass_claims` VALUES
(36980,1,0,1,1791478492),
(36980,1,1,1,1791478484);
/*!40000 ALTER TABLE `nexus_pass_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nexus_pass_progress`
--

DROP TABLE IF EXISTS `nexus_pass_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nexus_pass_progress` (
  `account` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `xp` int(11) NOT NULL DEFAULT 0,
  `premium` int(11) NOT NULL DEFAULT 0,
  `daystamp` int(11) NOT NULL DEFAULT 0,
  `daily` int(11) NOT NULL DEFAULT 0,
  `daymask` int(11) NOT NULL DEFAULT 0,
  `weekstamp` int(11) NOT NULL DEFAULT 0,
  `weekly` int(11) NOT NULL DEFAULT 0,
  `weekmask` int(11) NOT NULL DEFAULT 0,
  `jobs` int(11) NOT NULL DEFAULT 0,
  `seasonmask` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`account`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nexus_pass_progress`
--

LOCK TABLES `nexus_pass_progress` WRITE;
/*!40000 ALTER TABLE `nexus_pass_progress` DISABLE KEYS */;
INSERT INTO `nexus_pass_progress` VALUES
(36980,1,0,1,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `nexus_pass_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nexus_pass_seasons`
--

DROP TABLE IF EXISTS `nexus_pass_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nexus_pass_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starts` int(11) NOT NULL,
  `ends` int(11) NOT NULL,
  `community` int(11) NOT NULL DEFAULT 0,
  `catalog` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nexus_pass_seasons`
--

LOCK TABLES `nexus_pass_seasons` WRITE;
/*!40000 ALTER TABLE `nexus_pass_seasons` DISABLE KEYS */;
INSERT INTO `nexus_pass_seasons` VALUES
(1,1791449196,1796633196,0,1);
/*!40000 ALTER TABLE `nexus_pass_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_vehicles`
--

DROP TABLE IF EXISTS `p_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Propietario` int(11) NOT NULL,
  `Slot` int(11) NOT NULL DEFAULT 0,
  `EstacionadoX` float NOT NULL DEFAULT 0,
  `EstacionadoY` float NOT NULL DEFAULT 0,
  `EstacionadoZ` float NOT NULL DEFAULT 0,
  `EstacionadoA` float NOT NULL DEFAULT 0,
  `VE1` int(11) NOT NULL DEFAULT 0,
  `VE2` int(11) NOT NULL DEFAULT 0,
  `VE3` int(11) NOT NULL DEFAULT 0,
  `VE4` int(11) NOT NULL DEFAULT 0,
  `vMoneda` int(11) NOT NULL DEFAULT 45,
  `Modelo` int(11) NOT NULL DEFAULT 0,
  `Combustible` int(11) NOT NULL DEFAULT 50,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VW` int(11) NOT NULL DEFAULT 0,
  `Color1` int(11) NOT NULL DEFAULT 0,
  `Color2` int(11) NOT NULL DEFAULT 0,
  `Vida` int(11) NOT NULL DEFAULT 1000,
  `vBaul` int(11) NOT NULL DEFAULT 0,
  `vBaul2` int(11) NOT NULL DEFAULT 0,
  `vBaul3` int(11) NOT NULL DEFAULT 0,
  `vBaul4` int(11) NOT NULL DEFAULT 0,
  `vBaul5` int(11) NOT NULL DEFAULT 0,
  `vBaul6` int(11) NOT NULL DEFAULT 0,
  `vBaul7` int(11) NOT NULL DEFAULT 0,
  `vBaul8` int(11) NOT NULL DEFAULT 0,
  `vBaul9` int(11) NOT NULL DEFAULT 0,
  `vBaul10` int(11) NOT NULL DEFAULT 0,
  `PaintJob` int(11) NOT NULL DEFAULT -1,
  `Componentes0` int(11) NOT NULL DEFAULT 0,
  `Componentes1` int(11) NOT NULL DEFAULT 0,
  `Componentes2` int(11) NOT NULL DEFAULT 0,
  `Componentes3` int(11) NOT NULL DEFAULT 0,
  `Componentes4` int(11) NOT NULL DEFAULT 0,
  `Componentes5` int(11) NOT NULL DEFAULT 0,
  `Componentes6` int(11) NOT NULL DEFAULT 0,
  `Componentes7` int(11) NOT NULL DEFAULT 0,
  `Componentes8` int(11) NOT NULL DEFAULT 0,
  `Componentes9` int(11) NOT NULL DEFAULT 0,
  `Componentes10` int(11) NOT NULL DEFAULT 0,
  `Componentes11` int(11) NOT NULL DEFAULT 0,
  `Componentes12` int(11) NOT NULL DEFAULT 0,
  `Componentes13` int(11) NOT NULL DEFAULT 0,
  `Precio` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `A` float NOT NULL DEFAULT 0,
  `O_VW` int(11) NOT NULL DEFAULT 0,
  `Seguro` int(11) NOT NULL DEFAULT 0,
  `O_Interior` int(11) NOT NULL DEFAULT 0,
  `Patente` varchar(9) NOT NULL DEFAULT 'GZRP 1705',
  `vAlarma` int(11) NOT NULL DEFAULT 0,
  `Traba` int(11) NOT NULL DEFAULT 0,
  `Estado_Alarma` int(11) NOT NULL DEFAULT 0,
  `Estado_Seguro` int(11) NOT NULL DEFAULT 0,
  `ACELERACION` int(11) NOT NULL DEFAULT 0,
  `ACTIVE` int(11) NOT NULL DEFAULT 0,
  `SALTO_V` int(11) NOT NULL DEFAULT 0,
  `SALTO_V_1` int(11) NOT NULL DEFAULT 0,
  `SALTO_V_2` int(11) NOT NULL DEFAULT 0,
  `vfaccion` int(11) NOT NULL,
  `Garage` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `GET` (`Propietario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26395 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_vehicles`
--

LOCK TABLES `p_vehicles` WRITE;
/*!40000 ALTER TABLE `p_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `PEDIDO` varchar(100) NOT NULL,
  `INFO` varchar(100) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `ESTADO` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(32) NOT NULL,
  `Mensaje_Personal` varchar(150) NOT NULL DEFAULT 'Nada para decir.',
  `Dia_Nacimiento` int(11) NOT NULL DEFAULT -1,
  `Mes_Nacimiento` int(11) NOT NULL DEFAULT -1,
  `Ano_Nacimiento` int(11) NOT NULL DEFAULT -1,
  `Pais_Actual` varchar(32) NOT NULL DEFAULT 'Desconocido',
  `Mostrar_Edad` int(11) NOT NULL DEFAULT 0,
  `Valor_Total` int(11) NOT NULL DEFAULT 0,
  `Votos_Totales` int(11) NOT NULL DEFAULT 0,
  `Color` int(11) NOT NULL DEFAULT 1,
  `Avatar` int(11) NOT NULL DEFAULT 32,
  `Propietario` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36990 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES
(36980,'Williangel_Vera','Nada para decir.',-1,-1,-1,'Unknown',0,0,0,1,32,36980),
(36987,'Shadows_Dzxx','Nada para decir.',-1,-1,-1,'Localhost',0,0,0,1,32,36987),
(36989,'Williangel_Verass','Nada para decir.',-1,-1,-1,'Localhost',0,0,0,1,32,36989);
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantas`
--

DROP TABLE IF EXISTS `plantas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantas` (
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `paX` varchar(32) NOT NULL,
  `paY` varchar(32) NOT NULL,
  `paZ` varchar(32) NOT NULL,
  `pSegundos` int(11) NOT NULL,
  `pMinutos` int(11) NOT NULL,
  `pHoras` int(11) NOT NULL,
  `pEstado` int(11) NOT NULL,
  `Plantador` varchar(32) NOT NULL,
  `Creado` int(11) NOT NULL,
  PRIMARY KEY (`pID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantas`
--

LOCK TABLES `plantas` WRITE;
/*!40000 ALTER TABLE `plantas` DISABLE KEYS */;
/*!40000 ALTER TABLE `plantas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_book`
--

DROP TABLE IF EXISTS `player_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PHONE_ID` int(11) NOT NULL,
  `NAME` varchar(24) NOT NULL,
  `PHONE_NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20387 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_book`
--

LOCK TABLES `player_book` WRITE;
/*!40000 ALTER TABLE `player_book` DISABLE KEYS */;
INSERT INTO `player_book` VALUES
(20342,0,'policía',911),
(20343,0,'Asistencia medica',71),
(20344,0,'Servicio de gruas',815),
(20345,0,'Asistencia mecanica',80),
(20346,0,'Servicio de taxi',82),
(20347,0,'policía',911),
(20348,0,'Asistencia medica',71),
(20349,0,'Servicio de gruas',815),
(20350,0,'Asistencia mecanica',80),
(20351,0,'Servicio de taxi',82),
(20352,0,'policía',911),
(20353,0,'Asistencia medica',71),
(20354,0,'Servicio de gruas',815),
(20355,0,'Asistencia mecanica',80),
(20356,0,'Servicio de taxi',82),
(20357,0,'policía',911),
(20358,0,'Asistencia medica',71),
(20359,0,'Servicio de gruas',815),
(20360,0,'Asistencia mecanica',80),
(20361,0,'Servicio de taxi',82),
(20362,0,'policía',911),
(20363,0,'Asistencia medica',71),
(20364,0,'Servicio de gruas',815),
(20365,0,'Asistencia mecanica',80),
(20366,0,'Servicio de taxi',82),
(20367,121431,'policía',911),
(20368,121431,'Asistencia medica',71),
(20369,121431,'Servicio de gruas',815),
(20370,121431,'Asistencia mecanica',80),
(20371,121431,'Servicio de taxi',82),
(20372,0,'policía',911),
(20373,0,'Asistencia medica',71),
(20374,0,'Servicio de gruas',815),
(20375,0,'Asistencia mecanica',80),
(20376,0,'Servicio de taxi',82),
(20377,0,'policía',911),
(20378,0,'Asistencia medica',71),
(20379,0,'Servicio de gruas',815),
(20380,0,'Asistencia mecanica',80),
(20381,0,'Servicio de taxi',82),
(20382,0,'policía',911),
(20383,0,'Asistencia medica',71),
(20384,0,'Servicio de gruas',815),
(20385,0,'Asistencia mecanica',80),
(20386,0,'Servicio de taxi',82);
/*!40000 ALTER TABLE `player_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_spray`
--

DROP TABLE IF EXISTS `player_spray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_spray` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLAYER_ID` int(11) NOT NULL,
  `TEXT` varchar(32) NOT NULL,
  `FONT` varchar(32) NOT NULL,
  `FontSize` int(11) NOT NULL,
  `FontBold` int(11) NOT NULL,
  `FontColor` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `RotX` float NOT NULL,
  `RotY` float NOT NULL,
  `RotZ` float NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_spray`
--

LOCK TABLES `player_spray` WRITE;
/*!40000 ALTER TABLE `player_spray` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_spray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_toys`
--

DROP TABLE IF EXISTS `player_toys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_toys` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `MODEL_ID` int(11) NOT NULL,
  `BONE` int(11) NOT NULL,
  `ATTACHED` int(11) NOT NULL DEFAULT 0,
  `POS_X` float NOT NULL DEFAULT 0.085,
  `POS_Y` float NOT NULL DEFAULT 0.017999,
  `POS_Z` float NOT NULL DEFAULT 0.000999,
  `ROT_X` float NOT NULL DEFAULT 87.2,
  `ROT_Y` float NOT NULL DEFAULT 88.1,
  `ROT_Z` float NOT NULL DEFAULT -7.5,
  `SCALE_X` float NOT NULL DEFAULT 1,
  `SCALE_Y` float NOT NULL DEFAULT 1,
  `SCALE_Z` float NOT NULL DEFAULT 1,
  `COLOR_1` int(11) NOT NULL,
  `COLOR_2` int(11) NOT NULL,
  `Web` int(11) NOT NULL DEFAULT 0,
  `Slot` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_toys`
--

LOCK TABLES `player_toys` WRITE;
/*!40000 ALTER TABLE `player_toys` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_toys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_rating`
--

DROP TABLE IF EXISTS `post_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `rating_number` int(11) NOT NULL,
  `total_points` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Block, 0 = Unblock',
  PRIMARY KEY (`rating_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_rating`
--

LOCK TABLES `post_rating` WRITE;
/*!40000 ALTER TABLE `post_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `ID` int(10) unsigned NOT NULL,
  `IDPropietario` int(11) NOT NULL,
  `Propietario` varchar(40) NOT NULL DEFAULT 'Ninguno',
  `EnVenta` int(11) NOT NULL,
  `Precio` int(11) NOT NULL,
  `EnUso` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosXS` float NOT NULL,
  `PosYS` float NOT NULL,
  `PosZS` float NOT NULL,
  `PosA` float NOT NULL,
  `PosAS` float NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `EnVentaPor` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `InteriorID` int(11) NOT NULL,
  `Abierta` int(11) NOT NULL,
  `Sprunk` int(11) NOT NULL,
  `Cerveza` int(11) NOT NULL,
  `Aquarius` int(11) NOT NULL,
  `Pizzas` int(11) NOT NULL,
  `Vino` int(11) NOT NULL,
  `AK47` int(11) NOT NULL,
  `M4` int(11) NOT NULL,
  `EscopetaNormal` int(11) NOT NULL,
  `EscopetaDeCombate` int(11) NOT NULL,
  `MP5` int(11) NOT NULL,
  `9mm` int(11) NOT NULL,
  `9mmSilenciada` int(11) NOT NULL,
  `DesertEagle` int(11) NOT NULL,
  `Rifle` int(11) NOT NULL,
  `Granada` int(11) NOT NULL,
  `Manopla` int(11) NOT NULL,
  `Cuchillo` int(11) NOT NULL,
  `Katana` int(11) NOT NULL,
  `Medicamentos` int(11) NOT NULL,
  `Crack` int(11) NOT NULL,
  `Marihuana` int(11) NOT NULL,
  `VW` int(11) NOT NULL,
  `Camara` int(11) NOT NULL,
  `Flores` int(11) NOT NULL,
  `Pala` int(11) NOT NULL,
  `BateDeBeisbol` int(11) NOT NULL,
  `PaloDeGolf` int(11) NOT NULL,
  `GX` float NOT NULL,
  `GY` float NOT NULL,
  `GZ` float NOT NULL,
  `GA` float NOT NULL,
  `Localizacion` varchar(80) NOT NULL,
  `Ganancias` int(11) NOT NULL DEFAULT 0,
  `PaloDeBillar` int(11) NOT NULL,
  `ConsoladorRosa` int(11) NOT NULL,
  `VibradorBlanco` int(11) NOT NULL,
  `GranVibradorBlanco` int(11) NOT NULL,
  `VibradorPlateado` int(11) NOT NULL,
  `Baston` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES
(1,0,'Nadie',1,16,1,1739.28,-1582.02,14.1523,223.092,1287.08,1082.14,0,0,3,1,1,10,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,'Commerce',0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pworks_points`
--

DROP TABLE IF EXISTS `pworks_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pworks_points` (
  `id_player` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `last_prize` int(11) NOT NULL DEFAULT 0,
  `id_work` int(11) NOT NULL,
  PRIMARY KEY (`id_player`,`id_work`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pworks_points`
--

LOCK TABLES `pworks_points` WRITE;
/*!40000 ALTER TABLE `pworks_points` DISABLE KEYS */;
INSERT INTO `pworks_points` VALUES
(36980,1,0,2);
/*!40000 ALTER TABLE `pworks_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_server`
--

DROP TABLE IF EXISTS `queue_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_server` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Data` text NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45053 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_server`
--

LOCK TABLES `queue_server` WRITE;
/*!40000 ALTER TABLE `queue_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_blindado_bandas`
--

DROP TABLE IF EXISTS `rb_blindado_bandas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rb_blindado_bandas` (
  `banda` int(11) NOT NULL,
  `experiencia` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`banda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_blindado_bandas`
--

LOCK TABLES `rb_blindado_bandas` WRITE;
/*!40000 ALTER TABLE `rb_blindado_bandas` DISABLE KEYS */;
/*!40000 ALTER TABLE `rb_blindado_bandas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb_mercado_cocaina`
--

DROP TABLE IF EXISTS `rb_mercado_cocaina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rb_mercado_cocaina` (
  `cuenta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb_mercado_cocaina`
--

LOCK TABLES `rb_mercado_cocaina` WRITE;
/*!40000 ALTER TABLE `rb_mercado_cocaina` DISABLE KEYS */;
/*!40000 ALTER TABLE `rb_mercado_cocaina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros` (
  `id` int(10) unsigned NOT NULL,
  `Cantidad` int(11) NOT NULL DEFAULT 0,
  `Stats` int(11) NOT NULL DEFAULT 0,
  `Arbol` int(11) NOT NULL DEFAULT 0,
  `Cerveza` int(11) NOT NULL DEFAULT 0,
  `Blindado` int(11) NOT NULL DEFAULT 0,
  `Halloween` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
INSERT INTO `registros` VALUES
(1,4,1,0,0,1,0);
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_admin`
--

DROP TABLE IF EXISTS `registros_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `Responsable` varchar(64) NOT NULL DEFAULT 'Ninguno',
  `Jugador` varchar(64) NOT NULL DEFAULT 'Ninguno',
  `Razon` varchar(128) NOT NULL DEFAULT 'Vacio',
  `Accion` varchar(32) NOT NULL DEFAULT 'Ninguna',
  `Panel` int(11) DEFAULT 0,
  `Nota` varchar(128) NOT NULL DEFAULT 'Ninguna',
  `NotaNivel` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5993 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_admin`
--

LOCK TABLES `registros_admin` WRITE;
/*!40000 ALTER TABLE `registros_admin` DISABLE KEYS */;
INSERT INTO `registros_admin` VALUES
(5992,'2026-10-05 22:00:18','Anticheat - Camionero','Williangel_Vera','SpeedHack','3',0,'Ninguna',1);
/*!40000 ALTER TABLE `registros_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros_sapd`
--

DROP TABLE IF EXISTS `registros_sapd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `registros_sapd` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Registro',
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de la acción',
  `Policia` varchar(32) NOT NULL DEFAULT 'Ninguno' COMMENT 'Policia quien ejecuta',
  `Usuario` varchar(32) NOT NULL DEFAULT 'Ninguno' COMMENT 'Usuario a quien es ejecutado',
  `Type` int(11) NOT NULL DEFAULT 1 COMMENT '1= Antecedentes | 2 = Edad | 3 = Nacionalidad',
  `Edad_Entrada` int(11) NOT NULL,
  `Edad_Salida` int(11) NOT NULL DEFAULT 0,
  `Nacionalidad_A` varchar(32) NOT NULL DEFAULT 'Americana',
  `Nacionalidad_B` varchar(32) NOT NULL DEFAULT 'San Andreas',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros_sapd`
--

LOCK TABLES `registros_sapd` WRITE;
/*!40000 ALTER TABLE `registros_sapd` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros_sapd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_atm_cooldown`
--

DROP TABLE IF EXISTS `rp_atm_cooldown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_atm_cooldown` (
  `id` int(11) NOT NULL,
  `until_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_atm_cooldown`
--

LOCK TABLES `rp_atm_cooldown` WRITE;
/*!40000 ALTER TABLE `rp_atm_cooldown` DISABLE KEYS */;
INSERT INTO `rp_atm_cooldown` VALUES
(0,1791502779),
(1,1791476227);
/*!40000 ALTER TABLE `rp_atm_cooldown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_atm_damage`
--

DROP TABLE IF EXISTS `rp_atm_damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_atm_damage` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_atm_damage`
--

LOCK TABLES `rp_atm_damage` WRITE;
/*!40000 ALTER TABLE `rp_atm_damage` DISABLE KEYS */;
/*!40000 ALTER TABLE `rp_atm_damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_atm_positions`
--

DROP TABLE IF EXISTS `rp_atm_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_atm_positions` (
  `id` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `angle` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_atm_positions`
--

LOCK TABLES `rp_atm_positions` WRITE;
/*!40000 ALTER TABLE `rp_atm_positions` DISABLE KEYS */;
INSERT INTO `rp_atm_positions` VALUES
(0,1723.7,-1584.02,13.5432,0),
(1,1834.29,-1851,13.3897,0),
(9,2383.24,-1914.88,13.5469,0);
/*!40000 ALTER TABLE `rp_atm_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_business_cash`
--

DROP TABLE IF EXISTS `rp_business_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_business_cash` (
  `business_type` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `cash` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`business_type`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_business_cash`
--

LOCK TABLES `rp_business_cash` WRITE;
/*!40000 ALTER TABLE `rp_business_cash` DISABLE KEYS */;
INSERT INTO `rp_business_cash` VALUES
(2,13,0),
(6,13,0),
(6,21,0);
/*!40000 ALTER TABLE `rp_business_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_business_operations`
--

DROP TABLE IF EXISTS `rp_business_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_business_operations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_type` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `action` varchar(16) NOT NULL,
  `product` int(11) NOT NULL DEFAULT -1,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_business_operations`
--

LOCK TABLES `rp_business_operations` WRITE;
/*!40000 ALTER TABLE `rp_business_operations` DISABLE KEYS */;
INSERT INTO `rp_business_operations` VALUES
(1,6,13,36980,'restock',0,10,7500,'2026-10-08 07:19:41'),
(2,6,13,36980,'restock',1,10,180,'2026-10-08 07:37:55'),
(3,6,13,36980,'restock',2,10,10000,'2026-10-08 07:38:01'),
(4,6,21,36980,'restock',0,100,75000,'2026-10-08 07:38:53');
/*!40000 ALTER TABLE `rp_business_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_business_prices`
--

DROP TABLE IF EXISTS `rp_business_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_business_prices` (
  `business_type` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  PRIMARY KEY (`business_type`,`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_business_prices`
--

LOCK TABLES `rp_business_prices` WRITE;
/*!40000 ALTER TABLE `rp_business_prices` DISABLE KEYS */;
INSERT INTO `rp_business_prices` VALUES
(6,1,35,2),
(6,2,35,2),
(6,3,35,2),
(6,4,35,2),
(6,5,35,2),
(6,6,35,2),
(6,7,35,2),
(6,8,35,2),
(6,9,35,2),
(6,10,35,2),
(6,11,35,2),
(6,12,35,2),
(6,13,35,2),
(6,14,35,2),
(6,15,35,2),
(6,16,35,2),
(6,17,35,2),
(6,18,35,2),
(6,19,35,2),
(6,20,35,2),
(6,21,35,2),
(6,22,35,2),
(6,23,35,2),
(6,24,35,2),
(6,25,35,2),
(6,26,35,2),
(6,27,35,2),
(6,28,35,2),
(6,29,35,2),
(6,30,35,2),
(6,31,35,2),
(6,32,35,2),
(6,33,35,2),
(6,34,35,2),
(6,35,35,2),
(6,36,35,2),
(6,37,35,2),
(6,38,35,2),
(6,39,35,2),
(6,40,35,2),
(6,41,35,2),
(6,42,35,2),
(6,43,35,2),
(6,44,35,2),
(6,45,35,2),
(6,46,35,2);
/*!40000 ALTER TABLE `rp_business_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_business_sales`
--

DROP TABLE IF EXISTS `rp_business_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_business_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_type` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_business_sales`
--

LOCK TABLES `rp_business_sales` WRITE;
/*!40000 ALTER TABLE `rp_business_sales` DISABLE KEYS */;
INSERT INTO `rp_business_sales` VALUES
(1,6,13,0,36980,35,2,'2026-10-08 04:34:09'),
(2,6,21,0,36980,35,2,'2026-10-08 05:03:16');
/*!40000 ALTER TABLE `rp_business_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_business_staff`
--

DROP TABLE IF EXISTS `rp_business_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_business_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_type` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `world` int(11) NOT NULL,
  `interior` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `angle` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_role` (`business_type`,`business_id`,`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_business_staff`
--

LOCK TABLES `rp_business_staff` WRITE;
/*!40000 ALTER TABLE `rp_business_staff` DISABLE KEYS */;
INSERT INTO `rp_business_staff` VALUES
(2,6,13,2,1791478677,1,18,-28.1799,-91.6415,1003.55,0);
/*!40000 ALTER TABLE `rp_business_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_business_stock`
--

DROP TABLE IF EXISTS `rp_business_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_business_stock` (
  `business_type` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`business_type`,`business_id`,`product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_business_stock`
--

LOCK TABLES `rp_business_stock` WRITE;
/*!40000 ALTER TABLE `rp_business_stock` DISABLE KEYS */;
INSERT INTO `rp_business_stock` VALUES
(6,13,0,10),
(6,13,1,10),
(6,13,2,10),
(6,13,3,0),
(6,13,4,0),
(6,13,5,0),
(6,13,6,0),
(6,13,7,0),
(6,13,8,0),
(6,13,9,0),
(6,13,10,0),
(6,21,0,100),
(6,21,1,0),
(6,21,2,0),
(6,21,3,0),
(6,21,4,0),
(6,21,5,0),
(6,21,6,0),
(6,21,7,0),
(6,21,8,0),
(6,21,9,0),
(6,21,10,0);
/*!40000 ALTER TABLE `rp_business_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_empty_furniture_backup`
--

DROP TABLE IF EXISTS `rp_empty_furniture_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_empty_furniture_backup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CasaID` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `x1` float NOT NULL,
  `y1` float NOT NULL,
  `z1` float NOT NULL,
  `Modelo` int(11) NOT NULL,
  `EnUso` int(11) NOT NULL,
  `Puesto` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_empty_furniture_backup`
--

LOCK TABLES `rp_empty_furniture_backup` WRITE;
/*!40000 ALTER TABLE `rp_empty_furniture_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `rp_empty_furniture_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_empty_house_backup`
--

DROP TABLE IF EXISTS `rp_empty_house_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_empty_house_backup` (
  `ID` int(10) unsigned NOT NULL,
  `IDPropietario` int(11) NOT NULL,
  `Propietario` varchar(40) NOT NULL DEFAULT 'Ninguno',
  `EnVenta` int(11) NOT NULL,
  `Precio` int(11) NOT NULL,
  `EnUso` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosXS` float NOT NULL,
  `PosYS` float NOT NULL,
  `PosZS` float NOT NULL,
  `PosA` float NOT NULL,
  `PosAS` float NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `EnVentaPor` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `InteriorID` int(11) NOT NULL,
  `Abierta` int(11) NOT NULL,
  `Sprunk` int(11) NOT NULL,
  `Cerveza` int(11) NOT NULL,
  `Aquarius` int(11) NOT NULL,
  `Pizzas` int(11) NOT NULL,
  `Vino` int(11) NOT NULL,
  `AK47` int(11) NOT NULL,
  `M4` int(11) NOT NULL,
  `EscopetaNormal` int(11) NOT NULL,
  `EscopetaDeCombate` int(11) NOT NULL,
  `MP5` int(11) NOT NULL,
  `9mm` int(11) NOT NULL,
  `9mmSilenciada` int(11) NOT NULL,
  `DesertEagle` int(11) NOT NULL,
  `Rifle` int(11) NOT NULL,
  `Granada` int(11) NOT NULL,
  `Manopla` int(11) NOT NULL,
  `Cuchillo` int(11) NOT NULL,
  `Katana` int(11) NOT NULL,
  `Medicamentos` int(11) NOT NULL,
  `Crack` int(11) NOT NULL,
  `Marihuana` int(11) NOT NULL,
  `VW` int(11) NOT NULL,
  `Camara` int(11) NOT NULL,
  `Flores` int(11) NOT NULL,
  `Pala` int(11) NOT NULL,
  `BateDeBeisbol` int(11) NOT NULL,
  `PaloDeGolf` int(11) NOT NULL,
  `GX` float NOT NULL,
  `GY` float NOT NULL,
  `GZ` float NOT NULL,
  `GA` float NOT NULL,
  `Localizacion` varchar(80) NOT NULL,
  `Ganancias` int(11) NOT NULL DEFAULT 0,
  `PaloDeBillar` int(11) NOT NULL,
  `ConsoladorRosa` int(11) NOT NULL,
  `VibradorBlanco` int(11) NOT NULL,
  `GranVibradorBlanco` int(11) NOT NULL,
  `VibradorPlateado` int(11) NOT NULL,
  `Baston` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_empty_house_backup`
--

LOCK TABLES `rp_empty_house_backup` WRITE;
/*!40000 ALTER TABLE `rp_empty_house_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `rp_empty_house_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_furniture_materials`
--

DROP TABLE IF EXISTS `rp_furniture_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_furniture_materials` (
  `MuebleID` int(11) NOT NULL,
  `Surface` int(11) NOT NULL,
  `Color` int(11) NOT NULL DEFAULT 0,
  `Texture` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`MuebleID`,`Surface`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_furniture_materials`
--

LOCK TABLES `rp_furniture_materials` WRITE;
/*!40000 ALTER TABLE `rp_furniture_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `rp_furniture_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_gates`
--

DROP TABLE IF EXISTS `rp_gates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_gates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Model` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `LinkID` int(11) NOT NULL,
  `World` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `CX` float NOT NULL,
  `CY` float NOT NULL,
  `CZ` float NOT NULL,
  `CRX` float NOT NULL,
  `CRY` float NOT NULL,
  `CRZ` float NOT NULL,
  `OX` float NOT NULL,
  `OY` float NOT NULL,
  `OZ` float NOT NULL,
  `ORX` float NOT NULL,
  `ORY` float NOT NULL,
  `ORZ` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_gates`
--

LOCK TABLES `rp_gates` WRITE;
/*!40000 ALTER TABLE `rp_gates` DISABLE KEYS */;
INSERT INTO `rp_gates` VALUES
(3,971,1,1,0,0,1744.25,-1592.07,12.1908,0,0,0,1744.25,-1592.07,17.5452,0,0,0);
/*!40000 ALTER TABLE `rp_gates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_house_points`
--

DROP TABLE IF EXISTS `rp_house_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_house_points` (
  `HouseID` int(11) NOT NULL,
  `Kind` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  PRIMARY KEY (`HouseID`,`Kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_house_points`
--

LOCK TABLES `rp_house_points` WRITE;
/*!40000 ALTER TABLE `rp_house_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `rp_house_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_job_skills`
--

DROP TABLE IF EXISTS `rp_job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_job_skills` (
  `id_player` int(11) NOT NULL,
  `id_work` int(11) NOT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_player`,`id_work`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_job_skills`
--

LOCK TABLES `rp_job_skills` WRITE;
/*!40000 ALTER TABLE `rp_job_skills` DISABLE KEYS */;
INSERT INTO `rp_job_skills` VALUES
(36980,2,4);
/*!40000 ALTER TABLE `rp_job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_player_c4`
--

DROP TABLE IF EXISTS `rp_player_c4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_player_c4` (
  `account_id` int(11) NOT NULL,
  `amount` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_player_c4`
--

LOCK TABLES `rp_player_c4` WRITE;
/*!40000 ALTER TABLE `rp_player_c4` DISABLE KEYS */;
/*!40000 ALTER TABLE `rp_player_c4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rp_public_businesses`
--

DROP TABLE IF EXISTS `rp_public_businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rp_public_businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `door` int(11) DEFAULT NULL,
  `kind` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `owner_name` varchar(25) NOT NULL DEFAULT 'Nadie',
  `active` int(11) NOT NULL DEFAULT 1,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `a` float NOT NULL DEFAULT 0,
  `ix` float NOT NULL,
  `iy` float NOT NULL,
  `iz` float NOT NULL,
  `ia` float NOT NULL,
  `interior` int(11) NOT NULL,
  `world` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `door` (`door`)
) ENGINE=InnoDB AUTO_INCREMENT=1197 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rp_public_businesses`
--

LOCK TABLES `rp_public_businesses` WRITE;
/*!40000 ALTER TABLE `rp_public_businesses` DISABLE KEYS */;
INSERT INTO `rp_public_businesses` VALUES
(1,5,2,'The Well Stacked Pizza',0,'Nadie',1,-1808.71,945.916,24.8906,0,372.359,-133.524,1001.49,358.898,5,1),
(2,6,2,'The Well Stacked Pizza',0,'Nadie',1,-1720.95,1359.78,7.1853,0,372.359,-133.524,1001.49,358.898,5,2),
(3,7,2,'The Well Stacked Pizza',0,'Nadie',1,2083.34,2224.7,11.0234,0,372.359,-133.524,1001.49,358.898,5,3),
(4,8,2,'The Well Stacked Pizza',0,'Nadie',1,2756.76,2477.35,11.0625,0,372.359,-133.524,1001.49,358.898,5,4),
(5,9,2,'The Well Stacked Pizza',0,'Nadie',1,2638.78,1849.79,11.0234,0,372.359,-133.524,1001.49,358.898,5,5),
(6,10,2,'The Well Stacked Pizza',0,'Nadie',1,2331.81,75.0506,26.621,0,372.359,-133.524,1001.49,358.898,5,6),
(7,11,2,'The Well Stacked Pizza',0,'Nadie',1,1367.55,248.252,19.5669,0,372.359,-133.524,1001.49,358.898,5,7),
(8,12,2,'The Well Stacked Pizza',0,'Nadie',1,203.395,-201.942,1.5781,0,372.359,-133.524,1001.49,358.898,5,8),
(9,13,2,'The Well Stacked Pizza',0,'Nadie',1,2105.48,-1806.47,13.5547,0,372.359,-133.524,1001.49,358.898,5,9),
(10,14,2,'The Well Stacked Pizza',0,'Nadie',1,2351.82,2533.63,10.8203,0,372.359,-133.524,1001.49,358.898,5,10),
(11,15,2,'The Well Stacked Pizza',0,'Nadie',1,2330.6,2533.61,10.8203,0,372.359,-133.524,1001.49,358.898,5,11),
(12,16,2,'The Well Stacked Pizza',0,'Nadie',1,2309.5,2533.61,10.8203,0,372.359,-133.524,1001.49,358.898,5,12),
(13,18,1,'24/7',36980,'Williangel_Vera',1,1833.77,-1842.58,13.5781,0,-30.9007,-91.4636,1003.55,0,18,1),
(14,19,1,'24/7',0,'Nadie',1,1000.59,-919.926,42.3281,0,-25.9019,-188.042,1007.73,358.898,10,2),
(15,20,1,'24/7',0,'Nadie',1,2247.64,2396.17,10.8203,0,-30.9007,-91.4636,1003.55,0,18,8),
(16,21,1,'24/7',0,'Nadie',1,1104.87,-1370.28,13.9844,0,-27.3408,-31.7468,1003.66,90,4,56),
(17,22,1,'24/7',0,'Nadie',1,1315.49,-897.682,39.5781,0,-30.9007,-91.4636,1003.55,0,18,2),
(18,23,1,'24/7',0,'Nadie',1,2424.2,-1742.81,13.5454,0,-30.9007,-91.4636,1003.55,0,18,6),
(19,24,1,'24/7',0,'Nadie',1,2194.94,1991.05,12.2969,0,-30.9007,-91.4636,1003.55,0,18,5),
(20,25,1,'24/7',0,'Nadie',1,1565.86,-1171.42,24.0953,0,-30.9007,-91.4636,1003.55,0,18,11),
(21,26,1,'Tienda de autoservicio',36980,'Williangel_Vera',1,1928.58,-1776.28,13.5469,0,-25.9019,-188.042,1007.73,358.898,10,1),
(22,27,1,'Tienda de autoservicio',0,'Nadie',1,-78.3736,-1169.9,2.1355,0,-25.9019,-188.042,1007.73,358.898,10,3),
(23,28,1,'Tienda de autoservicio',0,'Nadie',1,-1676.17,432.196,7.1797,0,-25.9019,-188.042,1007.73,358.898,10,4),
(24,29,1,'Tienda de autoservicio',0,'Nadie',1,-2420.15,969.843,45.2969,0,-25.9019,-188.042,1007.73,358.898,10,5),
(25,30,1,'Tienda de autoservicio',0,'Nadie',1,-1320.48,2698.65,50.2663,0,-25.9019,-188.042,1007.73,358.898,10,6),
(26,31,1,'Tienda de autoservicio',0,'Nadie',1,639.065,1683.35,7.1875,0,-25.9019,-188.042,1007.73,358.898,10,7),
(27,32,1,'Tienda de autoservicio',0,'Nadie',1,1599.07,2221.81,11.0625,0,-25.9019,-188.042,1007.73,358.898,10,8),
(28,33,1,'Tienda de autoservicio',0,'Nadie',1,2637.28,1129.68,11.1797,0,-25.9019,-188.042,1007.73,358.898,10,9),
(29,34,1,'Tienda de autoservicio',0,'Nadie',1,2117.5,896.778,11.1797,0,-25.9019,-188.042,1007.73,358.898,10,10),
(30,35,1,'Tienda de autoservicio',0,'Nadie',1,2344.04,583.385,11.2078,0,-25.9019,-188.042,1007.73,358.898,10,11),
(31,36,1,'Tienda de autoservicio',0,'Nadie',1,2187.71,2469.64,11.2422,0,-25.9019,-188.042,1007.73,358.898,10,12),
(32,37,4,'Bar',0,'Nadie',1,2310.08,-1643.53,14.827,0,502.016,-67.6595,998.858,180,11,9),
(33,38,4,'Bar',0,'Nadie',1,824.868,860.272,12.3028,0,-229.129,1401.12,27.7656,0,18,0),
(34,39,4,'Bar',0,'Nadie',1,-1820.85,-125.765,5.7484,0,502.016,-67.6595,998.758,180,11,3),
(35,40,6,'Sex Shop',0,'Nadie',1,1137.99,-1365.38,13.9844,0,-100.208,-24.9942,1000.72,354.155,3,6),
(36,41,6,'Sex Shop',0,'Nadie',1,2085.12,2073.97,11.0547,0,-100.208,-24.9942,1000.72,354.155,3,9),
(37,45,3,'ZIP',0,'Nadie',1,1456.48,-1137.61,23.9485,0,161.429,-96.9712,1001.8,355.906,18,55),
(38,46,3,'Didder Sachs',0,'Nadie',1,454.201,-1477.97,30.8137,0,204.293,-168.859,1000.52,358.1,14,57),
(39,47,3,'Victim',0,'Nadie',1,461.704,-1500.8,31.0453,0,227.529,-8.1299,1002.21,82.0738,5,56),
(40,48,3,'Pro Laps',0,'Nadie',1,499.518,-1360.63,16.369,0,207.023,-140.256,1003.51,352.146,3,0),
(41,49,3,'Binco',0,'Nadie',1,2244.44,-1665.25,15.4766,0,207.686,-110.829,1005.13,0,15,3),
(42,50,3,'Sub Urban',0,'Nadie',1,2112.91,-1211.46,23.9629,0,203.924,-50.6627,1001.8,2.5871,1,66),
(43,51,5,'Ferreteria',0,'Nadie',1,-1480.98,2591.66,55.8359,0,-1074.44,339.985,1180.53,356.796,1,60051),
(44,52,5,'Ferreteria',0,'Nadie',1,2107.75,2165.51,10.8203,0,-1074.44,339.985,1180.53,356.796,1,1),
(45,53,5,'Ferreteria',0,'Nadie',1,2861.26,2430.74,11.069,0,-1074.44,339.985,1180.53,356.796,1,60053),
(46,67,1,'24/7',0,'Nadie',1,1352.35,-1759.25,13.5078,0,-27.3931,-58.2556,1003.65,90,6,66);
/*!40000 ALTER TABLE `rp_public_businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(32) NOT NULL,
  `s_alcohol` int(11) NOT NULL DEFAULT 0,
  `s_water` int(11) NOT NULL DEFAULT 0,
  `s_dioxide` int(11) NOT NULL DEFAULT 0,
  `s_clothes` int(11) NOT NULL DEFAULT 0,
  `s_part` int(11) NOT NULL DEFAULT 0,
  `s_materials` int(11) NOT NULL DEFAULT 0,
  `s_unload` varchar(128) NOT NULL,
  `s_grafiti` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_muebles`
--

DROP TABLE IF EXISTS `server_muebles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_muebles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CasaID` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `x1` float NOT NULL,
  `y1` float NOT NULL,
  `z1` float NOT NULL,
  `Modelo` int(11) NOT NULL,
  `EnUso` int(11) NOT NULL,
  `Puesto` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=758 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_muebles`
--

LOCK TABLES `server_muebles` WRITE;
/*!40000 ALTER TABLE `server_muebles` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_muebles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_admin_info_files`
--

DROP TABLE IF EXISTS `smf_admin_info_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_admin_info_files` (
  `id_file` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `parameters` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `filetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_file`),
  KEY `filename` (`filename`(30))
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_admin_info_files`
--

LOCK TABLES `smf_admin_info_files` WRITE;
/*!40000 ALTER TABLE `smf_admin_info_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_admin_info_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_approval_queue`
--

DROP TABLE IF EXISTS `smf_approval_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_approval_queue` (
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `id_attach` int(10) unsigned NOT NULL DEFAULT 0,
  `id_event` smallint(5) unsigned NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_approval_queue`
--

LOCK TABLES `smf_approval_queue` WRITE;
/*!40000 ALTER TABLE `smf_approval_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_approval_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_attachments`
--

DROP TABLE IF EXISTS `smf_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_attachments` (
  `id_attach` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_thumb` int(10) unsigned NOT NULL DEFAULT 0,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_folder` tinyint(4) NOT NULL DEFAULT 1,
  `attachment_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `file_hash` varchar(40) NOT NULL DEFAULT '',
  `fileext` varchar(8) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT 0,
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `width` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `height` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `mime_type` varchar(20) NOT NULL DEFAULT '',
  `approved` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_attach`),
  UNIQUE KEY `id_member` (`id_member`,`id_attach`),
  KEY `id_msg` (`id_msg`),
  KEY `attachment_type` (`attachment_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_attachments`
--

LOCK TABLES `smf_attachments` WRITE;
/*!40000 ALTER TABLE `smf_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_ban_groups`
--

DROP TABLE IF EXISTS `smf_ban_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_ban_groups` (
  `id_ban_group` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `ban_time` int(10) unsigned NOT NULL DEFAULT 0,
  `expire_time` int(10) unsigned DEFAULT NULL,
  `cannot_access` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cannot_register` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cannot_post` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cannot_login` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  PRIMARY KEY (`id_ban_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_ban_groups`
--

LOCK TABLES `smf_ban_groups` WRITE;
/*!40000 ALTER TABLE `smf_ban_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_ban_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_ban_items`
--

DROP TABLE IF EXISTS `smf_ban_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_ban_items` (
  `id_ban` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_ban_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `ip_low1` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ip_high1` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ip_low2` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ip_high2` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ip_low3` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ip_high3` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ip_low4` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ip_high4` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `hostname` varchar(255) NOT NULL DEFAULT '',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_ban`),
  KEY `id_ban_group` (`id_ban_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_ban_items`
--

LOCK TABLES `smf_ban_items` WRITE;
/*!40000 ALTER TABLE `smf_ban_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_ban_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_board_permissions`
--

DROP TABLE IF EXISTS `smf_board_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_board_permissions` (
  `id_group` smallint(6) NOT NULL DEFAULT 0,
  `id_profile` smallint(5) unsigned NOT NULL DEFAULT 0,
  `permission` varchar(30) NOT NULL DEFAULT '',
  `add_deny` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_group`,`id_profile`,`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_board_permissions`
--

LOCK TABLES `smf_board_permissions` WRITE;
/*!40000 ALTER TABLE `smf_board_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_board_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_boards`
--

DROP TABLE IF EXISTS `smf_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_boards` (
  `id_board` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_cat` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `child_level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `id_parent` smallint(5) unsigned NOT NULL DEFAULT 0,
  `board_order` smallint(6) NOT NULL DEFAULT 0,
  `id_last_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `id_msg_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `member_groups` varchar(255) NOT NULL DEFAULT '-1,0',
  `id_profile` smallint(5) unsigned NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `num_topics` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `num_posts` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `count_posts` tinyint(4) NOT NULL DEFAULT 0,
  `id_theme` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `override_theme` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `unapproved_posts` smallint(6) NOT NULL DEFAULT 0,
  `unapproved_topics` smallint(6) NOT NULL DEFAULT 0,
  `redirect` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_board`),
  UNIQUE KEY `categories` (`id_cat`,`id_board`),
  KEY `id_parent` (`id_parent`),
  KEY `id_msg_updated` (`id_msg_updated`),
  KEY `member_groups` (`member_groups`(48))
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_boards`
--

LOCK TABLES `smf_boards` WRITE;
/*!40000 ALTER TABLE `smf_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_calendar`
--

DROP TABLE IF EXISTS `smf_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_calendar` (
  `id_event` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL DEFAULT '0001-01-01',
  `end_date` date NOT NULL DEFAULT '0001-01-01',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_event`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `topic` (`id_topic`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_calendar`
--

LOCK TABLES `smf_calendar` WRITE;
/*!40000 ALTER TABLE `smf_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_calendar_holidays`
--

DROP TABLE IF EXISTS `smf_calendar_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_calendar_holidays` (
  `id_holiday` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `event_date` date NOT NULL DEFAULT '0001-01-01',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_holiday`),
  KEY `event_date` (`event_date`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_calendar_holidays`
--

LOCK TABLES `smf_calendar_holidays` WRITE;
/*!40000 ALTER TABLE `smf_calendar_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_calendar_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_categories`
--

DROP TABLE IF EXISTS `smf_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_categories` (
  `id_cat` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `cat_order` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `can_collapse` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_categories`
--

LOCK TABLES `smf_categories` WRITE;
/*!40000 ALTER TABLE `smf_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_collapsed_categories`
--

DROP TABLE IF EXISTS `smf_collapsed_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_collapsed_categories` (
  `id_cat` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_cat`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_collapsed_categories`
--

LOCK TABLES `smf_collapsed_categories` WRITE;
/*!40000 ALTER TABLE `smf_collapsed_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_collapsed_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_custom_fields`
--

DROP TABLE IF EXISTS `smf_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_custom_fields` (
  `id_field` smallint(6) NOT NULL AUTO_INCREMENT,
  `col_name` varchar(12) NOT NULL DEFAULT '',
  `field_name` varchar(40) NOT NULL DEFAULT '',
  `field_desc` varchar(255) NOT NULL DEFAULT '',
  `field_type` varchar(8) NOT NULL DEFAULT 'text',
  `field_length` smallint(6) NOT NULL DEFAULT 255,
  `field_options` text NOT NULL,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `show_reg` tinyint(4) NOT NULL DEFAULT 0,
  `show_display` tinyint(4) NOT NULL DEFAULT 0,
  `show_profile` varchar(20) NOT NULL DEFAULT 'forumprofile',
  `private` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `bbc` tinyint(4) NOT NULL DEFAULT 0,
  `can_search` tinyint(4) NOT NULL DEFAULT 0,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `enclose` text NOT NULL,
  `placement` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_field`),
  UNIQUE KEY `col_name` (`col_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_custom_fields`
--

LOCK TABLES `smf_custom_fields` WRITE;
/*!40000 ALTER TABLE `smf_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_discord_hook_boards`
--

DROP TABLE IF EXISTS `smf_discord_hook_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_discord_hook_boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_board` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `push_type` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_discord_hook_boards`
--

LOCK TABLES `smf_discord_hook_boards` WRITE;
/*!40000 ALTER TABLE `smf_discord_hook_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_discord_hook_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_group_moderators`
--

DROP TABLE IF EXISTS `smf_group_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_group_moderators` (
  `id_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_group`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_group_moderators`
--

LOCK TABLES `smf_group_moderators` WRITE;
/*!40000 ALTER TABLE `smf_group_moderators` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_group_moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_actions`
--

DROP TABLE IF EXISTS `smf_log_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_actions` (
  `id_action` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_log` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `log_time` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ip` char(16) NOT NULL DEFAULT '',
  `action` varchar(30) NOT NULL DEFAULT '',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `extra` text NOT NULL,
  PRIMARY KEY (`id_action`),
  KEY `id_log` (`id_log`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`),
  KEY `id_board` (`id_board`),
  KEY `id_msg` (`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_actions`
--

LOCK TABLES `smf_log_actions` WRITE;
/*!40000 ALTER TABLE `smf_log_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_activity`
--

DROP TABLE IF EXISTS `smf_log_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_activity` (
  `date` date NOT NULL DEFAULT '0001-01-01',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topics` smallint(5) unsigned NOT NULL DEFAULT 0,
  `posts` smallint(5) unsigned NOT NULL DEFAULT 0,
  `registers` smallint(5) unsigned NOT NULL DEFAULT 0,
  `most_on` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`date`),
  KEY `most_on` (`most_on`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_activity`
--

LOCK TABLES `smf_log_activity` WRITE;
/*!40000 ALTER TABLE `smf_log_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_banned`
--

DROP TABLE IF EXISTS `smf_log_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_banned` (
  `id_ban_log` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ip` char(16) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_ban_log`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_banned`
--

LOCK TABLES `smf_log_banned` WRITE;
/*!40000 ALTER TABLE `smf_log_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_boards`
--

DROP TABLE IF EXISTS `smf_log_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_boards` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_member`,`id_board`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_boards`
--

LOCK TABLES `smf_log_boards` WRITE;
/*!40000 ALTER TABLE `smf_log_boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_comments`
--

DROP TABLE IF EXISTS `smf_log_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_comments` (
  `id_comment` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `member_name` varchar(80) NOT NULL DEFAULT '',
  `comment_type` varchar(8) NOT NULL DEFAULT 'warning',
  `id_recipient` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `recipient_name` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(11) NOT NULL DEFAULT 0,
  `id_notice` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `counter` tinyint(4) NOT NULL DEFAULT 0,
  `body` text NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_recipient` (`id_recipient`),
  KEY `log_time` (`log_time`),
  KEY `comment_type` (`comment_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_comments`
--

LOCK TABLES `smf_log_comments` WRITE;
/*!40000 ALTER TABLE `smf_log_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_digest`
--

DROP TABLE IF EXISTS `smf_log_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_digest` (
  `id_topic` mediumint(8) unsigned NOT NULL,
  `id_msg` int(10) unsigned NOT NULL,
  `note_type` varchar(10) NOT NULL DEFAULT 'post',
  `daily` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `exclude` mediumint(8) unsigned NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_digest`
--

LOCK TABLES `smf_log_digest` WRITE;
/*!40000 ALTER TABLE `smf_log_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_errors`
--

DROP TABLE IF EXISTS `smf_log_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_errors` (
  `id_error` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ip` char(16) NOT NULL DEFAULT '',
  `url` text NOT NULL,
  `message` text NOT NULL,
  `session` char(32) NOT NULL DEFAULT '',
  `error_type` char(15) NOT NULL DEFAULT 'general',
  `file` varchar(255) NOT NULL DEFAULT '',
  `line` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_error`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=2298 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_errors`
--

LOCK TABLES `smf_log_errors` WRITE;
/*!40000 ALTER TABLE `smf_log_errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_floodcontrol`
--

DROP TABLE IF EXISTS `smf_log_floodcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_floodcontrol` (
  `ip` char(16) NOT NULL DEFAULT '',
  `log_time` int(10) unsigned NOT NULL DEFAULT 0,
  `log_type` varchar(8) NOT NULL DEFAULT 'post',
  PRIMARY KEY (`ip`,`log_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_floodcontrol`
--

LOCK TABLES `smf_log_floodcontrol` WRITE;
/*!40000 ALTER TABLE `smf_log_floodcontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_floodcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_group_requests`
--

DROP TABLE IF EXISTS `smf_log_group_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_group_requests` (
  `id_request` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `time_applied` int(10) unsigned NOT NULL DEFAULT 0,
  `reason` text NOT NULL,
  PRIMARY KEY (`id_request`),
  UNIQUE KEY `id_member` (`id_member`,`id_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_group_requests`
--

LOCK TABLES `smf_log_group_requests` WRITE;
/*!40000 ALTER TABLE `smf_log_group_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_group_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_karma`
--

DROP TABLE IF EXISTS `smf_log_karma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_karma` (
  `id_target` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_executor` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `log_time` int(10) unsigned NOT NULL DEFAULT 0,
  `action` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_target`,`id_executor`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_karma`
--

LOCK TABLES `smf_log_karma` WRITE;
/*!40000 ALTER TABLE `smf_log_karma` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_mark_read`
--

DROP TABLE IF EXISTS `smf_log_mark_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_mark_read` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_member`,`id_board`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_mark_read`
--

LOCK TABLES `smf_log_mark_read` WRITE;
/*!40000 ALTER TABLE `smf_log_mark_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_mark_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_member_notices`
--

DROP TABLE IF EXISTS `smf_log_member_notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_member_notices` (
  `id_notice` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id_notice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_member_notices`
--

LOCK TABLES `smf_log_member_notices` WRITE;
/*!40000 ALTER TABLE `smf_log_member_notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_member_notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_notify`
--

DROP TABLE IF EXISTS `smf_log_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_notify` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sent` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_member`,`id_topic`,`id_board`),
  KEY `id_topic` (`id_topic`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_notify`
--

LOCK TABLES `smf_log_notify` WRITE;
/*!40000 ALTER TABLE `smf_log_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_online`
--

DROP TABLE IF EXISTS `smf_log_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_online` (
  `session` varchar(32) NOT NULL DEFAULT '',
  `log_time` int(11) NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT 0,
  `ip` int(10) unsigned NOT NULL DEFAULT 0,
  `url` text NOT NULL,
  PRIMARY KEY (`session`),
  KEY `log_time` (`log_time`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_online`
--

LOCK TABLES `smf_log_online` WRITE;
/*!40000 ALTER TABLE `smf_log_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_packages`
--

DROP TABLE IF EXISTS `smf_log_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_packages` (
  `id_install` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `package_id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `id_member_installed` mediumint(9) NOT NULL DEFAULT 0,
  `member_installed` varchar(255) NOT NULL DEFAULT '',
  `time_installed` int(11) NOT NULL DEFAULT 0,
  `id_member_removed` mediumint(9) NOT NULL DEFAULT 0,
  `member_removed` varchar(255) NOT NULL DEFAULT '',
  `time_removed` int(11) NOT NULL DEFAULT 0,
  `install_state` tinyint(4) NOT NULL DEFAULT 1,
  `failed_steps` text NOT NULL,
  `themes_installed` varchar(255) NOT NULL DEFAULT '',
  `db_changes` text NOT NULL,
  PRIMARY KEY (`id_install`),
  KEY `filename` (`filename`(15))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_packages`
--

LOCK TABLES `smf_log_packages` WRITE;
/*!40000 ALTER TABLE `smf_log_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_polls`
--

DROP TABLE IF EXISTS `smf_log_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_polls` (
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_choice` tinyint(3) unsigned NOT NULL DEFAULT 0,
  KEY `id_poll` (`id_poll`,`id_member`,`id_choice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_polls`
--

LOCK TABLES `smf_log_polls` WRITE;
/*!40000 ALTER TABLE `smf_log_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_reported`
--

DROP TABLE IF EXISTS `smf_log_reported`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_reported` (
  `id_report` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `membername` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `time_started` int(11) NOT NULL DEFAULT 0,
  `time_updated` int(11) NOT NULL DEFAULT 0,
  `num_reports` mediumint(9) NOT NULL DEFAULT 0,
  `closed` tinyint(4) NOT NULL DEFAULT 0,
  `ignore_all` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_report`),
  KEY `id_member` (`id_member`),
  KEY `id_topic` (`id_topic`),
  KEY `closed` (`closed`),
  KEY `time_started` (`time_started`),
  KEY `id_msg` (`id_msg`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_reported`
--

LOCK TABLES `smf_log_reported` WRITE;
/*!40000 ALTER TABLE `smf_log_reported` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_reported` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_reported_comments`
--

DROP TABLE IF EXISTS `smf_log_reported_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_reported_comments` (
  `id_comment` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id_report` mediumint(9) NOT NULL DEFAULT 0,
  `id_member` mediumint(9) NOT NULL,
  `membername` varchar(255) NOT NULL DEFAULT '',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `member_ip` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `time_sent` int(11) NOT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `id_report` (`id_report`),
  KEY `id_member` (`id_member`),
  KEY `time_sent` (`time_sent`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_reported_comments`
--

LOCK TABLES `smf_log_reported_comments` WRITE;
/*!40000 ALTER TABLE `smf_log_reported_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_reported_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_scheduled_tasks`
--

DROP TABLE IF EXISTS `smf_log_scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_scheduled_tasks` (
  `id_log` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_task` smallint(6) NOT NULL DEFAULT 0,
  `time_run` int(11) NOT NULL DEFAULT 0,
  `time_taken` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM AUTO_INCREMENT=1748 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_scheduled_tasks`
--

LOCK TABLES `smf_log_scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `smf_log_scheduled_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_search_messages`
--

DROP TABLE IF EXISTS `smf_log_search_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_search_messages` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_search`,`id_msg`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_search_messages`
--

LOCK TABLES `smf_log_search_messages` WRITE;
/*!40000 ALTER TABLE `smf_log_search_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_search_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_search_results`
--

DROP TABLE IF EXISTS `smf_log_search_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_search_results` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `relevance` smallint(5) unsigned NOT NULL DEFAULT 0,
  `num_matches` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_search`,`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_search_results`
--

LOCK TABLES `smf_log_search_results` WRITE;
/*!40000 ALTER TABLE `smf_log_search_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_search_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_search_subjects`
--

DROP TABLE IF EXISTS `smf_log_search_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_search_subjects` (
  `word` varchar(20) NOT NULL DEFAULT '',
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`word`,`id_topic`),
  KEY `id_topic` (`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_search_subjects`
--

LOCK TABLES `smf_log_search_subjects` WRITE;
/*!40000 ALTER TABLE `smf_log_search_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_search_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_search_topics`
--

DROP TABLE IF EXISTS `smf_log_search_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_search_topics` (
  `id_search` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_search`,`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_search_topics`
--

LOCK TABLES `smf_log_search_topics` WRITE;
/*!40000 ALTER TABLE `smf_log_search_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_search_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_spider_hits`
--

DROP TABLE IF EXISTS `smf_log_spider_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_spider_hits` (
  `id_hit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT 0,
  `log_time` int(10) unsigned NOT NULL DEFAULT 0,
  `url` varchar(255) NOT NULL DEFAULT '',
  `processed` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_hit`),
  KEY `id_spider` (`id_spider`),
  KEY `log_time` (`log_time`),
  KEY `processed` (`processed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_spider_hits`
--

LOCK TABLES `smf_log_spider_hits` WRITE;
/*!40000 ALTER TABLE `smf_log_spider_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_spider_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_spider_stats`
--

DROP TABLE IF EXISTS `smf_log_spider_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_spider_stats` (
  `id_spider` smallint(5) unsigned NOT NULL DEFAULT 0,
  `page_hits` smallint(5) unsigned NOT NULL DEFAULT 0,
  `last_seen` int(10) unsigned NOT NULL DEFAULT 0,
  `stat_date` date NOT NULL DEFAULT '0001-01-01',
  PRIMARY KEY (`stat_date`,`id_spider`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_spider_stats`
--

LOCK TABLES `smf_log_spider_stats` WRITE;
/*!40000 ALTER TABLE `smf_log_spider_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_spider_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_subscribed`
--

DROP TABLE IF EXISTS `smf_log_subscribed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_subscribed` (
  `id_sublog` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_subscribe` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_member` int(11) NOT NULL DEFAULT 0,
  `old_id_group` smallint(6) NOT NULL DEFAULT 0,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `end_time` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `payments_pending` tinyint(4) NOT NULL DEFAULT 0,
  `pending_details` text NOT NULL,
  `reminder_sent` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ref` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_sublog`),
  UNIQUE KEY `id_subscribe` (`id_subscribe`,`id_member`),
  KEY `end_time` (`end_time`),
  KEY `reminder_sent` (`reminder_sent`),
  KEY `payments_pending` (`payments_pending`),
  KEY `status` (`status`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_subscribed`
--

LOCK TABLES `smf_log_subscribed` WRITE;
/*!40000 ALTER TABLE `smf_log_subscribed` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_subscribed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_log_topics`
--

DROP TABLE IF EXISTS `smf_log_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_log_topics` (
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_msg` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_member`,`id_topic`),
  KEY `id_topic` (`id_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_log_topics`
--

LOCK TABLES `smf_log_topics` WRITE;
/*!40000 ALTER TABLE `smf_log_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_log_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_mail_queue`
--

DROP TABLE IF EXISTS `smf_mail_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_mail_queue` (
  `id_mail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_sent` int(11) NOT NULL DEFAULT 0,
  `recipient` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `headers` text NOT NULL,
  `send_html` tinyint(4) NOT NULL DEFAULT 0,
  `priority` tinyint(4) NOT NULL DEFAULT 1,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_mail`),
  KEY `time_sent` (`time_sent`),
  KEY `mail_priority` (`priority`,`id_mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_mail_queue`
--

LOCK TABLES `smf_mail_queue` WRITE;
/*!40000 ALTER TABLE `smf_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_mail_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_membergroups`
--

DROP TABLE IF EXISTS `smf_membergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_membergroups` (
  `id_group` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(80) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `online_color` varchar(20) NOT NULL DEFAULT '',
  `min_posts` mediumint(9) NOT NULL DEFAULT -1,
  `max_messages` smallint(5) unsigned NOT NULL DEFAULT 0,
  `stars` varchar(255) NOT NULL DEFAULT '',
  `group_type` tinyint(4) NOT NULL DEFAULT 0,
  `hidden` tinyint(4) NOT NULL DEFAULT 0,
  `id_parent` smallint(6) NOT NULL DEFAULT -2,
  PRIMARY KEY (`id_group`),
  KEY `min_posts` (`min_posts`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_membergroups`
--

LOCK TABLES `smf_membergroups` WRITE;
/*!40000 ALTER TABLE `smf_membergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_membergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_members`
--

DROP TABLE IF EXISTS `smf_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_members` (
  `id_member` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_name` varchar(80) NOT NULL DEFAULT '',
  `date_registered` int(10) unsigned NOT NULL DEFAULT 0,
  `posts` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `lngfile` varchar(255) NOT NULL DEFAULT '',
  `last_login` int(10) unsigned NOT NULL DEFAULT 0,
  `real_name` varchar(255) NOT NULL DEFAULT '',
  `instant_messages` smallint(6) NOT NULL DEFAULT 0,
  `unread_messages` smallint(6) NOT NULL DEFAULT 0,
  `new_pm` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `buddy_list` text NOT NULL DEFAULT '',
  `pm_ignore_list` varchar(255) NOT NULL DEFAULT '',
  `pm_prefs` mediumint(9) NOT NULL DEFAULT 0,
  `mod_prefs` varchar(20) NOT NULL DEFAULT '',
  `message_labels` text NOT NULL DEFAULT '',
  `passwd` varchar(64) NOT NULL DEFAULT '',
  `openid_uri` text NOT NULL DEFAULT '',
  `email_address` varchar(255) NOT NULL DEFAULT '',
  `personal_text` varchar(255) NOT NULL DEFAULT '',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `birthdate` date NOT NULL DEFAULT '0001-01-01',
  `website_title` varchar(255) NOT NULL DEFAULT '',
  `website_url` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `icq` varchar(255) NOT NULL DEFAULT '',
  `aim` varchar(255) NOT NULL DEFAULT '',
  `yim` varchar(32) NOT NULL DEFAULT '',
  `msn` varchar(255) NOT NULL DEFAULT '',
  `hide_email` tinyint(4) NOT NULL DEFAULT 0,
  `show_online` tinyint(4) NOT NULL DEFAULT 1,
  `time_format` varchar(80) NOT NULL DEFAULT '',
  `signature` text NOT NULL DEFAULT '',
  `time_offset` float NOT NULL DEFAULT 0,
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `pm_email_notify` tinyint(4) NOT NULL DEFAULT 0,
  `karma_bad` smallint(5) unsigned NOT NULL DEFAULT 0,
  `karma_good` smallint(5) unsigned NOT NULL DEFAULT 0,
  `usertitle` varchar(255) NOT NULL DEFAULT '',
  `notify_announcements` tinyint(4) NOT NULL DEFAULT 1,
  `notify_regularity` tinyint(4) NOT NULL DEFAULT 1,
  `notify_send_body` tinyint(4) NOT NULL DEFAULT 0,
  `notify_types` tinyint(4) NOT NULL DEFAULT 2,
  `member_ip` varchar(255) NOT NULL DEFAULT '',
  `member_ip2` varchar(255) NOT NULL DEFAULT '',
  `secret_question` varchar(255) NOT NULL DEFAULT '',
  `secret_answer` varchar(64) NOT NULL DEFAULT '',
  `id_theme` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_activated` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `validation_code` varchar(10) NOT NULL DEFAULT '',
  `id_msg_last_visit` int(10) unsigned NOT NULL DEFAULT 0,
  `additional_groups` varchar(255) NOT NULL DEFAULT '',
  `smiley_set` varchar(48) NOT NULL DEFAULT '',
  `id_post_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `total_time_logged_in` int(10) unsigned NOT NULL DEFAULT 0,
  `password_salt` varchar(255) NOT NULL DEFAULT '',
  `ignore_boards` text NOT NULL DEFAULT '',
  `warning` tinyint(4) NOT NULL DEFAULT 0,
  `passwd_flood` varchar(12) NOT NULL DEFAULT '',
  `pm_receive_from` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_member`),
  KEY `member_name` (`member_name`),
  KEY `real_name` (`real_name`),
  KEY `date_registered` (`date_registered`),
  KEY `id_group` (`id_group`),
  KEY `birthdate` (`birthdate`),
  KEY `posts` (`posts`),
  KEY `last_login` (`last_login`),
  KEY `lngfile` (`lngfile`(30)),
  KEY `id_post_group` (`id_post_group`),
  KEY `warning` (`warning`),
  KEY `total_time_logged_in` (`total_time_logged_in`),
  KEY `id_theme` (`id_theme`)
) ENGINE=MyISAM AUTO_INCREMENT=38216 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_members`
--

LOCK TABLES `smf_members` WRITE;
/*!40000 ALTER TABLE `smf_members` DISABLE KEYS */;
INSERT INTO `smf_members` VALUES
(38215,'Williangel_Vera',1791190491,0,9,'',0,'Williangel Vera',0,0,0,'0','',0,'','0','0016575984dc46272acd59fcea6d4594619a28c3','','sdasd@sada.es','',0,'0001-01-01','','','','','','','',0,1,'','',0,'',0,0,0,'',1,1,0,2,'','','','',0,1,'',0,'','',0,0,'','',0,'',1);
/*!40000 ALTER TABLE `smf_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_message_icons`
--

DROP TABLE IF EXISTS `smf_message_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_message_icons` (
  `id_icon` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `filename` varchar(80) NOT NULL DEFAULT '',
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `icon_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_icon`),
  KEY `id_board` (`id_board`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_message_icons`
--

LOCK TABLES `smf_message_icons` WRITE;
/*!40000 ALTER TABLE `smf_message_icons` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_message_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_messages`
--

DROP TABLE IF EXISTS `smf_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_messages` (
  `id_msg` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_topic` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poster_time` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_msg_modified` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `poster_name` varchar(255) NOT NULL DEFAULT '',
  `poster_email` varchar(255) NOT NULL DEFAULT '',
  `poster_ip` varchar(255) NOT NULL DEFAULT '',
  `smileys_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `modified_time` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_name` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `icon` varchar(16) NOT NULL DEFAULT 'xx',
  `approved` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_msg`),
  UNIQUE KEY `topic` (`id_topic`,`id_msg`),
  UNIQUE KEY `id_board` (`id_board`,`id_msg`),
  UNIQUE KEY `id_member` (`id_member`,`id_msg`),
  KEY `approved` (`approved`),
  KEY `ip_index` (`poster_ip`(15),`id_topic`),
  KEY `participation` (`id_member`,`id_topic`),
  KEY `show_posts` (`id_member`,`id_board`),
  KEY `id_topic` (`id_topic`),
  KEY `id_member_msg` (`id_member`,`approved`,`id_msg`),
  KEY `current_topic` (`id_topic`,`id_msg`,`id_member`,`approved`),
  KEY `related_ip` (`id_member`,`poster_ip`,`id_msg`)
) ENGINE=MyISAM AUTO_INCREMENT=338 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_messages`
--

LOCK TABLES `smf_messages` WRITE;
/*!40000 ALTER TABLE `smf_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_moderators`
--

DROP TABLE IF EXISTS `smf_moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_moderators` (
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_board`,`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_moderators`
--

LOCK TABLES `smf_moderators` WRITE;
/*!40000 ALTER TABLE `smf_moderators` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_openid_assoc`
--

DROP TABLE IF EXISTS `smf_openid_assoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_openid_assoc` (
  `server_url` text NOT NULL,
  `handle` varchar(255) NOT NULL DEFAULT '',
  `secret` text NOT NULL,
  `issued` int(11) NOT NULL DEFAULT 0,
  `expires` int(11) NOT NULL DEFAULT 0,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`server_url`(125),`handle`(125)),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_openid_assoc`
--

LOCK TABLES `smf_openid_assoc` WRITE;
/*!40000 ALTER TABLE `smf_openid_assoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_openid_assoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_package_servers`
--

DROP TABLE IF EXISTS `smf_package_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_package_servers` (
  `id_server` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_server`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_package_servers`
--

LOCK TABLES `smf_package_servers` WRITE;
/*!40000 ALTER TABLE `smf_package_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_package_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_permission_profiles`
--

DROP TABLE IF EXISTS `smf_permission_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_permission_profiles` (
  `id_profile` smallint(6) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_profile`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_permission_profiles`
--

LOCK TABLES `smf_permission_profiles` WRITE;
/*!40000 ALTER TABLE `smf_permission_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_permission_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_permissions`
--

DROP TABLE IF EXISTS `smf_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_permissions` (
  `id_group` smallint(6) NOT NULL DEFAULT 0,
  `permission` varchar(30) NOT NULL DEFAULT '',
  `add_deny` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_group`,`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_permissions`
--

LOCK TABLES `smf_permissions` WRITE;
/*!40000 ALTER TABLE `smf_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_personal_messages`
--

DROP TABLE IF EXISTS `smf_personal_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_personal_messages` (
  `id_pm` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pm_head` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member_from` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `deleted_by_sender` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `from_name` varchar(255) NOT NULL DEFAULT '',
  `msgtime` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  PRIMARY KEY (`id_pm`),
  KEY `id_member` (`id_member_from`,`deleted_by_sender`),
  KEY `msgtime` (`msgtime`),
  KEY `id_pm_head` (`id_pm_head`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_personal_messages`
--

LOCK TABLES `smf_personal_messages` WRITE;
/*!40000 ALTER TABLE `smf_personal_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_personal_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_pm_recipients`
--

DROP TABLE IF EXISTS `smf_pm_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_pm_recipients` (
  `id_pm` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `labels` varchar(60) NOT NULL DEFAULT '-1',
  `bcc` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_read` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_new` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_pm`,`id_member`),
  UNIQUE KEY `id_member` (`id_member`,`deleted`,`id_pm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_pm_recipients`
--

LOCK TABLES `smf_pm_recipients` WRITE;
/*!40000 ALTER TABLE `smf_pm_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_pm_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_pm_rules`
--

DROP TABLE IF EXISTS `smf_pm_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_pm_rules` (
  `id_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_member` int(10) unsigned NOT NULL DEFAULT 0,
  `rule_name` varchar(60) NOT NULL,
  `criteria` text NOT NULL,
  `actions` text NOT NULL,
  `delete_pm` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `is_or` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_rule`),
  KEY `id_member` (`id_member`),
  KEY `delete_pm` (`delete_pm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_pm_rules`
--

LOCK TABLES `smf_pm_rules` WRITE;
/*!40000 ALTER TABLE `smf_pm_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_pm_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_poll_choices`
--

DROP TABLE IF EXISTS `smf_poll_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_poll_choices` (
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_choice` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `label` varchar(255) NOT NULL DEFAULT '',
  `votes` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_poll`,`id_choice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_poll_choices`
--

LOCK TABLES `smf_poll_choices` WRITE;
/*!40000 ALTER TABLE `smf_poll_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_poll_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_polls`
--

DROP TABLE IF EXISTS `smf_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_polls` (
  `id_poll` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `voting_locked` tinyint(1) NOT NULL DEFAULT 0,
  `max_votes` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `expire_time` int(10) unsigned NOT NULL DEFAULT 0,
  `hide_results` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `change_vote` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `guest_vote` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `num_guest_voters` int(10) unsigned NOT NULL DEFAULT 0,
  `reset_poll` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member` mediumint(9) NOT NULL DEFAULT 0,
  `poster_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_poll`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_polls`
--

LOCK TABLES `smf_polls` WRITE;
/*!40000 ALTER TABLE `smf_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_scheduled_tasks`
--

DROP TABLE IF EXISTS `smf_scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_scheduled_tasks` (
  `id_task` smallint(6) NOT NULL AUTO_INCREMENT,
  `next_time` int(11) NOT NULL DEFAULT 0,
  `time_offset` int(11) NOT NULL DEFAULT 0,
  `time_regularity` smallint(6) NOT NULL DEFAULT 0,
  `time_unit` varchar(1) NOT NULL DEFAULT 'h',
  `disabled` tinyint(4) NOT NULL DEFAULT 0,
  `task` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_task`),
  UNIQUE KEY `task` (`task`),
  KEY `next_time` (`next_time`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_scheduled_tasks`
--

LOCK TABLES `smf_scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `smf_scheduled_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_sessions`
--

DROP TABLE IF EXISTS `smf_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_sessions` (
  `session_id` char(32) NOT NULL,
  `last_update` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_sessions`
--

LOCK TABLES `smf_sessions` WRITE;
/*!40000 ALTER TABLE `smf_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_settings`
--

DROP TABLE IF EXISTS `smf_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_settings` (
  `variable` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`variable`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_settings`
--

LOCK TABLES `smf_settings` WRITE;
/*!40000 ALTER TABLE `smf_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_smileys`
--

DROP TABLE IF EXISTS `smf_smileys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_smileys` (
  `id_smiley` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL DEFAULT '',
  `filename` varchar(48) NOT NULL DEFAULT '',
  `description` varchar(80) NOT NULL DEFAULT '',
  `smiley_row` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `smiley_order` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_smiley`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_smileys`
--

LOCK TABLES `smf_smileys` WRITE;
/*!40000 ALTER TABLE `smf_smileys` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_smileys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_spiders`
--

DROP TABLE IF EXISTS `smf_spiders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_spiders` (
  `id_spider` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `spider_name` varchar(255) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `ip_info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_spider`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_spiders`
--

LOCK TABLES `smf_spiders` WRITE;
/*!40000 ALTER TABLE `smf_spiders` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_spiders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_subscriptions`
--

DROP TABLE IF EXISTS `smf_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_subscriptions` (
  `id_subscribe` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `cost` text NOT NULL,
  `length` varchar(6) NOT NULL DEFAULT '',
  `id_group` smallint(6) NOT NULL DEFAULT 0,
  `add_groups` varchar(40) NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `repeatable` tinyint(4) NOT NULL DEFAULT 0,
  `allow_partial` tinyint(4) NOT NULL DEFAULT 0,
  `reminder` tinyint(4) NOT NULL DEFAULT 0,
  `email_complete` text NOT NULL,
  PRIMARY KEY (`id_subscribe`),
  KEY `active` (`active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_subscriptions`
--

LOCK TABLES `smf_subscriptions` WRITE;
/*!40000 ALTER TABLE `smf_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_themes`
--

DROP TABLE IF EXISTS `smf_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_themes` (
  `id_member` mediumint(9) NOT NULL DEFAULT 0,
  `id_theme` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `variable` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id_theme`,`id_member`,`variable`(30)),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_themes`
--

LOCK TABLES `smf_themes` WRITE;
/*!40000 ALTER TABLE `smf_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smf_topics`
--

DROP TABLE IF EXISTS `smf_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `smf_topics` (
  `id_topic` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `is_sticky` tinyint(4) NOT NULL DEFAULT 0,
  `id_board` smallint(5) unsigned NOT NULL DEFAULT 0,
  `id_first_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `id_last_msg` int(10) unsigned NOT NULL DEFAULT 0,
  `id_member_started` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_member_updated` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_poll` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `id_previous_board` smallint(6) NOT NULL DEFAULT 0,
  `id_previous_topic` mediumint(9) NOT NULL DEFAULT 0,
  `num_replies` int(10) unsigned NOT NULL DEFAULT 0,
  `num_views` int(10) unsigned NOT NULL DEFAULT 0,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `unapproved_posts` smallint(6) NOT NULL DEFAULT 0,
  `approved` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_topic`),
  UNIQUE KEY `last_message` (`id_last_msg`,`id_board`),
  UNIQUE KEY `first_message` (`id_first_msg`,`id_board`),
  UNIQUE KEY `poll` (`id_poll`,`id_topic`),
  KEY `is_sticky` (`is_sticky`),
  KEY `approved` (`approved`),
  KEY `id_board` (`id_board`),
  KEY `member_started` (`id_member_started`,`id_board`),
  KEY `last_message_sticky` (`id_board`,`is_sticky`,`id_last_msg`),
  KEY `board_news` (`id_board`,`id_first_msg`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smf_topics`
--

LOCK TABLES `smf_topics` WRITE;
/*!40000 ALTER TABLE `smf_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `smf_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soporte`
--

DROP TABLE IF EXISTS `soporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `soporte` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `nombre_pago` varchar(30) NOT NULL,
  `meteodo` int(11) NOT NULL DEFAULT 0,
  `fecha` varchar(15) NOT NULL DEFAULT '16/1/2018',
  `monto` varchar(129) NOT NULL,
  `fecha_reclamo` varchar(100) NOT NULL,
  `estado` varchar(129) NOT NULL,
  `respuesta` varchar(129) NOT NULL,
  `correo` varchar(129) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soporte`
--

LOCK TABLES `soporte` WRITE;
/*!40000 ALTER TABLE `soporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `soporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territorios`
--

DROP TABLE IF EXISTS `territorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `territorios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Banda` int(11) NOT NULL DEFAULT 0,
  `Parte` varchar(64) NOT NULL DEFAULT 'Ninguna',
  `Nombre` varchar(64) NOT NULL,
  `Min_X` float NOT NULL,
  `Min_Y` float NOT NULL,
  `Min_Z` float NOT NULL DEFAULT -5000,
  `Max_X` float NOT NULL,
  `Max_Y` float NOT NULL,
  `Max_Z` float NOT NULL DEFAULT 5000,
  `Z_Activa` int(11) NOT NULL DEFAULT 1,
  `Color` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territorios`
--

LOCK TABLES `territorios` WRITE;
/*!40000 ALTER TABLE `territorios` DISABLE KEYS */;
INSERT INTO `territorios` VALUES
(1,0,'Ninguna','Montgomery #1',1176.4,217.8,-5000,1334.4,362.8,5000,1,0),
(2,0,'Ninguna','Flint County #2',-116.6,-2606.2,-5000,16.4001,-2464.2,5000,1,0),
(3,0,'Ninguna','Regular Tom #3',-409,1715.8,-5000,-284,1855.8,5000,1,0),
(4,0,'Ninguna','Blackfield Chapel #4',1398.2,671,-5000,1553.2,806,5000,1,0),
(5,0,'Ninguna','Blueberry #5',124.8,-203.4,-5000,262.8,-41.4001,5000,1,0),
(6,0,'Ninguna','Paradiso #6',-2762.22,880.8,-5000,-2600.22,1010.8,5000,1,0),
(7,0,'Ninguna','Calton Heights #7',-2266.2,924.8,-5000,-2133.2,1109.8,5000,1,0),
(8,0,'Ninguna','Ocean Flats #8',-2724.06,-89.7749,-5000,-2515.06,48.2251,5000,1,0),
(9,0,'Ninguna','Esplanade North #9',-1826.09,1206.29,-5000,-1649.09,1342.29,5000,1,0),
(10,0,'Ninguna','Angel Pine #10',-2272.02,-2491.38,-5000,-2083.02,-2358.38,5000,1,0),
(11,0,'Ninguna','Whetstone #11',-1660.01,-2795.38,-5000,-1457.01,-2653.38,5000,1,0),
(12,0,'Ninguna','Glen Park #12',1848.98,-1262.39,-5000,2076.98,-1131.39,5000,1,0),
(13,0,'Ninguna','El Corona #13',1649.38,-2156.36,-5000,1867.38,-2022.36,5000,1,0),
(14,0,'Ninguna','East Beach #14',2674.37,-1643.38,-5000,2895.37,-1502.38,5000,1,0),
(15,0,'Ninguna','Las Payasadas #15',-355.025,2646.62,-5000,-160.025,2768.62,5000,1,0),
(16,0,'Ninguna','Palomino Creek #16',2194.39,-140.394,-5000,2366.39,-5.39362,5000,1,0),
(17,0,'Ninguna','Palomino Creek #17',2452.39,-47.3936,-5000,2579.39,160.606,5000,1,0),
(18,0,'Ninguna','Willowfield #18',2333.37,-2042.39,-5000,2521.37,-1920.39,5000,1,0),
(19,0,'Ninguna','Caligulas Palace #19',2298.32,1609.67,-5000,2553.32,1725.67,5000,1,0),
(20,0,'Ninguna','Redsands East #20',1903.17,2018.01,-5000,2125.17,2127.01,5000,1,0),
(21,0,'Ninguna','Creek #21',2774.38,2210.03,-5000,2903.38,2412.03,5000,1,0),
(22,0,'Ninguna','Las Barrancas #22',-862.225,1461.03,-5000,-733.225,1630.03,5000,1,0),
(23,0,'Ninguna','Fort Carson #23',-369.219,1012.01,-5000,-197.219,1208.01,5000,1,0),
(24,0,'Ninguna','Fort Carson #24',-86.2064,1037.01,-5000,93.7936,1270.01,5000,1,0),
(25,0,'Ninguna','Santa Maria Beach #25',154,-1894.6,-5000,343,-1767.6,5000,1,0),
(26,0,'Ninguna','Verdant Bluffs #26',1111,-2079,-5000,1296,-1979,5000,1,0),
(27,0,'Ninguna','Vinewood #27',633,-1309,-5000,798,-1188,5000,1,0),
(28,0,'Ninguna','Chinatown #28',-2151.61,568.006,-5000,-2005.61,739.006,5000,1,0),
(29,0,'Ninguna','Palisades #29',-2906.01,413.019,-5000,-2791.01,612.019,5000,1,0),
(30,0,'Ninguna','Missionary Hill #30',-2945.02,-828.981,-5000,-2812.02,-622.981,5000,1,0),
(31,0,'Ninguna','Whetstone #31',-1924.01,-1738.99,-5000,-1762.01,-1563.99,5000,1,0),
(32,0,'Ninguna','Fallen Tree #32',-623,-572.2,-5000,-461,-462.2,5000,1,0),
(33,0,'Ninguna','El Quebrados #33',-1593.47,2523,-5000,-1454.47,2707,5000,1,0),
(34,0,'Ninguna','Bayside #34',-2674,2261,-5000,-2545,2458,5000,1,0),
(35,0,'Ninguna','Bayside Marina #35',-2381,2297,-5000,-2218,2439,5000,1,0),
(36,0,'Ninguna','Come-A-Lot #36',2401.53,1055.33,-5000,2605.53,1204.33,5000,1,0),
(37,0,'Ninguna','Whitewood Estates #37',1002.8,1845,-5000,1152.8,2040,5000,1,0),
(44,0,'Ninguna','Bone County #44',-531.8,1441,-5000,-335.5,1558.4,5000,1,0),
(45,0,'Ninguna','San Fierro #45',-1490.82,1470.3,-5000,-1336.78,1526.34,5000,1,0),
(49,0,'Ninguna','Easter Basin #49',-1473.49,471.253,-5000,-1207.44,541.292,5000,1,0),
(52,0,'Ninguna','Bone County #52',805.7,1631.2,-5000,922.3,1812.1,5000,1,0),
(56,0,'Ninguna','Redsands West #56',1385.6,1856,-5000,1522.2,2002.3,5000,1,0),
(57,0,'Ninguna','Bone County #57',600,1494.8,-5000,793.7,1671.5,5000,1,0),
(58,0,'Ninguna','Redsands West #58',1204.1,1944.5,-5000,1377.4,2110,5000,1,0),
(60,0,'Ninguna','Octane Springs #60',526.3,1208.9,-5000,714.4,1357.5,5000,1,0),
(64,0,'Ninguna','Bone County #64',634.5,1814.8,-5000,804.4,1990.3,5000,1,0),
(67,0,'Ninguna','Verona Beach #67',1106.8,-1698.9,-5000,1300.3,-1596.3,5000,1,0),
(69,0,'Ninguna','Back o Beyond #69',-1226.8,-2587.1,-5000,-1059.5,-2425.2,5000,1,0),
(70,0,'Ninguna','Verdant Meadows #70',346.9,2250.4,-5000,485.3,2442.4,5000,1,0),
(71,0,'Ninguna','Bone County #71',617,2201,-5000,758.1,2314.4,5000,1,0),
(72,0,'Ninguna','Bone County #72',-463.5,908.4,-5000,-337.7,1058.1,5000,1,0),
(73,0,'Ninguna','Calton Heights #73',-2171.8,1053.3,-5000,-2041.6,1194,5000,1,0),
(74,0,'Ninguna','Las Venturas #74',893.3,2666.4,-5000,1002.4,2817.3,5000,1,0),
(75,0,'Ninguna','Flint County #75',-931.9,-2854.5,-5000,-831.7,-2729.2,5000,1,0),
(76,0,'Ninguna','Bone County #76',547.5,2429.2,-5000,707.4,2609.5,5000,1,0),
(77,0,'Ninguna','Red County #77',2601.7,-19.2,-5000,2710.6,139.5,5000,1,0),
(78,0,'Ninguna','The Four Dragons Casino #78',1755.8,994.9,-5000,1891.7,1168.8,5000,1,0),
(79,0,'Ninguna','Red County #79',324.8,525.7,-5000,440.6,660.6,5000,1,0),
(81,0,'Ninguna','Richman #81',416.7,-1295.7,-5000,521.8,-1128,5000,1,0),
(82,0,'Ninguna','Whetstone #82',-2980.6,-2968.7,-5000,-2855.6,-2772.8,5000,1,0),
(83,0,'Ninguna','Red County #83',1852.3,-571.2,-5000,2044.6,-463.7,5000,1,0),
(85,0,'Ninguna','Tierra Robada #85',-1061.8,1542.8,-5000,-907,1705.8,5000,1,0),
(87,0,'Ninguna','Bayside #87',-2525,2207.1,-5000,-2355.1,2319,5000,1,0),
(88,0,'Ninguna','Easter Basin #88',-1586.2,271,-5000,-1395.1,442.9,5000,1,0),
(90,0,'Ninguna','Red County #90',2748.8,490.9,-5000,2910.5,630.6,5000,1,0),
(92,0,'Ninguna','Bone County #92',-177.3,1981.1,-5000,21.5,2116.5,5000,1,0),
(93,0,'Ninguna','Redsands East #93',1830.7,2201.3,-5000,1948.5,2401,5000,1,0),
(94,0,'Ninguna','Red County #94',162.8,-625.3,-5000,291.4,-471.9,5000,1,0),
(95,0,'Ninguna','Red County #95',-356.3,-730,-5000,-195.9,-629.9,5000,1,0),
(97,0,'Ninguna','Pirates in Mens Pants #97',1802,1484.8,-5000,1998.1,1634.6,5000,1,0),
(98,0,'Ninguna','Tierra Robada #98',-1321.2,2435,-5000,-1165.2,2630,5000,1,0),
(100,0,'Ninguna','Whetstone #100',-2692.9,-1550.6,-5000,-2508.1,-1390.1,5000,1,0),
(101,0,'Ninguna','Santa Maria Beach #101',410.891,-1932.22,-5000,710.048,-1815.38,5000,1,0),
(102,0,'Ninguna','Ganton #102',2417.81,-1717.47,-5000,2554.63,-1630.77,5000,1,0),
(103,0,'Ninguna','Playa del Seville #103',2710.15,-2053.07,-5000,2816.73,-1895.77,5000,1,0),
(104,0,'Ninguna','Los Santos International #104',1910.54,-2435.62,-5000,2022.54,-2281.28,5000,1,0),
(105,0,'Ninguna','San Fierro #105',-2527.83,1526.39,-5000,-2261.78,1596.43,5000,1,0);
/*!40000 ALTER TABLE `territorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuning_objects`
--

DROP TABLE IF EXISTS `tuning_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuning_objects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) NOT NULL,
  `NAME` varchar(32) NOT NULL,
  `MODELID` int(11) NOT NULL,
  `OFF_X` float NOT NULL,
  `OFF_Y` float NOT NULL,
  `OFF_Z` float NOT NULL,
  `ROT_X` float NOT NULL,
  `ROT_Y` float NOT NULL,
  `ROT_Z` float NOT NULL,
  `COLOR_0` int(11) NOT NULL,
  `COLOR_1` int(11) NOT NULL,
  `COLOR_2` int(11) NOT NULL,
  `COLOR_3` int(11) NOT NULL,
  `COLOR_4` int(11) NOT NULL,
  `TEXT` varchar(32) NOT NULL,
  `FONT` varchar(32) NOT NULL,
  `FONT_SIZE` int(11) NOT NULL,
  `FONT_BOLD` int(11) NOT NULL,
  `FONT_COLOR` varchar(50) NOT NULL DEFAULT '',
  `ID_VEHICLE` int(11) NOT NULL,
  `ATTACHED` int(11) NOT NULL,
  `FACC` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19324 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuning_objects`
--

LOCK TABLES `tuning_objects` WRITE;
/*!40000 ALTER TABLE `tuning_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuning_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `posA` float NOT NULL DEFAULT 0,
  `EntradaX` float NOT NULL DEFAULT 0,
  `EntradaY` float NOT NULL DEFAULT 0,
  `EntradaZ` float NOT NULL DEFAULT 0,
  `DeathX` float NOT NULL DEFAULT 0,
  `DeathY` float NOT NULL DEFAULT 0,
  `TempBan` int(11) NOT NULL DEFAULT 0,
  `Sanciones` int(11) NOT NULL DEFAULT 0,
  `DeathZ` float NOT NULL DEFAULT 0,
  `DeathA` float NOT NULL DEFAULT 0,
  `Admin` int(11) NOT NULL DEFAULT 0,
  `Fecha_Ban` varchar(32) NOT NULL DEFAULT '16/02/2020',
  `Mapper` varchar(32) NOT NULL DEFAULT '0',
  `Sexo` varchar(1) NOT NULL DEFAULT '1',
  `Edad` int(11) NOT NULL DEFAULT 0,
  `Skin` varchar(3) NOT NULL,
  `Vida` float NOT NULL,
  `Chaleco` float NOT NULL DEFAULT 0,
  `Registro` varchar(15) NOT NULL DEFAULT '19/7/2014',
  `Linked` int(11) NOT NULL DEFAULT 0,
  `Money` int(11) NOT NULL DEFAULT 0,
  `Banco` int(11) NOT NULL DEFAULT 0,
  `Moneda` int(11) NOT NULL DEFAULT 0,
  `Cargos` varchar(10) NOT NULL DEFAULT '0',
  `Duty` varchar(1) NOT NULL DEFAULT '0',
  `SkinTrabajo` varchar(3) NOT NULL DEFAULT '0',
  `Nivel` varchar(2) NOT NULL DEFAULT '1',
  `Experiencia` varchar(3) NOT NULL DEFAULT '0',
  `Agonizando` varchar(1) NOT NULL DEFAULT '0',
  `GPS` varchar(1) NOT NULL DEFAULT '0',
  `Radio` varchar(1) NOT NULL DEFAULT '0',
  `Numero` varchar(10) NOT NULL DEFAULT '0',
  `Guia` int(11) NOT NULL DEFAULT 1,
  `Sonidos` int(11) NOT NULL DEFAULT 1,
  `Muteos` int(11) NOT NULL DEFAULT 1,
  `Barras` int(11) NOT NULL DEFAULT 1,
  `Alerta` int(11) NOT NULL DEFAULT 1,
  `Velocimetro` int(11) NOT NULL DEFAULT 1,
  `valortotal` int(11) NOT NULL DEFAULT 0,
  `votostotales` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `MundoVirtual` int(11) NOT NULL DEFAULT 0,
  `Materiales` int(11) NOT NULL DEFAULT 0,
  `Sed` int(11) NOT NULL DEFAULT 8,
  `Trabajo` int(11) NOT NULL DEFAULT 0,
  `Trabajo2` int(11) NOT NULL DEFAULT 0,
  `Faccion` varchar(5) NOT NULL DEFAULT '0',
  `Rango` varchar(10) DEFAULT NULL,
  `suspendido` int(11) NOT NULL DEFAULT 0,
  `suspensiones` int(11) NOT NULL DEFAULT 0,
  `TiempoBanda` int(11) NOT NULL DEFAULT 0,
  `Crack` int(11) NOT NULL DEFAULT 0,
  `Caramelos` int(11) NOT NULL DEFAULT 0,
  `Medicamentos` int(11) NOT NULL DEFAULT 0,
  `Marihuana` int(11) NOT NULL DEFAULT 0,
  `Agenda` varchar(2) NOT NULL DEFAULT '0',
  `Registro_U` varchar(32) NOT NULL DEFAULT '',
  `username_low` varchar(32) NOT NULL DEFAULT 'ninguno',
  `Licencia` varchar(5) NOT NULL DEFAULT '0',
  `TiempoPD` int(11) NOT NULL DEFAULT 0,
  `TiempoJail` int(11) NOT NULL DEFAULT 0,
  `Repuestos` int(11) NOT NULL DEFAULT 0,
  `hx` float NOT NULL DEFAULT 0,
  `hy` float NOT NULL DEFAULT 0,
  `hz` float NOT NULL DEFAULT 0,
  `Baneado` varchar(2) NOT NULL DEFAULT '0',
  `Banpor` varchar(64) NOT NULL DEFAULT 'Ninguno',
  `Baneante` int(11) NOT NULL DEFAULT 0,
  `razon` varchar(32) NOT NULL DEFAULT 'Ninguno',
  `IP` varchar(15) NOT NULL DEFAULT '',
  `NMute` int(11) NOT NULL DEFAULT 0,
  `changenamefree` int(11) NOT NULL DEFAULT 0,
  `Online` int(11) NOT NULL DEFAULT 0,
  `EnFC` int(11) NOT NULL DEFAULT 0,
  `Email` varchar(50) NOT NULL DEFAULT 'notiene@email.com',
  `EMS` int(11) NOT NULL DEFAULT 0,
  `TiempoCarcelS` int(11) NOT NULL DEFAULT 0,
  `Changed` int(11) NOT NULL DEFAULT 0,
  `Pais_Registro` varchar(32) NOT NULL DEFAULT 'Desconocido',
  `Multas` int(11) NOT NULL DEFAULT 0,
  `Stats` int(11) NOT NULL DEFAULT 0,
  `EnCasa` varchar(10) NOT NULL DEFAULT '0',
  `EnRopero` varchar(10) NOT NULL DEFAULT '0',
  `EnGarage` int(11) NOT NULL DEFAULT 0,
  `VIP` int(11) NOT NULL DEFAULT 0,
  `FinDia` int(11) NOT NULL DEFAULT 0,
  `FinMes` int(11) NOT NULL DEFAULT 0,
  `FinAno` int(11) NOT NULL DEFAULT 0,
  `FinDiaL` int(11) NOT NULL DEFAULT 0,
  `FinLicencia` int(11) NOT NULL DEFAULT 0,
  `hprecio` int(11) NOT NULL DEFAULT 0,
  `h2precio` int(11) NOT NULL DEFAULT 0,
  `hmoneda` int(11) NOT NULL DEFAULT 0,
  `h2moneda` int(11) NOT NULL DEFAULT 0,
  `CasaID1` int(11) NOT NULL DEFAULT 0,
  `CasaID2` int(11) NOT NULL DEFAULT 0,
  `Baneo_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `WP0` varchar(2) NOT NULL DEFAULT '0',
  `WP1` varchar(2) NOT NULL DEFAULT '0',
  `WP2` varchar(2) NOT NULL DEFAULT '0',
  `WP3` varchar(2) NOT NULL DEFAULT '0',
  `WP4` varchar(2) NOT NULL DEFAULT '0',
  `WP5` varchar(2) NOT NULL DEFAULT '0',
  `WP6` varchar(2) NOT NULL DEFAULT '0',
  `WP7` varchar(2) NOT NULL DEFAULT '0',
  `WP8` varchar(2) NOT NULL DEFAULT '0',
  `WP9` varchar(2) NOT NULL DEFAULT '0',
  `WP10` varchar(2) NOT NULL DEFAULT '0',
  `WP11` varchar(2) NOT NULL DEFAULT '0',
  `WP12` varchar(2) NOT NULL DEFAULT '0',
  `NivelArmero` varchar(3) NOT NULL DEFAULT '1',
  `ExpArmero` varchar(3) NOT NULL DEFAULT '0',
  `NivelPescador` int(11) NOT NULL DEFAULT 1,
  `ExpPescador` int(11) NOT NULL DEFAULT 0,
  `NivelPiloto` int(11) NOT NULL DEFAULT 1,
  `ExpPiloto` int(11) NOT NULL DEFAULT 0,
  `NivelCamionero` varchar(3) NOT NULL DEFAULT '1',
  `ExpCamionero` varchar(3) NOT NULL DEFAULT '0',
  `NivelTransportista` int(11) NOT NULL DEFAULT 1,
  `ExpTransportista` int(11) NOT NULL DEFAULT 0,
  `NivelBasurero` int(11) NOT NULL DEFAULT 1,
  `ExpBasurero` int(11) NOT NULL DEFAULT 0,
  `NivelLadron` int(11) NOT NULL DEFAULT 1,
  `ExpLadron` int(11) NOT NULL DEFAULT 0,
  `NivelMedico` int(11) NOT NULL DEFAULT 1,
  `ExpMedico` int(11) NOT NULL DEFAULT 0,
  `RopaBasu` int(11) NOT NULL DEFAULT 0,
  `RopaMedi` int(11) NOT NULL DEFAULT 0,
  `RopaMeca` int(11) DEFAULT 0,
  `RopaMine` int(11) NOT NULL DEFAULT 0,
  `Martillo` int(11) NOT NULL DEFAULT 0,
  `Destornillador` int(11) NOT NULL DEFAULT 0,
  `Barreta` int(11) NOT NULL DEFAULT 0,
  `Balde` int(11) NOT NULL DEFAULT 0,
  `EstacionamientoID` int(11) NOT NULL DEFAULT 0,
  `Estacionado1` int(11) NOT NULL DEFAULT 0,
  `Estacionado2` int(11) NOT NULL DEFAULT 0,
  `Estacionado3` int(11) NOT NULL DEFAULT 0,
  `Estacionado4` int(11) NOT NULL DEFAULT 0,
  `EnEstacionamiento` int(11) NOT NULL DEFAULT 0,
  `ent_totem` float NOT NULL DEFAULT 0,
  `Totem_Name` varchar(64) DEFAULT NULL,
  `totems` int(11) NOT NULL DEFAULT 0,
  `NivelMinero` int(11) NOT NULL DEFAULT 1,
  `ExpMinero` int(11) NOT NULL DEFAULT 0,
  `Regalo` int(11) NOT NULL DEFAULT 0,
  `Muteado` int(11) NOT NULL DEFAULT 0,
  `arrestado` int(11) NOT NULL DEFAULT 0,
  `horasjugadas` int(11) NOT NULL DEFAULT 0,
  `TipoCarcel` varchar(3) NOT NULL DEFAULT '0',
  `SocioHP` varchar(3) NOT NULL DEFAULT '0',
  `Hambre` int(11) NOT NULL DEFAULT 8,
  `Patines` int(11) NOT NULL DEFAULT 0,
  `PuntosCarrera` int(11) NOT NULL DEFAULT 0,
  `TieneEmisora` int(11) NOT NULL DEFAULT 0,
  `NombreEmisora` varchar(90) NOT NULL DEFAULT '',
  `Conexion` varchar(90) NOT NULL DEFAULT '1',
  `Semillas` int(11) NOT NULL DEFAULT 0,
  `XE` float NOT NULL DEFAULT 0,
  `YE` float NOT NULL DEFAULT 0,
  `ZE` float NOT NULL DEFAULT 0,
  `FinMesC` int(11) NOT NULL DEFAULT 0,
  `FinAnoC` int(11) NOT NULL DEFAULT 0,
  `enviocorreo` int(11) NOT NULL DEFAULT 0,
  `nuevocorreo` varchar(70) NOT NULL DEFAULT '',
  `MinutosECorreo` varchar(25) NOT NULL DEFAULT '',
  `MinJuego` int(11) NOT NULL DEFAULT 0,
  `IpReg` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `CodigoC` int(11) NOT NULL DEFAULT 0,
  `mensajepersonal` varchar(64) NOT NULL DEFAULT 'Nada para decir.',
  `Mapear` int(11) NOT NULL DEFAULT 0,
  `Afinidad1` int(11) NOT NULL DEFAULT 0,
  `Afinidad2` int(11) NOT NULL DEFAULT 0,
  `Afinidad3` int(11) NOT NULL DEFAULT 0,
  `Afinidad4` int(11) NOT NULL DEFAULT 0,
  `Afinidad5` int(11) NOT NULL DEFAULT 0,
  `Afinidad6` int(11) NOT NULL DEFAULT 0,
  `EstadoKEY` int(11) NOT NULL DEFAULT 0,
  `CPendiente` int(11) NOT NULL DEFAULT 0,
  `CodigoKEY` int(11) NOT NULL DEFAULT 329450,
  `avatarenuso` varchar(5) NOT NULL DEFAULT '32',
  `Puesto1H` int(11) NOT NULL DEFAULT 0,
  `Puesto2H` int(11) NOT NULL DEFAULT 0,
  `Puesto3H` int(11) NOT NULL DEFAULT 0,
  `Puesto4H` int(11) NOT NULL DEFAULT 0,
  `Puesto5H` int(11) NOT NULL DEFAULT 0,
  `Puesto6H` int(11) NOT NULL DEFAULT 0,
  `Puesto7H` int(11) NOT NULL DEFAULT 0,
  `Puesto8H` int(11) NOT NULL DEFAULT 0,
  `Puesto9H` int(11) NOT NULL DEFAULT 0,
  `Puesto10H` int(11) NOT NULL DEFAULT 0,
  `Puesto11H` int(11) NOT NULL DEFAULT 0,
  `Puesto12H` int(11) NOT NULL DEFAULT 0,
  `Puesto13H` int(11) NOT NULL DEFAULT 0,
  `Puesto14H` int(11) NOT NULL DEFAULT 0,
  `Puesto15H` int(11) NOT NULL DEFAULT 0,
  `Puesto16H` int(11) NOT NULL DEFAULT 0,
  `Puesto17H` int(11) NOT NULL DEFAULT 0,
  `Puesto18H` int(11) NOT NULL DEFAULT 0,
  `Puesto19H` int(11) NOT NULL DEFAULT 0,
  `Puesto20H` int(11) NOT NULL DEFAULT 0,
  `Puesto21H` int(11) NOT NULL DEFAULT 0,
  `Puesto22H` int(11) NOT NULL DEFAULT 0,
  `Puesto23H` int(11) NOT NULL DEFAULT 0,
  `Puesto24H` int(11) NOT NULL DEFAULT 0,
  `Puesto25H` int(11) NOT NULL DEFAULT 0,
  `Puesto26H` int(11) NOT NULL DEFAULT 0,
  `Puesto27H` int(11) NOT NULL DEFAULT 0,
  `Puesto28H` int(11) NOT NULL DEFAULT 0,
  `Puesto29H` int(11) NOT NULL DEFAULT 0,
  `Puesto30H` int(11) NOT NULL DEFAULT 0,
  `Puesto31H` int(11) NOT NULL DEFAULT 0,
  `Puesto32H` int(11) NOT NULL DEFAULT 0,
  `vAlarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma` int(11) NOT NULL DEFAULT 0,
  `v2Alarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma2` int(11) NOT NULL DEFAULT 0,
  `v3Alarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma3` int(11) NOT NULL DEFAULT 0,
  `v4Alarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma4` int(11) NOT NULL DEFAULT 0,
  `LastID` int(11) DEFAULT 0,
  `Lang` int(11) NOT NULL DEFAULT 2,
  `BaneosHechos` int(11) NOT NULL DEFAULT 0,
  `BaneosDia` int(11) NOT NULL DEFAULT 0,
  `Nacionalidad` varchar(32) NOT NULL DEFAULT 'San Andreas',
  `Bloqueado` int(11) NOT NULL DEFAULT 0,
  `RazonSan` varchar(128) NOT NULL DEFAULT 'Nada',
  `LogAdmin` int(11) DEFAULT 1,
  `FinDiaC` int(11) NOT NULL DEFAULT 0,
  `Participar` int(11) NOT NULL DEFAULT 0,
  `Striptease` int(11) NOT NULL DEFAULT 0,
  `Anuncios` int(11) NOT NULL DEFAULT 0,
  `RecompensaLZ` int(11) NOT NULL DEFAULT 0,
  `TiempoDuda` int(11) NOT NULL DEFAULT 0,
  `LSD` int(11) NOT NULL DEFAULT 0,
  `Krippy` int(11) NOT NULL DEFAULT 0,
  `Acento` int(11) NOT NULL DEFAULT 0,
  `Totems2` int(11) NOT NULL DEFAULT 0,
  `LastUnixConnection` int(11) NOT NULL DEFAULT 0,
  `FacebookID` varchar(128) NOT NULL DEFAULT '',
  `Mascara` varchar(1) NOT NULL DEFAULT '0',
  `BackPack` int(11) NOT NULL DEFAULT 0,
  `Botiquines` int(11) NOT NULL DEFAULT 0,
  `TiempoDepa` int(11) NOT NULL DEFAULT 0,
  `CasaID3` int(11) NOT NULL DEFAULT 0,
  `CasaID4` int(11) NOT NULL DEFAULT 0,
  `EstadoX` text NOT NULL DEFAULT '',
  `TiempoOffline` int(11) NOT NULL DEFAULT 0,
  `Estacionado5` int(11) NOT NULL DEFAULT 0,
  `EstadoON` int(11) NOT NULL DEFAULT 0,
  `Responsable` text NOT NULL DEFAULT '',
  `Jugador` text NOT NULL DEFAULT '',
  `Clima` int(11) NOT NULL DEFAULT 0,
  `discordVerificado` int(11) NOT NULL DEFAULT 0,
  `CodDisc` int(11) NOT NULL DEFAULT 0,
  `TiempoGuarda` int(11) NOT NULL DEFAULT 0,
  `LiderApsa` int(11) NOT NULL DEFAULT 0,
  `EnApsa` int(11) NOT NULL DEFAULT 0,
  `cc_exp` int(11) NOT NULL DEFAULT 0,
  `Asesinatos` int(11) NOT NULL DEFAULT 0,
  `Muertes` int(11) NOT NULL DEFAULT 0,
  `LogAutomatico` int(11) DEFAULT 0,
  `SessID` varchar(100) DEFAULT NULL,
  `Quest` varchar(500) DEFAULT NULL,
  `NexusTotems` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36990 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(36980,'Williangel_Vera','0DAAFD12B567765A9F65AAE9661A825B6584C95A464CEAC50CBA0B18D0D1DE8B',1160.51,-1657.09,14.0113,0,1513.41,-1669.48,14.0469,1396.36,1180.67,0,0,11.6007,0,8,'2026/10/08','0','1',0,'292',25,29,'05/10/2026',0,69046,7297,25,'0','0','278','5','11','0','1','1','121431',1,1,1,1,1,1,0,0,0,0,1000,-36,2,0,'0','0',0,0,0,497,0,496,2,'1','5/10/2026','ninguno','0',10,0,0,0,0,0,'0','Anticheat',0,'Speed Hack (79:1:4)','127.0.0.1',0,0,1,0,'sdasd@sada.es',1,0,0,'Localhost',0,1,'0','0',0,0,0,0,0,0,0,0,0,0,0,0,0,'2026-10-09 01:12:57','0','0','0','0','0','0','0','0','0','41','0','0','0','6','0',1,0,1,0,'1','0',1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7.85,NULL,52,1,0,0,0,3,13,'0','0',-16,0,0,0,'','08/10/2026 21:12:57',0,1513.41,-1669.48,14.0469,0,0,0,'','',0,'127.0.0.1',0,'Nada para decir.',0,0,0,0,0,0,0,0,0,329450,'32',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1791507197,'San Andreas',0,'Nada',1,0,0,0,0,0,0,300,300,0,0,1791508377,'','1',0,10,0,0,0,'',1791508377,0,0,'','',0,0,0,0,0,0,1854305691,0,0,0,NULL,NULL,0),
(36987,'Shadows_Dzxx','51314DBD52D6D416F6D5AFAB9FF0919E44C660DF8FF7C283D358516264A7C72C',1742.85,-1829.94,13.5519,0,-1944.45,-19.5402,31.4234,0,0,0,0,0,0,0,'2026/10/06','0','1',18,'23',100,0,'06/10/2026',0,100000,100000,50,'0','0','0','4','0','0','1','0','0',1,1,1,1,1,1,0,0,0,0,1000,0,0,0,'0','0',0,0,0,500,0,500,0,'0','6/10/2026','ninguno','0',10,0,0,0,0,0,'0','Ninguno',0,'Ninguno','127.0.0.1',0,0,0,0,'sadasda@asdas.es',1,0,0,'Localhost',0,1,'0','0',0,0,0,0,0,0,0,0,0,0,0,0,0,'2026-10-06 16:44:16','0','0','0','0','0','0','0','0','0','0','0','0','0','6','0',1,0,1,0,'1','0',1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2.5,NULL,50,1,0,0,0,0,0,'0','0',0,0,0,0,'','06/10/2026 12:44:16',0,-1944.45,-19.5402,31.4234,0,0,0,'','',0,'127.0.0.1',0,'Nada para decir.',0,0,0,0,0,0,0,0,0,329450,'32',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1791304403,'San Andreas',0,'Nada',1,0,0,0,0,0,0,300,300,0,0,1791305056,'','0',0,10,0,0,0,'',1791305056,0,0,'','',0,0,0,0,0,0,1854419662,0,0,1,NULL,NULL,0),
(36988,'Williangel_Veras','4A21D7CF07B43B14055ECE880523FE88F247883D6F913AF685A78697AC7920A4',366.291,-1072.72,17.8163,0,1714.7,-1898.68,14.0666,0,0,0,0,0,0,0,'2026/10/07','0','1',24,'23',100,0,'07/10/2026',0,0,0,0,'0','0','0','1','0','0','0','0','0',1,1,1,1,1,1,0,0,0,0,0,0,0,0,'0','0',0,0,0,0,0,0,0,'0','7/10/2026','ninguno','0',1,0,0,0,0,0,'0','Ninguno',0,'Ninguno','127.0.0.1',279,0,0,0,'asdasd@asda.es',1,0,0,'Localhost',0,0,'0','0',0,0,0,0,0,0,0,0,0,0,0,0,0,'2026-10-07 21:13:27','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0',1,0,1,0,'1','0',1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,1,0,0,0,0,0,'0','0',0,0,0,0,'','07/10/2026 17:13:27',0,1714.7,-1898.68,14.0666,0,0,0,'','',0,'127.0.0.1',0,'Nada para decir.',0,0,0,0,0,0,0,0,0,329450,'32',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1791407505,'San Andreas',0,'Nada',1,0,0,0,0,0,0,0,0,0,0,1791407607,'','0',0,0,0,0,0,'',1791407607,0,0,'','',0,0,0,0,0,0,1854522785,0,0,1,NULL,NULL,0),
(36989,'Williangel_Verass','A6E6224D7F0DB285450ACA9BC7ECE69F59240067DAC94FF665FBFD9F9FB6517C',1825.87,-1847.2,13.4141,0,-30.6857,-92.0024,1003.55,0,0,0,0,0,0,0,'2026/10/07','0','1',18,'26',100,0,'07/10/2026',0,98500,100000,50,'0','0','0','4','0','0','1','0','118516',1,1,1,1,1,1,0,0,0,0,1000,0,0,0,'0','0',0,0,0,500,0,500,0,'0','7/10/2026','ninguno','0',3,0,0,0,0,0,'0','Ninguno',0,'Ninguno','127.0.0.1',130,0,0,0,'asdasda@adas.es',1,0,0,'Localhost',0,1,'0','0',0,0,0,0,0,0,0,0,0,0,0,0,0,'2026-10-07 21:24:07','0','0','0','0','0','0','0','0','0','0','0','0','0','6','0',1,0,1,0,'1','0',1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2.5,NULL,50,1,0,0,0,0,0,'0','0',0,0,0,0,'','07/10/2026 17:24:07',0,-30.6857,-92.0024,1003.55,0,0,0,'','',0,'127.0.0.1',0,'Nada para decir.',0,0,0,0,0,0,0,0,0,329450,'32',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1791407996,'San Andreas',0,'Nada',1,0,0,0,0,0,0,300,300,0,0,1791408247,'','0',0,10,0,0,0,'',1791408247,0,0,'','',0,0,0,0,0,0,1854523271,0,0,1,NULL,NULL,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios2`
--

DROP TABLE IF EXISTS `usuarios2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios2` (
  `ID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(129) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `posA` float NOT NULL DEFAULT 0,
  `EntradaX` float NOT NULL DEFAULT 0,
  `EntradaY` float NOT NULL DEFAULT 0,
  `EntradaZ` float NOT NULL DEFAULT 0,
  `DeathX` float NOT NULL DEFAULT 0,
  `DeathY` float NOT NULL DEFAULT 0,
  `TempBan` int(11) NOT NULL DEFAULT 0,
  `Sanciones` int(11) NOT NULL DEFAULT 0,
  `DeathZ` float NOT NULL DEFAULT 0,
  `DeathA` float NOT NULL DEFAULT 0,
  `Admin` int(11) NOT NULL DEFAULT 0,
  `Fecha_Ban` varchar(32) NOT NULL DEFAULT '16/02/2020',
  `Mapper` varchar(32) NOT NULL DEFAULT '0',
  `Sexo` varchar(1) NOT NULL DEFAULT '1',
  `Edad` int(11) NOT NULL DEFAULT 0,
  `Skin` varchar(3) NOT NULL,
  `Vida` float NOT NULL,
  `Chaleco` float NOT NULL,
  `Registro` varchar(15) NOT NULL DEFAULT '19/7/2014',
  `Linked` int(11) NOT NULL DEFAULT 0,
  `Money` int(11) NOT NULL DEFAULT 0,
  `Banco` int(11) NOT NULL DEFAULT 0,
  `Moneda` int(11) NOT NULL DEFAULT 0,
  `Cargos` varchar(10) NOT NULL DEFAULT '0',
  `Duty` varchar(1) NOT NULL DEFAULT '0',
  `SkinTrabajo` varchar(3) NOT NULL DEFAULT '0',
  `Nivel` varchar(2) NOT NULL DEFAULT '1',
  `Experiencia` varchar(3) NOT NULL DEFAULT '0',
  `Agonizando` varchar(1) NOT NULL DEFAULT '0',
  `GPS` varchar(1) NOT NULL DEFAULT '0',
  `Radio` varchar(1) NOT NULL DEFAULT '0',
  `Numero` varchar(10) NOT NULL DEFAULT '0',
  `Guia` int(11) NOT NULL DEFAULT 1,
  `Sonidos` int(11) NOT NULL DEFAULT 1,
  `Muteos` int(11) NOT NULL DEFAULT 1,
  `Barras` int(11) NOT NULL DEFAULT 1,
  `Alerta` int(11) NOT NULL DEFAULT 1,
  `Velocimetro` int(11) NOT NULL DEFAULT 1,
  `valortotal` int(11) NOT NULL,
  `votostotales` int(11) NOT NULL,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `MundoVirtual` int(11) NOT NULL DEFAULT 0,
  `Materiales` int(11) NOT NULL DEFAULT 0,
  `Sed` int(11) NOT NULL DEFAULT 8,
  `Trabajo` int(11) NOT NULL DEFAULT 0,
  `Trabajo2` int(11) NOT NULL DEFAULT 0,
  `Faccion` varchar(5) NOT NULL DEFAULT '0',
  `Rango` varchar(10) DEFAULT NULL,
  `suspendido` int(11) NOT NULL DEFAULT 0,
  `suspensiones` int(11) NOT NULL DEFAULT 0,
  `TiempoBanda` int(11) NOT NULL,
  `Crack` int(11) NOT NULL DEFAULT 0,
  `Caramelos` int(11) NOT NULL DEFAULT 0,
  `Medicamentos` int(11) NOT NULL DEFAULT 0,
  `Marihuana` int(11) NOT NULL,
  `Agenda` varchar(2) NOT NULL DEFAULT '0',
  `Registro_U` varchar(32) NOT NULL,
  `username_low` varchar(32) NOT NULL DEFAULT 'ninguno',
  `Licencia` varchar(5) NOT NULL DEFAULT '0',
  `TiempoPD` int(11) NOT NULL DEFAULT 0,
  `TiempoJail` int(11) NOT NULL DEFAULT 0,
  `Repuestos` int(11) NOT NULL DEFAULT 0,
  `hx` float NOT NULL,
  `hy` float NOT NULL,
  `hz` float NOT NULL,
  `Baneado` varchar(2) NOT NULL DEFAULT '0',
  `Banpor` varchar(64) NOT NULL DEFAULT 'Ninguno',
  `Baneante` int(11) NOT NULL,
  `razon` varchar(32) NOT NULL DEFAULT 'Ninguno',
  `IP` varchar(15) NOT NULL,
  `NMute` int(11) NOT NULL DEFAULT 0,
  `changenamefree` int(11) NOT NULL DEFAULT 0,
  `Online` int(11) NOT NULL DEFAULT 0,
  `EnFC` int(11) NOT NULL DEFAULT 0,
  `Email` varchar(50) NOT NULL DEFAULT 'notiene@email.com',
  `EMS` int(11) NOT NULL DEFAULT 0,
  `TiempoCarcelS` int(11) NOT NULL DEFAULT 0,
  `Changed` int(11) NOT NULL DEFAULT 0,
  `Pais_Registro` varchar(32) NOT NULL DEFAULT 'Desconocido',
  `Multas` int(11) NOT NULL DEFAULT 0,
  `Stats` int(11) NOT NULL DEFAULT 0,
  `EnCasa` varchar(10) NOT NULL DEFAULT '0',
  `EnRopero` varchar(10) NOT NULL DEFAULT '0',
  `EnGarage` int(11) NOT NULL DEFAULT 0,
  `VIP` int(11) NOT NULL DEFAULT 0,
  `FinDia` int(11) NOT NULL DEFAULT 0,
  `FinMes` int(11) NOT NULL DEFAULT 0,
  `FinAno` int(11) NOT NULL DEFAULT 0,
  `FinDiaL` int(11) NOT NULL,
  `FinLicencia` int(11) NOT NULL,
  `hprecio` int(11) NOT NULL DEFAULT 0,
  `h2precio` int(11) NOT NULL DEFAULT 0,
  `hmoneda` int(11) NOT NULL DEFAULT 0,
  `h2moneda` int(11) NOT NULL DEFAULT 0,
  `CasaID1` int(11) NOT NULL DEFAULT 0,
  `CasaID2` int(11) NOT NULL DEFAULT 0,
  `Baneo_Time` timestamp NOT NULL DEFAULT current_timestamp(),
  `WP0` varchar(2) NOT NULL DEFAULT '0',
  `WP1` varchar(2) NOT NULL DEFAULT '0',
  `WP2` varchar(2) NOT NULL DEFAULT '0',
  `WP3` varchar(2) NOT NULL DEFAULT '0',
  `WP4` varchar(2) NOT NULL DEFAULT '0',
  `WP5` varchar(2) NOT NULL DEFAULT '0',
  `WP6` varchar(2) NOT NULL DEFAULT '0',
  `WP7` varchar(2) NOT NULL DEFAULT '0',
  `WP8` varchar(2) NOT NULL DEFAULT '0',
  `WP9` varchar(2) NOT NULL DEFAULT '0',
  `WP10` varchar(2) NOT NULL DEFAULT '0',
  `WP11` varchar(2) NOT NULL DEFAULT '0',
  `WP12` varchar(2) NOT NULL DEFAULT '0',
  `NivelArmero` varchar(3) NOT NULL DEFAULT '1',
  `ExpArmero` varchar(3) NOT NULL DEFAULT '0',
  `NivelPescador` int(11) NOT NULL DEFAULT 1,
  `ExpPescador` int(11) NOT NULL DEFAULT 0,
  `NivelPiloto` int(11) NOT NULL DEFAULT 1,
  `ExpPiloto` int(11) NOT NULL DEFAULT 0,
  `NivelCamionero` varchar(3) NOT NULL DEFAULT '1',
  `ExpCamionero` varchar(3) NOT NULL DEFAULT '0',
  `NivelTransportista` int(11) NOT NULL DEFAULT 1,
  `ExpTransportista` int(11) NOT NULL DEFAULT 0,
  `NivelBasurero` int(11) NOT NULL DEFAULT 1,
  `ExpBasurero` int(11) NOT NULL DEFAULT 0,
  `NivelLadron` int(11) NOT NULL DEFAULT 1,
  `ExpLadron` int(11) NOT NULL DEFAULT 0,
  `NivelMedico` int(11) NOT NULL DEFAULT 1,
  `ExpMedico` int(11) NOT NULL DEFAULT 0,
  `RopaBasu` int(11) NOT NULL DEFAULT 0,
  `RopaMedi` int(11) NOT NULL DEFAULT 0,
  `RopaMeca` int(11) DEFAULT 0,
  `RopaMine` int(11) NOT NULL DEFAULT 0,
  `Martillo` int(11) NOT NULL DEFAULT 0,
  `Destornillador` int(11) NOT NULL DEFAULT 0,
  `Barreta` int(11) NOT NULL DEFAULT 0,
  `Balde` int(11) NOT NULL DEFAULT 0,
  `EstacionamientoID` int(11) NOT NULL DEFAULT 0,
  `Estacionado1` int(11) NOT NULL,
  `Estacionado2` int(11) NOT NULL,
  `Estacionado3` int(11) NOT NULL,
  `Estacionado4` int(11) NOT NULL,
  `EnEstacionamiento` int(11) NOT NULL DEFAULT 0,
  `ent_totem` float NOT NULL DEFAULT 0,
  `Totem_Name` varchar(64) DEFAULT NULL,
  `totems` int(11) NOT NULL DEFAULT 0,
  `NivelMinero` int(11) NOT NULL DEFAULT 1,
  `ExpMinero` int(11) NOT NULL DEFAULT 0,
  `Regalo` int(11) NOT NULL DEFAULT 0,
  `Muteado` int(11) NOT NULL DEFAULT 0,
  `arrestado` int(11) NOT NULL DEFAULT 0,
  `horasjugadas` int(11) NOT NULL DEFAULT 0,
  `TipoCarcel` varchar(3) NOT NULL DEFAULT '0',
  `SocioHP` varchar(3) NOT NULL DEFAULT '0',
  `Hambre` int(11) NOT NULL DEFAULT 8,
  `Patines` int(11) NOT NULL DEFAULT 0,
  `PuntosCarrera` int(11) NOT NULL DEFAULT 0,
  `TieneEmisora` int(11) NOT NULL DEFAULT 0,
  `NombreEmisora` varchar(90) NOT NULL,
  `Conexion` varchar(90) NOT NULL DEFAULT '1',
  `Semillas` int(11) NOT NULL DEFAULT 0,
  `XE` float NOT NULL,
  `YE` float NOT NULL,
  `ZE` float NOT NULL,
  `FinMesC` int(11) NOT NULL DEFAULT 0,
  `FinAnoC` int(11) NOT NULL DEFAULT 0,
  `enviocorreo` int(11) NOT NULL DEFAULT 0,
  `nuevocorreo` varchar(70) NOT NULL,
  `MinutosECorreo` varchar(25) NOT NULL,
  `MinJuego` int(11) NOT NULL,
  `IpReg` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `CodigoC` int(11) NOT NULL,
  `mensajepersonal` varchar(64) NOT NULL DEFAULT 'Nada para decir.',
  `Mapear` int(11) NOT NULL DEFAULT 0,
  `Afinidad1` int(11) NOT NULL DEFAULT 0,
  `Afinidad2` int(11) NOT NULL DEFAULT 0,
  `Afinidad3` int(11) NOT NULL DEFAULT 0,
  `Afinidad4` int(11) NOT NULL DEFAULT 0,
  `Afinidad5` int(11) NOT NULL DEFAULT 0,
  `Afinidad6` int(11) NOT NULL DEFAULT 0,
  `EstadoKEY` int(11) NOT NULL DEFAULT 0,
  `CPendiente` int(11) NOT NULL DEFAULT 0,
  `CodigoKEY` int(11) NOT NULL DEFAULT 329450,
  `avatarenuso` varchar(5) NOT NULL DEFAULT '32',
  `Puesto1H` int(11) NOT NULL,
  `Puesto2H` int(11) NOT NULL,
  `Puesto3H` int(11) NOT NULL,
  `Puesto4H` int(11) NOT NULL,
  `Puesto5H` int(11) NOT NULL,
  `Puesto6H` int(11) NOT NULL,
  `Puesto7H` int(11) NOT NULL,
  `Puesto8H` int(11) NOT NULL,
  `Puesto9H` int(11) NOT NULL,
  `Puesto10H` int(11) NOT NULL,
  `Puesto11H` int(11) NOT NULL,
  `Puesto12H` int(11) NOT NULL,
  `Puesto13H` int(11) NOT NULL,
  `Puesto14H` int(11) NOT NULL,
  `Puesto15H` int(11) NOT NULL,
  `Puesto16H` int(11) NOT NULL,
  `Puesto17H` int(11) NOT NULL,
  `Puesto18H` int(11) NOT NULL,
  `Puesto19H` int(11) NOT NULL,
  `Puesto20H` int(11) NOT NULL,
  `Puesto21H` int(11) NOT NULL,
  `Puesto22H` int(11) NOT NULL,
  `Puesto23H` int(11) NOT NULL,
  `Puesto24H` int(11) NOT NULL,
  `Puesto25H` int(11) NOT NULL,
  `Puesto26H` int(11) NOT NULL,
  `Puesto27H` int(11) NOT NULL,
  `Puesto28H` int(11) NOT NULL,
  `Puesto29H` int(11) NOT NULL,
  `Puesto30H` int(11) NOT NULL,
  `Puesto31H` int(11) NOT NULL,
  `Puesto32H` int(11) NOT NULL,
  `vAlarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma` int(11) NOT NULL DEFAULT 0,
  `v2Alarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma2` int(11) NOT NULL DEFAULT 0,
  `v3Alarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma3` int(11) NOT NULL DEFAULT 0,
  `v4Alarma` int(11) NOT NULL DEFAULT 0,
  `vAAlarma4` int(11) NOT NULL DEFAULT 0,
  `LastID` int(11) DEFAULT 0,
  `Lang` int(11) NOT NULL DEFAULT 2,
  `BaneosHechos` int(11) NOT NULL DEFAULT 0,
  `BaneosDia` int(11) NOT NULL DEFAULT 0,
  `Nacionalidad` varchar(32) NOT NULL DEFAULT 'San Andreas',
  `Bloqueado` int(11) NOT NULL DEFAULT 0,
  `RazonSan` varchar(128) NOT NULL DEFAULT 'Nada',
  `LogAdmin` int(11) DEFAULT 1,
  `FinDiaC` int(11) NOT NULL DEFAULT 0,
  `Participar` int(11) NOT NULL DEFAULT 0,
  `Striptease` int(11) NOT NULL DEFAULT 0,
  `Anuncios` int(11) NOT NULL DEFAULT 0,
  `RecompensaLZ` int(11) NOT NULL DEFAULT 0,
  `TiempoDuda` int(11) NOT NULL DEFAULT 0,
  `LSD` int(11) NOT NULL DEFAULT 0,
  `Krippy` int(11) NOT NULL DEFAULT 0,
  `Acento` int(11) NOT NULL DEFAULT 0,
  `Totems2` int(11) NOT NULL,
  `LastUnixConnection` int(11) NOT NULL DEFAULT 0,
  `FacebookID` varchar(128) NOT NULL,
  `Mascara` varchar(1) NOT NULL DEFAULT '0',
  `BackPack` int(11) NOT NULL,
  `Botiquines` int(11) NOT NULL,
  `TiempoDepa` int(11) NOT NULL DEFAULT 0,
  `CasaID3` int(11) NOT NULL,
  `CasaID4` int(11) NOT NULL,
  `EstadoX` text NOT NULL,
  `TiempoOffline` int(11) NOT NULL,
  `Estacionado5` int(11) NOT NULL,
  `EstadoON` int(11) NOT NULL,
  `Responsable` text NOT NULL,
  `Jugador` text NOT NULL,
  `Clima` int(11) NOT NULL,
  `discordVerificado` int(11) NOT NULL DEFAULT 0,
  `CodDisc` int(11) NOT NULL DEFAULT 0,
  `TiempoGuarda` int(11) NOT NULL DEFAULT 0,
  `LiderApsa` int(11) NOT NULL DEFAULT 0,
  `EnApsa` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios2`
--

LOCK TABLES `usuarios2` WRITE;
/*!40000 ALTER TABLE `usuarios2` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propietario` varchar(25) NOT NULL,
  `modelo` int(11) NOT NULL,
  `Servidor` int(11) NOT NULL DEFAULT 1,
  `precio` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `a` float NOT NULL,
  `color1` varchar(3) NOT NULL,
  `color2` varchar(3) NOT NULL,
  `comprable` varchar(1) NOT NULL,
  `moneda` int(11) NOT NULL DEFAULT 0,
  `faccion` int(11) NOT NULL DEFAULT 0,
  `trabajo` int(11) NOT NULL DEFAULT 0,
  `Vida` float NOT NULL DEFAULT 1000,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Capo` int(11) NOT NULL DEFAULT 0,
  `Puertas` int(11) NOT NULL DEFAULT 0,
  `vfaccion` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=447 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES
(257,'Gobierno',416,1,0,1616.56,1830.91,10.9195,178.945,'1','3','0',0,0,1,1000,0,0,0,0,0),
(258,'Gobierno',416,1,0,1178.3,-1338.5,14.2,270,'1','3','0',0,0,1,1000,0,0,0,0,0),
(259,'Gobierno',416,1,0,1179.65,-1308.65,13.897,268.682,'1','3','0',0,0,1,1000,0,0,0,0,0),
(260,'Gobierno',416,1,0,1192.11,-1347.71,13.4992,180.55,'1','3','0',0,0,1,1000,0,0,0,0,0),
(261,'Gobierno',416,1,0,1209.44,-1348.43,13.5497,0.476262,'1','3','0',0,0,1,1000,0,0,0,0,0),
(262,'Gobierno',416,1,0,1209.24,-1318.81,13.548,0.4484,'1','3','0',0,0,1,1000,0,0,0,0,0),
(263,'Gobierno',416,1,0,2032.72,-1447.62,17.2888,88.6918,'1','3','0',0,0,1,1000,0,0,0,0,0),
(264,'Gobierno',416,1,0,2000.81,-1409.93,17.1158,179.339,'1','3','0',0,0,1,1000,0,0,0,0,0),
(265,'Gobierno',416,1,0,1601.15,1849.37,10.9196,178.724,'1','3','0',0,0,1,1000,0,0,0,0,0),
(266,'Gobierno',416,1,0,1611.12,1839.96,10.9192,359.882,'1','3','0',0,0,1,1000,0,0,0,0,0),
(267,'Gobierno',416,1,0,1594.38,1839.87,10.9694,359.98,'1','3','0',0,0,1,1000,0,0,0,0,0),
(268,'Gobierno',416,1,0,-2687.89,635.193,14.5924,177.968,'1','3','0',0,0,1,1000,0,0,0,0,0),
(269,'Gobierno',416,1,0,-2707.01,633.95,14.6469,179.933,'1','3','0',0,0,1,1000,0,0,0,0,0),
(270,'Gobierno',416,1,0,-2697.14,634.771,14.6352,181.014,'1','3','0',0,0,1,1000,0,0,0,0,0),
(271,'Gobierno',416,1,0,-2675.66,629.996,14.639,89.078,'1','3','0',0,0,1,1000,0,0,0,0,0),
(272,'Gobierno',416,1,0,-2706.31,591.75,14.6461,270.85,'1','3','0',0,0,1,1000,0,0,0,0,0),
(273,'Gobierno',532,1,0,-367.014,-1487.82,26.3673,115.6,'0','1','0',0,0,5,1000,0,0,0,0,0),
(274,'Gobierno',532,1,0,-365.996,-1500.8,24.9991,62.528,'0','1','0',0,0,5,1000,0,0,0,0,0),
(275,'Gobierno',532,1,0,-371.448,-1518.32,23.1765,59.7599,'0','1','0',0,0,5,1000,0,0,0,0,0),
(276,'Gobierno',532,1,0,-405.126,-1532.23,23.7797,242.586,'0','1','0',0,0,5,1000,0,0,0,0,0),
(277,'Gobierno',532,1,0,-404.465,-1519.56,24.3825,242.185,'0','1','0',0,0,5,1000,0,0,0,0,0),
(278,'Gobierno',420,1,0,1804.45,-1916.3,13.4432,90,'6','6','0',0,0,2,1000,0,0,0,0,0),
(279,'Gobierno',420,1,0,1804.31,-1910.28,13.2023,90,'6','6','0',0,0,2,1000,0,0,0,0,0),
(280,'Gobierno',420,1,0,1804.56,-1904.39,13.2053,90,'6','1','0',0,0,2,1000,0,0,0,0,0),
(281,'Gobierno',420,1,0,1802.41,-1866.56,13.5667,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(282,'Gobierno',438,1,0,1797.99,-1865.87,13.3773,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(283,'Gobierno',411,1,20,-1959.56,268.04,35.1987,63.0793,'64','1','1',1,0,0,1000,0,0,0,0,0),
(284,'Gobierno',415,1,15,1482.01,-1771.76,13.6576,335.661,'40','1','1',1,0,0,1000,0,0,0,0,0),
(285,'Gobierno',451,1,15,1471.91,-1771.16,13.6028,342.03,'125','125','1',1,0,0,1000,0,0,0,0,0),
(286,'Gobierno',604,1,3000,1670.77,-1892.57,13.3213,39.598,'18','25','1',0,0,0,1000,0,0,0,0,0),
(287,'Gobierno',542,1,4000,1631.97,-1902.09,13.3229,279.542,'123','49','1',0,0,0,1000,0,0,0,0,0),
(288,'Gobierno',404,1,5000,1667.06,-1901.31,13.2967,31.8468,'115','117','1',0,0,0,1000,0,0,0,0,0),
(289,'Gobierno',561,1,70000,1474.23,-1806.53,19.1762,34.4741,'8','17','1',0,0,0,1000,0,0,0,0,0),
(290,'Gobierno',479,1,6000,1659.7,-1901.63,13.3617,331.342,'101','78','1',0,0,0,1000,0,0,0,0,0),
(291,'Gobierno',500,1,45000,1502.37,-1746.88,13.6768,358.847,'3','1','1',0,0,0,1000,0,0,0,0,0),
(292,'Gobierno',589,1,42000,1445.89,-1812.65,13.4716,213.499,'31','31','1',0,0,0,1000,0,0,0,0,0),
(293,'Gobierno',602,1,38000,1503.59,-1777.36,19.2932,36.5393,'70','1','1',0,0,0,1000,0,0,0,0,0),
(294,'Gobierno',603,1,45000,1459.19,-1798.3,13.6663,209.508,'58','1','1',0,0,0,1000,0,0,0,0,0),
(295,'Gobierno',506,1,185000,1457.99,-1777.26,19.1693,213.378,'43','1','1',0,0,0,1000,0,0,0,0,0),
(296,'Gobierno',565,1,60000,1426.64,-1812.88,13.4582,219.01,'42','42','1',0,0,0,1000,0,0,0,0,0),
(297,'Gobierno',445,1,7000,1631.74,-1910.09,13.4259,283.462,'66','97','1',0,0,0,1000,0,0,0,0,0),
(298,'Gobierno',478,1,8000,-1991.2,252.781,35.1768,92.672,'66','1','1',0,0,0,1000,0,0,0,0,0),
(299,'Gobierno',489,1,70000,-1990.23,259.905,35.2739,93.7587,'112','120','1',0,0,0,1000,0,0,0,0,0),
(300,'Gobierno',579,1,75000,1487.15,-1746.32,13.2787,0.9643,'53','53','1',0,0,0,1000,0,0,0,0,0),
(301,'Gobierno',560,1,75000,528.881,-1291,16.9522,1.9805,'125','125','1',0,0,0,1000,0,0,0,0,0),
(302,'Gobierno',551,1,10000,522.654,-1290.37,17.0625,1.5201,'120','120','1',0,0,0,1000,0,0,0,0,0),
(303,'Gobierno',587,1,80000,534.75,-1290.76,16.9767,359.092,'3','3','1',0,0,0,1000,0,0,0,0,0),
(304,'Gobierno',566,1,25000,541.087,-1291.04,17.0545,358.907,'60','60','1',0,0,0,1000,0,0,0,0,0),
(305,'Gobierno',533,1,20000,546.171,-1291.44,16.9675,359.936,'62','62','1',0,0,0,1000,0,0,0,0,0),
(306,'Gobierno',496,1,22500,551.673,-1291.2,16.9553,0.1237,'25','25','1',0,0,0,1000,0,0,0,0,0),
(307,'Gobierno',412,1,19000,557.545,-1291.23,17.1069,359.237,'6','6','1',0,0,0,1000,0,0,0,0,0),
(308,'Gobierno',463,1,55000,2136.26,-1143.39,24.5006,104.467,'125','125','1',0,0,0,1000,0,0,0,0,0),
(309,'Gobierno',475,1,42000,2134.8,-1127.5,25.3771,107.747,'30','96','1',0,0,0,1000,0,0,0,0,0),
(310,'Gobierno',545,1,33000,2135.39,-1132.46,25.4555,110.67,'66','66','1',0,0,0,1000,0,0,0,0,0),
(311,'Gobierno',491,1,32000,2135.81,-1137.63,25.3027,107.811,'25','25','1',0,0,0,1000,0,0,0,0,0),
(312,'Gobierno',567,1,70000,2119.02,-1135.08,25.1327,285.762,'93','64','1',0,0,0,1000,0,0,0,0,0),
(313,'Gobierno',534,1,60000,2118.2,-1157.27,23.8819,305.856,'37','37','1',0,0,0,1000,0,0,0,0,0),
(314,'Gobierno',535,1,35000,2118.55,-1148.21,24.1713,291.002,'3','1','1',0,0,0,1000,0,0,0,0,0),
(315,'Gobierno',554,1,42000,1481.82,-1746.35,13.6364,0.0619,'15','32','1',0,0,0,1000,0,0,0,0,0),
(316,'Gobierno',400,1,70000,1468.03,-1746.78,13.6484,359.329,'123','1','1',0,0,0,1000,0,0,0,0,0),
(317,'Gobierno',414,1,90000,1454.4,-1746.98,13.656,1.297,'28','1','1',0,0,0,1000,0,0,0,0,0),
(318,'Gobierno',482,1,120000,1507.33,-1746.44,13.7067,0.208,'37','37','1',0,0,0,1000,0,0,0,0,0),
(319,'Gobierno',480,1,225000,-1959.93,300.865,35.257,64.4359,'12','12','1',0,0,0,1000,0,0,0,0,0),
(320,'Gobierno',578,1,230000,-1989.62,243.943,35.7655,92.0401,'1','1','1',0,0,0,1000,0,0,0,0,0),
(321,'Gobierno',477,1,250000,-1959.58,258.49,35.2501,63.3406,'121','1','1',0,0,0,1000,0,0,0,0,0),
(322,'Gobierno',409,1,1000000,1462.86,-1747.48,13.3221,1.4709,'1','1','1',0,0,0,1000,0,0,0,0,0),
(323,'Gobierno',408,1,0,-112.047,-1506.97,3.9356,137.839,'1','1','0',0,0,8,1000,0,0,0,0,0),
(324,'Gobierno',408,1,0,-115.923,-1503.26,3.9712,139.903,'1','1','0',0,0,8,1000,0,0,0,0,0),
(325,'Gobierno',408,1,0,-120.514,-1499.57,3.9835,139.188,'1','1','0',0,0,8,1000,0,0,0,0,0),
(326,'Gobierno',408,1,0,-119.727,-1490.93,3.669,138.094,'1','1','0',0,0,8,1000,0,0,0,0,0),
(327,'Gobierno',408,1,0,-134.342,-1505.57,5.5412,228.926,'1','1','0',0,0,8,1000,0,0,0,0,0),
(328,'Gobierno',408,1,0,-138.332,-1509.35,5.6167,249.55,'1','1','0',0,0,8,1000,0,0,0,0,0),
(329,'Gobierno',408,1,0,-137.396,-1533.75,4.3183,161.573,'1','1','0',0,0,8,1000,0,0,0,0,0),
(330,'Gobierno',408,1,0,-166.593,-1533.65,6.4289,227.063,'1','1','0',0,0,8,1000,0,0,0,0,0),
(331,'Gobierno',408,1,0,-171.923,-1540.54,6.6371,227.988,'1','1','0',0,0,8,1000,0,0,0,0,0),
(332,'Gobierno',453,1,0,2822.07,-2624.44,-0.0876,89.6143,'1','1','0',0,0,12,1000,0,0,0,0,0),
(333,'Gobierno',453,1,0,2821.58,-2618.06,-0.2381,82.3052,'1','1','0',0,0,12,1000,0,0,0,0,0),
(334,'Gobierno',453,1,0,2822.26,-2611.5,-0.7854,91.6937,'1','1','0',0,0,12,1000,0,0,0,0,0),
(335,'Gobierno',453,1,0,2821.52,-2604.74,-0.1236,87.5986,'1','1','0',0,0,12,1000,0,0,0,0,0),
(336,'Gobierno',453,1,0,2821.52,-2596.74,-0.3082,90.4083,'1','1','0',0,0,12,1000,0,0,0,0,0),
(337,'Gobierno',453,1,0,2822.91,-2584.06,-0.3235,87.4044,'1','1','0',0,0,12,1000,0,0,0,0,0),
(338,'Gobierno',453,1,0,2839.35,-2625.99,0.2129,272.277,'1','1','0',0,0,12,1000,0,0,0,0,0),
(339,'Gobierno',453,1,0,2839.33,-2617.7,-0.6352,273.978,'1','1','0',0,0,12,1000,0,0,0,0,0),
(340,'Gobierno',453,1,0,2839.43,-2608.04,0.1093,265.808,'1','1','0',0,0,12,1000,0,0,0,0,0),
(341,'Gobierno',453,1,0,2840.28,-2598.57,0.1278,270.083,'1','1','0',0,0,12,1000,0,0,0,0,0),
(342,'Gobierno',453,1,0,2838.01,-2586.62,-0.7477,273.957,'1','1','0',0,0,12,1000,0,0,0,0,0),
(343,'Gobierno',453,1,0,2838.26,-2576.27,-0.7139,274.884,'1','1','0',0,0,12,1000,0,0,0,0,0),
(344,'Gobierno',453,1,0,2822.48,-2590.11,0.068,88.2848,'1','1','0',0,0,12,1000,0,0,0,0,0),
(345,'Gobierno',453,1,0,2839.15,-2592.76,-0.0994,264.828,'1','1','0',0,0,12,1000,0,0,0,0,0),
(346,'Gobierno',453,1,0,2801.81,-2583.29,-0.7696,181.831,'1','1','0',0,0,12,1000,0,0,0,0,0),
(347,'Gobierno',466,1,5000,1670.53,-1899.05,13.324,35.1716,'90','76','1',0,0,0,1000,0,0,0,0,0),
(348,'Gobierno',429,1,15,-1959.95,282.43,35.1263,63.6825,'14','14','1',1,0,0,1000,0,0,0,0,0),
(349,'Gobierno',517,1,6500,1631.71,-1905.92,13.4107,279.31,'1','80','1',0,0,0,1000,0,0,0,0,0),
(350,'Gobierno',536,1,40000,2119.26,-1140.82,24.7283,286.63,'30','96','1',0,0,0,1000,0,0,0,0,0),
(351,'Gobierno',580,1,32000,2119.64,-1128.31,25.1539,282.517,'6','6','1',0,0,0,1000,0,0,0,0,0),
(352,'Gobierno',532,1,0,-398.434,-1508.2,25.1264,243.781,'0','1','0',0,0,5,1000,0,0,0,0,0),
(353,'Gobierno',532,1,0,-397.763,-1491.12,26.0029,242.204,'0','1','0',0,0,5,1000,0,0,0,0,0),
(354,'Gobierno',532,1,0,-409.188,-1504.94,24.9588,48.4749,'0','1','0',0,0,5,1000,0,0,0,0,0),
(355,'Gobierno',532,1,0,-407.182,-1485.52,26.0576,40.1412,'0','1','0',0,0,5,1000,0,0,0,0,0),
(356,'Gobierno',609,1,0,-1662.12,-36.4333,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(357,'Gobierno',609,1,0,-1658.46,-40.245,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(358,'Gobierno',609,1,0,-1654.96,-43.8127,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(359,'Gobierno',609,1,0,-1651.54,-47.7158,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(360,'Gobierno',609,1,0,-1648.05,-51.5126,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(361,'Gobierno',609,1,0,-1644.67,-54.8924,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(362,'Gobierno',609,1,0,-1640.68,-58.6293,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(363,'Gobierno',609,1,0,-1637.15,-62.3905,3.6027,133.44,'0','0','0',0,0,4,1000,0,0,0,0,0),
(364,'Gobierno',609,1,0,-1733.45,-5.3612,3.3793,-88.86,'0','0','0',0,0,4,1000,0,0,0,0,0),
(365,'Gobierno',609,1,0,-1733.38,0.1806,3.3793,-88.86,'0','0','0',0,0,4,1000,0,0,0,0,0),
(366,'Gobierno',609,1,0,-1733.39,4.9433,3.3793,-88.86,'0','0','0',0,0,4,1000,0,0,0,0,0),
(367,'Gobierno',609,1,0,-1733.43,10.6054,3.3793,-88.86,'0','0','0',0,0,4,1000,0,0,0,0,0),
(368,'Gobierno',609,1,0,-1733.5,15.3659,3.3793,-88.86,'0','0','0',0,0,4,1000,0,0,0,0,0),
(369,'Gobierno',609,1,0,-1733.48,21.0065,3.3793,-88.86,'0','0','0',0,0,4,1000,0,0,0,0,0),
(370,'Gobierno',609,1,0,-1662.63,35.2098,3.3793,-136.26,'0','0','0',0,0,4,1000,0,0,0,0,0),
(371,'Gobierno',609,1,0,-1658.86,39.0425,3.3793,-136.26,'0','0','0',0,0,4,1000,0,0,0,0,0),
(372,'Gobierno',609,1,0,-1651.7,46.0807,3.3793,-136.26,'0','0','0',0,0,4,1000,0,0,0,0,0),
(373,'Gobierno',609,1,0,-1647.79,50.1095,3.3793,-136.26,'0','0','0',0,0,4,1000,0,0,0,0,0),
(374,'Gobierno',609,1,0,-1644.55,53.439,3.3793,-136.26,'0','0','0',0,0,4,1000,0,0,0,0,0),
(375,'Gobierno',609,1,0,-1640.63,57.2199,3.3793,-136.26,'0','0','0',0,0,4,1000,0,0,0,0,0),
(376,'Gobierno',609,1,0,-1637.13,60.844,3.3793,-136.26,'0','0','0',0,0,4,1000,0,0,0,0,0),
(377,'Gobierno',609,1,0,-1655.18,42.5719,3.6218,224.087,'0','0','0',0,0,4,1000,0,0,0,0,0),
(378,'Gobierno',609,1,0,-1644.33,17.2651,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(379,'Gobierno',609,1,0,-1640.59,21.3952,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(380,'Gobierno',609,1,0,-1637.74,24.3893,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(381,'Gobierno',609,1,0,-1633.43,28.653,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(382,'Gobierno',609,1,0,-1630.44,31.6121,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(383,'Gobierno',609,1,0,-1626.03,36.006,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(384,'Gobierno',609,1,0,-1623.08,38.9479,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(385,'Gobierno',609,1,0,-1618.81,43.3621,3.5289,45.799,'0','0','0',0,0,4,1000,0,0,0,0,0),
(386,'Gobierno',456,1,0,-1622.93,77.3871,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(387,'Gobierno',456,1,0,-1618.84,81.5055,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(388,'Gobierno',456,1,0,-1616.03,84.2379,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(389,'Gobierno',456,1,0,-1611.58,88.7232,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(390,'Gobierno',456,1,0,-1608.94,91.3832,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(391,'Gobierno',456,1,0,-1604.08,96.2963,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(392,'Gobierno',456,1,0,-1601.43,98.9696,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(393,'Gobierno',456,1,0,-1596.91,103.471,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(394,'Gobierno',456,1,0,-1586.54,113.449,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(395,'Gobierno',456,1,0,-1582.1,118.03,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(396,'Gobierno',456,1,0,-1571.74,128.235,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(397,'Gobierno',456,1,0,-1567.71,132.539,3.8975,225.054,'1','1','0',0,0,4,1000,0,0,0,0,0),
(398,'Gobierno',456,1,0,-1677.93,-95.3974,3.5354,315.345,'1','1','0',0,0,4,1000,0,0,0,0,0),
(399,'Gobierno',456,1,0,-1681.01,-92.3768,3.5354,315.345,'1','1','0',0,0,4,1000,0,0,0,0,0),
(400,'Gobierno',456,1,0,-1685.57,-87.7755,3.5354,315.345,'1','1','0',0,0,4,1000,0,0,0,0,0),
(401,'Gobierno',456,1,0,-1688.39,-85.0225,3.5354,315.345,'1','1','0',0,0,4,1000,0,0,0,0,0),
(402,'Gobierno',456,1,0,-1692.78,-80.6929,3.5354,315.345,'1','1','0',0,0,4,1000,0,0,0,0,0),
(403,'Gobierno',456,1,0,-1695.77,-77.8372,3.5354,315.345,'1','1','0',0,0,4,1000,0,0,0,0,0),
(404,'Gobierno',456,1,0,-1720.81,-144.426,3.5338,46.0556,'1','1','0',0,0,4,1000,0,0,0,0,0),
(405,'Gobierno',456,1,0,-1725.54,-148.853,3.5338,46.0556,'1','1','0',0,0,4,1000,0,0,0,0,0),
(406,'Gobierno',456,1,0,-1728.34,-152.125,3.5338,46.0556,'1','1','0',0,0,4,1000,0,0,0,0,0),
(407,'Gobierno',456,1,0,-1732.59,-156.491,3.5338,46.0556,'1','1','0',0,0,4,1000,0,0,0,0,0),
(408,'Gobierno',456,1,0,-1740.08,-164.095,3.5338,46.0556,'1','1','0',0,0,4,1000,0,0,0,0,0),
(409,'Gobierno',456,1,0,-1746.88,-171.106,3.5338,46.0556,'1','1','0',0,0,4,1000,0,0,0,0,0),
(410,'Gobierno',456,1,0,-1700.97,-73.8456,3.5348,314.409,'1','1','0',0,0,4,1000,0,0,0,0,0),
(411,'Gobierno',456,1,0,-1674.72,-100.541,3.5348,314.409,'1','1','0',0,0,4,1000,0,0,0,0,0),
(412,'Gobierno',408,1,0,-106.365,-1513.03,3.5715,137.213,'1','1','0',0,0,8,1000,0,0,0,0,0),
(413,'Gobierno',408,1,0,-114.01,-1521.4,3.6564,135.519,'1','1','0',0,0,8,1000,0,0,0,0,0),
(414,'Gobierno',408,1,0,-123.042,-1536.85,3.4431,136.495,'1','1','0',0,0,8,1000,0,0,0,0,0),
(415,'Gobierno',408,1,0,-117.884,-1543.56,3.1891,135.776,'1','1','0',0,0,8,1000,0,0,0,0,0),
(416,'Gobierno',408,1,0,-115.344,-1583.61,3.2129,162.62,'1','1','0',0,0,8,1000,0,0,0,0,0),
(417,'Gobierno',408,1,0,-109.428,-1591.2,3.1723,98.7876,'1','1','0',0,0,8,1000,0,0,0,0,0),
(418,'Gobierno',408,1,0,-106.366,-1595.99,3.1826,99.8592,'1','1','0',0,0,8,1000,0,0,0,0,0),
(419,'Gobierno',408,1,0,-103.168,-1600.95,3.1826,100.234,'1','1','0',0,0,8,1000,0,0,0,0,0),
(420,'Gobierno',408,1,0,-99.5796,-1606.24,3.1829,98.7939,'1','1','0',0,0,8,1000,0,0,0,0,0),
(421,'Gobierno',408,1,0,-96.2696,-1611.65,3.2347,91.5225,'1','1','0',0,0,8,1000,0,0,0,0,0),
(422,'Gobierno',408,1,0,-108.751,-1614.39,3.1724,89.7864,'1','1','0',0,0,8,1000,0,0,0,0,0),
(423,'Gobierno',408,1,0,-115.699,-1607.41,3.3777,92.4092,'1','1','0',0,0,8,1000,0,0,0,0,0),
(424,'Gobierno',408,1,0,-194.766,-1563.97,7.1792,224.577,'1','1','0',0,0,8,1000,0,0,0,0,0),
(425,'Gobierno',408,1,0,-199.939,-1569.11,7.0825,220.237,'1','1','0',0,0,8,1000,0,0,0,0,0),
(426,'Gobierno',408,1,0,-203.545,-1575.13,6.9703,206.976,'1','1','0',0,0,8,1000,0,0,0,0,0),
(427,'Gobierno',438,1,0,1804.53,-1921.37,13.3452,90,'6','1','0',0,0,2,1000,0,0,0,0,0),
(428,'Gobierno',420,1,0,1804.52,-1933.25,13.1806,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(429,'Gobierno',420,1,0,1798.59,-1933.32,13.1951,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(430,'Gobierno',420,1,0,1793.14,-1933.23,13.1908,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(431,'Gobierno',438,1,0,1788.08,-1933.15,13.4522,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(432,'Gobierno',420,1,0,1776.17,-1921.11,13.193,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(433,'Gobierno',420,1,0,1776.17,-1906.33,13.191,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(434,'Gobierno',438,1,0,-1976.75,179.753,27.6689,90,'6','1','0',0,0,2,1000,0,0,0,0,0),
(435,'Gobierno',438,1,0,-1977.02,172.893,27.7177,90,'6','1','0',0,0,2,1000,0,0,0,0,0),
(436,'Gobierno',420,1,0,-1987.8,161.954,27.3423,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(437,'Gobierno',420,1,0,-1987.8,123.818,27.3178,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(438,'Gobierno',420,1,0,-1987.75,109.786,27.3433,0,'6','1','0',0,0,2,1000,0,0,0,0,0),
(439,'Gobierno',532,1,0,-440.022,-1494.87,21.5918,6.7483,'0','1','0',0,0,5,1000,0,0,0,0,0),
(440,'Gobierno',532,1,0,-455.665,-1450.87,20.1458,20.7036,'0','1','0',0,0,5,1000,0,0,0,0,0),
(441,'Gobierno',532,1,0,-32.0611,66.1601,4.1104,73.1665,'0','1','0',0,0,5,1000,0,0,0,0,0),
(442,'Gobierno',532,1,0,-26.9689,79.7101,4.1073,77.5818,'0','1','0',0,0,5,1000,0,0,0,0,0),
(443,'Gobierno',532,1,0,-25.1596,88.4932,4.1005,68.8826,'0','1','0',0,0,5,1000,0,0,0,0,0),
(444,'Gobierno',532,1,0,-54.027,86.8697,4.0987,251.917,'0','1','0',0,0,5,1000,0,0,0,0,0),
(445,'Gobierno',532,1,0,-59.0665,75.4855,4.0959,269.413,'0','1','0',0,0,5,1000,0,0,0,0,0),
(446,'Gobierno',532,1,0,-45.9168,61.5404,4.1012,24.8176,'0','1','0',0,0,5,1000,0,0,0,0,0);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_autorizadas`
--

DROP TABLE IF EXISTS `ventas_autorizadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_autorizadas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Jugador` varchar(128) NOT NULL,
  `IP_ENCRIPTADA` varchar(128) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36262 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_autorizadas`
--

LOCK TABLES `ventas_autorizadas` WRITE;
/*!40000 ALTER TABLE `ventas_autorizadas` DISABLE KEYS */;
INSERT INTO `ventas_autorizadas` VALUES
(36258,'90d5d933144d3aec1d236b112ef23368','f528764d624db129b32c21fbca0cb8d6'),
(36259,'0ea7b00bd581c42eabbfc688337fca28','f528764d624db129b32c21fbca0cb8d6'),
(36260,'ce9dabbe17729b56c3d5e1a4388775aa','f528764d624db129b32c21fbca0cb8d6'),
(36261,'b8bcdd343a08c345850ce73baede5834','f528764d624db129b32c21fbca0cb8d6');
/*!40000 ALTER TABLE `ventas_autorizadas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-08 21:27:55
