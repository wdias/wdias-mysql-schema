CREATE DATABASE IF NOT EXISTS metadata; USE metadata;

CREATE TABLE IF NOT EXISTS grids (
  `locationId` CHAR(32) NOT NULL,
  `gridType` ENUM('Regular', 'Irregular') NOT NULL,
  `rows` INT NOT NULL,
  `columns` INT NOT NULL,
  `geoDatum` char(255) NULL,
  `dataType` ENUM('gridFirstCell', 'gridCorners', 'geoJSONFile', 'geoCSVFile', 'netcdfFile', 'esriShapeFile') NOT NULL,
  `data` JSON NULL, -- Regular Data: 'gridFirstCell', 'gridCorners'
  `file` MEDIUMBLOB NULL, -- Irregualr Data: 'geoJSONFile', 'geoCSVFile', 'netcdfFile', 'esriShapeFile'
  `description` CHAR(255) NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB DEFAULT COLLATE='utf8_general_ci';
