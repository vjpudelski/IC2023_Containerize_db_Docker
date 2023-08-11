USE master;
IF db_id('indy_myapp') IS NOT NULL
  DROP DATABASE indy_myapp;
GO

CREATE DATABASE indy_myapp;
GO

IF NOT EXISTS(SELECT name FROM sys.server_principals WHERE name = 'dbo_indycode')
BEGIN
  CREATE LOGIN [dbo_indycode] WITH PASSWORD = N'IndyC0d3'

  ALTER LOGIN [dbo_indycode] ENABLE
END
GO

USE indy_myapp;
GO

CREATE USER dbo_indycode FOR LOGIN dbo_indycode WITH DEFAULT_SCHEMA = [DBO]
GO

ALTER ROLE db_owner ADD MEMBER dbo_indycode
GO

CREATE TABLE orders (
    order_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    order_date DATE
)

SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT INTO orders (order_id, order_date) VALUES
(1, GETDATE()-1),
(2, GETDATE())

SET IDENTITY_INSERT [dbo].[orders] OFF 
