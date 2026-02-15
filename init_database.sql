/*
	Create a data warehouse database with three schemas: bronze, silver, and gold.
	If the database already exists, drop it before creating a new one.

*/



USE master;
GO

-- Drop the data warehouse database if it already existsq
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	DROP DATABASE DataWarehouse;
END



GO

-- Create the data warehouse database
CREATE DATABASE DataWarehouse;

GO

-- Switch to the data warehouse database
USE DataWarehouse;

GO

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
