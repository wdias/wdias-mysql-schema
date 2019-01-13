CREATE DATABASE IF NOT EXISTS extenstion; USE extenstion;

CREATE TABLE IF NOT EXISTS extensions (
  `extensionId` CHAR(64) NOT NULL,
  `extension` ENUM('Transformation', 'Validation', 'Interpolation') NOT NULL,
  `function` CHAR(50) NOT NULL,
  `data` JSON NOT NULL,
  `options` JSON NOT NULL,
  PRIMARY KEY (`extensionId`),
  UNIQUE `extension_function_unique` (`extension`, `function`)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
