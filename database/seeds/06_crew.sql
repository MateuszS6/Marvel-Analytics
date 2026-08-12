INSERT INTO
    people (first_name, last_name)
VALUES ('Jon', 'Favreau'),
    ('Ramin', 'Djawadi'),
    ('Alan', 'Silvestri'),
    ('Joss', 'Whedon'),
    ('Brian', 'Tyler'),
    ('Anthony', 'Russo'),
    ('Joe', 'Russo'),
    ('Henry', 'Jackman'),
    ('James', 'Gunn'),
    ('Danny', 'Elfman'),
    ('Michael', 'Giacchino'),
    ('Ludwig', 'Göransson');

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Director'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Jon'
    AND pe.last_name = 'Favreau'
    AND pr.universe_id = '199999'
    AND pr.id IN (1, 2);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Composer'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Ramin'
    AND pe.last_name = 'Djawadi'
    AND pr.universe_id = '199999'
    AND pr.id IN (1, 30);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Composer'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Alan'
    AND pe.last_name = 'Silvestri'
    AND pr.universe_id = '199999'
    AND pr.id IN (5, 6, 19, 22);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Director'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Joss'
    AND pe.last_name = 'Whedon'
    AND pr.universe_id = '199999'
    AND pr.id IN (6, 11);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Composer'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Brian'
    AND pe.last_name = 'Tyler'
    AND pr.universe_id = '199999'
    AND pr.id IN (7, 11);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Director'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Anthony'
    AND pe.last_name = 'Russo'
    AND pr.universe_id = '199999'
    AND pr.id IN (9, 13, 19, 22);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Director'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Joe'
    AND pe.last_name = 'Russo'
    AND pr.universe_id = '199999'
    AND pr.id IN (9, 13, 19, 22);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Composer'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Henry'
    AND pe.last_name = 'Jackman'
    AND pr.universe_id = '199999'
    AND pr.id IN (9, 13, 25);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Director'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'James'
    AND pe.last_name = 'Gunn'
    AND pr.universe_id = '199999'
    AND pr.id IN (10, 15, 41);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Composer'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Danny'
    AND pe.last_name = 'Elfman'
    AND (
        pr.universe_id = '96283'
        AND pr.id IN (1, 2)
        OR pr.universe_id = '199999'
        AND pr.id IN (11, 34)
    );

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Composer'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Michael'
    AND pe.last_name = 'Giacchino'
    AND pr.universe_id = '199999'
    AND pr.id IN (14, 16, 23, 32, 36, 39);

INSERT INTO
    project_credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, 'Composer'
FROM people pe
    CROSS JOIN projects pr
WHERE
    pe.first_name = 'Ludwig'
    AND pe.last_name = 'Göransson'
    AND (
        pr.universe_id = '199999'
        AND pr.id IN (18, 40)
        OR pr.universe_id = 'TRN688'
        AND pr.id = 1
    );