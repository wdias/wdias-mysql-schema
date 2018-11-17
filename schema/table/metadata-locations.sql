CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS locations (
  `locationId` CHAR(32) NOT NULL,
  `name` CHAR(45) NOT NULL,
  `lat` DOUBLE NOT NULL,
  `lot` DOUBLE NOT NULL,
  `elevation` DOUBLE NULL,
  `description` CHAR(255) NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
