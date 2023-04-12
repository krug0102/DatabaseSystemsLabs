USE [BJohnson]

CREATE SCHEMA [finalProject]

CREATE USER Blake FOR LOGIN BJohnson
CREATE USER Nik FOR LOGIN NBailey

GRANT
    SELECT, INSERT, ALTER, DELETE, EXECUTE, UPDATE
ON SCHEMA :: finalProject
    TO Blake, Nik
GO


CREATE TABLE finalProject.gameGenre (
    genreID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    genre NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE finalProject.publisher (
    publisherID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    publisher NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE finalProject.developer (
    developerID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    developer NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE finalProject.contentRating (
    ratingID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ESRBRating NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE finalProject.platform (
    platformID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    platformName NVARCHAR(MAX) NOT NULL,
    platformType NVARCHAR(MAX) NOT NULL, 
)

CREATE TABLE finalProject.games (
    gameID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    title NVARCHAR(MAX) NOT NULL,
    genre INT FOREIGN KEY REFERENCES finalProject.gameGenre(genreID),
    publisher INT FOREIGN KEY REFERENCES finalProject.publisher(publisherID),
    release_year INT NOT NULL,
    content_rating INT FOREIGN KEY REFERENCES finalProject.contentRating(ratingID),
    units_sold INT NULL,
    total_revenue MONEY NOT NULL,
)

-- we'll probably have to make an alias table that the app will use

INSERT INTO finalProject.publisher (
    publisher
)
VALUES
('2K Games'),
('Sony Computer Entertainment'),
('Microsoft Game Studios'),
('Electronic Arts'),
('Rockstar Games'),
('MTV Games'),
('Blizzard Entertainment'),
('Nintendo'),
('Team Meat'),
('Warner Bros. Interactive Entertainment'),
('Namco Bandai Games'),
('Bethesda Softworks'),
('Mojang'),
('Valve'),
('Ubisoft'),
('Devolver Digital'),
('Telltale Games'),
('3909 LLC'),
('Bungie'),
('Yacht Club Games'),
('Psyonix'),
('Toby Fox'),
('CD Projekt'),
('ConcernedApe'),
('Playdead');

INSERT INTO finalProject.platform (
    platformName,
    platformType
)
VALUES
('Playstation 3', 'console'),
('Xbox 360', 'console'),
('PC', 'desktop'),
('Nintendo DS', 'handheld'),
('Wii', 'console'),
('Macintosh', 'desktop'),
('Nintendo 3DS', 'handheld'),
('Playstation 4', 'console'),
('Xbox One', 'console'),
('Wii U', 'console'),
('Nintendo Switch', 'handheld');

INSERT INTO finalProject.gameGenre (
    genre
)
VALUES
('Action'),
('Adventure'),
('Action-adventure'),
('Turn-based strategy'),
('Platform'),
('Action role-playing'),
('Rhythm'),
('Real-time strategy'),
('Sandbox'),
('Puzzle-platformer'),
('Stealth'),
('First-person shooter'),
('Tactical role-playing'),
('MOBA'),
('Puzzle'),
('Digital collectible card'),
('Sports'),
('Role-playing'),
('Simulation');

INSERT INTO finalProject.developer (
    developer
)
VALUES
('Firaxis Games'),
('Aspyr'),
('Santa Monica Studio'),
('Quantic Dream'),
('Play Dead'),
('Double Eleven'),
('BioWare'),
('Rockstar San Diego'),
('Rockstar North'),
('Harmonix Music Systems'),
('Backbone Entertainment'),
('Blizzard Entertainment'),
('Nintendo EAD Tokyo'),
('Team Meat'),
('Blitworks'),
('Monolith Soft'),
('Rocksteady Studios'),
('WB Games Montreal'),
('FromSoftware'),
('Bethesda Game Studios'),
('Mojang Studios'),
('4J Studios'),
('Other Ocean Interactive'),
('Xbox Game Studios'),
('Valve Corporation'),
('Arkane Studios'),
('Massive Entertainment'),
('Ubisoft Montreal'),
('Ubisoft Shanghai'),
('Intelligent Systems'),
('Nintendo'),
('Nintendo Software Planning & Development'),
('Thatgamecompany'),
('Tricky Pixels'),
('Dennaton Games'),
('Abstraction'),
('Telltale Games'),
('Feral Interactive'),
('2K Games'),
('Irrational Games'),
('2K Marin'),
('2K Australia'),
('Virtual Programming'),
('Rockstar Games'),
('Naughty Dog'),
('3909 LLC'),
('Bungie Inc.'),
('Radical Entertainment'),
('High Moon Studios'),
('Yacht Club Games'),
('FromSoftware Inc.'),
('Psyonix'),
('Toby Fox'),
('CD Projekt RED'),
('CD Projekt'),
('Playdead'),
('Iron Galaxy'),
('ConcernedApe'),
('Naughty Dog'),
('Nintendo Entertainment Planning & Development'),
('Jetpack Interactive');


INSERT INTO finalProject.contentRating (
    ESRBRating
)
VALUES
('E'),
('E 10+'),
('T'),
('M'),
('AO'),
('RP'),
('RP 17+');

SELECT * FROM finalProject.gameGenre
SELECT * FROM finalProject.publisher
SELECT * FROM finalProject.developer
SELECT * FROM finalProject.contentRating
SELECT * FROM finalProject.games
SELECT * FROM finalProject.platform
SELECT * FROM finalProject.testGames

INSERT INTO finalProject.games (
    title,
    genre,
    platform,
    developer,
    publisher,
    release_year,
    content_rating,
    units_sold,
    total_revenue
)

CREATE TABLE finalProject.testGames(
    title NVARCHAR (MAX) NOT NULL,
    year INT NOT NULL,
    genre INT FOREIGN KEY REFERENCES finalProject.gameGenre(genreID)
)

SELECT finalProject.testGames.title, finalProject.testGames.year, finalProject.gameGenre.genre
FROM finalProject.testGames
LEFT JOIN finalProject.gameGenre ON finalProject.testGames.genre=finalProject.gameGenre.genreID

INSERT INTO finalProject.testGames(
    title,
    year,
    genre 
)
VALUES
('Civilization V', 2010, 4),
('God of War III', 2010, 3),
('Heavy Rain', 2010, 2),
('Limbo', 2010, 5),
('Mass Effect 2', 2010, 6),
('Red Dead Redemption', 2010, 3),
('Rock band 3', 2010, 7),
('Starcraft II: Wings of Liberty', 2010, 8),
('Super Mario Galaxay 2', 2010, 5),
('Super Meat Boy', 2010, 5),
('Xenoblade Chronicles', 2010, 6),
('Batman: Arkhma City', 2011, 3),
('Dark Souls', 2011, 6),
('The Elder Scrolls V: Skyrim', 2011, 6),
('Minecraft', 2011, 9),
('Portal 2', 2011, 10),
('Dishonored', 2012, 11),
('Far Cry 3', 2012, 12),
('Fire Emblem: Awakening', 2012, 13),
('Journey', 2012, 2),
('Hotline Miami', 2012, 1),
('The Walking Dead', 2012, 2),
('XCOM: Enemy Unknown', 2012, 4),
('Bioshock Infinite', 2013, 12),
('Dota 2', 2013, 14),
('Grand Theft Auto V', 2013, 3),
('The Last of Us', 2013, 3),
('Papers, Please', 2013, 15),
('Destiny', 2014, 12),
('Hearthstone', 2014, 16),
('Shovel Knight', 2014, 5),
('Bloodborne', 2015, 6),
('Rocket League', 2015, 17),
('Undertale', 2015, 18),
('The Witcher 3: Wild Hunt', 2015, 6),
('Inside', 2016, 5),
('Overwatch', 2016, 12),
('Stardew Valley', 2016, 19),
('Uncharted 4: A Thief''s End', 2016, 3),
('The Legend of Zelda: Breath of the Wild', 2017, 3),
('Super Mario Odyssey', 2017, 5),
('God of War', 2018, 3),
('Red Dead Redemption 2', 2018, 3)

DROP TABLE finalProject.testGames

--TODO
-- Separate master table into multiple tables where necessary (entries with multiple values)
-- Add another field in Developer and Platform tables which references the PK in the game table.
