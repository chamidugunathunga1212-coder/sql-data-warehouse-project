/*
	Script purpose: This script defines a stored procedure named 'bronze.load_bronze' that loads data into the bronze layer of a data warehouse. 
					The procedure performs the following steps: 
						1. Initializes variables to track the start and end times of the loading process.
						2. Truncates existing data from the target tables in the bronze layer.
						3. Uses the BULK INSERT command to load data from specified CSV files into the corresponding tables in the bronze layer.
						4. Measures and prints the duration of each loading step and the total loading process.
						5. Implements error handling to catch and print any errors that occur during the loading process, including error number, message, line, severity, and state.
						6. Prints messages to indicate the progress of the loading process, including which tables are being loaded and the duration of each step.


*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=======================================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=======================================================================';




		PRINT '-----------------------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-----------------------------------------------------------------------';



		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info <<';
		TRUNCATE TABLE bronze.crm_cust_info;


		PRINT '>> Inserting Data Into: bronze.crm_cust_info <<';
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Data Engineering\data-warehouse-project\datawarehousing\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duraion: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds <<'; 
		PRINT '------------------'




		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info <<';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into: bronze.crm_prd_info <<';
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Data Engineering\data-warehouse-project\datawarehousing\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duraion: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds <<'; 
		PRINT '------------------'



		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details <<';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into: bronze.crm_sales_details <<';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Data Engineering\data-warehouse-project\datawarehousing\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duraion: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds <<'; 
		PRINT '------------------'





		PRINT '-----------------------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-----------------------------------------------------------------------';





		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101 <<';
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into: bronze.erp_loc_a101 <<';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Data Engineering\data-warehouse-project\datawarehousing\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duraion: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds <<'; 
		PRINT '------------------'



		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_az12 <<';
		TRUNCATE TABLE bronze.erp_az12;

		PRINT '>> Inserting Data Into: bronze.erp_az12 <<';
		BULK INSERT bronze.erp_az12
		FROM 'D:\Data Engineering\data-warehouse-project\datawarehousing\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duraion: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds <<'; 
		PRINT '------------------'



		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2 <<';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2 <<';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Data Engineering\data-warehouse-project\datawarehousing\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duraion: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds <<'; 
		PRINT '------------------'

		SET @batch_end_time = GETDATE();

		PRINT '=======================================================================';
		PRINT 'Finished Loading Bronze Layer';
		PRINT 'Total Load Duraion: '+ CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + ' seconds <<';
		PRINT '=======================================================================';

	END TRY
	BEGIN CATCH
		PRINT '=================================================================================='
		PRINT 'Error Occurred While Loading Bronze Layer';
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR(50));
		PRINT 'ERROR Message: ' + ERROR_MESSAGE();
		PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(50));
		PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR(50));
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(50));
		PRINT '=================================================================================='

	END CATCH
END
