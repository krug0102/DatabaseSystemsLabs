USE [ZKrug]
USE [NBailey]

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
SELECT * FROM Lab02.pricSELECT * FROM Lab04.PD_comboTable
ign VALUES(4, 'Quarter Jack special', 4, 2.15, 2)
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
    name NVARCHAR(255) PRIMARY KEY



)

create table Lab04.fk_A(
    idA int not null primary key IDENTITY(1,1),
    foreignID int not null foreign key REFERENCES Lab04.fk_B(idB)
)

create table Lab04.fk_B(
    idB int not null primary key IDENTITY(1,1),
    text NVARCHAR(255) not null
)

select * from Lab04.fk_B

insert into Lab04.fk_A values(5),
(6),
(7)

insert into Lab04.fk_B values('hey'), ('hi'), ('hello'), ('hola'), ('aloha'), ('nein'), ('nik dum dum')


CREATE TABLE Lab04.randA (
id INT,
Fname nvarchar(255),
Lname nvarchar(255),
[A] INT,
[B] INT
)


INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (100,'Frank','Caliendo',1,1)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (101,'Bob','Johnson',2,3)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (102,'Henry','Smith',3,4)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (103,'Kara','Howards',4,2)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (104,'Turtle','Smithson',5,9)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (105,'Sarah','Hansen',6,8)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (106,'Angela','Edwards',7,10)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (107,'TJ','Darp',8,7)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (108,'Lindsey','Victor',9,6)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (109,'Sylvia','Sampson',10,11)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (110,'Howard','Jones',11,10)
INSERT INTO Lab04.randA (id,Fname,Lname,A,B) values (111,'Jeremy','Watterson',12,12)


SELECT * FROM Lab04.randA where A BETWEEN 2 AND 9;
SELECT * FROM Lab04.randA where B BETWEEN 2 AND 9;

SELECT * FROM Lab04.randA where A BETWEEN 2 AND 9
UNION
SELECT * FROM Lab04.randA where B BETWEEN 2 AND 9

SELECT * FROM Lab04.randA where A BETWEEN 2 AND 9
UNION ALL
SELECT * FROM Lab04.randA where B BETWEEN 2 AND 9

SELECT * FROM Lab04.randA where A BETWEEN 2 AND 9
UNION ALL
SELECT * FROM Lab04.randA where B BETWEEN 2 AND 9
ORDER BY B


