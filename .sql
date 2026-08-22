-- Business SQL


-- 1) What were the order counts, sales, and AOV for MacBooks sold in North America for each quarter across all years? 

SELECT DATE_TRUNC(purchase_ts, quarter) AS quarterly,
  COUNT(DISTINCT orders.id) AS order_count,
  ROUND(SUM(orders.usd_price),2) AS sales,
  ROUND(AVG(orders.usd_price),2) AS aov
FROM core.orders
LEFT JOIN core.customers_orig
  ON orders.customer_id = customers_orig.id
LEFT JOIN core.geo_lookup
  ON customers_orig.country_code = geo_lookup.country_code
WHERE lower(region) = 'na' AND lower(product_name) LIKE '%macbook%'
GROUP BY 1
ORDER BY 1 DESC;




--Bonus
--What is the average quarterly order count and total sales for MacBooks sold in North America? (i.e. “For North America Macbooks, average of X units sold per quarter and Y in dollar sales per quarter”
WITH quartely_metrics AS (
SELECT DATE_TRUNC(purchase_ts, quarter) AS quarterly,
  COUNT(DISTINCT orders.id) AS order_count,
  ROUND(SUM(usd_price),2) AS total_sales
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country_code
WHERE lower(region) = 'na' AND lower(product_name) LIKE '%macbook%'
GROUP BY 1
ORDER BY 1
)
SELECT ROUND(AVG(order_count),2) AS avg_quarter_order_count,
  ROUND(AVG(total_sales),2) AS avg_quarter_sales
FROM quartely_metrics;




-- 2) For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver? 

SELECT geo_lookup.region,
  AVG(DATE_DIFF(order_status.delivery_ts, order_status.purchase_ts, day)) AS avg_time_to_deliver
FROM core.order_status
LEFT JOIN core.orders
  ON order_status.order_id = orders.id
LEFT JOIN core.customers_orig
  ON orders.customer_id = customers_orig.id
LEFT JOIN core.geo_lookup
  ON customers_orig.country_code = geo_lookup.country_code
WHERE (EXTRACT(year from orders.purchase_ts) = 2022 AND orders.purchase_platform = 'website') OR orders.purchase_platform = 'mobile app'
GROUP BY 1
ORDER BY 2 DESC;




SELECT DISTINCT purchase_platform
FROM core.orders;

-- BONUS
-- Rewrite this query for website purchases made in 2022 or Samsung purchases made in 2021, expressing time to deliver in weeks instead of days.

SELECT geo_lookup.region,
  AVG(DATE_DIFF(order_status.delivery_ts, order_status.purchase_ts, week)) AS avg_time_to_deliver
FROM core.order_status
LEFT JOIN core.orders
  ON order_status.order_id = orders.id
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country_code
WHERE (EXTRACT(year from orders.purchase_ts) = 2022 AND account_creation_method = 'website') OR (EXTRACT(year from orders.purchase_ts) = 2021 AND product_name LIKE '%Samsung%')
GROUP BY 1
ORDER BY 2 DESC;




--3) What was the refund rate and refund count for each product overall? 

SELECT CASE WHEN product_name ='27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name  END AS cleaned_product_name,
  SUM(CASE WHEN order_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refund_count,
  ROUND(AVG(CASE WHEN order_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END)*100,2) AS refund_rate
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 3 DESC;




-- Bonus. What was the refund rate and refund count for each product per year? How would you interpret these rates in English?
SELECT EXTRACT(year from order_status.purchase_ts) AS purchase_year,
  CASE WHEN product_name ='27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name  END AS cleaned_product_name,
  SUM(CASE WHEN order_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refund_count,
  ROUND(AVG(CASE WHEN order_status.refund_ts IS NOT NULL THEN 1 ELSE 0 END)*100,2) AS refund_rate
FROM core.orders
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
GROUP BY 1,2
ORDER BY 3 DESC;


SELECT DISTINCT product_name
FROM core.orders;




-- 4) Within each region, what is the most popular product? 

WITH sales_by_product AS (
SELECT geo_lookup.region AS region,
  CASE WHEN product_name ='27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name  END AS cleaned_product_name,
  COUNT(DISTINCT orders.id) AS total_orders
FROM core.orders
LEFT JOIN core.customers_orig
  ON orders.customer_id = customers_orig.id
LEFT JOIN core.geo_lookup
  ON customers_orig.country_code = geo_lookup.country_code
GROUP BY 1,2
)

SELECT *,
  ROW_NUMBER() OVER(PARTITION BY region ORDER BY total_orders DESC) AS order_ranking
FROM sales_by_product
QUALIFY order_ranking = 1
ORDER BY 3 DESC;




-- 5) How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers?

SELECT customers_orig.loyalty_program,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers_orig.created_on, day)),1) AS avg_days_to_purchase,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers_orig.created_on, month)),1) AS avg_month_to_purchase
FROM core.customers_orig
LEFT JOIN core.orders 
  ON customers_orig.id = orders.customer_id
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
GROUP BY 1;




--Bonus: Update this query to split the time to purchase per loyalty program, per purchase platform. Return the number of records to benchmark the severity of nulls

SELECT orders.purchase_platform,
  customers_orig.loyalty_program,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers_orig.created_on, day)),1) AS avg_days_to_purchase,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers_orig.created_on, month)),1) AS avg_month_to_purchase,
  COUNT(*) AS row_count
FROM core.customers_orig
LEFT JOIN core.orders 
  ON customers_orig.id = orders.customer_id
LEFT JOIN core.order_status
  ON orders.id = order_status.order_id
GROUP BY 1,2;
