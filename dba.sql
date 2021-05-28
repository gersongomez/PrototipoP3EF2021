SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `filmMagic` DEFAULT CHARACTER SET utf8 ;
USE `filmMagic` ;

-- -----------------------------------------------------
-- Table `filmMagic`.`tbl_seguridad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmMagic`.`tbl_seguridad` (
  `id_usuario` INT NOT NULL,
  `nombre_usuario` VARCHAR(60) NULL DEFAULT NULL,
  `contraseña_usuario` VARCHAR(60) NULL DEFAULT NULL,
  `tipo_usuario` VARCHAR(1) NULL DEFAULT NULL,
  `estado_usuario` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `tbl_seguridad` (`id_usuario`, `nombre_usuario`, `contraseña_usuario`, `tipo_usuario`, `estado_usuario`) VALUES ('1', 'hleoneldc', 'estudiante', '1', '0');
INSERT INTO `tbl_seguridad` (`id_usuario`, `nombre_usuario`, `contraseña_usuario`, `tipo_usuario`, `estado_usuario`) VALUES ('2', 'Esduardo10', 'ingeniero', '1', '1');
-- -----------------------------------------------------
-- Table `filmMagic`.`tbl_clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmMagic`.`tbl_clientes` (
  `PK_numero_tarjeta` INT NOT NULL,
  `dpi_cliente` INT NULL DEFAULT NULL,
  `nombre_cliente` VARCHAR(50) NULL DEFAULT NULL,
  `apellido_cliente` VARCHAR(50) NULL DEFAULT NULL,
  `email_cliente` VARCHAR(50) DEFAULT NULL,
  `telefono_cliente` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_numero_tarjeta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `filmMagic`.`tbl_tarjeta_renta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmMagic`.`tbl_dvd` (
  `PK_id_dvd` INT NOT NULL,
  `nombre_dvd` VARCHAR(60) NULL DEFAULT NULL,
  `autor_dvd` VARCHAR(60) NULL DEFAULT NULL,
  `genero_dvd` VARCHAR(60) NULL DEFAULT NULL,
  `existencias_dvd` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_dvd`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `filmMagic`.`tbl_videojuego`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmMagic`.`tbl_videojuego` (
  `PK_id_videojuego` INT NOT NULL,
  `nombre_videojuego` VARCHAR(60) NULL DEFAULT NULL,
  `autor_videojuego` VARCHAR(60) NULL DEFAULT NULL,
  `genero_videojuego` VARCHAR(60) NULL DEFAULT NULL,
  `existencias_videojuego` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_videojuego`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `filmMagic`.`tbl_bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `filmMagic`.`tbl_bodega` (
  `PK_id_bodega` INT NOT NULL,
  `nombre_articulo` VARCHAR(60) NULL DEFAULT NULL,
  `autor_articulo` VARCHAR(60) NULL DEFAULT NULL,
  `genero_articulo` VARCHAR(60) NULL DEFAULT NULL,
  `tipo_articulo` VARCHAR(60) NULL DEFAULT NULL,
  `cantidad_articulo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_bodega`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;