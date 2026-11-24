-- 1.1 How many orders are there, and what are the first and last purchase dates?
SELECT
  COUNT(*) AS orders,
  MIN(order_purchase_timestamp)::DATE AS first_day,
  MAX(order_purchase_timestamp)::DATE AS last_day
FROM orders;

-- 1.2 How many orders are there per status, largest first?
SELECT
  order_status,
  COUNT(*) AS orders
FROM orders
GROUP BY order_status
ORDER BY orders DESC;

-- 1.3 What share of all orders was delivered, in %?
SELECT
  ROUND(100 * COUNT(*) FILTER (WHERE order_status = 'delivered') / COUNT(*), 1) AS delivered_pct
FROM orders;

-- 1.4 Data check: how many delivered orders have no delivery date?
SELECT
  COUNT(*) AS delivered_without_date
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NULL;
