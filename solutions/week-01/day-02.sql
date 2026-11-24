-- 2.1 How many orders were placed per month?
SELECT
  DATE_TRUNC('month', order_purchase_timestamp)::DATE AS month,
  COUNT(*) AS orders
FROM orders
GROUP BY month
ORDER BY month;

-- 2.2 Which months have fewer than 100 orders? (incomplete data: do not compare them)
SELECT
  DATE_TRUNC('month', order_purchase_timestamp)::DATE AS month,
  COUNT(*) AS orders
FROM orders
GROUP BY month
HAVING COUNT(*) < 100
ORDER BY month;

-- 2.3 Orders per weekday, busiest first.
SELECT
  DAYNAME(order_purchase_timestamp) AS weekday,
  COUNT(*) AS orders
FROM orders
GROUP BY weekday
ORDER BY orders DESC;

-- 2.4 The 3 hours of the day with the most orders.
SELECT
  EXTRACT(HOUR FROM order_purchase_timestamp) AS hour,
  COUNT(*) AS orders
FROM orders
GROUP BY hour
ORDER BY orders DESC
LIMIT 3;
