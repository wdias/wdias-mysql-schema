CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS timeseries (
  `timeseriesId` CHAR(50) NOT NULL,
  `moduleId` CHAR(50) NOT NULL,
  `valueType` CHAR(50) NOT NULL,
  `parameterId` CHAR(50) NOT NULL,
  `locationId` CHAR(50) NOT NULL,
  `timeseriesType` ENUM('ExternalHistorical', 'ExternalForecasting', 'SimulatedHistorical', 'SimulatedForecasting'),
  `timeStepId` CHAR(50) NOT NULL,
  PRIMARY KEY (`timeseriesId`),
  UNIQUE INDEX `uq_timeseries` (`moduleId`, `valueType`, `parameterId`, `locationId`, `timeseriesType`, `timeStepId`)
);
