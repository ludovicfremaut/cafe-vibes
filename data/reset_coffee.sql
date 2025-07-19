BEGIN;
-- SUPPRESSION DES TABLES SI ELLES EXISTENT
DROP TABLE IF EXISTS coffee_has_characteristic;
DROP TABLE IF EXISTS coffee;
DROP TABLE IF EXISTS characteristic;
DROP TABLE IF EXISTS origin_country;
-- TABLE ORIGIN_COUNTRY
CREATE TABLE origin_country (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);
-- TABLE CHARACTERISTIC
CREATE TABLE characteristic (
    id SERIAL PRIMARY KEY,
    label VARCHAR(64) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);
-- TABLE COFFEE
CREATE TABLE coffee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(512),
    reference INT NOT NULL UNIQUE,
    price NUMERIC(5, 2) NOT NULL,
    available BOOLEAN NOT NULL DEFAULT true,
    origin_country_id INT REFERENCES origin_country(id) ON DELETE CASCADE,
    image VARCHAR(255),
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);
-- TABLE DE LIAISON
CREATE TABLE coffee_has_characteristic (
    coffee_id INT REFERENCES coffee(id) ON DELETE CASCADE,
    characteristic_id INT REFERENCES characteristic(id) ON DELETE CASCADE,
    PRIMARY KEY (coffee_id, characteristic_id)
);
-- INSERTION DES PAYS D'ORIGINE
INSERT INTO origin_country (name)
VALUES ('Italie'),
    ('Colombie'),
    ('Éthiopie'),
    ('Brésil'),
    ('Guatemala'),
    ('Kenya'),
    ('Indonésie'),
    ('Costa Rica'),
    ('Vietnam'),
    ('Tanzanie'),
    ('Jamaïque'),
    ('Rwanda'),
    ('Panama'),
    ('Pérou'),
    ('Hawaï'),
    ('Nicaragua');
-- INSERTION DES CARACTÉRISTIQUES
INSERT INTO characteristic (label)
VALUES ('Corsé'),
    ('Acide'),
    ('Fruité'),
    ('Doux'),
    ('Chocolaté'),
    ('Épicé');
-- INSERTION DES CAFÉS
INSERT INTO coffee (
        name,
        description,
        reference,
        price,
        available,
        origin_country_id,
        image
    )
VALUES (
        'Espresso',
        'Café fort et concentré...',
        100955890,
        20.99,
        true,
        1,
        '100955890.png'
    ),
    (
        'Columbian',
        'Café moyennement corsé...',
        100955894,
        18.75,
        true,
        2,
        '100955894.png'
    ),
    (
        'Ethiopian Yirgacheffe',
        'Réputé pour son arôme floral...',
        105589090,
        22.50,
        true,
        3,
        '105589090.png'
    ),
    (
        'Brazilian Santos',
        'Café doux et lisse...',
        134009550,
        17.80,
        true,
        4,
        '134009550.png'
    ),
    (
        'Guatemalan Antigua',
        'Café corsé avec des nuances chocolatées...',
        256505890,
        21.25,
        true,
        5,
        '256505890.png'
    ),
    (
        'Kenyan AA',
        'Café complexe avec acidité rappelant le vin...',
        295432730,
        23.70,
        true,
        6,
        '295432730.png'
    ),
    (
        'Panamanian Geisha',
        'Café rare aux arômes floraux...',
        795501340,
        42.00,
        true,
        13,
        '795501340.png'
    );
-- LIEN ENTRE CAFÉS ET CARACTÉRISTIQUES
INSERT INTO coffee_has_characteristic (coffee_id, characteristic_id)
VALUES -- Espresso → Corsé
    (1, 1),
    -- Columbian → Acide
    (2, 2),
    -- Ethiopian Yirgacheffe → Fruité, Acide
    (3, 3),
    (3, 2),
    -- Brazilian Santos → Doux
    (4, 4),
    -- Guatemalan Antigua → Corsé, Chocolaté
    (5, 1),
    (5, 5),
    -- Kenyan AA → Fruité, Acide
    (6, 3),
    (6, 2),
    -- Panamanian Geisha → Fruité, Floral 
    (7, 3);
COMMIT