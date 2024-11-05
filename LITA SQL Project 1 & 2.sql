-- PROJECT 1

-- SELECT * FROM salesdata

-- 1. Retrieve the total sales for each product category

-- SELECT product, 
   --     SUM(sales_amount) AS total_sales
-- FROM salesdata
-- GROUP BY product_category;

-- 2. Find the number of sales transactions in each region
-- SELECT region, 
--        COUNT(transaction_id) AS num_sales_transcations
-- FROM sales
-- WHERE
-- region IN ('North','South','East','West')
-- GROUP BY region;
-- SORT BY num_sales_transactions DESC;

-- 3. Find the highest-selling product by total sales value
-- SELECT product_name, 
--        SUM(sales_amount) AS total_sales
-- FROM sales_table
-- GROUP BY product_name
-- ORDER BY total_sales DESC
-- LIMIT 1;

-- 4. Calculate total revenue per product
-- SELECT product_name, 
--        SUM(sales_amount) AS total_revenue
-- FROM sales_table
-- GROUP BY product_name;

-- 5. Calculate monthly sales totals for the current year
-- SELECT MONTH(sales_date) AS month, 
--        SUM(sales_amount) AS total_sales
-- FROM sales_table
-- WHERE YEAR(sales_date) = YEAR(CURDATE())
-- GROUP BY MONTH(sales_date)
-- ORDER BY month;

-- 5. Calculate monthly sales totals for the current year
-- SELECT MONTH(sales_date) AS month, 
--        SUM(sales_amount) AS total_sales
-- FROM sales_table
-- WHERE YEAR(sales_date) = YEAR(CURDATE())
-- GROUP BY MONTH(sales_date)
-- ORDER BY month;

-- 6. Find the top 5 customers by total purchase amount
-- SELECT customer_id, 
      --  SUM(sales_amount) AS total_purchase
-- FROM sales_table
-- GROUP BY customer_id
-- ORDER BY total_purchase DESC
-- LIMIT 5;

-- 7. Calculate the percentage of total sales contributed by each region
-- SELECT region, 
--        SUM(sales_amount) AS total_sales, 
--        (SUM(sales_amount) / (SELECT SUM(sales_amount) FROM sales_table) * 100) AS percentage_of_total_sales
-- FROM sales_table
-- GROUP BY region;

-- 8. Identify products with no sales in the last quarter
-- SELECT product_name
-- FROM products_table
-- WHERE product_name NOT IN (
--     SELECT product_name
--     FROM sales_table
--     WHERE sales_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
-- );


-- PROJECT 2

-- CREATE TABLE customers (
-- customer_id INT PRIMARY KEY,
-- name VARCHAR(225) NOT NULL,
-- email VARCHAR(225) UNIQUE,
-- phone VARCHAR(20),
-- address VARCHAR(100),
-- city VARCHAR(100),
-- state VARCHAR(100),
-- zip_code VARCHAR(20),
-- country VARCHAR(100)
-- );

-- SELECT * FROM customers;
-- 1. Retrieve the total number of customers from each region

-- SELECT region, 
--        COUNT(customer_id) AS total_customers
-- FROM customers_table
-- GROUP BY region;

-- 2. Find the most popular subscription type by the number of customers

-- SELECT subscription_type, 
--        COUNT(customer_id) AS total_customers
-- FROM subscriptions_table
-- GROUP BY subscription_type
-- ORDER BY total_customers DESC
-- LIMIT 1;

-- 3. Find customers who canceled their subscription within 6 months

-- SELECT customer_id, subscription_start_date, subscription_end_date
-- FROM subscriptions_table
-- WHERE subscription_end_date IS NOT NULL
-- AND DATEDIFF(subscription_end_date, subscription_start_date) <= 180;

-- 4. Calculate the average subscription duration for all customers

-- SELECT AVG(DATEDIFF(COALESCE(subscription_end_date, CURDATE()), subscription_start_date)) AS avg_subscription_duration
-- FROM subscriptions_table;

-- 5. Find customers with subscriptions longer than 12 months
-- SELECT customer_id, subscription_start_date, subscription_end_date
-- FROM subscriptions_table
-- WHERE DATEDIFF(COALESCE(subscription_end_date, CURDATE()), subscription_start_date) > 365;

-- 6. Calculate total revenue by subscription type
-- SELECT subscription_type, 
--        SUM(subscription_fee) AS total_revenue
-- FROM subscriptions_table
-- GROUP BY subscription_type;

-- 7. Find the top 3 regions by subscription cancellations
-- SELECT region, 
--        COUNT(customer_id) AS total_cancellations
-- FROM customers_table c
-- JOIN subscriptions_table s ON c.customer_id = s.customer_id
-- WHERE s.subscription_end_date IS NOT NULL
-- GROUP BY region
-- ORDER BY total_cancellations DESC
-- LIMIT 3;

-- 8. Find the total number of active and canceled subscriptions
-- SELECT 
--     SUM(CASE WHEN subscription_end_date IS NULL THEN 1 ELSE 0 END) AS active_subscriptions,
--     SUM(CASE WHEN subscription_end_date IS NOT NULL THEN 1 ELSE 0 END) AS canceled_subscriptions
-- FROM subscriptions_table;



























