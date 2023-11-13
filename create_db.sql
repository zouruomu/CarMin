/* 
 * Pull data from Data1 and Data3 into a new database
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

-- DATA 1

-- create table for Car and load
DROP TABLE IF EXISTS Car;
CREATE TABLE Car (
    vin VARCHAR(32),
    mmty_id VARCHAR(16),
    odometer FLOAT,
    is_certified_preowned VARCHAR(8),
    has_accidents VARCHAR(16),
    transmission_type VARCHAR(16),
    exterior_color VARCHAR(8),
    horsepower FLOAT,
    max_horsepower_at_rpm VARCHAR(32),
    max_torque_at_rpm VARCHAR(32),
    engine_type VARCHAR(4),
    engine_displacement FLOAT,
    fuel_type VARCHAR(32),
    city_mpg FLOAT,
    highway_mpg FLOAT
);
LOAD DATA LOCAL INFILE "./Data1/Car.csv"
INTO TABLE Car
COLUMNS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

-- create table for MMYT and load
DROP TABLE IF EXISTS MMYT;
CREATE TABLE MMYT (
    mmty_id VARCHAR(16),
    make_name VARCHAR(32),
    model_name VARCHAR(32),
    production_year INT,
    trim_name VARCHAR(128),
    body_type VARCHAR(16),
    max_seats FLOAT,
    fuel_tank_gallons FLOAT,
    drivetrain VARCHAR(4),
    vehicle_length FLOAT,
    vehicle_width FLOAT,
    vehicle_height FLOAT,
    wheelbase FLOAT
);
LOAD DATA LOCAL INFILE "./Data1/MMYT.csv"
INTO TABLE MMYT
COLUMNS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

-- create table for Dealer and load
DROP TABLE IF EXISTS Dealer;
CREATE TABLE Dealer (
    dealer_id VARCHAR(16),
    dealer_name VARCHAR(128),
    total_listings INT,
    avg_rating FLOAT,
    location VARCHAR(32),
    zipcode LONG,
    longitude FLOAT,
    latitude FLOAT,
    is_franchise_dealer VARCHAR(8)
);
LOAD DATA LOCAL INFILE "./Data1/Dealer.csv"
INTO TABLE Dealer
COLUMNS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

-- create table for Listing and load
DROP TABLE IF EXISTS Listing;
CREATE TABLE Listing (
    listing_id VARCHAR(16),
    vin VARCHAR(32),
    dealer_id VARCHAR(16),
    price FLOAT,
    listing_year INT,
    listing_month INT,
    listing_day INT,
    days_on_market INT
);
LOAD DATA LOCAL INFILE "./Data1/Listing.csv"
INTO TABLE Listing
COLUMNS TERMINATED BY ';' 
LINES TERMINATED BY '\n';


-- -- DATA 2:

-- -- NOTE: loading Data2 is currently disabled since I haven't yet organized it into the same format as Data1

-- -- create table for data2 (data2 is one big table) and load
-- DROP TABLE IF EXISTS Data2;
-- CREATE TABLE Data2 (
-- posting_id LONG,
-- posting_region VARCHAR(32),
-- price INT,
-- model_year FLOAT,
-- manufacturer VARCHAR(32),
-- description VARCHAR(256),
-- car_condition VARCHAR(32),
-- cylinders VARCHAR(32),
-- fuel_type VARCHAR(32),
-- odometer FLOAT,
-- title_status VARCHAR(32),
-- transmission VARCHAR(32),
-- vin VARCHAR(32),
-- drivetrain VARCHAR(32),
-- vehicle_size VARCHAR(32),
-- vehicle_type VARCHAR(32),
-- exterior_color VARCHAR(32),
-- posting_state VARCHAR(32),
-- latitude FLOAT,
-- longitude FLOAT,
-- posting_year INT,
-- posting_month INT,
-- posting_day INT
-- );
-- LOAD DATA LOCAL INFILE "./Data2/Data2_preprocessed.csv"
-- INTO TABLE Data2
-- COLUMNS TERMINATED BY ',' 
-- LINES TERMINATED BY '\n';