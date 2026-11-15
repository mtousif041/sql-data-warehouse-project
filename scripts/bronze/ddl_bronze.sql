/*-
==============================================================================

DDL Script: Create Bronze Tables
==============================================================================
Script Purpose:
This script creates tables in the 'bronze' schema, dropping existing tables
if they already exist.
Run this script to re-define the DDL structure of 'bronze' Tables
==============================================================================

*/

-- [[[[step 3]]]] Build Bronze Layer.
CREATE TABLE bronze.crm_cust_info(
 cst_id INT,
 cst_key NVARCHAR(50),
 cst_firstname NVARCHAR(50),
 cst_lastname VARCHAR(50),
 cst_material_status NVARCHAR(50),
 cst_gndr NVARCHAR(50),
 cst_create_date DATE
);


CREATE TABLE bronze.crm_prd_info(
 prd_id INT,
 prd_key NVARCHAR(50),
 prd_nm NVARCHAR(50),
 prd_cost INT,
 prd_line NVARCHAR(50),
 prd_start_dt DATETIME,
 prd_end_dt DATETIME
);

CREATE TABLE bronze.crm_sales_details(
 sls_ord_num NVARCHAR(50),
 sls_prd_key NVARCHAR(50),
 sls_cust_id INT,
 sls_order_dt INT,
 sls_ship_dt INT,
 sls_due_dt INT,
 sls_sales INT,
 sls_quantity INT,
 sls_price INT 
);

-- ====================================================================
-- DDL Script: Create Tables for Bronze Layer (with lowercase column names)
-- ====================================================================

-- 1. Create table for CUST_AZ12.csv
CREATE TABLE bronze.erp_cust_az12 (
    cid   VARCHAR(50),
    bdate DATE,
    gen   VARCHAR(50)
);
GO

-- 2. Create table for LOC_A101.csv
CREATE TABLE bronze.erp_loc_a101 (
    cid   VARCHAR(50),
    cntry VARCHAR(50)
);
GO

-- 3. Create table for PX_CAT_G1V2.csv
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          NVARCHAR(50),
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50)
);
GO

/*  NOTE 
-- SQL SERVER me CREATE OR REPLACE NAHI HOTA iske liye hume T_SQL ka use karna padta hai
--drop karke
IF OBJECT_ID('bronze.erp_loc_a101', 'U')IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO 
CREATE TABLE bronze.erp_loc_a101 (
    cid   VARCHAR(50),
    cntry VARCHAR(50)
);

*/
---------------------------------------------------------------------------------------

