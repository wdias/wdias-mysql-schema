CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS parameters (
  `parameterId` CHAR(50) NOT NULL,
  `variable` CHAR(50) NOT NULL,
  `unit` CHAR(50) NOT NULL,
  `parameterType` ENUM('Instantaneous', 'Accumulative', 'Mean'),
  PRIMARY KEY (`parameterId`),
  UNIQUE INDEX `uq_parameterId` (`parameterId`)
);
