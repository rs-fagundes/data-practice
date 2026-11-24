-- 5.1 customer_id vs customer_unique_id: how many of each?
-- customer_id is created again for every order. customer_unique_id is the person.
SELECT
  COUNT(DISTINCT customer_id) AS customer_ids,
  COUNT(DISTINCT customer_unique_id) AS buyers
FROM customers;

-- 5.2 Top 5 states by number of buyers.
SELECT
  customer_state,
  COUNT(DISTINCT customer_unique_id) AS buyers
FROM customers
GROUP BY customer_state
ORDER BY buyers DESC
LIMIT 5;

-- 5.3 How many buyers placed 1, 2, 3 or more orders?
-- In this table there is one row per order, so rows per buyer = orders per buyer.
WITH orders_per_buyer AS (
  SELECT
    customer_unique_id,
    COUNT(*) AS orders
  FROM customers
  GROUP BY customer_unique_id
)
SELECT
  CASE WHEN orders >= 3 THEN '3+' ELSE orders::VARCHAR END AS orders_group,
  COUNT(*) AS buyers,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS buyers_pct
FROM orders_per_buyer
GROUP BY orders_group
ORDER BY orders_group;
