-- =============================================================
-- Databasinitiering
-- =============================================================

-- Skapa databasen om den inte finns
CREATE DATABASE IF NOT EXISTS app_db;
USE app_db;

-- Skapa tabellen "items" som matchar appens modeller
CREATE TABLE IF NOT EXISTS items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Lägg in exempeldata så att GET /items returnerar något
INSERT INTO items (name, description) VALUES 
('Serverrack', 'Standard 42U rack för datacenter'),
('Switch', '24-portars gigabit switch'),
('Brandvägg', 'Hårdvarubrandvägg för nätverkssäkerhet');

-- Skapa databasanvändaren med EXAKT det lösenord som står i main.py
CREATE USER IF NOT EXISTS 'app_user'@'%' IDENTIFIED BY 'secure_password_123';

-- BEGRÄNSADE rättigheter: Appen behöver SELECT, INSERT och UPDATE
-- Vi ger INTE DELETE-rättigheter eftersom det inte efterfrågas i kraven
GRANT SELECT, INSERT, UPDATE ON app_db.* TO 'app_user'@'%';

-- Verksställ ändringarna
FLUSH PRIVILEGES;