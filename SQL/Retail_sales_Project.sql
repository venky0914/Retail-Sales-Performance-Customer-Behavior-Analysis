create database sales_data;
use sales_data;
CREATE TABLE retail_sales_data (

customer_id VARCHAR(20),
customer_name VARCHAR(100),
customer_city VARCHAR(50),
customer_state VARCHAR(50),
customer_segment VARCHAR(50),

order_id VARCHAR(20),
order_date DATE,
order_time TIME,
delivery_date DATE,
delivery_days INT,
delivery_status VARCHAR(20),
cancel_reason VARCHAR(100),
day_type VARCHAR(50),

product_id VARCHAR(20),
product_name VARCHAR(100),

brand VARCHAR(50),
category VARCHAR(50),
subcategory VARCHAR(50),

price INT,
discount FLOAT,
quantity INT,
amount INT,
product_cost INT,
earning INT,
profit INT,

customer_rating FLOAT,
product_returned VARCHAR(10),

shipping_cost INT,
order_channel VARCHAR(50),
payment_type VARCHAR(50)

);

-- Importing data into SQL 
-- ===================

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'D:\\Datasets for project\\Sales domain\\E - Commerce\\Retail_sales_cleaned_dataset_valid.csv'
INTO TABLE retail_sales_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select count(*) from retail_sales_data;

-- KPI Analysis --

-- Total Orders

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM retail_sales_data;

-- Total Revenue

SELECT SUM(amount) AS total_revenue
FROM retail_sales_data;

-- Average Order Value

SELECT 
    SUM(amount) / COUNT(DISTINCT order_id) AS avg_order_value
FROM retail_sales_data;

-- otal Profit

SELECT SUM(profit) AS total_profit
FROM retail_sales_data;

-- Profit Margin %

SELECT 
    (SUM(profit) / SUM(amount)) * 100 AS profit_margin
FROM retail_sales_data;

-- 2. PRODUCT & CATEGORY ANALYSIS

-- Revenue by Category
SELECT 
    category,
    SUM(amount) AS revenue
FROM retail_sales_data
GROUP BY category
ORDER BY revenue DESC;

-- Top 5 Products by Revenue

SELECT 
    product_name,
    SUM(amount) AS revenue
FROM retail_sales_data
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 5;

-- Top 5 Brands

SELECT 
    brand,
    SUM(amount) AS revenue
FROM retail_sales_data
GROUP BY brand
ORDER BY revenue DESC
LIMIT 5;

-- 3. TIME ANALYSIS

-- Month-wise Revenue

SELECT 
    MONTH(order_date) AS month,
    SUM(amount) AS revenue
FROM retail_sales_data
GROUP BY MONTH(order_date)
ORDER BY month;

-- Orders by Hour

SELECT 
    HOUR(order_time) AS hour,
    COUNT(order_id) AS total_orders
FROM retail_sales_data
GROUP BY HOUR(order_time)
ORDER BY hour;

-- 4. CUSTOMER ANALYSIS

-- Total Customers

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales_data;

-- Average Customer Rating

SELECT round(AVG(customer_rating),1) AS avg_rating
FROM retail_sales_data;

-- Customer Segment Analysis

SELECT 
    customer_segment,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(amount) AS revenue
FROM retail_sales_data
GROUP BY customer_segment;

-- 5. DELIVERY & OPERATIONS

-- Average Delivery Days 
SELECT AVG(delivery_days) AS avg_delivery_days
FROM retail_sales_data;

-- Orders by Delivery Status

SELECT 
    delivery_status,
    COUNT(order_id) AS total_orders
FROM retail_sales_data
GROUP BY delivery_status;

-- Orders by Delivery Days

SELECT 
    delivery_days,
    COUNT(order_id) AS total_orders
FROM retail_sales_data
GROUP BY delivery_days
ORDER BY delivery_days;

-- 6. RETURNS & CANCELLATIONS

-- Cancellation Rate %

-- Return Rate %

SELECT 
    (COUNT(CASE WHEN product_returned = 'Yes' THEN 1 END)
    / COUNT(order_id)) * 100 AS return_rate
FROM retail_sales_data;

-- Cancellation Reasons

SELECT 
    cancel_reason,
    COUNT(order_id) AS total_orders
FROM retail_sales_data
WHERE cancel_reason IS NOT NULL
GROUP BY cancel_reason
ORDER BY total_orders DESC;

-- 7. PAYMENT & CHANNEL ANALYSIS

-- Payment Type Distribution

SELECT 
    payment_type,
    COUNT(order_id) AS total_orders
FROM retail_sales_data
GROUP BY payment_type;

-- Order Channel Analysis

SELECT 
    order_channel,
    COUNT(order_id) AS total_orders
FROM retail_sales_data
GROUP BY order_channel;

-- Repeat vs New Customers

SELECT 
    customer_type,
    COUNT(*) AS total_customers
FROM (
    SELECT 
        customer_id,
        CASE 
            WHEN COUNT(order_id) > 1 THEN 'Repeat'
            ELSE 'New'
        END AS customer_type
    FROM retail_sales_data
    GROUP BY customer_id
) t
GROUP BY customer_type;

-- Top Profitable Category

SELECT 
    category,
    SUM(profit) AS total_profit
FROM retail_sales_data
GROUP BY category
ORDER BY total_profit DESC;

-- Customer Lifetime Value 

SELECT 
    customer_id,
    SUM(amount) AS lifetime_value
FROM retail_sales_data
GROUP BY customer_id
ORDER BY lifetime_value DESC;

-- Profit Impact of Discounts

SELECT 
    discount,
    SUM(profit) AS total_profit
FROM retail_sales_data
GROUP BY discount
ORDER BY discount;

-- Peak Sales Day Type

SELECT 
    day_type,
    SUM(amount) AS revenue
FROM retail_sales_data
GROUP BY day_type
ORDER BY revenue DESC;

-- Most Returned Products

SELECT 
    product_name,
    COUNT(*) AS return_count
FROM retail_sales_data
WHERE product_returned = 'Yes'
GROUP BY product_name
ORDER BY return_count DESC
LIMIT 5;