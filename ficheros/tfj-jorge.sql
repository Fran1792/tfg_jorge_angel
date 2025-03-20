-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tfgjorge
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `pedido_producto`
--

DROP TABLE IF EXISTS `pedido_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_producto` (
  `id_pedido_producto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_vehiculo` int NOT NULL,
  `cantidad` int NOT NULL,
  `id_pedido` int NOT NULL,
  PRIMARY KEY (`id_pedido_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_producto`
--

LOCK TABLES `pedido_producto` WRITE;
/*!40000 ALTER TABLE `pedido_producto` DISABLE KEYS */;
INSERT INTO `pedido_producto` VALUES (7,1,10,1,0),(8,1,20,1,0),(9,1,2,1,0),(10,1,2,1,0),(11,1,2,1,0),(12,1,2,1,22),(13,1,2,1,23),(14,1,2,1,24),(15,1,2,1,25),(16,1,2,1,26),(17,1,2,1,27),(18,1,2,1,28),(19,1,2,1,29),(20,1,3,1,30),(21,1,3,1,31),(22,1,5,1,32),(23,1,4,1,33),(24,1,1,1,34),(25,2,3,1,35),(26,2,3,1,36),(27,2,3,1,37),(28,2,3,1,38),(29,2,3,1,39),(30,2,3,1,40),(31,2,3,1,41),(32,2,3,1,42),(33,2,6,1,43),(34,2,19,1,44);
/*!40000 ALTER TABLE `pedido_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `fecha_compra` date NOT NULL,
  `metodo_pago` varchar(45) NOT NULL,
  `tarjeta_credito` varchar(16) DEFAULT NULL,
  `ccv` varchar(5) DEFAULT NULL,
  `fecha_expiracion` varchar(45) DEFAULT NULL,
  `nombre_tarjeta` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(6) DEFAULT NULL,
  `numero_telefono` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'pepe','pepe@gmail.com','2025-02-26','tarjeta','3432432','123','17/09','pepe','España','Albacete','02345','123456789'),(2,'pepe','pepe@gmail.com','2025-02-26','tarjeta','2132','123','17/09','pepe','España','Albacete','02345','132'),(3,'sergio','sergio@gmail.com','2025-02-26','tarjeta','12323','123','17/76','sergio','España','Albacete','02345','123'),(4,'asss','franmorcillo92@gmail.com','2025-02-27','tarjeta','21321','123','18/09','raul','España','Albacete','02004','672753297'),(5,'Fran','franmorcillo92@gmail.com','2025-03-11','tarjeta','32434','123','11/32','erdf','España','Albacete','02004','672753297'),(6,'aaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaa@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(7,'aaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaa@gmail.com','2025-03-16','tarjeta','123123','123','19/89','ew','España','Albacete','02004','672753297'),(8,'aaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaaaaaaaaa@gmail.com','2025-03-16','tarjeta','123123','123','19/89','ew','España','Albacete','02004','672753297'),(9,'qwswsaaaaas','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(10,'qwswsaaaaas','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(11,'Franaaasadsfdf','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(12,'Fran','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(13,'Fran','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(14,'Franaaa','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(15,'Franaaa','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(16,'Fransdsadasd','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(17,'Fransdsadasd','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(18,'Franaaasdsdsd','franmorcillo92@gmail.com','2025-03-16','paypal','','','','','España','Albacete','02004','672753297'),(19,'pba','pba@gmail.com','2025-03-18','transferencia',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(20,'pba','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(21,'ddd','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(22,'sjgfkldfgn','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(23,'sjgfkldfgn','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(24,'sjgfkldfgn','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(25,'sjgfkldfgn','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(26,'asss','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(27,'asss','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(28,'ss','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(29,'sssssssssssssssss','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(30,'lklkok','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(31,'popop','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(32,'gggggggggggggg','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(33,'kikik','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(34,'asss','franmorcillo92@gmail.com','2025-03-18','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(35,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(36,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(37,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(38,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(39,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(40,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(41,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(42,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(43,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297'),(44,'Fran','franmorcillo08@gmail.com','2025-03-19','paypal',NULL,NULL,NULL,NULL,'España','Albacete','02004','672753297');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'RAUL','raul@gmail.com','666666.j','23','Rios'),(2,'FRAN2','franmorcillo08@gmail.com','6','1','r');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculos` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `año` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '1',
  `imagen` varchar(255) DEFAULT NULL,
  `tipo` varchar(50) NOT NULL,
  `color` varchar(30) NOT NULL,
  `combustible` varchar(20) NOT NULL,
  `transmision` varchar(20) NOT NULL,
  PRIMARY KEY (`id_vehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
INSERT INTO `vehiculos` VALUES (1,'Toyota','Corolla',2022,25000.00,10,'imagenes/toyota-corolla-2022.jpg','Sedán','Blanco','Gasolina','Automática'),(2,'Honda','Civic',2021,24000.00,8,'imagenes/honda-civic-2021.jpg','Sedán','Negro','Gasolina','Manual'),(3,'Ford','Mustang',2023,55000.00,5,'imagenes/ford-mustang-2023.jpg','Deportivo','Rojo','Gasolina','Manual'),(4,'Chevrolet','Camaro',2022,52000.00,6,'imagenes/chevrolet-camaro-2022.jpg','Deportivo','Amarillo','Gasolina','Automática'),(5,'Nissan','Altima',2020,22000.00,12,'imagenes/nissan-altima-2020.jpg','Sedán','Gris','Gasolina','Automática'),(6,'Mazda','CX-5',2023,30000.00,9,'imagenes/Mazda-CX-5-2023.jpg','SUV','Azul','Gasolina','Automática'),(7,'Volkswagen','Jetta',2021,23000.00,15,'imagenes/volkswagen-jetta-2021.jpg','Sedán','Plateado','Gasolina','Manual'),(8,'Hyundai','Elantra',2022,21000.00,11,'imagenes/hyundai-elantra-2022.jpg','Sedán','Blanco','Gasolina','Automática'),(9,'Kia','Sportage',2023,27000.00,7,'imagenes/2023-kia-sportage-hybrid-9.jpg','SUV','Verde','Híbrido','Automática'),(10,'Subaru','Outback',2020,28000.00,10,'imagenes/subaru_outback_2020.jpg','SUV','Marrón','Gasolina','Automática'),(11,'Tesla','Model 3',2023,45000.00,4,'imagenes/Tesla-Model-3-2023.jpg','Sedán','Negro','Eléctrico','Automática'),(12,'BMW','Serie 3',2022,48000.00,6,'imagenes/2022-bmw-3er-limousine.jpg','Sedán','Azul','Gasolina','Automática'),(13,'Mercedes-Benz','C-Class',2021,50000.00,5,'imagenes/mercedes-benz-Class-C.jpg','Sedán','Gris','Gasolina','Automática'),(14,'Audi','A4',2023,47000.00,7,'imagenes/audi-a4-avant-2023.jpg','Sedán','Blanco','Gasolina','Automática'),(15,'Jeep','Wrangler',2022,39000.00,8,'imagenes/jeep-wrangler-4xe-2022.jpg','SUV','Verde','Gasolina','Manual'),(16,'Dodge','Challenger',2021,53000.00,6,'imagenes/dodge-challenger-2021.jpg','Deportivo','Negro','Gasolina','Manual'),(17,'Lexus','RX 350',2023,60000.00,3,'imagenes/Lexus-RX-2023-6.jpg','SUV','Gris','Híbrido','Automática'),(18,'Porsche','911 Carrera GTS',2022,120000.00,2,'imagenes/2022-porsche-911-carrera-gts.jpg','Deportivo','Rojo','Gasolina','Automática'),(19,'Ferrari','F8 Tributo',2023,280000.00,0,'imagenes/ferrari-f8-tributo.jpg','Deportivo','Rojo','Gasolina','Automática'),(20,'Lamborghini','Huracán',2023,320000.00,1,'imagenes/lamborghini-huracan-2023.jpg','Deportivo','Amarillo','Gasolina','Automática');
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20 11:46:26
