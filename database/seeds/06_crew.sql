INSERT INTO people VALUES
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
INSERT INTO project_credits
    SELECT 'Jon', 'Favreau', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (1, 2)
    UNION
    SELECT 'Ramin', 'Djawadi', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (1, 30)
    UNION
    SELECT 'Alan', 'Silvestri', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (5, 6, 19, 22)
    UNION
    SELECT 'Joss', 'Whedon', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (6, 11)
    UNION
    SELECT 'Brian', 'Tyler', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (7, 11)
    UNION
    SELECT 'Anthony', 'Russo', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (9, 13, 19, 22)
    UNION
    SELECT 'Joe', 'Russo', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (9, 13, 19, 22)
    UNION
    SELECT 'Henry', 'Jackman', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (9, 13, 25)
    UNION
    SELECT 'James', 'Gunn', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (10, 15, 41)
    UNION
    SELECT 'Danny', 'Elfman', id, timeline_order, title
    FROM projects WHERE universe_id = '96283' AND id IN (1, 2)
    OR universe_id = '199999' AND id IN (11, 34)
    UNION
    SELECT 'Michael', 'Giacchino', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (14, 16, 23, 32, 36, 39)
    UNION
    SELECT 'Ludwig', 'Göransson', id, timeline_order, title
    FROM projects WHERE universe_id = '199999' AND id IN (18, 40)
    OR universe_id = 'TRN688' AND id = 1;
