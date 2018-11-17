CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS parameters (
  `parameterId` CHAR(32) NOT NULL,
  `variable` CHAR(45) NOT NULL,
  `unit` CHAR(45) NOT NULL,
  `parameterType` ENUM('Instantaneous', 'Accumulative', 'Mean') NOT NULL,
  PRIMARY KEY (`parameterId`)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
