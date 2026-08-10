UPDATE projects
SET is_out = TRUE
WHERE released <= CURRENT_DATE();

UPDATE projects
SET type = CASE
    WHEN box_office IS NOT NULL THEN 'Film'
    WHEN box_office IS NULL THEN 'TV'
END;

UPDATE projects
SET type = 'Special Presentation'
WHERE id IN (39, 41);

UPDATE projects
SET mcu_phase = CASE
    WHEN YEAR(released) BETWEEN 2008 AND 2012 THEN 1
    WHEN YEAR(released) BETWEEN 2013 AND 2015 THEN 2
    WHEN YEAR(released) BETWEEN 2016 AND 2019 THEN 3
    WHEN YEAR(released) BETWEEN 2021 AND 2022 THEN 4
    WHEN YEAR(released) BETWEEN 2023 AND 2024 THEN 5
    WHEN YEAR(released) BETWEEN 2025 AND 2026 THEN 6
END
WHERE studio_name = 'Marvel Studios';

UPDATE projects
SET mcu_saga = CASE
    WHEN mcu_phase BETWEEN 1 AND 3 THEN 'Infinity'
    WHEN mcu_phase BETWEEN 4 AND 6 THEN 'Multiverse'
END
WHERE studio_name = 'Marvel Studios';

UPDATE appearances
SET appearance_type = CASE
    WHEN project_id = (CASE character_alias
        WHEN 'Iron Man' THEN 2
        WHEN 'Nick Fury' THEN 21
    END) THEN 'Normal (Timeline Order)'
    WHEN project_id = (CASE character_alias
        WHEN 'War Machine' THEN 21
        WHEN 'Nick Fury' THEN 5
        WHEN 'Smart Hulk' THEN 21
        WHEN 'Black Widow' THEN 21
        WHEN 'Steve Rogers' THEN 21
        WHEN 'Val' THEN 27
    END) THEN 'Normal (Release Order)'
    WHEN project_id = (CASE character_alias
        WHEN 'Watcher Informant' THEN 22
    END) THEN 'Past Version'
    WHEN project_id = (CASE character_alias
        WHEN 'Thunder' THEN 14
        WHEN 'Steve Rogers' THEN 12
        WHEN 'White Wolf' THEN 12
    END) THEN 'Future Scene'
    WHEN (CASE character_alias
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
    END) THEN 'Footage'
    WHEN (CASE character_alias
        WHEN 'Steve Rogers' THEN project_id IN (23, 29)
        WHEN 'Hank Pym' THEN project_id = 32
    END) THEN 'Picture'
    WHEN project_id = (CASE character_alias
        WHEN 'Black Widow' THEN 31
        WHEN 'Loki' THEN 36
        WHEN 'Steve Rogers' THEN 25
        WHEN 'Thanos' THEN 36
        WHEN 'T\'Challa' THEN 40
    END) THEN 'Flashback'
    WHEN project_id = (CASE character_alias
        WHEN 'Heimdall' THEN 36
        WHEN 'Erik Killmonger' THEN 40
    END) THEN 'Afterlife'
    WHEN project_id = (CASE character_alias
        WHEN 'Iron Man' THEN 23
        WHEN 'Heimdall' THEN 11
        WHEN 'Steve Rogers' THEN 8
        WHEN 'Collector' THEN 19
    END) THEN 'Illusion'
    WHEN project_id = (CASE character_alias
        WHEN 'Blade' THEN 30
    END) THEN 'Voice'
    WHEN project_id = (CASE character_alias
        WHEN 'Steve Rogers' THEN 35
        WHEN 'Kang' THEN 26
        WHEN 'The Watcher' THEN 36
    END) THEN 'Statue'
    WHEN project_id = (CASE character_alias
        WHEN 'Rama-Tut' THEN 33
    END) THEN 'Illustration'
    WHEN (CASE character_alias
        WHEN 'Iron Man' THEN project_id = 39
        WHEN 'Smart Hulk' THEN project_id = 39
        WHEN 'Black Widow' THEN project_id = 39
        WHEN 'Thunder' THEN project_id = 39
        WHEN 'Hawkeye' THEN project_id = 39
        WHEN 'Steve Rogers' THEN project_id IN (31, 32, 34, 39)
    END) THEN 'Art'
    WHEN project_id = (CASE character_alias
        WHEN 'Loki (2012 Time Heist)' THEN 42
        WHEN 'Mobius' THEN 42
        WHEN 'Rama-Tut' THEN 42
        WHEN 'Immortus' THEN 42
        WHEN 'Scarlet Centurion' THEN 42
        WHEN 'Mister Gryphon' THEN 42
        WHEN 'Victor Timely' THEN 42
    END) THEN 'Multiverse'
    WHEN project_id = (CASE character_alias
        WHEN 'Vulture' THEN 3
    END) THEN 'Multiversal Entrance'
    WHEN (project_id = 28 AND character_alias <> 'The Watcher')
    OR project_id = (CASE character_alias
        WHEN 'Thanos' THEN 34
    END) THEN 'Multiversal Variant'
    ELSE 'Normal'
END;
# WHERE appearance_type IS NULL;
