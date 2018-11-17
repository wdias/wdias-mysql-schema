CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS time_steps (
  `timeStepId` CHAR(50) NOT NULL,
  `unit` ENUM('Second', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year', 'NonEquidistant'),
  `multiplier` INT(10),
  `divider` INT(10),
  PRIMARY KEY (`timeStepId`),
  UNIQUE INDEX `uq_timeStepId` (`timeStepId`)
);
