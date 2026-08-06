CREATE TABLE Studio(
    Name varchar(50) PRIMARY KEY,
    DateFounded date,
    President varchar(50)
);

CREATE TABLE Universe(
    Earth varchar(6) PRIMARY KEY,
    EditorialName varchar(50) UNIQUE,
    StudioName varchar(50),
    FOREIGN KEY (StudioName) REFERENCES Studio(Name)
        ON DELETE CASCADE
);

CREATE TABLE Project(
	ID int AUTO_INCREMENT,
	TimelineOrder int,
	Title varchar(100) UNIQUE,
	ReleaseDate date,
    Released tinyint(1) NOT NULL DEFAULT 0,
    Type varchar(20),
    BoxOffice dec(12),
	`Phase` int,
	Saga varchar(20),
    UniverseEarth varchar(6) DEFAULT '199999',
    StudioName varchar(50) DEFAULT 'Marvel Studios',
    PRIMARY KEY (ID, TimelineOrder, Title),
    FOREIGN KEY (UniverseEarth) REFERENCES Universe(Earth)
        ON DELETE CASCADE,
    FOREIGN KEY (StudioName) REFERENCES Studio(Name)
        ON DELETE CASCADE
);
/*
CREATE TABLE MCU(
    ProjectID int,
    ProjectTimelineOrder int,
    ProjectTitle varchar(100),
    `Phase` int,
	Saga varchar(20),
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
        ON DELETE CASCADE
);

CREATE TABLE Film(
    ID int PRIMARY KEY AUTO_INCREMENT,
    ProjectID int,
    ProjectTimelineOrder int,
    ProjectTitle varchar(100),
    RunningTime int,
    BoxOffice dec(12),
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
        ON DELETE CASCADE
);

CREATE TABLE Series(
    ID int PRIMARY KEY AUTO_INCREMENT,
    ProjectID int,
    ProjectTimelineOrder int,
    ProjectTitle varchar(100),
    Episodes int,
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
        ON DELETE CASCADE
);

CREATE TABLE Special(
    ID int PRIMARY KEY AUTO_INCREMENT,
    ProjectID int,
    ProjectTimelineOrder int,
    ProjectTitle varchar(100),
    RunningTime int,
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
        ON DELETE CASCADE
);
*/
CREATE TABLE `Character`(
	LatestAlias varchar(50) PRIMARY KEY,
	FirstName varchar(20),
	LastName varchar(20),
	`Status` varchar(10),
    OriginUniverse varchar(6) DEFAULT '199999',
    OwningStudio varchar(50) DEFAULT 'Marvel Studios',
    FOREIGN KEY (OriginUniverse) REFERENCES Universe(Earth)
        ON DELETE CASCADE,
    FOREIGN KEY (OwningStudio) REFERENCES Studio(Name)
        ON DELETE CASCADE
);

CREATE TABLE ProjectCharacter(
    AppearanceType varchar(50),
    CharacterAlias varchar(50),
    ProjectID int,
    ProjectTimelineOrder int,
    ProjectTitle varchar(100),
    PRIMARY KEY (CharacterAlias, ProjectID, ProjectTimelineOrder, ProjectTitle),
    FOREIGN KEY (CharacterAlias) REFERENCES `Character`(LatestAlias)
        ON DELETE CASCADE,
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
        ON DELETE CASCADE
);

CREATE TABLE CrewMember(
    FirstName varchar(20),
    LastName varchar(20),
    Role varchar(20) NOT NULL,
    PRIMARY KEY (FirstName, LastName)
);

CREATE TABLE ProjectCrewMember(
    CrewMemberFirstName varchar(20),
    CrewMemberLastName varchar(20),
    ProjectID int,
    ProjectTimelineOrder int,
    ProjectTitle varchar(100),
    PRIMARY KEY (CrewMemberFirstName, CrewMemberLastName, ProjectID, ProjectTimelineOrder, ProjectTitle),
    CONSTRAINT CrewMemberName FOREIGN KEY (CrewMemberFirstName, CrewMemberLastName) REFERENCES CrewMember(FirstName, LastName)
        ON DELETE CASCADE,
    FOREIGN KEY (ProjectID, ProjectTimelineOrder, ProjectTitle) REFERENCES Project(ID, TimelineOrder, Title)
        ON DELETE CASCADE
);
