
DROP TABLE IF EXISTS coffee_has_characteristic;
DROP TABLE IF EXISTS coffee;
DROP TABLE IF EXISTS origin_country;
DROP TABLE IF EXISTS characteristic;

CREATE TABLE origin_country (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE characteristic (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE coffee (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    price INT NOT NULL,
    availability BOOLEAN DEFAULT true,
    reference TEXT UNIQUE NOT NULL,
    image TEXT,
    origin_country_id INT REFERENCES origin_country(id),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE coffee_has_characteristic (
    coffee_id INT REFERENCES coffee(id),
    characteristic_id INT REFERENCES characteristic(id),
    PRIMARY KEY (coffee_id, characteristic_id)
);


-- Insertion des pays
INSERT INTO origin_country (name) VALUES ('Italie');
INSERT INTO origin_country (name) VALUES ('Colombie');
INSERT INTO origin_country (name) VALUES ('Éthiopie');
INSERT INTO origin_country (name) VALUES ('Brésil');
INSERT INTO origin_country (name) VALUES ('Guatemala');
INSERT INTO origin_country (name) VALUES ('Kenya');
INSERT INTO origin_country (name) VALUES ('Indonésie');
INSERT INTO origin_country (name) VALUES ('Costa Rica');
INSERT INTO origin_country (name) VALUES ('Vietnam');
INSERT INTO origin_country (name) VALUES ('Tanzanie');
INSERT INTO origin_country (name) VALUES ('Jamaïque');
INSERT INTO origin_country (name) VALUES ('Rwanda');
INSERT INTO origin_country (name) VALUES ('Panama');
INSERT INTO origin_country (name) VALUES ('Pérou');
INSERT INTO origin_country (name) VALUES ('Hawaï');
INSERT INTO origin_country (name) VALUES ('Nicaragua');

-- Insertion des caractéristiques
INSERT INTO characteristic (name) VALUES ('Corsé');
INSERT INTO characteristic (name) VALUES ('Acide');
INSERT INTO characteristic (name) VALUES ('Fruité');
INSERT INTO characteristic (name) VALUES ('Doux');
INSERT INTO characteristic (name) VALUES ('Épicé');
INSERT INTO characteristic (name) VALUES ('Chocolaté');

-- Insertion des cafés
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Espresso', 'Café fort et concentré préparé en faisant passer de l''eau chaude à travers du café finement moulu.', '100955890', 1, 20.99, '100955890.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (1, 1);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Columbian', 'Café moyennement corsé avec une acidité vive et une saveur riche.', '100955894', 2, 18.75, '100955894.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (2, 2);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Ethiopian Yirgacheffe', 'Réputé pour son arôme floral, son acidité vive et ses notes de saveur citronnée.', '105589090', 3, 22.5, '105589090.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (3, 3);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Brazilian Santos', 'Café doux et lisse avec un profil de saveur de noisette.', '134009550', 4, 17.8, '134009550.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (4, 4);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Guatemalan Antigua', 'Café corsé avec des nuances chocolatées et une pointe d''épice.', '256505890', 5, 21.25, '256505890.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (5, 1);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Kenyan AA', 'Café complexe connu pour son acidité rappelant le vin et ses saveurs fruitées.', '295432730', 6, 23.7, '295432730.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (6, 2);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Sumatra Mandheling', 'Café profond et terreux avec un corps lourd et une faible acidité.', '302932754', 7, 19.95, '302932754.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (7, 1);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Costa Rican Tarrazu', 'Café vif et net avec une finition propre et une acidité vive.', '327302954', 8, 24.5, '327302954.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (8, 2);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Vietnamese Robusta', 'Café audacieux et fort avec une saveur robuste distinctive.', '549549090', 9, 16.75, '549549090.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (9, 5);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Tanzanian Peaberry', 'Acidité vive avec un profil de saveur rappelant le vin et un corps moyen.', '582954954', 10, 26.8, '582954954.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (10, 3);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Jamaican Blue Mountain', 'Reconnu pour sa saveur douce, son acidité vive et son absence d''amertume.', '589100954', 11, 39.25, '589100954.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (11, 4);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Rwandan Bourbon', 'Café avec des notes florales prononcées, une acidité vive et un corps moyen.', '650753915', 12, 21.9, '650753915.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (12, 3);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Panamanian Geisha', 'Café rare aux arômes floraux complexes, une acidité brillante et un profil de saveur distinctif.', '795501340', 13, 42.0, '795501340.png', TRUE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (13, 3);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Peruvian Arabica', 'Café équilibré avec des notes de chocolat, une acidité modérée et un corps velouté.', '954589100', 14, 19.4, '954589100.png', FALSE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (14, 6);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Hawaiian Kona', 'Café rare au goût riche, une acidité douce et des nuances subtiles.', '958090105', 15, 55.75, '958090105.png', FALSE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (15, 4);
INSERT INTO coffee (name, description, reference, origin_country_id, price, image, availability) VALUES ('Nicaraguan Maragogipe', 'Café avec des notes de fruits, une acidité vive et un corps plein.', '691550753', 16, 28.6, '691550753.png', FALSE);
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id) VALUES (16, 3);