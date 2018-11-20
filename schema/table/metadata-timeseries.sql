CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS timeseries (
  `timeseriesId` CHAR(64) NOT NULL,
  `moduleId` CHAR(32) NOT NULL,
  `valueType` ENUM('Scalar', 'Vector', 'Grid') NOT NULL,
  `parameterId` CHAR(32) NOT NULL,
  `locationId` CHAR(32) NOT NULL,
  `timeseriesType` ENUM('ExternalHistorical', 'ExternalForecasting', 'SimulatedHistorical', 'SimulatedForecasting') NOT NULL,
  `timeStepId` CHAR(32) NOT NULL,
  PRIMARY KEY (`timeseriesId`),
  INDEX `moduleId_idx` (`moduleId` ASC),
  INDEX `valueType_idx` (`valueType` ASC),
  INDEX `parameterId_idx` (`parameterId` ASC),
  INDEX `locationId_idx` (`locationId` ASC),
  INDEX `timeseriesType_idx` (`timeseriesType` ASC),
  INDEX `timeStepId_idx` (`timeStepId` ASC)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
