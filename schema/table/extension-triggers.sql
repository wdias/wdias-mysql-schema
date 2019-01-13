CREATE DATABASE IF NOT EXISTS extenstion; USE extenstion;

CREATE TABLE IF NOT EXISTS triggers (
  `extensionId` CHAR(64) NOT NULL,
  `trigger_type` ENUM('OnChange', 'OnTime') NOT NULL,
  `trigger_on` CHAR(64) NOT NULL,
  UNIQUE KEY `extension_type_on_idx` (`extensionId`, `trigger_type`, `trigger_on` ASC)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
