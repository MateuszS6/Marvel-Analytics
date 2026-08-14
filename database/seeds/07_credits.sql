INSERT INTO
    credits (
        person_id,
        project_id,
        person_role
    )
SELECT pe.id, pr.id, credit.person_role
FROM (
        SELECT
            'Jon' AS first_name,
            'Favreau' AS last_name,
            'Iron Man' AS project_title,
            'Director' AS person_role
        UNION ALL
        SELECT 'Jon', 'Favreau', 'Iron Man 2', 'Director'
        UNION ALL
        SELECT 'Ramin', 'Djawadi', 'Iron Man', 'Composer'
        UNION ALL
        SELECT 'Ramin', 'Djawadi', 'Eternals', 'Composer'
        UNION ALL
        SELECT 'Alan', 'Silvestri', 'Captain America: The First Avenger', 'Composer'
        UNION ALL
        SELECT 'Alan', 'Silvestri', 'The Avengers', 'Composer'
        UNION ALL
        SELECT 'Alan', 'Silvestri', 'Avengers: Infinity War', 'Composer'
        UNION ALL
        SELECT 'Alan', 'Silvestri', 'Avengers: Endgame', 'Composer'
        UNION ALL
        SELECT 'Joss', 'Whedon', 'The Avengers', 'Director'
        UNION ALL
        SELECT 'Joss', 'Whedon', 'Avengers: Age of Ultron', 'Director'
        UNION ALL
        SELECT 'Brian', 'Tyler', 'Iron Man 3', 'Composer'
        UNION ALL
        SELECT 'Brian', 'Tyler', 'Thor: The Dark World', 'Composer'
        UNION ALL
        SELECT 'Anthony', 'Russo', 'Captain America: The Winter Soldier', 'Director'
        UNION ALL
        SELECT 'Anthony', 'Russo', 'Captain America: Civil War', 'Director'
        UNION ALL
        SELECT 'Anthony', 'Russo', 'Avengers: Infinity War', 'Director'
        UNION ALL
        SELECT 'Anthony', 'Russo', 'Avengers: Endgame', 'Director'
        UNION ALL
        SELECT 'Joe', 'Russo', 'Captain America: The Winter Soldier', 'Director'
        UNION ALL
        SELECT 'Joe', 'Russo', 'Captain America: Civil War', 'Director'
        UNION ALL
        SELECT 'Joe', 'Russo', 'Avengers: Infinity War', 'Director'
        UNION ALL
        SELECT 'Joe', 'Russo', 'Avengers: Endgame', 'Director'
        UNION ALL
        SELECT 'Henry', 'Jackman', 'Captain America: The Winter Soldier', 'Composer'
        UNION ALL
        SELECT 'Henry', 'Jackman', 'Captain America: Civil War', 'Composer'
        UNION ALL
        SELECT 'Henry', 'Jackman', 'The Falcon and the Winter Soldier', 'Composer'
        UNION ALL
        SELECT 'James', 'Gunn', 'Guardians of the Galaxy', 'Director'
        UNION ALL
        SELECT 'James', 'Gunn', 'Guardians of the Galaxy Vol. 2', 'Director'
        UNION ALL
        SELECT 'James', 'Gunn', 'Guardians of the Galaxy Vol. 3', 'Director'
        UNION ALL
        SELECT 'Danny', 'Elfman', 'Spider-Man', 'Composer'
        UNION ALL
        SELECT 'Danny', 'Elfman', 'Spider-Man 2', 'Composer'
        UNION ALL
        SELECT 'Danny', 'Elfman', 'Avengers: Age of Ultron', 'Composer'
        UNION ALL
        SELECT 'Danny', 'Elfman', 'Doctor Strange in the Multiverse of Madness', 'Composer'
        UNION ALL
        SELECT 'Michael', 'Giacchino', 'Spider-Man: Homecoming', 'Composer'
        UNION ALL
        SELECT 'Michael', 'Giacchino', 'Spider-Man: Far From Home', 'Composer'
        UNION ALL
        SELECT 'Michael', 'Giacchino', 'Spider-Man: No Way Home', 'Composer'
        UNION ALL
        SELECT 'Michael', 'Giacchino', 'Doctor Strange', 'Composer'
        UNION ALL
        SELECT 'Michael', 'Giacchino', 'Werewolf by Night', 'Composer'
        UNION ALL
        SELECT 'Michael', 'Giacchino', 'Thor: Love and Thunder', 'Composer'
        UNION ALL
        SELECT 'Ludwig', 'Göransson', 'Black Panther', 'Composer'
        UNION ALL
        SELECT 'Ludwig', 'Göransson', 'Black Panther: Wakanda Forever', 'Composer'
        UNION ALL
        SELECT 'Ludwig', 'Göransson', 'Venom', 'Composer'
    ) AS credit
    JOIN people pe ON pe.first_name = credit.first_name
    AND pe.last_name = credit.last_name
    JOIN projects pr ON pr.title = credit.project_title;