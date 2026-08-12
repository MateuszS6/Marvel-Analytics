CREATE OR REPLACE VIEW mcu AS
SELECT
    p.id,
    p.title,
    p.released,
    p.timeline_order,
    p.is_out,
    p.type,
    p.box_office,
    p.universe_id,
    d.phase AS mcu_phase,
    d.saga AS mcu_saga,
    s.name AS studio_name
FROM
    projects p
    JOIN mcu_project_details d ON p.id = d.project_id
    JOIN universes u ON p.universe_id = u.earth
    JOIN studios s ON u.studio_id = s.id
WHERE
    p.universe_id = '199999';

CREATE OR REPLACE VIEW mcu_movies AS
SELECT
    id,
    timeline_order,
    title,
    YEAR(released) AS release_year,
    is_out,
    FORMAT(box_office, 0) AS box_office,
    mcu_phase,
    mcu_saga,
    studio_name
FROM mcu
WHERE
    type = 'Movie';

CREATE OR REPLACE VIEW mcu_tv AS
SELECT
    id,
    timeline_order,
    title,
    YEAR(released) AS release_year,
    is_out,
    type,
    mcu_phase,
    mcu_saga,
    studio_name
FROM mcu
WHERE
    type <> 'Movie';

CREATE OR REPLACE VIEW raimiverse AS
SELECT p.id, p.timeline_order, p.title, p.released, s.name AS studio_name
FROM
    projects p
    JOIN universes u ON p.universe_id = u.earth
    JOIN studios s ON u.studio_id = s.id
WHERE
    universe_id = '96283';

CREATE OR REPLACE VIEW webbverse AS
SELECT p.id, p.timeline_order, p.title, p.released, s.name AS studio_name
FROM
    projects p
    JOIN universes u ON p.universe_id = u.earth
    JOIN studios s ON u.studio_id = s.id
WHERE
    universe_id = '120703';

CREATE OR REPLACE VIEW xmen AS
SELECT p.id, p.timeline_order, p.title, p.released, s.name AS studio_name
FROM
    projects p
    JOIN universes u ON p.universe_id = u.earth
    JOIN studios s ON u.studio_id = s.id
WHERE
    universe_id = 'TRN414';

CREATE OR REPLACE VIEW ssu AS
SELECT p.id, p.timeline_order, p.title, p.released, s.name AS studio_name
FROM
    projects p
    JOIN universes u ON p.universe_id = u.earth
    JOIN studios s ON u.studio_id = s.id
WHERE
    universe_id = 'TRN688';