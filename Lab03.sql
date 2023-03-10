USE [ZKrug]

CREATE SCHEMA [Lab03]

CREATE USER Blake FOR LOGIN BJohnson
CREATE USER Nik FOR LOGIN NBailey

GRANT
    SELECT, INSERT, ALTER, DELETE, EXECUTE, UPDATE
ON SCHEMA :: Lab03
    TO Blake, Nik
GO


-- Exercises

CREATE TABLE Lab03.master(
    start DATETIME NOT NULL,
    stop DATETIME NOT NULL,
    tid INTEGER PRIMARY KEY IDENTITY(1,1) NOT NULL,
    register INTEGER NOT NULL,
    [user] NVARCHAR(255) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
)

CREATE TABLE Lab03.t_items(
    tid INTEGER NOT NULL FOREIGN KEY REFERENCES Lab03.master(tid),
    pid INTEGER NOT NULL FOREIGN KEY REFERENCES Lab02.inventory(id),
    -- check what type pid is
    price DECIMAL(10,2) NOT NULL,
    gid INTEGER NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
)

CREATE TABLE Lab03.poorDesign(
    uid INTEGER PRIMARY KEY NOT NULL,
    comboName NVARCHAR (255) NOT NULL,
    item INTEGER NOT NULL FOREIGN KEY REFERENCES Lab02.inventory(id),
    -- check what type pid is
    price DECIMAL(10,2) NOT NULL,
    comboCode INTEGER NOT NULL,
)


SELECT * FROM Lab03.master
SELECT * FROM Lab03.t_items
SELECT * FROM Lab03.poorDesign

SELECT * FROM Lab02.inventory
SELECT * FROM Lab02.prices

INSERT INTO Lab03.poorDesign VALUES(1, 'Double Slam', 1, 1.99, 1)
INSERT INTO Lab03.poorDesign VALUES(2, 'Double Slam', 3, 1.99, 1)
INSERT INTO Lab03.poorDesign VALUES(3, 'Quarter Jack special', 6, 2.15, 2)
INSERT INTO Lab03.poorDesign VALUES(4, 'Quarter Jack special', 4, 2.15, 2)
INSERT INTO Lab03.poorDesign VALUES(5, 'Quarter Jack special', 5, 2.15, 2)


SELECT
comboName AS combo,
price AS price,
Lab02.inventory.item AS item
FROM
Lab03.poorDesign
RIGHT JOIN
Lab02.inventory
ON Lab03.poorDesign.item = Lab02.inventory.id


-- Anomalies

CREATE TABLE Lab03.students(
    StudentNum NVARCHAR(255) NOT NULL,
    CourseNum INT NOT NULL,
    StudentName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Course NVARCHAR(255) NOT NULL
)

INSERT INTO Lab03.students VALUES('S21', 9201, 'Jones', 'Edinburgh', 'Accounts')
INSERT INTO Lab03.students VALUES('S21', 9267, 'Jones', 'Edinburgh', 'Physics')
INSERT INTO Lab03.students VALUES('S24', 9267, 'Smith', 'Glasgow', 'Physics')
INSERT INTO Lab03.students VALUES('S30', 9251, 'Richards', 'Manchester', 'Computing')
INSERT INTO Lab03.students VALUES('S30', 9322, 'Richards', 'Manchester', 'Maths')

SELECT * FROM Lab03.students

UPDATE Lab03.students
SET StudentNum = 'S22'
WHERE CourseNum = 9267


-- Normal Forms

    -- First Normal
CREATE TABLE Lab03.firstNormal(
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(255) NOT NULL,
    age INT NOT NULL,
    DOB DATE NOT NULL,
    weight DECIMAL(10,2) NOT NULL
)

INSERT INTO Lab03.firstNormal VALUES('Nik Bailey', 32, '1997-09-11', 232.78)
INSERT INTO Lab03.firstNormal VALUES('Ezekiel Krug', 22, '2000-09-08', 146.30)
INSERT INTO Lab03.firstNormal VALUES('Blake Johnson', 22, '2000-12-05', 218.26)

SELECT * FROM Lab03.firstNormal


    -- Second Normal
CREATE TABLE Lab03.secondNormal(
    member_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    salutation NVARCHAR(5) NOT NULL
)

CREATE TABLE Lab03.movieRentals(
    member_id INT NOT NULL FOREIGN KEY REFERENCES Lab03.secondNormal(member_id),
    movies_rented NVARCHAR(255) NOT NULL
)

INSERT INTO Lab03.movieRentals VALUES (1, 'Harry Potter and the Chamber of Secrets')
INSERT INTO Lab03.movieRentals VALUES (1, 'IT')
INSERT INTO Lab03.movieRentals VALUES (2, 'Mama Mia')
INSERT INTO Lab03.movieRentals VALUES (3, 'Friday Night Lights')
INSERT INTO Lab03.movieRentals VALUES (3, 'John Wick 4')

INSERT INTO Lab03.secondNormal VALUES ('Zeke Krug', 'blakely hall', 'Mr.')
INSERT INTO Lab03.secondNormal VALUES ('Nik Bailey', 'an apartment in Morris', 'Mr.')
INSERT INTO Lab03.secondNormal VALUES ('Blake Johnson', 'a house in Morris', 'Mr.')

SELECT * FROM Lab03.secondNormal
SELECT * FROM Lab03.movieRentals


    -- Third Normal
CREATE TABLE Lab03.thirdNormal(
    member_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    salutation INT NOT NULL FOREIGN KEY REFERECES Lab03.salutations(salutation_id)
)

CREATE TABLE Lab03.salutations(
    salutation_id INT PRIMARY KEY NOT NULL,
    salutation NVARCHAR(5) NOT NULL
)

INSERT INTO Lab03.movieRentals VALUES (1, 'Harry Potter and the Chamber of Secrets')
INSERT INTO Lab03.movieRentals VALUES (1, 'IT')
INSERT INTO Lab03.movieRentals VALUES (2, 'Mama Mia')
INSERT INTO Lab03.movieRentals VALUES (3, 'Friday Night Lights')
INSERT INTO Lab03.movieRentals VALUES (3, 'John Wick 4')

INSERT INTO Lab03.salutations VALUES (1, 'Mr.')
INSERT INTO Lab03.salutations VALUES (2, 'Dr.')

INSERT INTO Lab03.thirdNormal VALUES ('Zeke Krug', 'blakely hall', 1)
INSERT INTO Lab03.thirdNormal VALUES ('Nik Bailey', 'an apartment in Morris', 2)
INSERT INTO Lab03.thirdNormal VALUES ('Blake Johnson', 'a house in Morris', 1)

SELECT * FROM Lab03.thirdNormal
SELECT * FROM Lab03.salutations
SELECT * FROM Lab03.movieRentals

