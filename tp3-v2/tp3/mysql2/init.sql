-- Exemple d'initialisation pour tp3_mysql2
-- Ce fichier est exécuté automatiquement au premier démarrage si le volume est vierge

CREATE TABLE IF NOT EXISTS demo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(100) NOT NULL
);

INSERT INTO demo (label) VALUES ('Bonjour depuis MySQL2');


