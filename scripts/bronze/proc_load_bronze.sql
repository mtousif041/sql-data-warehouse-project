
/*
=======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=======================================================================================

Script Purpose:
This stored procedure loads data into the 'bronze' schema from external CSV files.
It performs the following actions:
- Truncates the bronze tables before loading data.
- Uses the BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
None.
This stored procedure does not accept any parameters or return any values.

Usage Example:
EXEC bronze.load_bronze;
=======================================================================================

*/ 
-- [[[[step 4]]]]  Bronze Layer. Devlop SQL Load Scripts STORED PROCEDURE
-- load data dirctly from csv files


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN 
    DECLARE @start_time DATETIME, @end_time DATETIME;

    BEGIN TRY
      SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;
        BULK INSERT bronze.crm_cust_info 
        FROM 'C:\Users\mtous\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
         FIRSTROW = 2, -- means data ki first row 2 start ho rahi hai knyuki 1 pr header hai,
         FIELDTERMINATOR =',',
         TABLOCK  -- it is lock entire table during loading data.
        );
        SET @end_time = GETDATE();
        PRINT 'Load Duration :' + CAST(DATEDIFF(seconds, @start_time,@end_time)AS NVARCHAR)+'seconds'

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_prd_info;
        BULK INSERT bronze.crm_prd_info 
        FROM 'C:\Users\mtous\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
         FIRSTROW = 2, -- means data ki first row 2 start ho rahi hai knyuki 1 pr header hai,
         FIELDTERMINATOR =',',
         TABLOCK  -- it is lock entire table during loading data.
        );
        SET @end_time = GETDATE();
        PRINT 'Load Duration :' + CAST(DATEDIFF(seconds, @start_time,@end_time)AS NVARCHAR)+'seconds'

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;
        BULK INSERT bronze.crm_sales_details 
        FROM 'C:\Users\mtous\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
         FIRSTROW = 2, -- means data ki first row 2 start ho rahi hai knyuki 1 pr header hai,
         FIELDTERMINATOR =',',
         TABLOCK  -- it is lock entire table during loading data.
        );
        SET @end_time = GETDATE();
        PRINT 'Load Duration :' + CAST(DATEDIFF(seconds, @start_time,@end_time)AS NVARCHAR)+'seconds'
        --------------------------------------------------------------
        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101 
        FROM 'C:\Users\mtous\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
        WITH (
         FIRSTROW = 2, -- means data ki first row 2 start ho rahi hai knyuki 1 pr header hai,
         FIELDTERMINATOR =',',
         TABLOCK  -- it is lock entire table during loading data.
        );

        PRINT 'Load Duration :' + CAST(DATEDIFF(seconds, @start_time,@end_time)AS NVARCHAR)+'seconds'
        SET @end_time = GETDATE();

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12 
        FROM 'C:\Users\mtous\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
        WITH (
         FIRSTROW = 2, -- means data ki first row 2 start ho rahi hai knyuki 1 pr header hai,
         FIELDTERMINATOR =',',
         TABLOCK  -- it is lock entire table during loading data.
        );
        SET @end_time = GETDATE();

        PRINT 'Load Duration :' + CAST(DATEDIFF(seconds, @start_time,@end_time)AS NVARCHAR)+'seconds'

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2 
        FROM 'C:\Users\mtous\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
        WITH (
         FIRSTROW = 2, -- means data ki first row 2 start ho rahi hai knyuki 1 pr header hai,
         FIELDTERMINATOR =',',
         TABLOCK  -- it is lock entire table during loading data.
        );
        SET @end_time = GETDATE();
        PRINT 'Load Duration :' + CAST(DATEDIFF(seconds, @start_time,@end_time)AS NVARCHAR)+'seconds'
    
    END TRY 
    BEGIN CATCH
     PRINT 'ERROR OCCURED';
     PRINT 'ERROR Message'+ ERROR_MESSAGE();
     PRINT 'ERROR NUMBER'+ CAST(ERROR_NUMBER() AS NVARCHAR);
    END CATCH

END; 


EXEC bronze.load_bronze;
