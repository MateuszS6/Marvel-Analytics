UPDATE Project
SET Released = TRUE
WHERE ReleaseDate <= CURRENT_DATE();

UPDATE Project
SET Released = 2
WHERE ID IN (22, 23, 32);

UPDATE Project
SET Type = CASE
    WHEN BoxOffice IS NOT NULL THEN 'Film'
    WHEN BoxOffice IS NULL THEN 'Original Series'
END;

UPDATE Project
SET Type = 'Special Presentation'
WHERE ID IN (39, 41);

UPDATE Project
SET `Phase` = CASE
    WHEN YEAR(ReleaseDate) BETWEEN 2008 AND 2012 THEN 1
    WHEN YEAR(ReleaseDate) BETWEEN 2013 AND 2015 THEN 2
    WHEN YEAR(ReleaseDate) BETWEEN 2016 AND 2019 THEN 3
    WHEN YEAR(ReleaseDate) BETWEEN 2021 AND 2022 THEN 4
    WHEN YEAR(ReleaseDate) BETWEEN 2023 AND 2024 THEN 5
    WHEN YEAR(ReleaseDate) BETWEEN 2025 AND 2026 THEN 6
END
WHERE StudioName = 'Marvel Studios';

UPDATE Project
SET Saga = CASE
    WHEN `Phase` BETWEEN 1 AND 3 THEN 'Infinity'
    WHEN `Phase` BETWEEN 4 AND 6 THEN 'Multiverse'
END
WHERE StudioName = 'Marvel Studios';

UPDATE ProjectCharacter
SET AppearanceType = CASE
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Iron Man' THEN 2
        WHEN 'Nick Fury' THEN 21
    END) THEN 'Normal (Timeline Order)'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'War Machine' THEN 21
        WHEN 'Nick Fury' THEN 5
        WHEN 'Smart Hulk' THEN 21
        WHEN 'Black Widow' THEN 21
        WHEN 'Steve Rogers' THEN 21
        WHEN 'Val' THEN 27
    END) THEN 'Normal (Release Order)'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Watcher Informant' THEN 22
    END) THEN 'Past Version'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Thunder' THEN 14
        WHEN 'Steve Rogers' THEN 12
        WHEN 'White Wolf' THEN 12
    END) THEN 'Future Scene'
    WHEN (CASE CharacterAlias
        WHEN 'Iron Man' THEN ProjectID = 26
        WHEN 'War Machine' THEN ProjectID = 16
        WHEN 'White Vision' THEN ProjectID = 16
        WHEN 'Smart Hulk' THEN ProjectID IN (13, 26)
        WHEN 'Black Widow' THEN ProjectID IN (16, 17, 26)
        WHEN 'Thunder' THEN ProjectID = 26
        WHEN 'Loki' THEN ProjectID IN (26, 27)
        WHEN 'Hawkeye' THEN ProjectID IN (16, 26, 27)
        WHEN 'Steve Rogers' THEN ProjectID IN (16, 16, 27)
        WHEN 'Thanos' THEN ProjectID = 26
        WHEN 'Captain America' THEN ProjectID = 16
        WHEN 'Ant-Man' THEN ProjectID = 16
        WHEN 'T\'Challa' THEN ProjectID IN (16, 27)
        WHEN 'Mysterio' THEN ProjectID = 32
    END) THEN 'Footage'
    WHEN (CASE CharacterAlias
        WHEN 'Steve Rogers' THEN ProjectID IN (23, 29)
        WHEN 'Hank Pym' THEN ProjectID = 32
    END) THEN 'Picture'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Black Widow' THEN 31
        WHEN 'Loki' THEN 36
        WHEN 'Steve Rogers' THEN 25
        WHEN 'Thanos' THEN 36
        WHEN 'T\'Challa' THEN 40
    END) THEN 'Flashback'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Heimdall' THEN 36
        WHEN 'Erik Killmonger' THEN 40
    END) THEN 'Afterlife'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Iron Man' THEN 23
        WHEN 'Heimdall' THEN 11
        WHEN 'Steve Rogers' THEN 8
        WHEN 'Collector' THEN 19
    END) THEN 'Illusion'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Blade' THEN 30
    END) THEN 'Voice'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Steve Rogers' THEN 35
        WHEN 'Kang' THEN 26
        WHEN 'The Watcher' THEN 36
    END) THEN 'Statue'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Rama-Tut' THEN 33
    END) THEN 'Illustration'
    WHEN (CASE CharacterAlias
        WHEN 'Iron Man' THEN ProjectID = 39
        WHEN 'Smart Hulk' THEN ProjectID = 39
        WHEN 'Black Widow' THEN ProjectID = 39
        WHEN 'Thunder' THEN ProjectID = 39
        WHEN 'Hawkeye' THEN ProjectID = 39
        WHEN 'Steve Rogers' THEN ProjectID IN (31, 32, 34, 39)
    END) THEN 'Art'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Loki (2012 Time Heist)' THEN 42
        WHEN 'Mobius' THEN 42
        WHEN 'Rama-Tut' THEN 42
        WHEN 'Immortus' THEN 42
        WHEN 'Scarlet Centurion' THEN 42
        WHEN 'Mister Gryphon' THEN 42
        WHEN 'Victor Timely' THEN 42
    END) THEN 'Multiverse'
    WHEN ProjectID = (CASE CharacterAlias
        WHEN 'Vulture' THEN 3
    END) THEN 'Multiversal Entrance'
    WHEN (ProjectID = 28 AND CharacterAlias <> 'The Watcher')
    OR ProjectID = (CASE CharacterAlias
        WHEN 'Thanos' THEN 34
    END) THEN 'Multiversal Variant'
    ELSE 'Normal'
END;
# WHERE AppearanceType IS NULL;
