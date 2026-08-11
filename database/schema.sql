-- DROP EXISTING TABLES/VIEWS

DROP TABLE IF EXISTS appearances;
DROP TABLE IF EXISTS project_credits;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS universes;
DROP TABLE IF EXISTS studios;

DROP TABLE IF EXISTS mcu;
DROP TABLE IF EXISTS mcu_movies;
DROP TABLE IF EXISTS mcu_tv;
DROP TABLE IF EXISTS raimiverse;
DROP TABLE IF EXISTS webbverse;
DROP TABLE IF EXISTS xmen;
DROP TABLE IF EXISTS ssu;


-- CREATE TABLES

CREATE TABLE studios (
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    founded DATE,
    president VARCHAR(50)
);

CREATE TABLE universes (
    earth VARCHAR(6) PRIMARY KEY,

    editorial_name VARCHAR(50) UNIQUE,
    studio_id INT,

    FOREIGN KEY (studio_id)
        REFERENCES studios(id)
        ON DELETE CASCADE
);

CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(100) NOT NULL,
    released DATE,
    timeline_order INT,

    is_out BOOLEAN DEFAULT FALSE,
    type VARCHAR(30),
    box_office DECIMAL(12, 0),

    universe_id VARCHAR(6),

    FOREIGN KEY (universe_id)
        REFERENCES universes(earth)
        ON DELETE CASCADE
);

CREATE TABLE characters (
    id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(20),
    last_name VARCHAR(20),
    alias VARCHAR(50) NOT NULL,
    life_status VARCHAR(10),

    origin_universe_id VARCHAR(6),
    parent_studio_id INT,

    FOREIGN KEY (origin_universe_id)
        REFERENCES universes(earth)
        ON DELETE CASCADE,
    
    FOREIGN KEY (parent_studio_id)
        REFERENCES studios(id)
        ON DELETE CASCADE
);

CREATE TABLE appearances (
    character_id INT NOT NULL,
    project_id INT NOT NULL,
    appearance_type VARCHAR(50),

    PRIMARY KEY (character_id, project_id),

    FOREIGN KEY (character_id)
        REFERENCES characters(id)
        ON DELETE CASCADE,
    
    FOREIGN KEY (project_id)
        REFERENCES projects(id)
        ON DELETE CASCADE
);

CREATE TABLE people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
);

CREATE TABLE project_credits (
    person_id INT NOT NULL,
    project_id INT NOT NULL,
    person_role VARCHAR(50) NOT NULL,

    PRIMARY KEY (person_id, project_id, person_role),

    FOREIGN KEY (person_id)
        REFERENCES people(id)
        ON DELETE CASCADE,
    
    FOREIGN KEY (project_id)
        REFERENCES projects(id)
        ON DELETE CASCADE
);