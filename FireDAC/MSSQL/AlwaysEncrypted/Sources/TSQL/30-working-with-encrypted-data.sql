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


-- INSERTs into a table with encrypted columns

-- It fails
INSERT INTO dbo.Person
  (FirstName, LastName, SocialSecurityNumber, CreditCardNumber, Salary)
VALUES
  ('Janice', 'Galvin', '327-89-2514', '9999-1111-2222-3333', $38115);
GO



DECLARE
  @SocialSecurityNumber CHAR(11) = '327-89-2514'
  ,@CreditCardNumber CHAR(19) = '9999-1111-2222-3333'
  ,@Salary MONEY = $38115;

INSERT INTO dbo.Person
  (FirstName, LastName, SocialSecurityNumber, CreditCardNumber, Salary)
VALUES
  ('Janice', 'Galvin', @SocialSecurityNumber, @CreditCardNumber, @Salary);
GO


-- UPDATEs into a table with encrypted columns
DECLARE
  @Salary MONEY = $38615;

UPDATE
  dbo.Person
SET
  Salary = @Salary
WHERE
  FirstName = 'Janice';


DECLARE
  @SocialSecurityNumber CHAR(11) = '795-00-0000';

UPDATE
  dbo.Person
SET
  SocialSecurityNumber = @SocialSecurityNumber
WHERE
  FirstName = 'Janice';

DECLARE @NonEncryptedValue CHAR(11) = '795-00-0000'; UPDATE dbo.Person SET SocialSecurityNumber = @NonEncryptedValue
