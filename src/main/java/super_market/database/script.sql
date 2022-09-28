-- MySQL Script generated by MySQL Workbench
-- Thu Sep 22 14:24:06 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema super_market
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema super_market
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `super_market` DEFAULT CHARACTER SET utf8 ;
USE `super_market` ;

-- -----------------------------------------------------
-- Table `super_market`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`brand` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_market`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_market`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`role` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `super_market`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`person` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `identificacion` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surnames` VARCHAR(50) NOT NULL,
  `date_birth` DATE NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telephone` TEXT NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ASC),
  INDEX `fk_person_role` (`role_id` ASC),
  CONSTRAINT `fk_person_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `super_market`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_market`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`status` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `super_market`.`purchase_invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`purchase_invoice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `serial_number` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `company_name` VARCHAR(50) NOT NULL,
  `total_price` DOUBLE NOT NULL,
  `employee_id` INT UNSIGNED NOT NULL,
  `supplier_id` INT UNSIGNED NOT NULL,
  `status_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `number_serial_UNIQUE` (`serial_number` ASC),
  INDEX `fk_purchase_invoice_employee` (`employee_id` ASC),
  INDEX `fk_purchase_invoice_supplier` (`supplier_id` ASC),
  INDEX `fk_purchase_invoice_status` (`status_id` ASC),
  CONSTRAINT `fk_purchase_invoice_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `super_market`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_invoice_supplier`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `super_market`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_invoice_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `super_market`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_market`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `sale_price` DOUBLE NOT NULL,
  `purchase_price` DOUBLE NOT NULL,
  `stock` INT NOT NULL,
  `brand_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_product_brand` (`brand_id` ASC),
  INDEX `fk_product_category` (`category_id` ASC),
  CONSTRAINT `fk_product_brand`
    FOREIGN KEY (`brand_id`)
    REFERENCES `super_market`.`brand` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `super_market`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `super_market`.`purchase_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`purchase_detail` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` INT(11) NOT NULL,
  `price` DOUBLE NOT NULL,
  `purchase_invoice_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchase_detail_purchase_invoice` (`purchase_invoice_id` ASC),
  INDEX `fk_purchase_detail_product` (`product_id` ASC),
  CONSTRAINT `fk_purchase_detail_purchase_invoice`
    FOREIGN KEY (`purchase_invoice_id`)
    REFERENCES `super_market`.`purchase_invoice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_detail_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `super_market`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `super_market`.`sale_invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`sale_invoice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `serial_number` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `company_name` VARCHAR(50) NOT NULL,
  `total_price` DOUBLE UNSIGNED NOT NULL,
  `employee_id` INT UNSIGNED NOT NULL,
  `costumer_id` INT UNSIGNED NOT NULL,
  `status_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `series_number_UNIQUE` (`serial_number` ASC),
  INDEX `fk_sales_invoice_employee` (`employee_id` ASC),
  INDEX `fk_sales_invoice_costumer` (`costumer_id` ASC),
  INDEX `fk_sales_invoice_status` (`status_id` ASC),
  CONSTRAINT `fk_sales_invoice_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `super_market`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_costumer`
    FOREIGN KEY (`costumer_id`)
    REFERENCES `super_market`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_invoice_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `super_market`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `super_market`.`sale_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `super_market`.`sale_detail` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `price` DOUBLE NOT NULL,
  `sales_invoice_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sale_detail_sales_invoice` (`sales_invoice_id` ASC),
  INDEX `fk_sale_detail_product` (`product_id` ASC),
  CONSTRAINT `fk_sale_detail_sales_invoice`
    FOREIGN KEY (`sales_invoice_id`)
    REFERENCES `super_market`.`sale_invoice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_detail_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `super_market`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
