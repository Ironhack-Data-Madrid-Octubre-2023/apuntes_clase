CREATE DATABASE repasosql;
USE repasosql;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema repasosql
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema repasosql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema repasosql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `repasosql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `repasosql` ;

-- -----------------------------------------------------
-- Table `repasosql`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repasosql`.`Categorias` (
  `CategoriaID` INT NOT NULL,
  `NombreCategoria` VARCHAR(45) NULL,
  PRIMARY KEY (`CategoriaID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repasosql`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repasosql`.`Productos` (
  `ProductoID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Precio` INT NULL,
  `Categorias_CategoriaID` INT NOT NULL,
  PRIMARY KEY (`ProductoID`),
  INDEX `fk_Productos_Categorias_idx` (`Categorias_CategoriaID` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Categorias`
    FOREIGN KEY (`Categorias_CategoriaID`)
    REFERENCES `repasosql`.`Categorias` (`CategoriaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repasosql`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repasosql`.`Clientes` (
  `ClienteID` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`ClienteID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repasosql`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repasosql`.`Pedidos` (
  `PedidoID` INT NOT NULL,
  `Cantidad` VARCHAR(45) NULL,
  `Clientes_ClienteID` INT NOT NULL,
  PRIMARY KEY (`PedidoID`),
  INDEX `fk_Pedidos_Clientes1_idx` (`Clientes_ClienteID` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Clientes1`
    FOREIGN KEY (`Clientes_ClienteID`)
    REFERENCES `repasosql`.`Clientes` (`ClienteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `repasosql`.`Pedidos_has_Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `repasosql`.`Pedidos_has_Productos` (
  `Pedidos_PedidoID` INT NOT NULL,
  `Productos_ProductoID` INT NOT NULL,
  PRIMARY KEY (`Pedidos_PedidoID`, `Productos_ProductoID`),
  INDEX `fk_Pedidos_has_Productos_Productos1_idx` (`Productos_ProductoID` ASC) VISIBLE,
  INDEX `fk_Pedidos_has_Productos_Pedidos1_idx` (`Pedidos_PedidoID` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_has_Productos_Pedidos1`
    FOREIGN KEY (`Pedidos_PedidoID`)
    REFERENCES `repasosql`.`Pedidos` (`PedidoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_has_Productos_Productos1`
    FOREIGN KEY (`Productos_ProductoID`)
    REFERENCES `repasosql`.`Productos` (`ProductoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

