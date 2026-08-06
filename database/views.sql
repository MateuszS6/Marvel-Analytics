CREATE OR REPLACE VIEW MCU AS
SELECT * FROM Project
WHERE StudioName = 'Marvel Studios';

CREATE OR REPLACE VIEW MCU_Movies AS
SELECT ID, TimelineOrder, Title, YEAR(ReleaseDate) AS ReleaseYear, Released, FORMAT(BoxOffice, 0) AS BoxOffice, `Phase`, Saga, StudioName
FROM MCU
WHERE Type = 'Film';

CREATE OR REPLACE VIEW MCU_TV AS
SELECT ID, TimelineOrder, Title, YEAR(ReleaseDate) AS ReleaseYear, Released, Type, `Phase`, Saga, StudioName
FROM MCU
WHERE Type <> 'Film';

CREATE OR REPLACE VIEW Raimiverse AS
SELECT ID, TimelineOrder, Title, ReleaseDate, StudioName
FROM Project
WHERE UniverseEarth = '96283';

CREATE OR REPLACE VIEW Webbverse AS
SELECT ID, TimelineOrder, Title, ReleaseDate, StudioName
FROM Project
WHERE UniverseEarth = '120703';

CREATE OR REPLACE VIEW `X-Men` AS
SELECT ID, TimelineOrder, Title, ReleaseDate, StudioName
FROM Project
WHERE UniverseEarth = 'TRN414';

CREATE OR REPLACE VIEW SSU AS
SELECT ID, TimelineOrder, Title, ReleaseDate, StudioName
FROM Project
WHERE UniverseEarth = 'TRN688';
