-- SINGLE-TABLE QUERIES

-- (1) Characters that are currently alive or active in the MCU.
SELECT LatestAlias, FirstName, LastName, `Status`
FROM `Character`
WHERE OriginUniverse = '199999'
AND `Status` LIKE 'A%ive'
ORDER BY `Status`;

-- (2) Crew members with first/last name beginning with 'J'.
SELECT DISTINCT *
FROM CrewMember
WHERE FirstName LIKE 'J%'
OR LastName LIKE 'J%'
ORDER BY Role DESC, LastName;

-- (3) Non-MCU projects from 2012-2021.
SELECT Title, ReleaseDate
FROM Project
WHERE ReleaseDate BETWEEN 2012 AND 2021
AND `Phase` IS NULL
AND Saga IS NULL
ORDER BY ReleaseDate;

-- (4) Multiversal character appearances by project.
SELECT ProjectTitle, COUNT(*) AS NumAppearances
FROM ProjectCharacter
WHERE AppearanceType = 'Multiversal'
GROUP BY ProjectTitle;

-- (5) Crew members with 2+ projects.
SELECT CrewMemberFirstName, CrewMemberLastName, COUNT(*) AS NumProjects
FROM ProjectCrewMember
GROUP BY CrewMemberFirstName, CrewMemberLastName
HAVING NumProjects > 2
ORDER BY NumProjects, CrewMemberLastName;

-- (6) Box ofice earnings of film franchises.
SELECT CASE
    WHEN Title LIKE '%Spider-Man%' THEN 'Spider-Man'
    WHEN Title LIKE '%Avengers%' THEN 'Avengers'
    WHEN Title LIKE 'Iron Man%' THEN 'Iron Man'
    WHEN Title LIKE 'Thor%' THEN 'Thor'
    WHEN Title LIKE 'Captain America%' THEN 'Captain America'
    WHEN Title LIKE 'Guardians%' THEN 'Guardians of the Galaxy'
    WHEN Title LIKE 'Deadpool%' THEN 'Deadpool'
    WHEN Title LIKE 'Ant-Man%' THEN 'Ant-Man'
    WHEN Title LIKE 'Black Panther%' THEN 'Black Panther'
    WHEN Title LIKE 'Doctor Strange%' THEN 'Doctor Strange'
    ELSE CASE
        WHEN UniverseEarth = '199999' THEN 'Other MCU'
        WHEN UniverseEarth = 'TRN414' THEN 'X-Men (Revised)'
        WHEN UniverseEarth = 'TRN688' THEN 'SSU'
    END
END AS Franchise, FORMAT(SUM(BoxOffice), 0) AS TotalBoxOffice, StudioName
FROM Project
WHERE BoxOffice IS NOT NULL
GROUP BY Franchise
ORDER BY ReleaseDate, ID;


-- MULTI-TABLE QUERIES

-- (1) Release years and crew members of post-phase 1 projects that made less than $800 million.
SELECT DISTINCT ReleaseDate, CrewMemberFirstName, CrewMemberLastName
FROM Project p, ProjectCrewMember c
WHERE p.Title = c.ProjectTitle
AND p.BoxOffice < 800000000
AND p.Phase > 1;

-- (2) Studios that have created or own a cinematic universe.
SELECT Name, President, (
    SELECT COUNT(*)
    FROM Project p
    WHERE p.StudioName = s.Name
) AS NumProjects
FROM Studio s
WHERE Name IN (
    SELECT StudioName
    FROM Universe
    WHERE Earth IN ('96283', '120703', '199999', 'TRN414', 'TRN688')
)
ORDER BY DateFounded;

-- (3) Directors and their movies.
SELECT CONCAT_WS(' ', c.FirstName, c.LastName) AS Director, d.ProjectTitle
FROM ProjectCrewMember d
JOIN CrewMember c
ON d.CrewMemberFirstName = c.FirstName AND d.CrewMemberLastName = c.LastName
WHERE c.Role = 'Director'
ORDER BY d.ProjectID;

-- (4) Range of box office earnings and highest grossing character for each MCU phase.
SELECT p.Phase, p.Saga, FORMAT(MIN(p.BoxOffice), 0) AS MinBoxOffice, FORMAT(AVG(p.BoxOffice), 0) AS AvgBoxOffice, FORMAT(MAX(p.BoxOffice), 0) AS MaxBoxOffice, a.CharacterAlias AS HighestGrossingCharacter
FROM Project p
JOIN ProjectCharacter a ON p.ID = a.ProjectID AND p.TimelineOrder = a.ProjectTimelineOrder AND p.Title = a.ProjectTitle
WHERE p.UniverseEarth = '199999'
GROUP BY p.Phase
ORDER BY `Phase`, SUM(p.BoxOffice) DESC;

-- (5) Box office earnings for characters with less than 10 appearances.
SELECT a.CharacterAlias, COUNT(*) AS NumAppearances, FORMAT(SUM(BoxOffice), 0) AS TotalBoxOffice, u.EditorialName AS CinematicUniverse
FROM ProjectCharacter a
LEFT JOIN Project p
ON a.ProjectID = p.ID AND a.ProjectTimelineOrder = p.TimelineOrder AND a.ProjectTitle = p.Title
JOIN Universe u
ON p.UniverseEarth = u.Earth
GROUP BY a.CharacterAlias, CinematicUniverse
HAVING NumAppearances < 10
ORDER BY p.ReleaseDate;

-- (6) The major MCU team-up films so far with the status of appearing characters.
SELECT p.Title AS MajorTeamUpFilm, p.ReleaseDate, FORMAT(p.BoxOffice, 0) AS BoxOffice, c.LatestAlias AS CharacterName, c.`Status`, u.EditorialName AS CharacterOriginUniverse
FROM Project p
JOIN ProjectCharacter a ON p.ID = a.ProjectID AND p.TimelineOrder = a.ProjectTimelineOrder AND p.Title = a.ProjectTitle
JOIN `Character` c ON a.CharacterAlias = c.LatestAlias
JOIN Universe u ON c.OriginUniverse = u.Earth
WHERE p.UniverseEarth = '199999'
AND p.ID IN (6, 11, 13, 19, 22, 32)
ORDER BY p.ID DESC;