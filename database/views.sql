CREATE OR REPLACE VIEW mcu AS
SELECT * FROM projects
WHERE studio_name = 'Marvel Studios';

CREATE OR REPLACE VIEW mcu_movies AS
SELECT id, timeline_order, title, YEAR(released) AS ReleaseYear, is_out, FORMAT(box_office, 0) AS box_office, mcu_phase, mcu_saga, studio_name
FROM mcu
WHERE type = 'Film';

CREATE OR REPLACE VIEW mcu_tv AS
SELECT id, timeline_order, title, YEAR(released) AS ReleaseYear, is_out, type, mcu_phase, mcu_saga, studio_name
FROM mcu
WHERE type <> 'Film';

CREATE OR REPLACE VIEW raimiverse AS
SELECT id, timeline_order, title, released, studio_name
FROM projects
WHERE universe_id = '96283';

CREATE OR REPLACE VIEW webbverse AS
SELECT id, timeline_order, title, released, studio_name
FROM projects
WHERE universe_id = '120703';

CREATE OR REPLACE VIEW xmen AS
SELECT id, timeline_order, title, released, studio_name
FROM projects
WHERE universe_id = 'TRN414';

CREATE OR REPLACE VIEW ssu AS
SELECT id, timeline_order, title, released, studio_name
FROM projects
WHERE universe_id = 'TRN688';
