CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS locations (
  `locationId` CHAR(50) NOT NULL,
  `name` CHAR(50) NOT NULL,
  `lat` FLOAT(11) NOT NULL,
  `lot` FLOAT(11) NOT NULL,
  `elevation` FLOAT(11),
  `description` CHAR(255),
  PRIMARY KEY (`locationId`),
  UNIQUE INDEX `uq_locationId` (`locationId`)
);
