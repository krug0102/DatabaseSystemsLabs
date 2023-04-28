USE [BJohnson]

CREATE SCHEMA [Prac]

CREATE TABLE Prac.Quiz1 (
    TeacherID INTEGER PRIMARY KEY,
    FName VARCHAR (50),
    MI VARCHAR (2),
    LName VARCHAR (50),
    State VARCHAR (3),
    HighestDegree VARCHAR (10),
    HireDate DATETIME
)

CREATE TABLE Prac.Quiz2 (
    ClassID INTEGER PRIMARY KEY,
    ClassName VARCHAR(50),
    ClassDiscipline VARCHAR(25),
    Semester VARCHAR(10),
    ClassCredits INTEGER,
    TeacherID INTEGER FOREIGN KEY REFERENCES Prac.Quiz1(TeacherID)
)


INSERT INTO Prac.Quiz1 (
    TeacherID,
    FName,
    MI,
    LName,
    State,
    HighestDegree,
    HireDate
) 
VALUES 
(1, 'Nic', 'X', 'McPhee', 'MN', 'Doctorate', '4/15/96'),
(2, 'Elena', 'X', 'Machkasova', 'RU', 'Doctorate', '11/16/94'),
(3, 'Kristen', 'K', 'Lamberty', 'MN', 'Doctorate', '9/4/00'),
(4, 'Peter', 'X', 'Dolan', 'AK', 'Doctorate', '3/23/08'),
(5, 'Kristofer', 'X', 'Schleiper', 'MN', 'Doctorate', '7/23/21');


INSERT INTO Prac.Quiz2 (
    ClassID,
    ClassName,
    ClassDiscipline,
    Semester,
    ClassCredits,
    TeacherID
) VALUES
(1, 'Progamming Processes and Languages', 'Computer Science', 'F23', 4, 2),
(2, 'Database Systems', 'Computer Science', 'F23', 4, 5),
(3, 'Into to Statistics', 'Statistics', 'S22', 4, 4),
(4, 'Ethical and Social Implications of Technology', 'Intellectual Community', 'S21', 2, 1),
(5, 'Data Structures', 'Computer Science', 'F22', 4, 3),
(6, 'General Physics', 'Physics', 'S24', 5, 5),
(7, 'Mathematical Perspectives', 'Mathematics', 'S24', 4, 2),
(8, 'Drawing From Life', 'Artistic Performance', 'S24', 2, 3),
(9, 'Calculus I', 'Mathematics', 'S24', 5, 4),
(10, 'Linear Algebra', 'Mathematics', 'S22', 4, 2),
(11, 'Beginning Latin II', 'World Language', 'S22', 4, 1),
(12, 'Introduction to Gender, Women, & Sexuality Studies', 'Human Diversity', 'S24', 4, 3),
(13, 'Writing for the Liberal Arts', 'English', 'F19', 4, 5),
(14, 'Problem Solving and Algorith Development', 'Computer Science', 'F19', 4, 1),
(15, 'Computational Data Management & Manipulation', 'Computer Science', 'S23', 4, 5),
(16, 'Class Piano for the Non-Music Major', 'Artistic Performance', 'S21', 1, 2),
(17, 'War and Terrorism', 'Intellectual Community', 'F19', 2, 1),
(18, 'Black Morris', 'Intellectual Community', 'F23', 2, 3),
(19, 'General Chemistry I', 'Chemistry', 'F19', 5, 4),
(20, 'Fitness for Life', 'Sport Studies & Athletics', 'S23', 2, 4);



-- Queries: 

-- 1. Gets all records from Quiz1 and Quiz2 tables
-- Zeke Krug
SELECT * FROM Prac.Quiz1
SELECT * FROM Prac.Quiz2

-- 2. Joins tables Quiz1 and Quiz2 together on the TeacherID with Attributes of Quiz2 displaying first
-- Blake J
SELECT * FROM Prac.Quiz2 JOIN Prac.Quiz1 ON Prac.Quiz2.TeacherID = Prac.Quiz1.TeacherID

-- 3. Same as #2, except no ID attributes
-- Nik Bailey
SELECT 
    ClassName AS Class,
    ClassDiscipline AS Major,
    Semester AS Semester,
    ClassCredits AS Credits,
    Prac.quiz1.FName AS First_Name,
    Prac.Quiz1.MI AS MI,
    Prac.Quiz1.LName AS Last_Name,
    Prac.Quiz1.State AS State,
    Prac.Quiz1.HighestDegree AS Degree,
    Prac.Quiz1.HireDate AS hire_date
FROM Prac.Quiz2 JOIN Prac.Quiz1 ON Prac.Quiz2.TeacherID = Prac.Quiz1.TeacherID

-- 4. Same as #3 but with FName, MI, and LName combined into one field called 'Full Name'
-- Zeke Krug
SELECT 
    ClassName AS Class,
    ClassDiscipline AS Major,
    Semester AS Semester,
    ClassCredits AS Credits,
    Prac.Quiz1.FName + ' ' + Prac.Quiz1.MI + ' ' + Prac.Quiz1.LName AS 'Full Name',
    Prac.Quiz1.State AS State,
    Prac.Quiz1.HighestDegree AS Degree,
    Prac.Quiz1.HireDate AS hire_date
FROM Prac.Quiz2 JOIN Prac.Quiz1 ON Prac.Quiz2.TeacherID = Prac.Quiz1.TeacherID

