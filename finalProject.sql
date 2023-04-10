USE [NBailey]

CREATE SCHEMA [finalProject]

CREATE USER Blake FOR LOGIN BJohnson
CREATE USER Nik FOR LOGIN NBailey

GRANT
    SELECT, INSERT, ALTER, DELETE, EXECUTE, UPDATE
ON SCHEMA :: finalProject
    TO Blake, Nik
GO


CREATE TABLE gameGenre (
    genreID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    genre NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE publisher (
    publisherID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    publisher NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE developer (
    developerID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    developer NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE contentRating (
    ratingID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ESRBRating NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE platform (
    platformID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    platformName NVARCHAR(MAX) NOT NULL,
    platformType NVARCHAR(MAX) NOT NULL, 
)

CREATE TABLE games (
    title NVARCHAR(MAX) PRIMARY KEY NOT NULL,
    genre INT FOREIGN KEY REFERENCES gameGenre(genreID),
    publisher INT FOREIGN KEY REFERENCES publisher(publisherID),
    release_year INT NOT NULL,
    content_rating INT FOREIGN KEY REFERENCES contentRating(ratingID),
    units_sold INT NULL,
    total_revenue MONEY NOT NULL,
)

-- we'll probably have to make an alias table that the app will use

INSERT INTO publisher (
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

INSERT INTO platform (
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

INSERT INTO gameGenre (
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

INSERT INTO developer (
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


INSERT INTO contentRating (
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

SELECT * FROM gameGenre
SELECT * FROM publisher
SELECT * FROM developer
SELECT * FROM contentRating
SELECT * FROM games
SELECT * FROM platform

INSERT INTO games (
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
VALUES
()

--TODO
-- Separate master table into multiple tables where necessary (entries with multiple values)
-- Add another field in Developer and Platform tables which references the PK in the game table.