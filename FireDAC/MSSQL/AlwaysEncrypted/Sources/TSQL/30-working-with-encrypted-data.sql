------------------------------------------------------------------------
-- Event:        Delphi Day 2024 - June 11-12                         --
--               https://www.delphiday.it/                            --
--                                                                    --
-- Session:      SQL Server Encryption: Data protection in a          --
--               Delphi Applications!                                 --
--                                                                    --
-- Demo:         Working with Always Encrypted database               --
-- Author:       Sergio Govoni                                        --
-- Notes:        --                                                   --
------------------------------------------------------------------------

USE [AlwaysEncryptedDB];
GO


-- Enable Always Encrypted (column encryption) set to disabled
-- Query the dbo.Persons

-- SSMS will not be able to decrypt the data stored in the encrypted columns;
-- the following query will return the encrypted data
SELECT * FROM dbo.Persons;
GO


-- Enable Always Encrypted (column encryption) set to enabled
-- SSMS will attempt to decrypt the data stored in the encrypted columns
-- using the previously created cryptographic keys
SELECT * FROM dbo.Persons;
GO


-- Let's try to insert a new record in the dbo.Persons

-- This query will fail
INSERT INTO dbo.Persons
  (FirstName, LastName, SocialSecurityNumber, CreditCardNumber, Salary)
VALUES
  ('Janice', 'Galvin', '327-89-2514', '9999-1111-2222-3333', $38115);
GO


-- Operand type clash: varchar is incompatible with varchar(8000)
-- encrypted with (encryption_type = 'DETERMINISTIC', 
-- encryption_algorithm_name = 'AEAD_AES_256_CBC_HMAC_SHA_256', 
-- column_encryption_key_name = 'CEK_Auto1', 
-- column_encryption_key_database_name = 'AlwaysEncryptedDB') 
-- collation_name = 'SQL_Latin1_General_CP1_CI_AS'

-- When a query tries to insert data into encrypted columns or when it attempts 
-- to filter data based on one or more encrypted columns, passing values or
-- T-SQL variables corresponding to the encrypted columns is not supported

-- Inserting values into encrypted columns is allowed only using parameters

DECLARE
  @SocialSecurityNumber CHAR(11) = '327-89-2514'
  ,@CreditCardNumber CHAR(19) = '9999-1111-2222-3333'
  ,@Salary MONEY = $38115;

INSERT INTO dbo.Persons
  (FirstName, LastName, SocialSecurityNumber, CreditCardNumber, Salary)
VALUES
  ('Janice', 'Galvin', @SocialSecurityNumber, @CreditCardNumber, @Salary);
GO


-- Encryption scheme mismatch for columns/variables '@SocialSecurityNumber'.
-- The encryption scheme for the columns/variables is (encryption_type = 'PLAINTEXT')
-- and the expression near line '6' expects it to be DETERMINISTIC, or PLAINTEXT


-- Enabling parameterization for Always Encrypted
-- https://learn.microsoft.com/sql/relational-databases/security/encryption/always-encrypted-query-columns-ssms#enabling-and-disabling-parameterization-for-always-encrypted


DECLARE
  @SocialSecurityNumber CHAR(11) = '327-89-2514'
  ,@CreditCardNumber CHAR(19) = '9999-1111-2222-3333'
  ,@Salary MONEY = $38115;

INSERT INTO dbo.Persons
  (FirstName, LastName, SocialSecurityNumber, CreditCardNumber, Salary)
VALUES
  ('Janice', 'Galvin', @SocialSecurityNumber, @CreditCardNumber, @Salary);
GO


-- UPDATEs into a table with encrypted columns
DECLARE
  @Salary MONEY = $38615;

UPDATE
  dbo.Persons
SET
  Salary = @Salary
WHERE
  FirstName = 'Janice';
GO


DECLARE
  @SocialSecurityNumber CHAR(11) = '795-00-0000';

UPDATE
  dbo.Persons
SET
  SocialSecurityNumber = @SocialSecurityNumber
WHERE
  FirstName = 'Janice';
GO


/*
DECLARE @NonEncryptedValue CHAR(11) = '795-00-0000';

UPDATE
  dbo.Persons
SET
  SocialSecurityNumber = @NonEncryptedValue;
GO
*/