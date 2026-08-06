INSERT INTO ProjectCharacter(CharacterAlias, ProjectID, ProjectTimelineOrder, ProjectTitle)
    SELECT LatestAlias, ID, TimelineOrder, Title
    FROM `Character`, Project
    WHERE (
        CASE UniverseEarth
            WHEN '96283' THEN (CASE LatestAlias
                WHEN 'Watcher Informant' THEN ID IN (1, 2, 3)
                WHEN 'Friendly Neighborhood Spider-Man' THEN ID IN (1, 2, 3)
                WHEN 'Green Goblin' THEN ID IN (1, 3)
            END)
            WHEN '120703' THEN (CASE LatestAlias
                WHEN 'Watcher Informant' THEN ID IN (1, 2)
                WHEN 'The Amazing Spider-Man' THEN ID IN (1, 2)
            END)
            WHEN '199999' THEN (CASE LatestAlias
           	    WHEN 'Watcher Informant' THEN ID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
           	    WHEN 'Iron Man' THEN ID IN (1, 2, 3, 6, 7, 11, 13, 16, 19, 22, 23, 26, 28, 39)
           	    WHEN 'War Machine' THEN ID IN (1, 3, 7, 11, 13, 16, 19, 21, 22, 25)
                WHEN 'Pepper Potts' THEN ID IN (1, 3, 6, 7, 16, 19, 22, 28)
                WHEN 'Happy Hogan' THEN ID IN (1, 3, 7, 16, 22, 23, 28, 32)
                WHEN 'White Vision' THEN ID IN (1, 3, 6, 7, 11, 13, 16, 19, 24, 28)
                WHEN 'Nick Fury' THEN ID IN (1, 3, 4, 5, 6, 9, 11, 19, 21, 22, 23, 28)
           	    WHEN 'Smart Hulk' THEN ID IN (2, 6, 7, 11, 13, 17, 19, 21, 22, 26, 28, 29, 38, 39)
                WHEN 'Abomination' THEN ID IN (2, 29, 38)
                WHEN 'Thunderbolt Ross' THEN ID IN (2, 13, 19, 22, 27)
				WHEN 'Black Widow' THEN ID IN (3, 6, 9, 11, 13, 16, 17, 19, 21, 22, 26, 27, 28, 31, 38, 39)
				WHEN 'Thunder' THEN ID IN (4, 6, 8, 11, 14, 17, 19, 22, 26, 28, 36, 38, 39)
                WHEN 'Loki' THEN ID IN (4, 6, 8, 17, 19, 27, 28, 36)
                WHEN 'Heimdall' THEN ID IN (4, 6, 11, 17, 19, 36)
                WHEN 'Mighty Thor' THEN ID IN (4, 8, 22, 36)
           	    WHEN 'Hawkeye' THEN ID IN (4, 6, 11, 13, 16, 22, 26, 27, 28, 31, 39)
           	    WHEN 'Steve Rogers' THEN ID IN (5, 6, 8, 9, 11, 12, 13, 16, 19, 21, 22, 25, 26, 27, 28, 31, 32, 34, 35, 39)
                WHEN 'White Wolf' THEN ID IN (5, 9, 12, 13, 18, 19, 22, 25, 28)
                WHEN 'Thanos' THEN ID IN (6, 10, 11, 19, 22, 26, 28, 34, 36)
                WHEN 'Collector' THEN ID IN (8, 10, 19, 28)
                WHEN 'Captain America' THEN ID IN (9, 11, 12, 13, 19, 22, 25, 28)
                WHEN 'Scarlet Witch' THEN ID IN (9, 11, 13, 19, 22, 24, 28, 34)
                WHEN 'Star-Lord' THEN ID IN (10, 15, 19, 22, 28, 36, 37, 41)
                WHEN 'Rocket Racoon' THEN ID IN (10, 15, 19, 22, 36, 37, 41)
                WHEN 'Groot' THEN ID IN (10, 15, 19, 22, 36, 37, 41)
                WHEN 'Drax the Destroyer' THEN ID IN (10, 15, 19, 22, 36, 37, 41)
                WHEN 'Gamora' THEN ID IN (10, 15, 19, 28, 37)
                WHEN 'Nebula' THEN ID IN (10, 15, 19, 22, 28, 36, 41)
                WHEN 'Ultron' THEN ID IN (11, 28)
                WHEN 'Ant-Man' THEN ID IN (12, 13, 16, 20, 22, 28, 42)
                WHEN 'Wasp' THEN ID IN (12, 20, 22, 28, 42)
                WHEN 'Hank Pym' THEN ID IN (12, 20, 22, 28, 32, 42)
                WHEN 'M.O.D.O.K.' THEN ID IN (12, 42)
                WHEN 'T\'Challa' THEN ID IN (13, 16, 18, 19, 22, 27, 28, 40)
                WHEN 'Spider-Man' THEN ID IN (3, 13, 16, 19, 22, 23, 28, 32)
                WHEN 'Baron Zemo' THEN ID IN (13, 25)
                WHEN 'Doctor Strange' THEN ID IN (14, 17, 19, 22, 28, 34)
                WHEN 'Wong' THEN ID IN (14, 19, 22, 28, 29, 34, 38)
                WHEN 'Mantis' THEN ID IN (15, 19, 22, 36, 41)
                WHEN 'Vulture' THEN ID = 16
                WHEN 'Black Panther' THEN ID IN (18, 19, 22, 28, 40)
                WHEN 'Midnight Angel' THEN ID IN (18, 19, 22, 28, 40)
                WHEN 'M\'Baku' THEN ID IN (18, 19, 22, 28, 40)
                WHEN 'Erik Killmonger' THEN ID IN (18, 28, 40)
                WHEN 'Captain Marvel' THEN ID IN (21, 22, 28, 29, 35)
                WHEN 'Talos' THEN ID IN (21, 23)
                WHEN 'Loki (2012 Time Heist)' THEN ID IN (22, 26, 42)
                WHEN 'Gamora (2014 Time Heist)' THEN ID = 22
                WHEN 'Mysterio' THEN ID IN (23, 32)
                WHEN 'J. Jonah Jameson' THEN ID IN (23, 32)
                WHEN 'U.S. Agent' THEN ID = 25
                WHEN 'Val' THEN ID IN (25, 27, 40)
                WHEN 'Sylvie (Variant L1190)' THEN ID = 26
                WHEN 'Mobius' THEN ID IN (26, 42)
                WHEN 'He Who Remains' THEN ID = 26
                WHEN 'Kang' THEN ID = 26
                WHEN 'Yelena Belova' THEN ID IN (27, 31)
                WHEN 'Red Guardian' THEN ID = 27
                WHEN 'Taskmaster' THEN ID = 27
                WHEN 'The Watcher' THEN ID IN (28, 36)
                WHEN 'Shang-Chi' THEN ID = 29
                WHEN 'Sersi' THEN ID = 30
                WHEN 'Blade' THEN ID = 30
                WHEN 'Kate Bishop' THEN ID = 31
                WHEN 'Kingpin' THEN ID = 31
                WHEN 'Daredevil' THEN ID IN (32, 38)
                WHEN 'Green Goblin' THEN ID = 32
                WHEN 'The Amazing Spider-Man' THEN ID = 32
                WHEN 'Friendly Neighborhood Spider-Man' THEN ID = 32
           	    WHEN 'Lethal Protector' THEN ID = 32
                WHEN 'Moon Knight' THEN ID = 33
                WHEN 'America Chavez' THEN ID = 34
                WHEN 'Ms. Marvel' THEN ID = 35
                WHEN 'Gorr the God Butcher' THEN ID = 36
                WHEN 'She-Hulk' THEN ID = 38
                WHEN 'Werewolf by Night' THEN ID = 39
                WHEN 'Namor' THEN ID = 40
                WHEN 'Ironheart' THEN ID = 40
                WHEN 'Kang the Conqueror' THEN ID = 42
                WHEN 'Rama-Tut' THEN ID IN (33, 42)
                WHEN 'Immortus' THEN ID = 42
                WHEN 'Scarlet Centurion' THEN ID = 42
                WHEN 'Mister Gryphon' THEN ID = 42
                WHEN 'Victor Timely' THEN ID = 42
           	END)
           	WHEN 'TRN414' THEN (CASE LatestAlias
                WHEN 'Watcher Informant' THEN ID = 3
                WHEN 'Logan' THEN ID IN (1, 2, 4, 5, 6)
           	    WHEN 'Deadpool' THEN ID IN (3, 6)
           	END)
           	WHEN 'TRN688' THEN (CASE LatestAlias
                WHEN 'Watcher Informant' THEN ID = 1
           	    WHEN 'Lethal Protector' THEN ID IN (1, 2)
                WHEN 'J. Jonah Jameson' THEN ID = 2
                WHEN 'Spider-Man' THEN ID = 2
                WHEN 'Vulture' THEN ID = 3
           	END)
        END);
