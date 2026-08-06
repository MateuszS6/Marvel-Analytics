INSERT INTO CrewMember VALUES
    ('Jon', 'Favreau', 'Director'),
    ('Ramin', 'Djawadi', 'Composer'),
    ('Alan', 'Silvestri', 'Composer'),
    ('Joss', 'Whedon', 'Director'),
    ('Brian', 'Tyler', 'Composer'),
    ('Anthony', 'Russo', 'Director'),
    ('Joe', 'Russo', 'Director'),
    ('Henry', 'Jackman', 'Composer'),
    ('James', 'Gunn', 'Director'),
    ('Danny', 'Elfman', 'Composer'),
    ('Michael', 'Giacchino', 'Composer'),
    ('Ludwig', 'Göransson', 'Composer');

# cannot convert to case due to first and last names being separate
INSERT INTO ProjectCrewMember
    SELECT 'Jon', 'Favreau', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (1, 2)
    UNION
    SELECT 'Ramin', 'Djawadi', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (1, 30)
    UNION
    SELECT 'Alan', 'Silvestri', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (5, 6, 19, 22)
    UNION
    SELECT 'Joss', 'Whedon', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (6, 11)
    UNION
    SELECT 'Brian', 'Tyler', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (7, 11)
    UNION
    SELECT 'Anthony', 'Russo', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (9, 13, 19, 22)
    UNION
    SELECT 'Joe', 'Russo', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (9, 13, 19, 22)
    UNION
    SELECT 'Henry', 'Jackman', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (9, 13, 25)
    UNION
    SELECT 'James', 'Gunn', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (10, 15, 41)
    UNION
    SELECT 'Danny', 'Elfman', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '96283' AND ID IN (1, 2)
    OR UniverseEarth = '199999' AND ID IN (11, 34)
    UNION
    SELECT 'Michael', 'Giacchino', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (14, 16, 23, 32, 36, 39)
    UNION
    SELECT 'Ludwig', 'Göransson', ID, TimelineOrder, Title
    FROM Project WHERE UniverseEarth = '199999' AND ID IN (18, 40)
    OR UniverseEarth = 'TRN688' AND ID = 1;
