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


-- Create login with SID
IF EXISTS (SELECT principal_id FROM sys.sql_logins WHERE name = 'Delphi_User')
  DROP LOGIN [Delphi_User];

CREATE LOGIN [Delphi_User] WITH
  PASSWORD = 'DelphiDay2024!'
  ,SID = 0x7427B4ADC1F5F041AAD461C29DCDA151;

SELECT
  [name]
  ,principal_id
  ,[sid]
  ,[type_desc]
FROM
  sys.sql_logins
WHERE [name] = 'Delphi_User';
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


CREATE TABLE dbo.Persons
(
  ID INTEGER IDENTITY(1, 1) NOT NULL
  ,FirstName NVARCHAR(32) NOT NULL
  ,LastName NVARCHAR(32) NOT NULL
  ,SocialSecurityNumber CHAR(11) NOT NULL
    -- COLLATE Latin1_General_BIN2 NOT NULL
  ,CreditCardNumber CHAR(19)
    -- COLLATE Latin1_General_BIN2 NOT NULL
  ,Salary DECIMAL(19, 4) NOT NULL
    -- COLLATE Latin1_General_BIN2 NOT NULL
);
GO


INSERT INTO dbo.Persons
  (FirstName, LastName, SocialSecurityNumber, CreditCardNumber, Salary)
VALUES
  ('Rob', 'Walters', '795-73-9838', '1111-2222-3333-4444', 31692.50)
  ,('Gail', 'Erickson', '311-23-4578', '5555-6666-7777-8888', 40984.30);
GO


SELECT
  ID
  ,FirstName
  ,LastName
  ,SocialSecurityNumber
  ,CreditCardNumber
  ,Salary
FROM
  dbo.Persons;
GO


-- Create database user from login
CREATE USER [Delphi_User] FOR LOGIN [Delphi_User]
  WITH DEFAULT_SCHEMA = dbo;

EXEC sp_addrolemember 'db_datareader', 'Delphi_User';
EXEC sp_addrolemember 'db_datawriter', 'Delphi_User';


SELECT * FROM master.sys.server_principals WHERE [sid] = 0x7427B4ADC1F5F041AAD461C29DCDA151
GO


-- Database master key (CMK)
SELECT * FROM sys.column_master_keys;

-- Column encryption keys (CEK)
SELECT * FROM sys.column_encryption_keys;
GO