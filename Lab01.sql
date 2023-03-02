USE [ZKrug]

SELECT
*
FROM
dbo.Departments


-- Lab 01

CREATE SCHEMA Lab01
GO

CREATE TABLE [Lab01.test](
    test_field text NOT NULL,
)

INSERT Lab01.test(
    VALUES('Krug')
)

CREATE TABLE [Lab01.workers](
    EMPLOYEE NVARCHAR(255) NOT NULL,
    MANAGER NVARCHAR(255) NOT NULL,
    JOB NVARCHAR(255) NOT NULL,
    SALARY MONEY NOT NULL,
    YEARS_WORKED DECIMAL(10,2) NOT NULL,
)

INSERT Lab01.workers(
    VALUES('Roberts', 'Price', 'Ticket Agent', 12000.00, 0.00)
)
INSERT Lab01.workers(
    VALUES('Ruskin', 'Price', 'Ticket Agent', 13800.00, 1.50)
)
INSERT Lab01.workers(
    VALUES('Raphael', 'Price', 'Ticket Agent', 13800.00, 1.50)
)
INSERT Lab01.workers(
    VALUES('Rayburn', 'Powell', 'Baggage Handler', 14400.00, 2.00)
)
INSERT Lab01.workers(
    VALUES('Rice', 'Porter', 'Flight Mechanic', 21780.00, 2.00)
)
INSERT Lab01.workers(
    VALUES('Price', 'Porter', 'Ticket Agent Manager', 20800.00, 3.00)
)
INSERT Lab01.workers(
    VALUES('Powell', 'Porter', 'Head of Grounds Crew', 20800.00, 3.00)
)
INSERT Lab01.workers(
    VALUES('Porter', 'Porter', 'Chief of Operations', 32210.20, 5.00)
)

SELECT * FROM Lab01.workers