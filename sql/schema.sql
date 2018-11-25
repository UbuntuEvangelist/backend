CREATE DATABASE IF NOT EXISTS `restaurant`;
USE `restaurant`;

DROP TABLE IF EXISTS `reservations`;
DROP TABLE IF EXISTS `tables`;

CREATE TABLE IF NOT EXISTS `tables` (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
	places      TINYINT UNSIGNED NOT NULL,
	description VARCHAR(255) NOT NULL,
  updated_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `reservations` (
  id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
  table_id     INT UNSIGNED NOT NULL,
  guests       TINYINT UNSIGNED NOT NULL,
  email        VARCHAR(63) NOT NULL,
  phone        VARCHAR(63) NOT NULL,
  state        ENUM('created', 'approved', 'cancelled') NOT NULL DEFAULT 'created',
  full_name    VARCHAR(255) NOT NULL,
  time         DATETIME NOT NULL,
  duration     BIGINT,
  created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (table_id)
    REFERENCES tables(id)
) ENGINE = InnoDB;