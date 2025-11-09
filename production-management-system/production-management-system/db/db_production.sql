-- SQL script to create the database schema for the production management system

-- Create the database
CREATE DATABASE IF NOT EXISTS db_production;

USE db_production;

-- Create tables

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'leader') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_quantity INT NOT NULL,
    request_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS planning (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    shift_date DATE NOT NULL,
    target INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS shiftments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    planning_id INT NOT NULL,
    leader_id INT NOT NULL,
    production_date DATE NOT NULL,
    target INT NOT NULL,
    FOREIGN KEY (planning_id) REFERENCES planning(id) ON DELETE CASCADE,
    FOREIGN KEY (leader_id) REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS productions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    shiftment_id INT NOT NULL,
    machines_used VARCHAR(255),
    materials_used VARCHAR(255),
    production_date DATE NOT NULL,
    FOREIGN KEY (shiftment_id) REFERENCES shiftments(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS machines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status ENUM('available', 'in_use', 'maintenance') NOT NULL,
    history TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    stock INT NOT NULL,
    history TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    production_id INT NOT NULL,
    finished_goods INT NOT NULL,
    waste INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (production_id) REFERENCES productions(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS warehouse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    total_finished_goods INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);

-- Insert initial data

INSERT INTO users (username, password, role) VALUES
('admin', '$2y$10$eImiTXuWVfZy0jY0g5y8Oe2H9h8z5Y1y5Y1y5Y1y5Y1y5Y1y5Y1y5', 'admin'),
('leader', '$2y$10$eImiTXuWVfZy0jY0g5y8Oe2H9h8z5Y1y5Y1y5Y1y5Y1y5Y1y5Y1y5', 'leader');