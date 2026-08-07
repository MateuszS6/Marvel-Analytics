-- DROP EXISTING TABLES/VIEWS

DROP TABLE IF EXISTS ProjectCharacter;
DROP TABLE IF EXISTS ProjectCrewMember;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS `Character`;
DROP TABLE IF EXISTS CrewMember;
DROP TABLE IF EXISTS Universe;
DROP TABLE IF EXISTS Studio;

DROP TABLE IF EXISTS MCU;
DROP TABLE IF EXISTS MCU_Movies;
DROP TABLE IF EXISTS MCU_TV;
DROP TABLE IF EXISTS Raimiverse;
DROP TABLE IF EXISTS Webbverse;
DROP TABLE IF EXISTS `X-Men`;
DROP TABLE IF EXISTS SSU;


-- CREATE TABLES

CREATE TABLE Studio (
    Name VARCHAR(50) PRIMARY KEY,
    DateFounded DATE NULL,
    President VARCHAR(50)
);

CREATE TABLE Universe (
    Earth VARCHAR(6) PRIMARY KEY,
    EditorialName VARCHAR(50) UNIQUE,
    StudioName VARCHAR(50),
    FOREIGN KEY (StudioName) REFERENCES Studio (Name) ON DELETE CASCADE
);

CREATE TABLE Project (
    ID INT AUTO_INCREMENT,
    TimelineOrder INT,
    Title VARCHAR(100) UNIQUE,
    ReleaseDate DATE,
    Released TINYINT(1) NOT NULL DEFAULT 0,
    Type VARCHAR(20),
    BoxOffice DEC(12),
    `Phase` INT,
    Saga VARCHAR(20),
    UniverseEarth VARCHAR(6) DEFAULT '199999',
    StudioName VARCHAR(50) DEFAULT 'Marvel Studios',
    PRIMARY KEY (ID, TimelineOrder, Title),
    FOREIGN KEY (UniverseEarth) REFERENCES Universe (Earth) ON DELETE CASCADE,
    FOREIGN KEY (StudioName) REFERENCES Studio (Name) ON DELETE CASCADE
);

/*
CREATE TABLE MCU (
    ProjectID INT,
    ProjectTimelineOrder INT,
    ProjectTitle VARCHAR(100),
    `Phase` INT,
    Saga VARCHAR(20),
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
    ON DELETE CASCADE
);

CREATE TABLE Film (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    ProjectTimelineOrder INT,
    ProjectTitle VARCHAR(100),
    RunningTime INT,
    BoxOffice DEC(12),
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
    ON DELETE CASCADE
);

CREATE TABLE Series (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    ProjectTimelineOrder INT,
    ProjectTitle VARCHAR(100),
    Episodes INT,
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
    ON DELETE CASCADE
);

CREATE TABLE Special (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    ProjectTimelineOrder INT,
    ProjectTitle VARCHAR(100),
    RunningTime INT,
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
    ON DELETE CASCADE
);
*/

CREATE TABLE `Character` (
    LatestAlias VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    `Status` VARCHAR(10),
    OriginUniverse VARCHAR(6) DEFAULT '199999',
    OwningStudio VARCHAR(50) DEFAULT 'Marvel Studios',
    FOREIGN KEY (OriginUniverse) REFERENCES Universe (Earth) ON DELETE CASCADE,
    FOREIGN KEY (OwningStudio) REFERENCES Studio (Name) ON DELETE CASCADE
);

CREATE TABLE ProjectCharacter (
    AppearanceType VARCHAR(50),
    CharacterAlias VARCHAR(50),
    ProjectID INT,
    ProjectTimelineOrder INT,
    ProjectTitle VARCHAR(100),
    PRIMARY KEY (
        CharacterAlias,
        ProjectID,
        ProjectTimelineOrder,
        ProjectTitle
    ),
    FOREIGN KEY (CharacterAlias) REFERENCES `Character` (LatestAlias) ON DELETE CASCADE,
    FOREIGN KEY (
        ProjectID,
        ProjectTimelineOrder,
        ProjectTitle
    ) REFERENCES Project (ID, TimelineOrder, Title) ON DELETE CASCADE
);

CREATE TABLE CrewMember (
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Role VARCHAR(20) NOT NULL,
    PRIMARY KEY (FirstName, LastName)
);

CREATE TABLE ProjectCrewMember (
    CrewMemberFirstName VARCHAR(20),
    CrewMemberLastName VARCHAR(20),
    ProjectID INT,
    ProjectTimelineOrder INT,
    ProjectTitle VARCHAR(100),
    PRIMARY KEY (
        CrewMemberFirstName,
        CrewMemberLastName,
        ProjectID,
        ProjectTimelineOrder,
        ProjectTitle
    ),
    CONSTRAINT CrewMemberName FOREIGN KEY (
        CrewMemberFirstName,
        CrewMemberLastName
    ) REFERENCES CrewMember (FirstName, LastName) ON DELETE CASCADE,
    FOREIGN KEY (
        ProjectID,
        ProjectTimelineOrder,
        ProjectTitle
    ) REFERENCES Project (ID, TimelineOrder, Title) ON DELETE CASCADE
);