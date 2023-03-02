USE [ZKrug]

CREATE SCHEMA ZKrug.Lab02
GO

CREATE TABLE Lab02.inventory(
    item NVARCHAR(255) NOT NULL,
    unit NVARCHAR(255) NOT NULL,
    amount INTEGER CHECK(amount>=0) NOT NULL, -- Checks to see if the amount is >= 0 when a value is inserted
    id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
)

-- SELECT statement
SELECT
item,unit
FROM
Lab02.inventory

SELECT
unit
FROM
Lab02.inventory

SELECT
unit,unit,item
FROM
Lab02.inventory

SELECT
*
FROM
Lab02.inventory

SELECT
*, item
FROM
Lab02.inventory


-- Renaming a column
SELECT
item AS 'mega stuff'
FROM
Lab02.inventory

SELECT
item AS stuff,
amount,
unit AS 'counting thing'
FROM
Lab02.inventory


-- Getting fancy with columns
SELECT
left(item,3) AS leftiest
FROM
Lab02.inventory

SELECT
*,left(item,3) AS leftiest
FROM
Lab02.inventory

SELECT
"peanut butter jelly" AS time,
item,
unit
FROM
Lab02.inventory

SELECT
left(item,3) AS leftiest
FROM
Lab02.inventory

SELECT
left(item,3)
FROM
Lab02.inventory


-- The WHERE clause