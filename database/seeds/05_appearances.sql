INSERT INTO
    appearances (
        character_id,
        project_id,
        appearance_type
    )
SELECT c.id, p.id, appearance.appearance_type
FROM (
        SELECT
            'Iron Man' AS character_alias,
            'Iron Man' AS project_title,
            'Standard' AS appearance_type
        UNION ALL
        SELECT 'Iron Man', 'Iron Man 2', 'Standard'
        UNION ALL
        SELECT 'Iron Man', 'The Avengers', 'Standard'
        UNION ALL
        SELECT 'Iron Man', 'Avengers: Endgame', 'Standard'
        UNION ALL
        SELECT 'Nick Fury', 'Iron Man', 'Standard (Release Order)'
    ) AS appearance
    JOIN characters c ON c.alias = appearance.character_alias
    JOIN projects p ON p.title = appearance.project_title;