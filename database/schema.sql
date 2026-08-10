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
    name VARCHAR(50) PRIMARY KEY,
    founded DATE NULL,
    president VARCHAR(50)
);

CREATE TABLE universes (
    earth VARCHAR(6) PRIMARY KEY,
    editorial_name VARCHAR(50) UNIQUE,
    studio_name VARCHAR(50),
    FOREIGN KEY (studio_name) REFERENCES studios (name) ON DELETE CASCADE
);

CREATE TABLE projects (
    id INT AUTO_INCREMENT,
    timeline_order INT,
    title VARCHAR(100) UNIQUE,
    released DATE,
    is_out BOOLEAN DEFAULT FALSE,
    type VARCHAR(20),
    box_office DEC(12),
    mcu_phase INT,
    mcu_saga VARCHAR(20),
    universe_id VARCHAR(6) DEFAULT '199999',
    studio_name VARCHAR(50) DEFAULT 'Marvel Studios',
    PRIMARY KEY (id, timeline_order, title),
    FOREIGN KEY (universe_id) REFERENCES universes (earth) ON DELETE CASCADE,
    FOREIGN KEY (studio_name) REFERENCES studios (name) ON DELETE CASCADE
);

/*
CREATE TABLE mcu (
    project_id INT,
    project_timeline_order INT,
    project_title VARCHAR(100),
    mcu_phase INT,
    mcu_saga VARCHAR(20),
    FOREIGN KEY (project_id, project_timeline_order, project_title) REFERENCES projects(id, timeline_order, title)
    ON DELETE CASCADE
);

CREATE TABLE Film (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    project_timeline_order INT,
    project_title VARCHAR(100),
    running_time INT,
    box_office DEC(12),
    FOREIGN KEY (project_id, project_timeline_order, project_title) REFERENCES projects(id, timeline_order, title)
    ON DELETE CASCADE
);

CREATE TABLE Series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    project_timeline_order INT,
    project_title VARCHAR(100),
    episodes INT,
    FOREIGN KEY (project_id, project_timeline_order, project_title) REFERENCES projects(id, timeline_order, title)
    ON DELETE CASCADE
);

CREATE TABLE Special (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    project_timeline_order INT,
    project_title VARCHAR(100),
    running_time INT,
    FOREIGN KEY (project_id, project_timeline_order, project_title) REFERENCES projects(id, timeline_order, title)
    ON DELETE CASCADE
);
*/

CREATE TABLE characters (
    alias VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    life_status VARCHAR(10),
    origin_universe_id VARCHAR(6) DEFAULT '199999',
    parent_studio VARCHAR(50) DEFAULT 'Marvel Studios',
    FOREIGN KEY (origin_universe_id) REFERENCES universes (earth) ON DELETE CASCADE,
    FOREIGN KEY (parent_studio) REFERENCES studios (name) ON DELETE CASCADE
);

CREATE TABLE appearances (
    appearance_type VARCHAR(50),
    character_alias VARCHAR(50),
    project_id INT,
    project_timeline_order INT,
    project_title VARCHAR(100),
    PRIMARY KEY (
        character_alias,
        project_id,
        project_timeline_order,
        project_title
    ),
    FOREIGN KEY (character_alias) REFERENCES characters (alias) ON DELETE CASCADE,
    FOREIGN KEY (
        project_id,
        project_timeline_order,
        project_title
    ) REFERENCES projects (id, timeline_order, title) ON DELETE CASCADE
);

CREATE TABLE people (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    Role VARCHAR(20) NOT NULL,
    PRIMARY KEY (first_name, last_name)
);

CREATE TABLE project_credits (
    person_first_name VARCHAR(20),
    person_last_name VARCHAR(20),
    project_id INT,
    project_timeline_order INT,
    project_title VARCHAR(100),
    PRIMARY KEY (
        person_first_name,
        person_last_name,
        project_id,
        project_timeline_order,
        project_title
    ),
    CONSTRAINT CrewMemberName FOREIGN KEY (
        person_first_name,
        person_last_name
    ) REFERENCES people (first_name, last_name) ON DELETE CASCADE,
    FOREIGN KEY (
        project_id,
        project_timeline_order,
        project_title
    ) REFERENCES projects (id, timeline_order, title) ON DELETE CASCADE
);