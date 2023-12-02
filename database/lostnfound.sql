CREATE DATABASE lostnfound_management_sys;
USE lostnfound_management_sys;

-- Create User table
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(50) NOT NULL,
    user_type VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    status ENUM('active', 'inactive', 'banned') NOT NULL,
    avatar_url VARCHAR(255) NOT NULL,
    date_created DATETIME NOT NULL,
    last_login DATETIME NOT NULL
);

-- Create AdminUser table
CREATE TABLE admin_user (
    admin_user_id INT PRIMARY KEY,
    FOREIGN KEY (admin_user_id) REFERENCES user(user_id),
    access_level VARCHAR(20) NOT NULL,
    admin_id VARCHAR(50) UNIQUE NOT NULL
);

-- Create RegularUser table
CREATE TABLE regular_user (
    regular_user_id INT PRIMARY KEY,
    FOREIGN KEY (regular_user_id) REFERENCES user(user_id),
    user_bio VARCHAR(255) NOT NULL,
    items_claimed INT NOT NULL,
    items_reports_count INT NOT NULL,
    notification_setting ENUM('on', 'off') NOT NULL,
    credential_name VARCHAR(100) NOT NULL,
    credential_file_url VARCHAR(255) NOT NULL
);

-- Create Location table
CREATE TABLE location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    city_town VARCHAR(50) NOT NULL,
    zipcode VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL,
    date_created DATETIME NOT NULL,
    last_updated DATETIME NOT NULL
);

-- Create ItemCategory table
CREATE TABLE item_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    date_created DATETIME NOT NULL,
    last_updated DATETIME NOT NULL
);

-- Create LostFoundItemReport table
CREATE TABLE lost_found_item_report (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    title VARCHAR(255) NOT NULL,
    item_type ENUM('lost', 'found') NOT NULL,
    item_description VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES item_category(category_id),
    date_lost_found DATETIME NOT NULL,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES location(location_id),
    status ENUM('returned', 'pending', 'under review') NOT NULL,
    date_created DATETIME NOT NULL,
    last_updated DATETIME NOT NULL
);

-- Create ItemDetail table
CREATE TABLE item_detail (
    detail_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES lost_found_item_report(item_id),
    primary_color VARCHAR(50),
    secondary_color VARCHAR(50),
    specific_description VARCHAR(255),
    specific_location VARCHAR(255),
    brand VARCHAR(100),
    model VARCHAR(100),
    serial_number VARCHAR(100)
);

-- Create Claim table
CREATE TABLE claim (
    claim_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT NOT NULL,
    FOREIGN KEY (item_id) REFERENCES lost_found_item_report(item_id),
    claim_user_id INT,
    FOREIGN KEY (claim_user_id) REFERENCES user(user_id),
    non_registered_claim_name VARCHAR(100),
    non_registered_claim_contact VARCHAR(50),
    non_registered_claim_email VARCHAR(100),
    status ENUM('pending', 'under review', 'claimed', 'rejected') NOT NULL,
    claim_description VARCHAR(255),
    specific_item_info VARCHAR(255),
    date_created DATETIME NOT NULL,
    last_updated DATETIME NOT NULL
);


-- Create ItemPhoto table
CREATE TABLE item_photo (
    photo_id INT PRIMARY KEY AUTO_INCREMENT,
    claim_id INT,
    FOREIGN KEY (claim_id) REFERENCES claim(claim_id),
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES lost_found_item_report(item_id),
    photo_url VARCHAR(255) NOT NULL,
    file_name VARCHAR(100) NOT NULL
);