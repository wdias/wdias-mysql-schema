CREATE DATABASE IF NOT EXISTS extenstion; USE extenstion;

CREATE TABLE IF NOT EXISTS extensions (
  `extensionId` CHAR(32) NOT NULL,
  `extension` CHAR(50) NOT NULL,
  `function` CHAR(50) NOT NULL,
  `trigger` CHAR(50) NOT NULL,
  `triggerType` CHAR(50) NOT NULL,
  `triggerData` CHAR(50),
  PRIMARY KEY (`extensionId`)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
