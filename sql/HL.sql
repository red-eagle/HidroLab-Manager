-- MySQL Script generated by MySQL Workbench
-- 09/27/15 02:16:38
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `contador` SMALLINT UNSIGNED NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Decreto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Decreto` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(90) NULL,
  `Gaceta` VARCHAR(6) NULL,
  `Fecha` DATE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CArea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CArea` (
  `id` TINYINT NOT NULL,
  `nombre` SMALLINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(90) NULL,
  `Direccion` TINYTEXT NULL,
  `Celular` MEDIUMINT(7) UNSIGNED NULL,
  `Email` VARCHAR(90) NULL,
  `Encargado` VARCHAR(45) NULL,
  `NRif` CHAR(10) NULL,
  `CRif` CHAR(1) NULL,
  `Siglas` CHAR(4) NULL,
  `Contador` TINYINT UNSIGNED NULL,
  `Codigo_id` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Clientes_Codigo1_idx` (`Codigo_id` ASC),
  CONSTRAINT `fk_Clientes_Codigo1`
    FOREIGN KEY (`Codigo_id`)
    REFERENCES `mydb`.`CArea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Puesto` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `auth_key` VARCHAR(32) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `password_rest_token` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  `status` SMALLINT(6) UNSIGNED NOT NULL DEFAULT 10,
  `created_at` INT(11) NOT NULL,
  `update_at` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `Celular` MEDIUMINT(7) UNSIGNED NULL,
  `Email` VARCHAR(45) NULL,
  `Puesto_id` TINYINT UNSIGNED NOT NULL,
  `Codigo_id` TINYINT NOT NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `Departamento_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vendedor_Puesto_idx` (`Puesto_id` ASC),
  INDEX `fk_Vendedor_Codigo1_idx` (`Codigo_id` ASC),
  INDEX `fk_Vendedor_user1_idx` (`user_id` ASC),
  INDEX `fk_Vendedor_Departamento1_idx` (`Departamento_id` ASC),
  CONSTRAINT `fk_Vendedor_Puesto`
    FOREIGN KEY (`Puesto_id`)
    REFERENCES `mydb`.`Puesto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendedor_Codigo1`
    FOREIGN KEY (`Codigo_id`)
    REFERENCES `mydb`.`CArea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendedor_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendedor_Departamento1`
    FOREIGN KEY (`Departamento_id`)
    REFERENCES `mydb`.`Departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`General`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`General` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Copias` TINYINT UNSIGNED NULL,
  `Caudal` ENUM('Aplica', 'No Aplica') NULL,
  `Analisis` ENUM('Analisis y Muestreo', 'Analisis') NULL,
  `Departamento_id` TINYINT UNSIGNED NOT NULL,
  `Decreto_id` TINYINT UNSIGNED NOT NULL,
  `Clientes_id` INT UNSIGNED NOT NULL,
  `Vendedor_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_General_Departamento1_idx` (`Departamento_id` ASC),
  INDEX `fk_General_Decreto1_idx` (`Decreto_id` ASC),
  INDEX `fk_General_Clientes1_idx` (`Clientes_id` ASC),
  INDEX `fk_General_Vendedor1_idx` (`Vendedor_id` ASC),
  CONSTRAINT `fk_General_Departamento1`
    FOREIGN KEY (`Departamento_id`)
    REFERENCES `mydb`.`Departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_General_Decreto1`
    FOREIGN KEY (`Decreto_id`)
    REFERENCES `mydb`.`Decreto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_General_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `mydb`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_General_Vendedor1`
    FOREIGN KEY (`Vendedor_id`)
    REFERENCES `mydb`.`Vendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Muestras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Muestras` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `tipo` BINARY(1) NULL,
  `horas` TINYINT NULL,
  `General_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Muestras_General1_idx` (`General_id` ASC),
  CONSTRAINT `fk_Muestras_General1`
    FOREIGN KEY (`General_id`)
    REFERENCES `mydb`.`General` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipos` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Serial` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `Propietario` VARCHAR(45) NULL,
  `Equiposcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SubTipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SubTipo` (
  `id` TINYINT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Decreto_has_Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Decreto_has_Tipo` (
  `Decreto_id` TINYINT UNSIGNED NOT NULL,
  `Tipo_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`Decreto_id`, `Tipo_id`),
  INDEX `fk_Decreto_has_Tipo_Tipo1_idx` (`Tipo_id` ASC),
  INDEX `fk_Decreto_has_Tipo_Decreto1_idx` (`Decreto_id` ASC),
  CONSTRAINT `fk_Decreto_has_Tipo_Decreto1`
    FOREIGN KEY (`Decreto_id`)
    REFERENCES `mydb`.`Decreto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Decreto_has_Tipo_Tipo1`
    FOREIGN KEY (`Tipo_id`)
    REFERENCES `mydb`.`Tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_has_SubTipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_has_SubTipo` (
  `Tipo_id` TINYINT UNSIGNED NOT NULL,
  `SubTipo_id` TINYINT NOT NULL,
  PRIMARY KEY (`Tipo_id`, `SubTipo_id`),
  INDEX `fk_Tipo_has_SubTipo_SubTipo1_idx` (`SubTipo_id` ASC),
  INDEX `fk_Tipo_has_SubTipo_Tipo1_idx` (`Tipo_id` ASC),
  CONSTRAINT `fk_Tipo_has_SubTipo_Tipo1`
    FOREIGN KEY (`Tipo_id`)
    REFERENCES `mydb`.`Tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tipo_has_SubTipo_SubTipo1`
    FOREIGN KEY (`SubTipo_id`)
    REFERENCES `mydb`.`SubTipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamento_has_Decreto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento_has_Decreto` (
  `Departamento_id` TINYINT UNSIGNED NOT NULL,
  `Decreto_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`Departamento_id`, `Decreto_id`),
  INDEX `fk_Departamento_has_Decreto_Decreto1_idx` (`Decreto_id` ASC),
  INDEX `fk_Departamento_has_Decreto_Departamento1_idx` (`Departamento_id` ASC),
  CONSTRAINT `fk_Departamento_has_Decreto_Departamento1`
    FOREIGN KEY (`Departamento_id`)
    REFERENCES `mydb`.`Departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Departamento_has_Decreto_Decreto1`
    FOREIGN KEY (`Decreto_id`)
    REFERENCES `mydb`.`Decreto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`General_has_Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`General_has_Tipo` (
  `General_id` INT UNSIGNED NOT NULL,
  `General_Clientes_id` INT UNSIGNED NOT NULL,
  `Tipo_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`General_id`, `General_Clientes_id`, `Tipo_id`),
  INDEX `fk_General_has_Tipo_Tipo1_idx` (`Tipo_id` ASC),
  INDEX `fk_General_has_Tipo_General1_idx` (`General_id` ASC, `General_Clientes_id` ASC),
  CONSTRAINT `fk_General_has_Tipo_General1`
    FOREIGN KEY (`General_id` , `General_Clientes_id`)
    REFERENCES `mydb`.`General` (`id` , `Clientes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_General_has_Tipo_Tipo1`
    FOREIGN KEY (`Tipo_id`)
    REFERENCES `mydb`.`Tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caracterizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Caracterizacion` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `Preservacion` ENUM('0', '1', '2', '3', '4', '5', '6', '7', '8', '9') NULL,
  `Siglas` VARCHAR(15) NULL,
  `Laboratorio` ENUM('Si', 'No') NULL,
  `Opacidad` ENUM('Si', 'No') NULL,
  `Metodo` VARCHAR(15) NULL,
  `Equipos_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Caracterizacion_Equipos1_idx` (`Equipos_id` ASC),
  CONSTRAINT `fk_Caracterizacion_Equipos1`
    FOREIGN KEY (`Equipos_id`)
    REFERENCES `mydb`.`Equipos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rama`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rama` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caracterizacion_has_Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Caracterizacion_has_Departamento` (
  `Caracterizacion_id` SMALLINT UNSIGNED NOT NULL,
  `Departamento_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`Caracterizacion_id`, `Departamento_id`),
  INDEX `fk_Caracterizacion_has_Departamento_Departamento1_idx` (`Departamento_id` ASC),
  INDEX `fk_Caracterizacion_has_Departamento_Caracterizacion1_idx` (`Caracterizacion_id` ASC),
  CONSTRAINT `fk_Caracterizacion_has_Departamento_Caracterizacion1`
    FOREIGN KEY (`Caracterizacion_id`)
    REFERENCES `mydb`.`Caracterizacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Caracterizacion_has_Departamento_Departamento1`
    FOREIGN KEY (`Departamento_id`)
    REFERENCES `mydb`.`Departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rama_has_Caracterizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rama_has_Caracterizacion` (
  `Rama_id` INT UNSIGNED NOT NULL,
  `Caracterizacion_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`Rama_id`, `Caracterizacion_id`),
  INDEX `fk_Rama_has_Caracterizacion_Caracterizacion1_idx` (`Caracterizacion_id` ASC),
  INDEX `fk_Rama_has_Caracterizacion_Rama1_idx` (`Rama_id` ASC),
  CONSTRAINT `fk_Rama_has_Caracterizacion_Rama1`
    FOREIGN KEY (`Rama_id`)
    REFERENCES `mydb`.`Rama` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rama_has_Caracterizacion_Caracterizacion1`
    FOREIGN KEY (`Caracterizacion_id`)
    REFERENCES `mydb`.`Caracterizacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Limites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Limites` (
  `id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `liminf` FLOAT NULL,
  `Limsup` FLOAT NULL,
  `Existente` ENUM('Si', 'No') NULL,
  `Departamento_id` TINYINT UNSIGNED NOT NULL,
  `Decreto_id` TINYINT UNSIGNED NOT NULL,
  `Tipo_id` TINYINT UNSIGNED NOT NULL,
  `SubTipo_id` TINYINT NOT NULL,
  `Caracterizacion_id` SMALLINT UNSIGNED NOT NULL,
  `Rama_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Limites_Departamento1_idx` (`Departamento_id` ASC),
  INDEX `fk_Limites_Decreto1_idx` (`Decreto_id` ASC),
  INDEX `fk_Limites_Tipo1_idx` (`Tipo_id` ASC),
  INDEX `fk_Limites_SubTipo1_idx` (`SubTipo_id` ASC),
  INDEX `fk_Limites_Caracterizacion1_idx` (`Caracterizacion_id` ASC),
  INDEX `fk_Limites_Rama1_idx` (`Rama_id` ASC),
  CONSTRAINT `fk_Limites_Departamento1`
    FOREIGN KEY (`Departamento_id`)
    REFERENCES `mydb`.`Departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Limites_Decreto1`
    FOREIGN KEY (`Decreto_id`)
    REFERENCES `mydb`.`Decreto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Limites_Tipo1`
    FOREIGN KEY (`Tipo_id`)
    REFERENCES `mydb`.`Tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Limites_SubTipo1`
    FOREIGN KEY (`SubTipo_id`)
    REFERENCES `mydb`.`SubTipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Limites_Caracterizacion1`
    FOREIGN KEY (`Caracterizacion_id`)
    REFERENCES `mydb`.`Caracterizacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Limites_Rama1`
    FOREIGN KEY (`Rama_id`)
    REFERENCES `mydb`.`Rama` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parametros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parametros` (
  `id` INT UNSIGNED NOT NULL,
  `General_id` INT UNSIGNED NOT NULL,
  `Limites_id` MEDIUMINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Parametros_General1_idx` (`General_id` ASC),
  INDEX `fk_Parametros_Limites1_idx` (`Limites_id` ASC),
  CONSTRAINT `fk_Parametros_General1`
    FOREIGN KEY (`General_id`)
    REFERENCES `mydb`.`General` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parametros_Limites1`
    FOREIGN KEY (`Limites_id`)
    REFERENCES `mydb`.`Limites` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipos_has_General`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipos_has_General` (
  `Equipos_id` SMALLINT UNSIGNED NOT NULL,
  `General_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Equipos_id`, `General_id`),
  INDEX `fk_Equipos_has_General_General1_idx` (`General_id` ASC),
  INDEX `fk_Equipos_has_General_Equipos1_idx` (`Equipos_id` ASC),
  CONSTRAINT `fk_Equipos_has_General_Equipos1`
    FOREIGN KEY (`Equipos_id`)
    REFERENCES `mydb`.`Equipos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipos_has_General_General1`
    FOREIGN KEY (`General_id`)
    REFERENCES `mydb`.`General` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`costoPredeterminados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`costoPredeterminados` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `costo` FLOAT NULL,
  `fechaIngreso` DATE NULL,
  `vencimiento` TINYINT UNSIGNED NULL,
  `modena` CHAR(3) NULL,
  `tipo` BINARY(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CostoParametro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CostoParametro` (
  `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tMateriales` FLOAT NULL,
  `tEquipos` FLOAT NULL,
  `tMano` FLOAT NULL,
  `Parametros_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `Parametros_id`),
  INDEX `fk_CostoParametro_Parametros1_idx` (`Parametros_id` ASC),
  CONSTRAINT `fk_CostoParametro_Parametros1`
    FOREIGN KEY (`Parametros_id`)
    REFERENCES `mydb`.`Parametros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rama_has_General`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rama_has_General` (
  `Rama_id` INT UNSIGNED NOT NULL,
  `General_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Rama_id`, `General_id`),
  INDEX `fk_Rama_has_General_General1_idx` (`General_id` ASC),
  INDEX `fk_Rama_has_General_Rama1_idx` (`Rama_id` ASC),
  CONSTRAINT `fk_Rama_has_General_Rama1`
    FOREIGN KEY (`Rama_id`)
    REFERENCES `mydb`.`Rama` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rama_has_General_General1`
    FOREIGN KEY (`General_id`)
    REFERENCES `mydb`.`General` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`costoMuestra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`costoMuestra` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Muestras_id` INT UNSIGNED NOT NULL,
  `total` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_costoMuestra_Muestras1_idx` (`Muestras_id` ASC),
  CONSTRAINT `fk_costoMuestra_Muestras1`
    FOREIGN KEY (`Muestras_id`)
    REFERENCES `mydb`.`Muestras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parametros_has_Muestras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parametros_has_Muestras` (
  `Parametros_id` INT UNSIGNED NOT NULL,
  `Muestras_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Parametros_id`, `Muestras_id`),
  INDEX `fk_Parametros_has_Muestras_Muestras1_idx` (`Muestras_id` ASC),
  INDEX `fk_Parametros_has_Muestras_Parametros1_idx` (`Parametros_id` ASC),
  CONSTRAINT `fk_Parametros_has_Muestras_Parametros1`
    FOREIGN KEY (`Parametros_id`)
    REFERENCES `mydb`.`Parametros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parametros_has_Muestras_Muestras1`
    FOREIGN KEY (`Muestras_id`)
    REFERENCES `mydb`.`Muestras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plantilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plantilla` (
  `id` TINYINT NOT NULL,
  `reporte` TEXT NULL,
  `Vendedor_id` TINYINT UNSIGNED NOT NULL,
  `Departamento_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reporte_Vendedor1_idx` (`Vendedor_id` ASC),
  INDEX `fk_reporte_Departamento1_idx` (`Departamento_id` ASC),
  CONSTRAINT `fk_reporte_Vendedor1`
    FOREIGN KEY (`Vendedor_id`)
    REFERENCES `mydb`.`Vendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reporte_Departamento1`
    FOREIGN KEY (`Departamento_id`)
    REFERENCES `mydb`.`Departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`migration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`migration` (
  `version` VARCHAR(180) NOT NULL,
  `apply_time` INT(11) NULL,
  PRIMARY KEY (`version`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`track`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`track` (
  `id` INT NOT NULL,
  `session` VARCHAR(100) NULL,
  `date` DATETIME NULL,
  `ip` VARCHAR(15) NULL,
  `user_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_track_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_track_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`referencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`referencia` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ano` YEAR NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`diaLaborables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`diaLaborables` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dias` DATE NULL,
  `referencia_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_diaLaborables_referencia1_idx` (`referencia_id` ASC),
  CONSTRAINT `fk_diaLaborables_referencia1`
    FOREIGN KEY (`referencia_id`)
    REFERENCES `mydb`.`referencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reporte` (
  `id` INT NOT NULL,
  `Plantilla_id` TINYINT NOT NULL,
  `General_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reporte_Plantilla1_idx` (`Plantilla_id` ASC),
  INDEX `fk_reporte_General1_idx` (`General_id` ASC),
  CONSTRAINT `fk_reporte_Plantilla1`
    FOREIGN KEY (`Plantilla_id`)
    REFERENCES `mydb`.`Plantilla` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reporte_General1`
    FOREIGN KEY (`General_id`)
    REFERENCES `mydb`.`General` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`costos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`costos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cAnalisis` FLOAT NULL,
  `cMuestreo` FLOAT NULL,
  `cInforme` FLOAT NULL,
  `cAdministrativo` FLOAT NULL,
  `utilidad` FLOAT NULL,
  `rendimiento` TINYINT NULL,
  `General_id` INT UNSIGNED NOT NULL,
  `CostoParametro_id` SMALLINT UNSIGNED NOT NULL,
  `CostoParametro_Parametros_id` INT UNSIGNED NOT NULL,
  `costoMuestra_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `General_id`, `CostoParametro_id`, `CostoParametro_Parametros_id`, `costoMuestra_id`),
  INDEX `fk_costos_General1_idx` (`General_id` ASC),
  INDEX `fk_costos_CostoParametro1_idx` (`CostoParametro_id` ASC, `CostoParametro_Parametros_id` ASC),
  INDEX `fk_costos_costoMuestra1_idx` (`costoMuestra_id` ASC),
  CONSTRAINT `fk_costos_General1`
    FOREIGN KEY (`General_id`)
    REFERENCES `mydb`.`General` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_costos_CostoParametro1`
    FOREIGN KEY (`CostoParametro_id` , `CostoParametro_Parametros_id`)
    REFERENCES `mydb`.`CostoParametro` (`id` , `Parametros_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_costos_costoMuestra1`
    FOREIGN KEY (`costoMuestra_id`)
    REFERENCES `mydb`.`costoMuestra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`peticion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`peticion` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fPeticion` DATE NULL,
  `cadena` VARCHAR(15) NULL,
  `fVencimiento` TINYINT UNSIGNED NULL,
  `fCreacion` TIMESTAMP(8) NULL,
  `referencia_id` INT UNSIGNED NOT NULL,
  `costos_id` INT UNSIGNED NOT NULL,
  `costos_General_id` INT UNSIGNED NOT NULL,
  `costos_CostoParametro_id` SMALLINT UNSIGNED NOT NULL,
  `costos_CostoParametro_Parametros_id` INT UNSIGNED NOT NULL,
  `costos_costoMuestra_id` INT UNSIGNED NOT NULL,
  `General_id` INT UNSIGNED NOT NULL,
  `Muestras_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `costos_id`, `costos_General_id`, `costos_CostoParametro_id`, `costos_CostoParametro_Parametros_id`, `costos_costoMuestra_id`, `General_id`, `Muestras_id`),
  INDEX `fk_peticion_referencia1_idx` (`referencia_id` ASC),
  INDEX `fk_peticion_costos1_idx` (`costos_id` ASC, `costos_General_id` ASC, `costos_CostoParametro_id` ASC, `costos_CostoParametro_Parametros_id` ASC, `costos_costoMuestra_id` ASC),
  INDEX `fk_peticion_General1_idx` (`General_id` ASC),
  INDEX `fk_peticion_Muestras1_idx` (`Muestras_id` ASC),
  CONSTRAINT `fk_peticion_referencia1`
    FOREIGN KEY (`referencia_id`)
    REFERENCES `mydb`.`referencia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peticion_costos1`
    FOREIGN KEY (`costos_id` , `costos_General_id` , `costos_CostoParametro_id` , `costos_CostoParametro_Parametros_id` , `costos_costoMuestra_id`)
    REFERENCES `mydb`.`costos` (`id` , `General_id` , `CostoParametro_id` , `CostoParametro_Parametros_id` , `costoMuestra_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peticion_General1`
    FOREIGN KEY (`General_id`)
    REFERENCES `mydb`.`General` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peticion_Muestras1`
    FOREIGN KEY (`Muestras_id`)
    REFERENCES `mydb`.`Muestras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ordenCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ordenCompra` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nOrden` VARCHAR(45) NULL,
  `ubicacion` VARCHAR(150) NULL,
  `observaciones` TEXT NULL,
  `estado` ENUM('Rechazado', 'Pendiente', 'Aceptada') NULL,
  `peticion_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ordenCompra_peticion1_idx` (`peticion_id` ASC),
  CONSTRAINT `fk_ordenCompra_peticion1`
    FOREIGN KEY (`peticion_id`)
    REFERENCES `mydb`.`peticion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caracterizacion_has_Equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Caracterizacion_has_Equipos` (
  `Caracterizacion_id` SMALLINT UNSIGNED NOT NULL,
  `Equipos_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`Caracterizacion_id`, `Equipos_id`),
  INDEX `fk_Caracterizacion_has_Equipos_Equipos1_idx` (`Equipos_id` ASC),
  INDEX `fk_Caracterizacion_has_Equipos_Caracterizacion1_idx` (`Caracterizacion_id` ASC),
  CONSTRAINT `fk_Caracterizacion_has_Equipos_Caracterizacion1`
    FOREIGN KEY (`Caracterizacion_id`)
    REFERENCES `mydb`.`Caracterizacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Caracterizacion_has_Equipos_Equipos1`
    FOREIGN KEY (`Equipos_id`)
    REFERENCES `mydb`.`Equipos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`costoPredeterminados_has_CostoParametro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`costoPredeterminados_has_CostoParametro` (
  `costoPredeterminados_id` INT UNSIGNED NOT NULL,
  `CostoParametro_id` SMALLINT UNSIGNED NOT NULL,
  `cantidad` FLOAT NULL,
  `k` FLOAT NULL,
  `unidad` ENUM('equipos', 'materiales', 'mano') NULL,
  PRIMARY KEY (`costoPredeterminados_id`, `CostoParametro_id`),
  INDEX `fk_costoPredeterminados_has_CostoParametro_CostoParametro1_idx` (`CostoParametro_id` ASC),
  INDEX `fk_costoPredeterminados_has_CostoParametro_costoPredetermin_idx` (`costoPredeterminados_id` ASC),
  CONSTRAINT `fk_costoPredeterminados_has_CostoParametro_costoPredeterminad1`
    FOREIGN KEY (`costoPredeterminados_id`)
    REFERENCES `mydb`.`costoPredeterminados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_costoPredeterminados_has_CostoParametro_CostoParametro1`
    FOREIGN KEY (`CostoParametro_id`)
    REFERENCES `mydb`.`CostoParametro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`costoPredeterminados_has_costoMuestra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`costoPredeterminados_has_costoMuestra` (
  `costoPredeterminados_id` INT UNSIGNED NOT NULL,
  `costoMuestra_id` INT UNSIGNED NOT NULL,
  `cantidad` FLOAT NULL,
  PRIMARY KEY (`costoPredeterminados_id`, `costoMuestra_id`),
  INDEX `fk_costoPredeterminados_has_costoMuestra_costoMuestra1_idx` (`costoMuestra_id` ASC),
  INDEX `fk_costoPredeterminados_has_costoMuestra_costoPredeterminad_idx` (`costoPredeterminados_id` ASC),
  CONSTRAINT `fk_costoPredeterminados_has_costoMuestra_costoPredeterminados1`
    FOREIGN KEY (`costoPredeterminados_id`)
    REFERENCES `mydb`.`costoPredeterminados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_costoPredeterminados_has_costoMuestra_costoMuestra1`
    FOREIGN KEY (`costoMuestra_id`)
    REFERENCES `mydb`.`costoMuestra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
