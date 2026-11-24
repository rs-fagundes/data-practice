-- 4.1 Total GMV (sum of item prices) and total freight.
SELECT
  ROUND(SUM(price), 0) AS gmv,
  ROUND(SUM(freight_value), 0) AS freight
FROM order_items;

-- 4.2 Per order first, then the average: items per order and AOV (GMV per order).
WITH order_totals AS (
  SELECT
    order_id,
    COUNT(*) AS items,
    SUM(price) AS gmv
  FROM order_items
  GROUP BY order_id
)
SELECT
  COUNT(*) AS orders,
  ROUND(AVG(items), 2) AS items_per_order,
  ROUND(AVG(gmv), 2) AS aov,
  ROUND(MEDIAN(gmv), 2) AS median_order_gmv
FROM order_totals;

-- 4.3 Share of orders with more than 1 item, in %.
WITH order_totals AS (
  SELECT
    order_id,
    COUNT(*) AS items
  FROM order_items
  GROUP BY order_id
)
SELECT
  ROUND(100 * COUNT(*) FILTER (WHERE items > 1) / COUNT(*), 1) AS multi_item_pct
FROM order_totals;

-- 4.4 Top 5 sellers by GMV, with their number of orders.
SELECT
  seller_id,
  COUNT(DISTINCT order_id) AS orders,
  ROUND(SUM(price), 0) AS gmv
FROM order_items
GROUP BY seller_id
ORDER BY gmv DESC
LIMIT 5;
