INSERT INTO
    appearances (character_id, project_id)
SELECT c.id, p.id
FROM characters c
    CROSS JOIN projects p
WHERE (
        CASE p.universe_id
            WHEN '96283' THEN (
                CASE c.alias
                    WHEN 'Watcher Informant' THEN p.id IN (1, 2, 3)
                    WHEN 'Friendly Neighborhood Spider-Man' THEN p.id IN (1, 2, 3)
                    WHEN 'Green Goblin' THEN p.id IN (1, 3)
                END
            )
            WHEN '120703' THEN (
                CASE c.alias
                    WHEN 'Watcher Informant' THEN p.id IN (1, 2)
                    WHEN 'The Amazing Spider-Man' THEN p.id IN (1, 2)
                END
            )
            WHEN '199999' THEN (
                CASE c.alias
                    WHEN 'Watcher Informant' THEN p.id IN (
                        1,
                        2,
                        3,
                        4,
                        5,
                        6,
                        7,
                        8,
                        9,
                        10,
                        11,
                        12,
                        13,
                        14,
                        15,
                        16,
                        17,
                        18,
                        19,
                        20,
                        21,
                        22
                    )
                    WHEN 'Iron Man' THEN p.id IN (
                        1,
                        2,
                        3,
                        6,
                        7,
                        11,
                        13,
                        16,
                        19,
                        22,
                        23,
                        26,
                        28,
                        39
                    )
                    WHEN 'War Machine' THEN p.id IN (
                        1,
                        3,
                        7,
                        11,
                        13,
                        16,
                        19,
                        21,
                        22,
                        25
                    )
                    WHEN 'Pepper Potts' THEN p.id IN (1, 3, 6, 7, 16, 19, 22, 28)
                    WHEN 'Happy Hogan' THEN p.id IN (1, 3, 7, 16, 22, 23, 28, 32)
                    WHEN 'White Vision' THEN p.id IN (
                        1,
                        3,
                        6,
                        7,
                        11,
                        13,
                        16,
                        19,
                        24,
                        28
                    )
                    WHEN 'Nick Fury' THEN p.id IN (
                        1,
                        3,
                        4,
                        5,
                        6,
                        9,
                        11,
                        19,
                        21,
                        22,
                        23,
                        28
                    )
                    WHEN 'Smart Hulk' THEN p.id IN (
                        2,
                        6,
                        7,
                        11,
                        13,
                        17,
                        19,
                        21,
                        22,
                        26,
                        28,
                        29,
                        38,
                        39
                    )
                    WHEN 'Abomination' THEN p.id IN (2, 29, 38)
                    WHEN 'Thunderbolt Ross' THEN p.id IN (2, 13, 19, 22, 27)
                    WHEN 'Black Widow' THEN p.id IN (
                        3,
                        6,
                        9,
                        11,
                        13,
                        16,
                        17,
                        19,
                        21,
                        22,
                        26,
                        27,
                        28,
                        31,
                        38,
                        39
                    )
                    WHEN 'Thunder' THEN p.id IN (
                        4,
                        6,
                        8,
                        11,
                        14,
                        17,
                        19,
                        22,
                        26,
                        28,
                        36,
                        38,
                        39
                    )
                    WHEN 'Loki' THEN p.id IN (4, 6, 8, 17, 19, 27, 28, 36)
                    WHEN 'Heimdall' THEN p.id IN (4, 6, 11, 17, 19, 36)
                    WHEN 'Mighty Thor' THEN p.id IN (4, 8, 22, 36)
                    WHEN 'Hawkeye' THEN p.id IN (
                        4,
                        6,
                        11,
                        13,
                        16,
                        22,
                        26,
                        27,
                        28,
                        31,
                        39
                    )
                    WHEN 'Steve Rogers' THEN p.id IN (
                        5,
                        6,
                        8,
                        9,
                        11,
                        12,
                        13,
                        16,
                        19,
                        21,
                        22,
                        25,
                        26,
                        27,
                        28,
                        31,
                        32,
                        34,
                        35,
                        39
                    )
                    WHEN 'White Wolf' THEN p.id IN (
                        5,
                        9,
                        12,
                        13,
                        18,
                        19,
                        22,
                        25,
                        28
                    )
                    WHEN 'Thanos' THEN p.id IN (
                        6,
                        10,
                        11,
                        19,
                        22,
                        26,
                        28,
                        34,
                        36
                    )
                    WHEN 'Collector' THEN p.id IN (8, 10, 19, 28)
                    WHEN 'Captain America' THEN p.id IN (9, 11, 12, 13, 19, 22, 25, 28)
                    WHEN 'Scarlet Witch' THEN p.id IN (9, 11, 13, 19, 22, 24, 28, 34)
                    WHEN 'Star-Lord' THEN p.id IN (
                        10,
                        15,
                        19,
                        22,
                        28,
                        36,
                        37,
                        41
                    )
                    WHEN 'Rocket Racoon' THEN p.id IN (10, 15, 19, 22, 36, 37, 41)
                    WHEN 'Groot' THEN p.id IN (10, 15, 19, 22, 36, 37, 41)
                    WHEN 'Drax the Destroyer' THEN p.id IN (10, 15, 19, 22, 36, 37, 41)
                    WHEN 'Gamora' THEN p.id IN (10, 15, 19, 28, 37)
                    WHEN 'Nebula' THEN p.id IN (10, 15, 19, 22, 28, 36, 41)
                    WHEN 'Ultron' THEN p.id IN (11, 28)
                    WHEN 'Ant-Man' THEN p.id IN (12, 13, 16, 20, 22, 28, 42)
                    WHEN 'Wasp' THEN p.id IN (12, 20, 22, 28, 42)
                    WHEN 'Hank Pym' THEN p.id IN (12, 20, 22, 28, 32, 42)
                    WHEN 'M.O.D.O.K.' THEN p.id IN (12, 42)
                    WHEN 'T\'Challa' THEN p.id IN (
                        13,
                        16,
                        18,
                        19,
                        22,
                        27,
                        28,
                        40
                    )
                    WHEN 'Spider-Man' THEN p.id IN (3, 13, 16, 19, 22, 23, 28, 32)
                    WHEN 'Baron Zemo' THEN p.id IN (13, 25)
                    WHEN 'Doctor Strange' THEN p.id IN (14, 17, 19, 22, 28, 34)
                    WHEN 'Wong' THEN p.id IN (14, 19, 22, 28, 29, 34, 38)
                    WHEN 'Mantis' THEN p.id IN (15, 19, 22, 36, 41)
                    WHEN 'Vulture' THEN p.id = 16
                    WHEN 'Black Panther' THEN p.id IN (18, 19, 22, 28, 40)
                    WHEN 'Midnight Angel' THEN p.id IN (18, 19, 22, 28, 40)
                    WHEN 'M\'Baku' THEN p.id IN (18, 19, 22, 28, 40)
                    WHEN 'Erik Killmonger' THEN p.id IN (18, 28, 40)
                    WHEN 'Captain Marvel' THEN p.id IN (21, 22, 28, 29, 35)
                    WHEN 'Talos' THEN p.id IN (21, 23)
                    WHEN 'Loki (2012 Time Heist)' THEN p.id IN (22, 26, 42)
                    WHEN 'Gamora (2014 Time Heist)' THEN p.id = 22
                    WHEN 'Mysterio' THEN p.id IN (23, 32)
                    WHEN 'J. Jonah Jameson' THEN p.id IN (23, 32)
                    WHEN 'U.S. Agent' THEN p.id = 25
                    WHEN 'Val' THEN p.id IN (25, 27, 40)
                    WHEN 'Sylvie (Variant L1190)' THEN p.id = 26
                    WHEN 'Mobius' THEN p.id IN (26, 42)
                    WHEN 'He Who Remains' THEN p.id = 26
                    WHEN 'Kang' THEN p.id = 26
                    WHEN 'Yelena Belova' THEN p.id IN (27, 31)
                    WHEN 'Red Guardian' THEN p.id = 27
                    WHEN 'Taskmaster' THEN p.id = 27
                    WHEN 'The Watcher' THEN p.id IN (28, 36)
                    WHEN 'Shang-Chi' THEN p.id = 29
                    WHEN 'Sersi' THEN p.id = 30
                    WHEN 'Blade' THEN p.id = 30
                    WHEN 'Kate Bishop' THEN p.id = 31
                    WHEN 'Kingpin' THEN p.id = 31
                    WHEN 'Daredevil' THEN p.id IN (32, 38)
                    WHEN 'Green Goblin' THEN p.id = 32
                    WHEN 'The Amazing Spider-Man' THEN p.id = 32
                    WHEN 'Friendly Neighborhood Spider-Man' THEN p.id = 32
                    WHEN 'Lethal Protector' THEN p.id = 32
                    WHEN 'Moon Knight' THEN p.id = 33
                    WHEN 'America Chavez' THEN p.id = 34
                    WHEN 'Ms. Marvel' THEN p.id = 35
                    WHEN 'Gorr the God Butcher' THEN p.id = 36
                    WHEN 'She-Hulk' THEN p.id = 38
                    WHEN 'Werewolf by Night' THEN p.id = 39
                    WHEN 'Namor' THEN p.id = 40
                    WHEN 'Ironheart' THEN p.id = 40
                    WHEN 'Kang the Conqueror' THEN p.id = 42
                    WHEN 'Rama-Tut' THEN p.id IN (33, 42)
                    WHEN 'Immortus' THEN p.id = 42
                    WHEN 'Scarlet Centurion' THEN p.id = 42
                    WHEN 'Mister Gryphon' THEN p.id = 42
                    WHEN 'Victor Timely' THEN p.id = 42
                END
            )
            WHEN 'TRN414' THEN (
                CASE c.alias
                    WHEN 'Watcher Informant' THEN p.timeline_order = 3
                    WHEN 'Logan' THEN p.timeline_order IN (1, 2, 4, 5, 6)
                    WHEN 'Deadpool' THEN p.timeline_order IN (3, 6)
                END
            )
            WHEN 'TRN688' THEN (
                CASE c.alias
                    WHEN 'Watcher Informant' THEN p.timeline_order = 1
                    WHEN 'Lethal Protector' THEN p.timeline_order IN (1, 2)
                    WHEN 'J. Jonah Jameson' THEN p.timeline_order = 2
                    WHEN 'Spider-Man' THEN p.timeline_order = 2
                    WHEN 'Vulture' THEN p.timeline_order = 3
                END
            )
        END
    );

