------------------------------------------------------------------------
-- Event:        Delphi Day 2024 - June 11-12                         --
--               https://www.delphiday.it/                            --
--                                                                    --
-- Session:      SQL Server Encryption: Data protection in a          --
--               Delphi Applications!                                 --
--                                                                    --
-- Demo:         Setup databases (reset DB)                           --
-- Author:       Sergio Govoni                                        --
-- Notes:        --                                                   --
------------------------------------------------------------------------

USE [master];
GO


-- Drop sample database
IF (DB_ID('AlwaysEncryptedDB') IS NOT NULL)
BEGIN
  ALTER DATABASE [AlwaysEncryptedDB]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

  DROP DATABASE [AlwaysEncryptedDB];
END;
GO


CREATE DATABASE [AlwaysEncryptedDB]
 ON  PRIMARY 
 (
   NAME = N'AlwaysEncryptedDB'
   ,FILENAME = N'C:\SQL\DBs\AlwaysEncryptedDB.mdf'
   ,SIZE = 8192KB
   ,FILEGROWTH = 65536KB
 )
 LOG ON 
 (
   NAME = N'AlwaysEncryptedDB_log'
   ,FILENAME = N'C:\SQL\DBs\AlwaysEncryptedDB_log.ldf'
   ,SIZE = 8192KB
   ,FILEGROWTH = 65536KB
  )
GO


USE [AlwaysEncryptedDB];
GO


CREATE TABLE dbo.Person
(
  ID INTEGER IDENTITY(1, 1) NOT NULL
  ,FirstName NVARCHAR(64) NOT NULL
  ,LastName NVARCHAR(64) NOT NULL
  ,SocialSecurityNumber CHAR(11) NOT NULL
    -- COLLATE Latin1_General_BIN2 NOT NULL
  ,CreditCardNumber CHAR(19)
    -- COLLATE Latin1_General_BIN2 NOT NULL
  ,Salary MONEY NOT NULL
    -- COLLATE Latin1_General_BIN2 NOT NULL
);
GO


INSERT INTO dbo.Person
  (FirstName, LastName, SocialSecurityNumber, CreditCardNumber, Salary)
VALUES
  ('Rob', 'Walters', '795-73-9838', '1111-2222-3333-4444', $31692)
  ,('Gail', 'Erickson', '311-23-4578', '5555-6666-7777-8888', $40984);
GO


SELECT
  SocialSecurityNumber
  ,CreditCardNumber
  ,Salary
  ,ID
  ,FirstName
  ,LastName
FROM
  dbo.Person;
GO