/* 
 * Pull data from ./Data2/Data2_preprocessed.csv into a new database
 *
 * NOTE: run this file with "mysql -u root -p --local-infile=1 < ./create_db.sql"
 *
 */

-- some settings
SET GLOBAL local_infile=1;

-- refresh database
DROP DATABASE IF EXISTS CarMin;
CREATE DATABASE CarMin;
USE CarMin;

-- create table for data2 (data2 is one big table) and load
DROP TABLE IF EXISTS Data2;
CREATE TABLE Data2 (
posting_id LONG,
posting_region VARCHAR(32),
price INT,
model_year FLOAT,
manufacturer VARCHAR(32),
description VARCHAR(256),
car_condition VARCHAR(32),
cylinders VARCHAR(32),
fuel_type VARCHAR(32),
odometer FLOAT,
title_status VARCHAR(32),
transmission VARCHAR(32),
vin VARCHAR(32),
drivetrain VARCHAR(32),
vehicle_size VARCHAR(32),
vehicle_type VARCHAR(32),
exterior_color VARCHAR(32),
posting_state VARCHAR(32),
latitude FLOAT,
longitude FLOAT,
posting_year INT,
posting_month INT,
posting_day INT
);
LOAD DATA LOCAL INFILE "./Data2/Data2_preprocessed.csv"
INTO TABLE Data2
COLUMNS TERMINATED BY ',' 
LINES TERMINATED BY '\n';