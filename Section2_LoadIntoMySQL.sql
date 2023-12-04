/* 
 * Create a new MySQL database using the database files created in Section1_DatabaseCreation.ipynb
 *
 * NOTE: run this file with "mysql -u root -p --local-infile=1 < ./Section2_LoadIntoMySQL.sql"
 *
 * NOTE 2: For demo purposes, at present, the password for MySQL server on my local machine
 *         is temporarily set to "insecure_password"
 *
 */

-- global settings
SET GLOBAL local_infile=1;

-- refresh database
DROP DATABASE IF EXISTS CarMin;
CREATE DATABASE CarMin;
USE CarMin;

-- create table for Car and load
DROP TABLE IF EXISTS Car;
CREATE TABLE Car (
    vin VARCHAR(32),
    mmyt_id VARCHAR(16),
    odometer FLOAT,
    is_certified_preowned VARCHAR(8),
    has_accidents VARCHAR(16),
    transmission_type VARCHAR(16),
    exterior_color VARCHAR(8),
    horsepower FLOAT,
    max_horsepower_at_rpm VARCHAR(32),
    max_torque_at_rpm VARCHAR(32),
    engine_type VARCHAR(8),
    engine_displacement FLOAT,
    fuel_type VARCHAR(32),
    city_mpg FLOAT,
    highway_mpg FLOAT,
    PRIMARY KEY(vin)
);
LOAD DATA LOCAL INFILE "./Data/Car.csv"
INTO TABLE Car
COLUMNS TERMINATED BY ';' 
LINES TERMINATED BY '\n';

-- create table for MMYT and load
DROP TABLE IF EXISTS MMYT;
CREATE TABLE MMYT (
    mmyt_id VARCHAR(16),
    make_name VARCHAR(32),
    model_name VARCHAR(32),
    production_year INT,
    trim_name VARCHAR(128),
    body_type VARCHAR(16),
    max_seats FLOAT,
    fuel_tank_gallons FLOAT,
    drivetrain VARCHAR(8),
    vehicle_length FLOAT,
    vehicle_width FLOAT,
    vehicle_height FLOAT,
    wheelbase FLOAT,
    mmyt_description VARCHAR(256),
    PRIMARY KEY(mmyt_id)
);
LOAD DATA LOCAL INFILE "./Data/MMYT.csv"
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
    is_franchise_dealer VARCHAR(8),
    PRIMARY KEY(dealer_id)
);
LOAD DATA LOCAL INFILE "./Data/Dealer.csv"
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
    days_on_market INT,
    PRIMARY KEY(listing_id)
);
LOAD DATA LOCAL INFILE "./Data/Listing.csv"
INTO TABLE Listing
COLUMNS TERMINATED BY ';' 
LINES TERMINATED BY '\n';
