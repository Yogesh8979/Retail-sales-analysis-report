-- ================================================
-- RETAIL SALES PERFORMANCE ANALYSIS
-- Tool: MySQL
-- Description: Data cleaning and analysis queries
-- ================================================

-- ── STEP 1: CHECK RAW DATA(dataset and datatypes) ──────────────────────

use retail_sales_analysis;
 CREATE TABLE retail_sales (
     order_id VARCHAR(20) PRIMARY KEY,
     order_date DATE,
    ship_date DATE,
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    region VARCHAR(50),
    category VARCHAR(50),
     product_name VARCHAR(255),
     sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
     profit DECIMAL(10,2),
     ship_mode VARCHAR(50)
 );

 -- select count(*) as total_rows from retail_sales_dataset;
--  SELECT * 
-- -- FROM retail_sales_dataset
-- -- -- LIMIT 10;
-- -- -- DESCRIBE retail_sales_dataset;




-- ── STEP 2: CHECK DATASET DEEPLY ────────────────────



use retail_sales_analysis;


-- checking null values in each column
-- SELECT
--     SUM(CASE WHEN `Order_ID` IS NULL THEN 1 ELSE 0 END) AS null_order_id,
--     SUM(CASE WHEN `Order_Date` IS NULL THEN 1 ELSE 0 END) AS null_order_date,
--     SUM(CASE WHEN `Ship_Date` IS NULL THEN 1 ELSE 0 END) AS null_ship_date,
--     SUM(CASE WHEN `Customer_ID` IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
--     SUM(CASE WHEN `Customer_Name` IS NULL THEN 1 ELSE 0 END) AS null_customer_name,
--     SUM(CASE WHEN `Segment` IS NULL THEN 1 ELSE 0 END) AS null_segment,
--     SUM(CASE WHEN `Region` IS NULL THEN 1 ELSE 0 END) AS null_region,
--     SUM(CASE WHEN `Category` IS NULL THEN 1 ELSE 0 END) AS null_category,
--     SUM(CASE WHEN `Product_Name` IS NULL THEN 1 ELSE 0 END) AS null_product_name,
--     SUM(CASE WHEN `Sales` IS NULL THEN 1 ELSE 0 END) AS null_sales,
--     SUM(CASE WHEN `Quantity` IS NULL THEN 1 ELSE 0 END) AS null_quantity,
--     SUM(CASE WHEN `Discount` IS NULL THEN 1 ELSE 0 END) AS null_discount,
--     SUM(CASE WHEN `Profit` IS NULL THEN 1 ELSE 0 END) AS null_profit,
--     SUM(CASE WHEN `Ship_Mode` IS NULL THEN 1 ELSE 0 END) AS null_ship_mode
-- FROM retail_sales_dataset;


--  checking for blank values 
-- SELECT
--     SUM(CASE WHEN TRIM(`Order_ID`) = '' THEN 1 ELSE 0 END) AS blank_order_id,
--     SUM(CASE WHEN TRIM(`Customer_ID`) = '' THEN 1 ELSE 0 END) AS blank_customer_id,
--     SUM(CASE WHEN TRIM(`Customer_Name`) = '' THEN 1 ELSE 0 END) AS blank_customer_name,
--     SUM(CASE WHEN TRIM(`Segment`) = '' THEN 1 ELSE 0 END) AS blank_segment,
--     SUM(CASE WHEN TRIM(`Region`) = '' THEN 1 ELSE 0 END) AS blank_region,
--     SUM(CASE WHEN TRIM(`Category`) = '' THEN 1 ELSE 0 END) AS blank_category,
--     SUM(CASE WHEN TRIM(`Product_Name`) = '' THEN 1 ELSE 0 END) AS blank_product_name,
--     SUM(CASE WHEN TRIM(`Ship_Mode`) = '' THEN 1 ELSE 0 END) AS blank_ship_mode
-- FROM retail_sales_dataset;

-- SELECT `Order_ID`, COUNT(*) AS cnt
-- FROM retail_sales_dataset
-- GROUP BY `Order_ID`
-- HAVING COUNT(*) > 1;


-- SELECT 
--     `Order_ID`, `Order_Date`, `Ship_Date`, `Customer_ID`, `Customer_Name`,
--     `Segment`, `Region`, `Category`, `Product_Name`, `Sales`,
--     `Quantity`, `Discount`, `Profit`, `Ship_Mode`,
--     COUNT(*) AS duplicate_count
-- FROM retail_sales_dataset
-- GROUP BY
--     `Order_ID`, `Order_Date`, `Ship_Date`, `Customer_ID`, `Customer_Name`,
--     `Segment`, `Region`, `Category`, `Product_Name`, `Sales`,
--     `Quantity`, `Discount`, `Profit`, `Ship_Mode`
-- HAVING COUNT(*) > 1;



-- SELECT *
-- FROM retail_sales_dataset
-- WHERE `Ship_Date` < `Order_Date`;


-- SELECT *
-- FROM retail_sales_dataset
-- WHERE `Sales` <= 0
--    OR `Quantity` <= 0;


-- SELECT *
-- FROM retail_sales_dataset
-- WHERE `Profit` < 0;


-- SELECT *
-- FROM retail_sales_dataset
-- WHERE `Profit` < 0;


-- SELECT count(*) as negative_discount_rows
-- FROM retail_sales_dataset
-- WHERE `discount` < 0;



-- select 
-- min(discount) as min_discount,
-- max(discount) as max_discount
-- from retail_sales_dataset;

-- SELECT
--     MIN(`Order_Date`) AS first_order_date,
--     MAX(`Order_Date`) AS last_order_date,
--     MIN(`Ship_Date`) AS first_ship_date,
--     MAX(`Ship_Date`) AS last_ship_date
-- FROM retail_sales_dataset;

-- select distinct segment
-- from retail_sales_dataset;

-- select distinct region
-- from retail_sales_dataset;

-- select distinct category
-- from retail_sales_dataset;


-- select distinct ship_mode
-- from retail_sales_dataset;


 

-- ── STEP 3: ADDING IMPORTANT COLUMN FOR ANALYSIS ───────────────────


use retail_sales_analysis;

-- alter table retail_sales_dataset
-- add column order_year int,
-- add column order_month varchar(20),
-- add column shipping_days int;


-- set sql_safe_updates = 0;


-- UPDATE retail_sales_dataset
-- SET 
--     order_year = YEAR(`Order_Date`),
--     order_month = MONTHNAME(`Order_Date`),
--     shipping_days = DATEDIFF(`Ship_Date`, `Order_Date`);



SELECT 
    `Order_ID`,
    `Order_Date`,
    `Ship_Date`,
    order_year,
    order_month,
    shipping_days
FROM retail_sales_dataset
LIMIT 10;



-- ── STEP 4: CREATE NEW TABLE FOR CLEANED DATA ───────────────────


use retail_sales_analysis;
CREATE TABLE retail_sales_cleaned AS
SELECT *
FROM retail_sales_dataset;