UPDATE appearances
SET
    appearance_type = CASE
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Iron Man' THEN 2
                WHEN 'Nick Fury' THEN 21
            END
        ) THEN 'Standard (Timeline Order)'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'War Machine' THEN 21
                WHEN 'Nick Fury' THEN 5
                WHEN 'Smart Hulk' THEN 21
                WHEN 'Black Widow' THEN 21
                WHEN 'Steve Rogers' THEN 21
                WHEN 'Val' THEN 27
            END
        ) THEN 'Standard (Release Order)'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Watcher Informant' THEN 22
            END
        ) THEN 'Past Version'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Thunder' THEN 14
                WHEN 'Steve Rogers' THEN 12
                WHEN 'White Wolf' THEN 12
            END
        ) THEN 'Future Scene'
        WHEN (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Iron Man' THEN project_id = 26
                WHEN 'War Machine' THEN project_id = 16
                WHEN 'White Vision' THEN project_id = 16
                WHEN 'Smart Hulk' THEN project_id IN (13, 26)
                WHEN 'Black Widow' THEN project_id IN (16, 17, 26)
                WHEN 'Thunder' THEN project_id = 26
                WHEN 'Loki' THEN project_id IN (26, 27)
                WHEN 'Hawkeye' THEN project_id IN (16, 26, 27)
                WHEN 'Steve Rogers' THEN project_id IN (16, 16, 27)
                WHEN 'Thanos' THEN project_id = 26
                WHEN 'Captain America' THEN project_id = 16
                WHEN 'Ant-Man' THEN project_id = 16
                WHEN 'T\'Challa' THEN project_id IN (16, 27)
                WHEN 'Mysterio' THEN project_id = 32
            END
        ) THEN 'Footage'
        WHEN (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Steve Rogers' THEN project_id IN (23, 29)
                WHEN 'Hank Pym' THEN project_id = 32
            END
        ) THEN 'Picture'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Black Widow' THEN 31
                WHEN 'Loki' THEN 36
                WHEN 'Steve Rogers' THEN 25
                WHEN 'Thanos' THEN 36
                WHEN 'T\'Challa' THEN 40
            END
        ) THEN 'Flashback'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Heimdall' THEN 36
                WHEN 'Erik Killmonger' THEN 40
            END
        ) THEN 'Afterlife'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Iron Man' THEN 23
                WHEN 'Heimdall' THEN 11
                WHEN 'Steve Rogers' THEN 8
                WHEN 'Collector' THEN 19
            END
        ) THEN 'Illusion'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Blade' THEN 30
            END
        ) THEN 'Voice'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Steve Rogers' THEN 35
                WHEN 'Kang' THEN 26
                WHEN 'The Watcher' THEN 36
            END
        ) THEN 'Statue'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Rama-Tut' THEN 33
            END
        ) THEN 'Illustration'
        WHEN (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Iron Man' THEN project_id = 39
                WHEN 'Smart Hulk' THEN project_id = 39
                WHEN 'Black Widow' THEN project_id = 39
                WHEN 'Thunder' THEN project_id = 39
                WHEN 'Hawkeye' THEN project_id = 39
                WHEN 'Steve Rogers' THEN project_id IN (31, 32, 34, 39)
            END
        ) THEN 'Art'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Loki (2012 Time Heist)' THEN 42
                WHEN 'Mobius' THEN 42
                WHEN 'Rama-Tut' THEN 42
                WHEN 'Immortus' THEN 42
                WHEN 'Scarlet Centurion' THEN 42
                WHEN 'Mister Gryphon' THEN 42
                WHEN 'Victor Timely' THEN 42
            END
        ) THEN 'Multiverse'
        WHEN (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Vulture' THEN 3
            END
        ) THEN 'Multiversal Entrance'
        WHEN (
            (
                SELECT timeline_order
                FROM projects
                WHERE
                    id = project_id
            ) = 28
            AND (
                SELECT character_alias
                FROM characters
                WHERE
                    id = character_id
            ) <> 'The Watcher'
        )
        OR (
            SELECT timeline_order
            FROM projects
            WHERE
                id = project_id
        ) = (
            CASE (
                    SELECT character_alias
                    FROM characters
                    WHERE
                        id = character_id
                )
                WHEN 'Thanos' THEN 34
            END
        ) THEN 'Multiversal Variant'
        ELSE 'Standard'
    END;