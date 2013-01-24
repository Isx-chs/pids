/*
Navicat MySQL Data Transfer

Source Server         : Principal
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : proyecto_dawi

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2012-12-02 08:15:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dawi_area`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_area`;
CREATE TABLE `dawi_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_area
-- ----------------------------
INSERT INTO `dawi_area` VALUES ('1', 'Sistema');
INSERT INTO `dawi_area` VALUES ('2', 'Gerencia General');
INSERT INTO `dawi_area` VALUES ('3', 'Marketing');
INSERT INTO `dawi_area` VALUES ('4', 'Recursos Humanos');

-- ----------------------------
-- Table structure for `dawi_detalle`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_detalle`;
CREATE TABLE `dawi_detalle` (
  `det_id` int(11) NOT NULL AUTO_INCREMENT,
  `det_id_req` int(11) DEFAULT NULL,
  `det_actividad` varchar(250) DEFAULT NULL,
  `det_fec_ini` date DEFAULT NULL,
  `det_fec_fin` date DEFAULT NULL,
  `det_encargado` int(11) DEFAULT NULL,
  `det_estado` int(1) DEFAULT NULL,
  `det_descripcion` varchar(255) DEFAULT NULL,
  `det_tipo` int(1) DEFAULT NULL,
  PRIMARY KEY (`det_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_detalle
-- ----------------------------

-- ----------------------------
-- Table structure for `dawi_estado`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_estado`;
CREATE TABLE `dawi_estado` (
  `est_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_estado
-- ----------------------------
INSERT INTO `dawi_estado` VALUES ('1', 'Aprobado');
INSERT INTO `dawi_estado` VALUES ('2', 'Pendiente');
INSERT INTO `dawi_estado` VALUES ('3', 'Rechazado');

-- ----------------------------
-- Table structure for `dawi_modulo`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_modulo`;
CREATE TABLE `dawi_modulo` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_nombre` varchar(250) DEFAULT NULL,
  `mod_key` varchar(250) DEFAULT NULL,
  `mod_link` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_modulo
-- ----------------------------
INSERT INTO `dawi_modulo` VALUES ('1', 'Requerimiento', 'requerimiento', 'm_Reqierimiento');
INSERT INTO `dawi_modulo` VALUES ('2', 'Sistemas', 'sistema', 'm_Sistema');
INSERT INTO `dawi_modulo` VALUES ('3', 'Proyecto', 'proyecto', 'm_Proyecto');
INSERT INTO `dawi_modulo` VALUES ('4', 'Desarrollo', 'desarrollo', 'm_Desarrollo');
INSERT INTO `dawi_modulo` VALUES ('5', 'QA', 'calidad', 'm_Calidad');
INSERT INTO `dawi_modulo` VALUES ('6', 'Informes', 'informe', 'm_Informe');

-- ----------------------------
-- Table structure for `dawi_perfil`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_perfil`;
CREATE TABLE `dawi_perfil` (
  `per_id` int(11) NOT NULL AUTO_INCREMENT,
  `per_descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_perfil
-- ----------------------------
INSERT INTO `dawi_perfil` VALUES ('1', 'Programador');
INSERT INTO `dawi_perfil` VALUES ('2', 'Analista');
INSERT INTO `dawi_perfil` VALUES ('3', 'Lider de Proyecto');
INSERT INTO `dawi_perfil` VALUES ('4', 'Prueba');
INSERT INTO `dawi_perfil` VALUES ('5', 'Sistemas');
INSERT INTO `dawi_perfil` VALUES ('7', 'Solicitante');
INSERT INTO `dawi_perfil` VALUES ('8', 'Responsable Desarrollo');
INSERT INTO `dawi_perfil` VALUES ('9', 'Responsable Analista');

-- ----------------------------
-- Table structure for `dawi_privilegio`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_privilegio`;
CREATE TABLE `dawi_privilegio` (
  `per_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_privilegio
-- ----------------------------
INSERT INTO `dawi_privilegio` VALUES ('7', '1');
INSERT INTO `dawi_privilegio` VALUES ('5', '2');
INSERT INTO `dawi_privilegio` VALUES ('3', '3');
INSERT INTO `dawi_privilegio` VALUES ('2', '5');
INSERT INTO `dawi_privilegio` VALUES ('9', '5');
INSERT INTO `dawi_privilegio` VALUES ('1', '4');
INSERT INTO `dawi_privilegio` VALUES ('8', '4');
INSERT INTO `dawi_privilegio` VALUES ('9', '6');
INSERT INTO `dawi_privilegio` VALUES ('4', '1');
INSERT INTO `dawi_privilegio` VALUES ('4', '2');
INSERT INTO `dawi_privilegio` VALUES ('4', '3');
INSERT INTO `dawi_privilegio` VALUES ('4', '4');
INSERT INTO `dawi_privilegio` VALUES ('4', '5');
INSERT INTO `dawi_privilegio` VALUES ('4', '6');

-- ----------------------------
-- Table structure for `dawi_requerimiento`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_requerimiento`;
CREATE TABLE `dawi_requerimiento` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_titulo` varchar(250) DEFAULT NULL,
  `req_fecha` date DEFAULT NULL,
  `req_obsr` varchar(250) DEFAULT NULL,
  `req_id_area` int(11) DEFAULT NULL,
  `req_id_solicitante` int(11) DEFAULT NULL COMMENT 'req_id_solicitante: es la FK de la  tabla usuario, en este caso dando el rol de solicitante',
  `req_id_estado` int(11) DEFAULT NULL,
  `req_importancia` char(1) DEFAULT NULL,
  `req_prioridad` int(11) DEFAULT NULL,
  `req_id_responsable` int(11) DEFAULT NULL COMMENT 're_id_responsable: es una FK de la tabla usuario  en este caso como responsable de desarrollo',
  `req_recursos` varchar(250) DEFAULT NULL,
  `req_estado_final` int(1) DEFAULT NULL,
  `req_etapa_id` int(11) DEFAULT NULL,
  `req_sistema` varchar(250) DEFAULT NULL,
  `req_modulo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_requerimiento
-- ----------------------------
INSERT INTO `dawi_requerimiento` VALUES ('1', 'prueba', '2012-12-20', 'sdf', '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('2', 'prueba 2', '2012-12-11', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('3', 'prueba 3', '2012-12-11', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('4', 'prueba 4', '2012-12-17', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('5', 'prueba 5', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('6', 'prueba 6', '2012-12-17', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('7', 'prueba 7', '2012-12-19', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('8', 'prueba 8', '2012-12-19', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('9', 'prueba 9', '2012-12-19', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('10', 'prueba 10', '2012-12-19', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('11', 'prueba 11', '2012-12-19', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('12', 'prueba 12', '2012-12-18', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('13', 'prueba 13', '2012-12-18', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('14', 'prueba 14', '2012-12-18', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('15', 'test 1', '2012-12-18', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('16', 'test 2', '2012-12-18', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('17', 'test 3', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('18', 'test 4', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('19', 'test 5', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('20', 'test 6', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('21', 'test 7', '2012-12-22', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('22', 'test 8', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('23', 'test 9', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('24', 'test 10', '2012-12-20', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('25', 'test 11', '2012-12-22', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('26', 'test 12', '2012-12-22', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('27', 'test 13', '2012-12-22', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('28', 'test 14', '2012-12-22', null, '1', '1', '2', null, null, null, null, '2', '3', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('29', 'INGRESO 1', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('30', 'INGRESO 2', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('31', 'INGRESO 3', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('32', 'INGRESO 4', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('33', 'INGRESO 5', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('34', 'INGRESO 6', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('35', 'INGRESO 7', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('36', 'INGRESO 8', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);
INSERT INTO `dawi_requerimiento` VALUES ('37', 'INGRESO 10', '2012-12-01', null, '1', '1', '1', null, null, null, null, '2', '2', null, null);

-- ----------------------------
-- Table structure for `dawi_usuario`
-- ----------------------------
DROP TABLE IF EXISTS `dawi_usuario`;
CREATE TABLE `dawi_usuario` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_user` varchar(50) DEFAULT NULL,
  `us_pass` varchar(250) DEFAULT NULL,
  `us_nombre` varchar(250) DEFAULT NULL,
  `us_apellido` varchar(250) DEFAULT NULL,
  `us_per_id` int(11) DEFAULT NULL,
  `us_area_id` int(11) DEFAULT NULL,
  `us_sexo` char(1) DEFAULT NULL,
  `us_email` varchar(50) DEFAULT NULL,
  `us_telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dawi_usuario
-- ----------------------------
INSERT INTO `dawi_usuario` VALUES ('1', 'carlos', 'dawi', 'carlos', 'huamani', '4', '1', 'M', 'carlos.hs.92@gmail.com', '997396491');
INSERT INTO `dawi_usuario` VALUES ('2', 'renato', 'lp3', 'renato', 'arrascue', '1', '1', 'M', 'rarrascue93@hotmail.com', '989458789');
INSERT INTO `dawi_usuario` VALUES ('6', 'luis', 'calidad', 'Luis', 'Vasquez', '2', '1', 'F', null, null);
INSERT INTO `dawi_usuario` VALUES ('7', 'req', 'demo', 'Juan', 'Perez', '7', '2', 'M', null, null);
INSERT INTO `dawi_usuario` VALUES ('8', 'sis', 'demo', 'Daniela', 'Gomez', '5', '1', 'F', null, null);
INSERT INTO `dawi_usuario` VALUES ('9', 'pro', 'demo', 'Carlos', 'Huamani', '3', '1', 'M', null, null);
INSERT INTO `dawi_usuario` VALUES ('10', 'lis', 'demo', 'Wendy', 'Ibarra', '9', '1', 'F', null, null);
INSERT INTO `dawi_usuario` VALUES ('11', 'lid', 'demo', 'Richard', 'Cuicapaza', '8', '1', 'M', null, null);
INSERT INTO `dawi_usuario` VALUES ('12', 'pro2', 'demo', 'Cesar', 'Soplin', '3', '1', 'M', null, null);

-- ----------------------------
-- Procedure structure for `obtenerDetallexUsuario`
-- ----------------------------
DROP PROCEDURE IF EXISTS `obtenerDetallexUsuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDetallexUsuario`(IN v_det_tipo INT, IN v_det_encargado INT)
BEGIN
		SELECT * FROM dawi_detalle
		WHERE det_tipo = v_det_tipo 
		AND det_encargado = v_det_encargado
		AND det_estado = 2;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_actualizarDetalle`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_actualizarDetalle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarDetalle`(IN v_det_id INT, IN v_det_tipo INT)
BEGIN
		DECLARE v_cant INT DEFAULT 0;
		DECLARE v_cant_fin INT DEFAULT 0;
		DECLARE v_det_req_id INT DEFAULT 0;

		SET v_det_req_id = (SELECT det_id_req FROM dawi_detalle WHERE det_id = v_det_id);

		UPDATE dawi_detalle SET det_estado = 1 WHERE det_id = v_det_id;
		
		SET v_cant = (SELECT COUNT(det_id) FROM dawi_detalle WHERE det_id_req = v_det_req_id and det_tipo=v_det_tipo);
		SET v_cant_fin = (SELECT COUNT(det_id) FROM dawi_detalle WHERE det_id_req = v_det_req_id and det_estado = 1 and det_tipo=v_det_tipo);
		
		IF v_cant = v_cant_fin THEN 
			IF v_det_tipo = 1 THEN
				UPDATE dawi_requerimiento SET req_etapa_id = 5,req_id_estado=2 WHERE req_id = v_det_req_id;
			ELSEIF v_det_tipo = 2 THEN
				UPDATE dawi_requerimiento SET req_etapa_id = 6,req_id_estado=2 WHERE req_id = v_det_req_id;
			END IF;
		END IF;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_actualizar_proyecto`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_actualizar_proyecto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_proyecto`(
	IN v_req_importancia INT, 
	IN v_req_prioridad INT,
	IN v_req_id INT,
	IN v_req_id_responsable INT,
	IN v_req_recursos VARCHAR(250))
BEGIN
		UPDATE dawi_requerimiento 
		SET req_etapa_id = 4, 
				req_recursos = v_req_recursos, 
				req_prioridad=v_req_prioridad,
				req_id_responsable=v_req_id_responsable,
				req_importancia = v_req_importancia
		WHERE req_id = v_req_id;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_actualizar_sistema`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_actualizar_sistema`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_sistema`(
	IN v_estado_id INT, 
	IN v_req_id INT,
	IN v_obsr VARCHAR(250))
BEGIN
		DECLARE v_estado_final INT DEFAULT 2;
		DECLARE v_req_etapa_id INT DEFAULT 3;
		IF v_estado_id = 3 THEN SET v_estado_final = 3,v_req_etapa_id = 2;
		ELSE SET v_estado_final = 2, v_estado_id = 2;
		END IF;
		
		UPDATE dawi_requerimiento 
		SET req_etapa_id = v_req_etapa_id, 
				req_obsr = v_obsr, 
				req_id_estado=v_estado_id,
				req_estado_final = v_estado_final
		WHERE req_id = v_req_id;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_buscar_area`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_buscar_area`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_area`(IN v_area_id INT)
BEGIN
		SELECT * FROM dawi_area
		where area_id = v_area_id;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_buscar_usuario`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_buscar_usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_usuario`(IN v_us_id INT)
BEGIN
		SELECT * FROM dawi_usuario
		where us_id = v_us_id;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_buscar_x_perfil`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_buscar_x_perfil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_x_perfil`(IN v_us_per_id INT)
BEGIN
		SELECT * FROM dawi_usuario
		where us_per_id = v_us_per_id;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_guardarDetalle`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_guardarDetalle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_guardarDetalle`(
	IN v_det_id_req INT,
	IN v_det_actividad VARCHAR(255),
	IN v_det_fec_ini DATE,
	IN v_det_fec_fin DATE,
	IN v_det_encargado INT,
  IN v_det_descripcion VARCHAR(255),
	IN v_det_tipo INT

)
BEGIN
		INSERT INTO dawi_detalle (det_id_req,det_actividad,det_fec_ini,det_fec_fin,det_encargado,det_estado,det_descripcion,det_tipo)
		VALUES (v_det_id_req,v_det_actividad,v_det_fec_ini,v_det_fec_fin,v_det_encargado,2,v_det_descripcion,v_det_tipo);

		UPDATE dawi_requerimiento SET req_id_estado=4 WHERE req_id = v_det_id_req;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_insertarsistema`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_insertarsistema`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertarsistema`(
	IN req_titulo VARCHAR(250), 
	IN req_id_area  INT,
	IN req_id_solicitante INT)
BEGIN
	
	
	INSERT INTO dawi_requerimiento(req_titulo,req_fecha,req_id_area,req_id_solicitante,req_id_estado,req_estado_final,req_etapa_id) values(req_titulo,now(),req_id_area,req_id_solicitante,1,2,2);
		
	
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_listarDetalle`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_listarDetalle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarDetalle`(IN v_det_id_req INT, IN v_det_tipo INT)
BEGIN
		SELECT * FROM dawi_detalle
		where det_id_req = v_det_id_req and det_tipo=v_det_tipo;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_login`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(IN us VARCHAR(250), IN pwd VARCHAR(250))
BEGIN
		SELECT * FROM dawi_usuario
		where us_user like us and us_pass like pwd;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_obetenerrequerimientosegunestado`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_obetenerrequerimientosegunestado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obetenerrequerimientosegunestado`(IN v_estado VARCHAR(250))
BEGIN
		SELECT * FROM dawi_requerimiento
		where  CAST(req_id_estado AS CHAR(250)) = v_estado;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_obtenerDetalle`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_obtenerDetalle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerDetalle`(IN v_det_id INT)
BEGIN
		SELECT * FROM dawi_detalle
		where det_id = v_det_id;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_obtener_requerimiento`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_obtener_requerimiento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_requerimiento`(IN v_id INT)
BEGIN
		SELECT * FROM dawi_requerimiento
		where req_id = v_id;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_obtener_requerimientos`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_obtener_requerimientos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtener_requerimientos`(IN v_etapa INT)
BEGIN
		SELECT * FROM dawi_requerimiento
		where req_etapa_id >= v_etapa;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_pribilegio`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_pribilegio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pribilegio`(IN v_perfil INT)
BEGIN
		SELECT dawi_modulo.mod_id, dawi_modulo.mod_nombre, dawi_modulo.mod_key
		FROM dawi_perfil
		INNER JOIN dawi_privilegio
		ON dawi_perfil.per_id = dawi_privilegio.per_id
		INNER JOIN dawi_modulo
		ON dawi_modulo.mod_id = dawi_privilegio.mod_id
		where dawi_perfil.per_id = v_perfil;
	END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_privilegios`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_privilegios`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_privilegios`(IN v_perfil INT)
BEGIN
		SELECT dawi_modulo.mod_id, 
					 dawi_modulo.mod_nombre, 
           dawi_modulo.mod_key,
           dawi_modulo.mod_link
		FROM dawi_perfil
		INNER JOIN dawi_privilegio
		ON dawi_perfil.per_id = dawi_privilegio.per_id
		INNER JOIN dawi_modulo
		ON dawi_modulo.mod_id = dawi_privilegio.mod_id
		where dawi_perfil.per_id = v_perfil;
	END
;;
DELIMITER ;
