
-- Create Database
CREATE DATABASE IF NOT EXISTS tour_itinerary_planner;
USE tour_itinerary_planner;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL, -- hashed password
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Destinations Table
CREATE TABLE IF NOT EXISTS destinations (
    destination_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(100),
    description TEXT
);

-- Itineraries Table
CREATE TABLE IF NOT EXISTS itineraries (
    itinerary_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(150) NOT NULL,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Itinerary Details Table
CREATE TABLE IF NOT EXISTS itinerary_details (
    detail_id INT AUTO_INCREMENT PRIMARY KEY,
    itinerary_id INT,
    day_number INT,
    destination_id INT,
    activity VARCHAR(255),
    FOREIGN KEY (itinerary_id) REFERENCES itineraries(itinerary_id),
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id)
);

-- Bookings Table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    itinerary_id INT,
    booking_type ENUM('flight','hotel','transport','activity'),
    details TEXT,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (itinerary_id) REFERENCES itineraries(itinerary_id)
);

SHOW DATABASES;
USE tour_itinerary_planner;
SHOW TABLES;