-- 5. Write a query that shows the Full Name of each teacher and add a count of the number of semesters they -->
-- are teaching in and a count of the number of classes in that semester
-- Blake Johnson
SELECT
CONCAT(Prac.Quiz1.FName, ' ', Prac.Quiz1.MI, ' ', Prac.Quiz1.LName) AS 'Full Name',
Prac.Quiz2.Semester,
COUNT(DISTINCT Prac.Quiz2.ClassID) AS 'Classes Taught'
FROM Prac.Quiz2 JOIN Prac.Quiz1 ON Prac.Quiz2.TeacherID = Prac.Quiz1.TeacherID
GROUP BY Prac.Quiz1.FName, Prac.Quiz1.MI, Prac.Quiz1.LName, Prac.Quiz2.Semester

-- IDK what this is feel free to delete when query 5 is confimed as correct or fixed according to Schleiper
SELECT
COUNT(DISTINCT prac.Quiz2.Semester) AS 'Semesters',
COUNT(DISTINCT prac.Quiz2.ClassName) AS 'Classes'
FROM Prac.Quiz2
GROUP BY TeacherID

SELECT
    CONCAT(q1.FName, ' ', q1.MI, ' ', q1.LName) AS FullName,
    COUNT(DISTINCT q2.Semester) AS Semesters,
    COUNT(q2.ClassID) AS Classes
FROM Prac.Quiz1 q1
JOIN Prac.Quiz2 q2 ON q1.TeacherID = q2.TeacherID
GROUP BY q1.FName, q1.MI, q1.LName

-- 9. Sums up the credits for each semester by discipline and filters by disciplines that have more than 6 total credits
-- Blake Johnson
-- This one divides it further to show how many credits in each semester by discipline (not necessary but double check)
-- Adjust filter value (currently 6) to see other results for these two queries
SELECT 
Prac.Quiz2.ClassDiscipline,
Prac.Quiz2.Semester AS 'Semesters',
SUM(Prac.Quiz2.ClassCredits) AS 'Total Credits'
FROM Prac.Quiz2
GROUP BY Prac.Quiz2.Semester, Prac.Quiz2.ClassDiscipline
HAVING SUM(Prac.Quiz2.ClassCredits) > 6

-- This is the CORRECT query that totals the credits from each semester for every discipline
-- *note that only CSci and Math have over 6 total credits*
SELECT 
Prac.Quiz2.ClassDiscipline,
SUM(Prac.Quiz2.ClassCredits) AS 'Total Credits'
FROM Prac.Quiz2
GROUP BY Prac.Quiz2.ClassDiscipline
HAVING SUM(Prac.Quiz2.ClassCredits) > 1

-- 10. Same as query 4 but adds a sub-query in the WHERE clause that pulls the last semester
-- Not exactly sure what is being asked for here but this sub-query 'pulls' the last semester which -->
-- I translated as being the most recent one or 'S24' in this case
-- Otherwise, this sub-query is easily modifiable to pertain to what Schlieper is asking for
-- Blake Johnson
SELECT 
    ClassName AS Class,
    ClassDiscipline AS Major,
    Semester AS Semester,
    ClassCredits AS Credits,
    CONCAT(Prac.Quiz1.FName, ' ', Prac.Quiz1.MI, ' ', Prac.Quiz1.LName) AS 'Full Name',
    Prac.Quiz1.State,
    Prac.Quiz1.HighestDegree AS Degree,
    Prac.Quiz1.HireDate
FROM Prac.Quiz2 JOIN Prac.Quiz1 ON Prac.Quiz2.TeacherID = Prac.Quiz1.TeacherID
WHERE Prac.Quiz2.Semester NOT IN 
(SELECT Prac.Quiz2.Semester FROM Prac.Quiz2 WHERE Semester = 'S24') 


-- Counts the distinct Semesters and Classes a Professor is teaching
-- TODO: how to display the Full Name


-- This is close to working, but I can't get the JOIN to work
SELECT
Quiz1.FName + ' ' + Quiz1.MI + ' ' + Quiz1.LName AS 'Full Name',
Quiz1.TeacherID
FROM Prac.Quiz1 AS Quiz1 AS Major,
    Semester AS Semester,
    ClassCredits AS Credits,
    Prac.quiz1.FName AS First_Name,
    Prac.Quiz1.MI AS MI,
    Prac.Quiz1.LName AS Last_Name,
    Prac.Quiz1.State AS State,
    Prac.Quiz1.HighestDegree AS Degree,
    Prac.Quiz1.HireDate AS hire_date
FROM Prac.Quiz2 JOIN Prac.Quiz1 ON Prac.Quiz2.TeacherID = Prac.Quiz1.TeacherID
GROUP BY TeacherID) AS Quiz2
ON Quiz1.TeacherID = Quiz2.TeacherID
 AS Major,
    Semester AS Semester,
    ClassCredits AS Credits,
    Prac.quiz1.FName AS First_Name,
    Prac.Quiz1.MI AS MI,
    Prac.Quiz1.LName AS Last_Name,
    Prac.Quiz1.State AS State,
    Prac.Quiz1.HighestDegree AS Degree,
    Prac.Quiz1.HireDate AS hire_date
FROM Prac.Quiz2 JOIN Prac.Quiz1 ON Prac.Quiz2.TeacherID = Prac.Quiz1.TeacherID
