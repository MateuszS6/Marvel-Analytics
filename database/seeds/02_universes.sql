INSERT INTO universes(earth, editorial_name, studio_id)
SELECT '616', 'Prime Marvel Universe', id
FROM studios WHERE name = 'Marvel Comics';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT '838', NULL, id
FROM studios WHERE name = 'Marvel Studios';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT '1610', 'Ultimate Marvel Universe', id
FROM studios WHERE name = 'Marvel Comics';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT '96283', 'Raimiverse', id
FROM studios WHERE name = 'Sony Pictures';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT '120703', 'Webbverse', id
FROM studios WHERE name = 'Sony Pictures';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT '199999', 'Marvel Cinematic Universe', id
FROM studios WHERE name = 'Marvel Studios';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT 'TRN414', 'Revised X-Men Cinematic Universe', id
FROM studios WHERE name = '20th Century Fox';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT 'TRN688', 'Sony\'s Spider-Man Universe', id
FROM studios WHERE name = 'Sony Pictures';

INSERT INTO universes(earth, editorial_name, studio_id)
SELECT 'TRN700', 'E-1610', id
FROM studios WHERE name = 'Sony Pictures';