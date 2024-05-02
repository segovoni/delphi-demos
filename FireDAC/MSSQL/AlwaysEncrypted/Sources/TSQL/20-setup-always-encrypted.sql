------------------------------------------------------------------------
-- Event:        Delphi Day 2024 - June 11-12                         --
--               https://www.delphiday.it/                            --
--                                                                    --
-- Session:      SQL Server Encryption: Data protection in a          --
--               Delphi Applications!                                 --
--                                                                    --
-- Demo:         Setup SQL Server Always Encrypted                    --
-- Author:       Sergio Govoni                                        --
-- Notes:        --                                                   --
------------------------------------------------------------------------

USE [master];
GO

-- Always Encrypted documentation
-- https://learn.microsoft.com/azure/azure-sql/database/always-encrypted-landing 


-- Analyze the impacts due to the possible change of COLLATE for the encrypted columns
-- https://learn.microsoft.com/sql/relational-databases/collations/collation-and-unicode-support


-- Analyze possible impacts on client applications (parametric queries, connection strings, supported drivers)
-- https://learn.microsoft.com/sql/relational-databases/security/encryption/always-encrypted-client-development


-- How queries against encrypted columns work
-- https://learn.microsoft.com/sql/relational-databases/security/encryption/always-encrypted-database-engine#how-queries-against-encrypted-columns-work


-- Analyze existing Limitations
-- https://learn.microsoft.com/sql/relational-databases/security/encryption/always-encrypted-database-engine#limitations