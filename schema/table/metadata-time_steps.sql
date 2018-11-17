CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS time_steps (
  `timeStepId` CHAR(32) NOT NULL,
  `unit` ENUM('Second', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year', 'NonEquidistant') NOT NULL,
  `multiplier` INT(10),
  `divider` INT(10),
  PRIMARY KEY (`timeStepId`)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
