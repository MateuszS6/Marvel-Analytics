INSERT INTO appearances(character_alias, project_id, project_timeline_order, project_title)
    SELECT alias, id, timeline_order, title
    FROM characters, projects
    WHERE (
        CASE universe_id
            WHEN '96283' THEN (CASE alias
                WHEN 'Watcher Informant' THEN id IN (1, 2, 3)
                WHEN 'Friendly Neighborhood Spider-Man' THEN id IN (1, 2, 3)
                WHEN 'Green Goblin' THEN id IN (1, 3)
            END)
            WHEN '120703' THEN (CASE alias
                WHEN 'Watcher Informant' THEN id IN (1, 2)
                WHEN 'The Amazing Spider-Man' THEN id IN (1, 2)
            END)
            WHEN '199999' THEN (CASE alias
           	    WHEN 'Watcher Informant' THEN id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
           	    WHEN 'Iron Man' THEN id IN (1, 2, 3, 6, 7, 11, 13, 16, 19, 22, 23, 26, 28, 39)
           	    WHEN 'War Machine' THEN id IN (1, 3, 7, 11, 13, 16, 19, 21, 22, 25)
                WHEN 'Pepper Potts' THEN id IN (1, 3, 6, 7, 16, 19, 22, 28)
                WHEN 'Happy Hogan' THEN id IN (1, 3, 7, 16, 22, 23, 28, 32)
                WHEN 'White Vision' THEN id IN (1, 3, 6, 7, 11, 13, 16, 19, 24, 28)
                WHEN 'Nick Fury' THEN id IN (1, 3, 4, 5, 6, 9, 11, 19, 21, 22, 23, 28)
           	    WHEN 'Smart Hulk' THEN id IN (2, 6, 7, 11, 13, 17, 19, 21, 22, 26, 28, 29, 38, 39)
                WHEN 'Abomination' THEN id IN (2, 29, 38)
                WHEN 'Thunderbolt Ross' THEN id IN (2, 13, 19, 22, 27)
				WHEN 'Black Widow' THEN id IN (3, 6, 9, 11, 13, 16, 17, 19, 21, 22, 26, 27, 28, 31, 38, 39)
				WHEN 'Thunder' THEN id IN (4, 6, 8, 11, 14, 17, 19, 22, 26, 28, 36, 38, 39)
                WHEN 'Loki' THEN id IN (4, 6, 8, 17, 19, 27, 28, 36)
                WHEN 'Heimdall' THEN id IN (4, 6, 11, 17, 19, 36)
                WHEN 'Mighty Thor' THEN id IN (4, 8, 22, 36)
           	    WHEN 'Hawkeye' THEN id IN (4, 6, 11, 13, 16, 22, 26, 27, 28, 31, 39)
           	    WHEN 'Steve Rogers' THEN id IN (5, 6, 8, 9, 11, 12, 13, 16, 19, 21, 22, 25, 26, 27, 28, 31, 32, 34, 35, 39)
                WHEN 'White Wolf' THEN id IN (5, 9, 12, 13, 18, 19, 22, 25, 28)
                WHEN 'Thanos' THEN id IN (6, 10, 11, 19, 22, 26, 28, 34, 36)
                WHEN 'Collector' THEN id IN (8, 10, 19, 28)
                WHEN 'Captain America' THEN id IN (9, 11, 12, 13, 19, 22, 25, 28)
                WHEN 'Scarlet Witch' THEN id IN (9, 11, 13, 19, 22, 24, 28, 34)
                WHEN 'Star-Lord' THEN id IN (10, 15, 19, 22, 28, 36, 37, 41)
                WHEN 'Rocket Racoon' THEN id IN (10, 15, 19, 22, 36, 37, 41)
                WHEN 'Groot' THEN id IN (10, 15, 19, 22, 36, 37, 41)
                WHEN 'Drax the Destroyer' THEN id IN (10, 15, 19, 22, 36, 37, 41)
                WHEN 'Gamora' THEN id IN (10, 15, 19, 28, 37)
                WHEN 'Nebula' THEN id IN (10, 15, 19, 22, 28, 36, 41)
                WHEN 'Ultron' THEN id IN (11, 28)
                WHEN 'Ant-Man' THEN id IN (12, 13, 16, 20, 22, 28, 42)
                WHEN 'Wasp' THEN id IN (12, 20, 22, 28, 42)
                WHEN 'Hank Pym' THEN id IN (12, 20, 22, 28, 32, 42)
                WHEN 'M.O.D.O.K.' THEN id IN (12, 42)
                WHEN 'T\'Challa' THEN id IN (13, 16, 18, 19, 22, 27, 28, 40)
                WHEN 'Spider-Man' THEN id IN (3, 13, 16, 19, 22, 23, 28, 32)
                WHEN 'Baron Zemo' THEN id IN (13, 25)
                WHEN 'Doctor Strange' THEN id IN (14, 17, 19, 22, 28, 34)
                WHEN 'Wong' THEN id IN (14, 19, 22, 28, 29, 34, 38)
                WHEN 'Mantis' THEN id IN (15, 19, 22, 36, 41)
                WHEN 'Vulture' THEN id = 16
                WHEN 'Black Panther' THEN id IN (18, 19, 22, 28, 40)
                WHEN 'Midnight Angel' THEN id IN (18, 19, 22, 28, 40)
                WHEN 'M\'Baku' THEN id IN (18, 19, 22, 28, 40)
                WHEN 'Erik Killmonger' THEN id IN (18, 28, 40)
                WHEN 'Captain Marvel' THEN id IN (21, 22, 28, 29, 35)
                WHEN 'Talos' THEN id IN (21, 23)
                WHEN 'Loki (2012 Time Heist)' THEN id IN (22, 26, 42)
                WHEN 'Gamora (2014 Time Heist)' THEN id = 22
                WHEN 'Mysterio' THEN id IN (23, 32)
                WHEN 'J. Jonah Jameson' THEN id IN (23, 32)
                WHEN 'U.S. Agent' THEN id = 25
                WHEN 'Val' THEN id IN (25, 27, 40)
                WHEN 'Sylvie (Variant L1190)' THEN id = 26
                WHEN 'Mobius' THEN id IN (26, 42)
                WHEN 'He Who Remains' THEN id = 26
                WHEN 'Kang' THEN id = 26
                WHEN 'Yelena Belova' THEN id IN (27, 31)
                WHEN 'Red Guardian' THEN id = 27
                WHEN 'Taskmaster' THEN id = 27
                WHEN 'The Watcher' THEN id IN (28, 36)
                WHEN 'Shang-Chi' THEN id = 29
                WHEN 'Sersi' THEN id = 30
                WHEN 'Blade' THEN id = 30
                WHEN 'Kate Bishop' THEN id = 31
                WHEN 'Kingpin' THEN id = 31
                WHEN 'Daredevil' THEN id IN (32, 38)
                WHEN 'Green Goblin' THEN id = 32
                WHEN 'The Amazing Spider-Man' THEN id = 32
                WHEN 'Friendly Neighborhood Spider-Man' THEN id = 32
           	    WHEN 'Lethal Protector' THEN id = 32
                WHEN 'Moon Knight' THEN id = 33
                WHEN 'America Chavez' THEN id = 34
                WHEN 'Ms. Marvel' THEN id = 35
                WHEN 'Gorr the God Butcher' THEN id = 36
                WHEN 'She-Hulk' THEN id = 38
                WHEN 'Werewolf by Night' THEN id = 39
                WHEN 'Namor' THEN id = 40
                WHEN 'Ironheart' THEN id = 40
                WHEN 'Kang the Conqueror' THEN id = 42
                WHEN 'Rama-Tut' THEN id IN (33, 42)
                WHEN 'Immortus' THEN id = 42
                WHEN 'Scarlet Centurion' THEN id = 42
                WHEN 'Mister Gryphon' THEN id = 42
                WHEN 'Victor Timely' THEN id = 42
           	END)
           	WHEN 'TRN414' THEN (CASE alias
                WHEN 'Watcher Informant' THEN id = 3
                WHEN 'Logan' THEN id IN (1, 2, 4, 5, 6)
           	    WHEN 'Deadpool' THEN id IN (3, 6)
           	END)
           	WHEN 'TRN688' THEN (CASE alias
                WHEN 'Watcher Informant' THEN id = 1
           	    WHEN 'Lethal Protector' THEN id IN (1, 2)
                WHEN 'J. Jonah Jameson' THEN id = 2
                WHEN 'Spider-Man' THEN id = 2
                WHEN 'Vulture' THEN id = 3
           	END)
        END);
