-- database.sql
CREATE DATABASE IF NOT EXISTS hopebridge;
USE hopebridge;

-- users table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL, 
  role ENUM('user','ngo') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reports (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  photo VARCHAR(255),
  description TEXT,
  location VARCHAR(255),
  status ENUM('Pending','Resolved') DEFAULT 'Pending',
  priority ENUM('High','Medium','Low') DEFAULT 'Medium',
  category VARCHAR(100),
  response_time INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS feedback (
  id INT AUTO_INCREMENT PRIMARY KEY,
  report_id INT NOT NULL,
  ngo_id INT NOT NULL,
  message TEXT,
  photo VARCHAR(255),
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (report_id) REFERENCES reports(id) ON DELETE CASCADE,
  FOREIGN KEY (ngo_id) REFERENCES users(id) ON DELETE CASCADE
);