-- Initialisation de la base de données pour MySQL1
CREATE DATABASE IF NOT EXISTS tp3db;
USE tp3db;

CREATE TABLE IF NOT EXISTS server_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    server_name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO server_info (server_name) VALUES ('Serveur 1 - MySQL1');
