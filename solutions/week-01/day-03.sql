-- 3.1 Payments per payment type: number of payments and total value.
SELECT
  payment_type,
  COUNT(*) AS payments,
  ROUND(SUM(payment_value), 0) AS payment_value
FROM order_payments
GROUP BY payment_type
ORDER BY payment_value DESC;

-- 3.2 Group payments by installments and show the share of payments in each group.
SELECT
  CASE
    WHEN payment_installments <= 1 THEN '1x'
    WHEN payment_installments <= 3 THEN '2-3x'
    WHEN payment_installments <= 6 THEN '4-6x'
    ELSE '7x+'
  END AS installments_group,
  COUNT(*) AS payments,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS payments_pct
FROM order_payments
GROUP BY installments_group
ORDER BY installments_group;

-- 3.3 Of the delivered orders with a delivery date, what share arrived late, in %?
SELECT
  COUNT(*) AS delivered_orders,
  COUNT(*) FILTER (WHERE order_delivered_customer_date > order_estimated_delivery_date) AS late_orders,
  ROUND(100 * COUNT(*) FILTER (WHERE order_delivered_customer_date > order_estimated_delivery_date) / COUNT(*), 1) AS late_pct
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;
