-- SINGLE-TABLE QUERIES

-- (1) Characters that are currently alive or active in the MCU.
SELECT alias, first_name, last_name, life_status
FROM characters
WHERE origin_universe_id = '199999'
AND life_status LIKE 'A%ive'
ORDER BY life_status;

-- (2) Crew members with first/last name beginning with 'J'.
SELECT DISTINCT *
FROM people
WHERE first_name LIKE 'J%'
OR last_name LIKE 'J%'
ORDER BY Role DESC, last_name;

-- (3) Non-MCU projects from 2012-2021.
SELECT title, released
FROM projects
WHERE released BETWEEN 2012 AND 2021
AND mcu_phase IS NULL
AND mcu_saga IS NULL
ORDER BY released;

-- (4) Multiversal character appearances by project.
SELECT project_title, COUNT(*) AS num_appearances
FROM appearances
WHERE appearance_type = 'Multiversal'
GROUP BY project_title;

-- (5) Crew members with 2+ projects.
SELECT person_first_name, person_last_name, COUNT(*) AS num_projects
FROM credits
GROUP BY person_first_name, person_last_name
HAVING num_projects > 2
ORDER BY num_projects, person_last_name;

-- (6) Box ofice earnings of film franchises.
SELECT CASE
    WHEN title LIKE '%Spider-Man%' THEN 'Spider-Man'
    WHEN title LIKE '%Avengers%' THEN 'Avengers'
    WHEN title LIKE 'Iron Man%' THEN 'Iron Man'
    WHEN title LIKE 'Thor%' THEN 'Thor'
    WHEN title LIKE 'Captain America%' THEN 'Captain America'
    WHEN title LIKE 'Guardians%' THEN 'Guardians of the Galaxy'
    WHEN title LIKE 'Deadpool%' THEN 'Deadpool'
    WHEN title LIKE 'Ant-Man%' THEN 'Ant-Man'
    WHEN title LIKE 'Black Panther%' THEN 'Black Panther'
    WHEN title LIKE 'Doctor Strange%' THEN 'Doctor Strange'
    ELSE CASE
        WHEN universe_id = '199999' THEN 'Other MCU'
        WHEN universe_id = 'TRN414' THEN 'X-Men (Revised)'
        WHEN universe_id = 'TRN688' THEN 'SSU'
    END
END AS franchise, FORMAT(SUM(box_office), 0) AS TotalBoxOffice, studio_name
FROM projects
WHERE box_office IS NOT NULL
GROUP BY franchise
ORDER BY released, id;


-- MULTI-TABLE QUERIES

-- (1) Release years and crew members of post-phase 1 projects that made less than $800 million.
SELECT DISTINCT released, person_first_name, person_last_name
FROM projects p, credits c
WHERE p.title = c.project_title
AND p.box_office < 800000000
AND p.Phase > 1;

-- (2) Studios that have created or own a cinematic universe.
SELECT name, president, (
    SELECT COUNT(*)
    FROM projects p
    WHERE p.studio_name = s.name
) AS num_projects
FROM studios s
WHERE name IN (
    SELECT studio_name
    FROM universes
    WHERE earth IN ('96283', '120703', '199999', 'TRN414', 'TRN688')
)
ORDER BY founded;

-- (3) Directors and their movies.
SELECT CONCAT_WS(' ', c.first_name, c.last_name) AS Director, d.project_title
FROM credits d
JOIN people c
ON d.person_first_name = c.first_name AND d.person_last_name = c.last_name
WHERE c.Role = 'Director'
ORDER BY d.project_id;

-- (4) Range of box office earnings and highest grossing character for each MCU phase.
SELECT p.Phase, p.mcu_saga, FORMAT(MIN(p.box_office), 0) AS MinBoxOffice, FORMAT(AVG(p.box_office), 0) AS AvgBoxOffice, FORMAT(MAX(p.box_office), 0) AS MaxBoxOffice, a.character_alias AS HighestGrossingCharacter
FROM projects p
JOIN appearances a ON p.id = a.project_id AND p.timeline_order = a.project_timeline_order AND p.title = a.project_title
WHERE p.universe_id = '199999'
GROUP BY p.Phase
ORDER BY mcu_phase, SUM(p.box_office) DESC;

-- (5) Box office earnings for characters with less than 10 appearances.
SELECT a.character_alias, COUNT(*) AS num_appearances, FORMAT(SUM(box_office), 0) AS TotalBoxOffice, u.editorial_name AS CinematicUniverse
FROM appearances a
LEFT JOIN projects p
ON a.project_id = p.id AND a.project_timeline_order = p.timeline_order AND a.project_title = p.title
JOIN universes u
ON p.universe_id = u.earth
GROUP BY a.character_alias, CinematicUniverse
HAVING num_appearances < 10
ORDER BY p.released;

-- (6) The major MCU team-up films so far with the status of appearing characters.
SELECT p.title AS MajorTeamUpFilm, p.released, FORMAT(p.box_office, 0) AS box_office, c.alias AS CharacterName, c.life_status, u.editorial_name AS CharacterOriginUniverse
FROM projects p
JOIN appearances a ON p.id = a.project_id AND p.timeline_order = a.project_timeline_order AND p.title = a.project_title
JOIN characters c ON a.character_alias = c.alias
JOIN universes u ON c.origin_universe_id = u.earth
WHERE p.universe_id = '199999'
AND p.id IN (6, 11, 13, 19, 22, 32)
ORDER BY p.id DESC;