# Week 1, Day 4: GMV and AOV

Topics: CTEs (`WITH`), aggregate first and average after, `MEDIAN`. pandas: `groupby().agg()`, `isin`.

In this repo, GMV = sum of `price` in `order_items` (freight not included).

## Recall (5 min)

From memory, write a `CASE WHEN` with 3 groups and an `ELSE`.

## SQL (15 min)

Table: `order_items` (one row per item in an order).

4.1 Total GMV and total freight (`freight_value`).
Check: GMV of 13,591,644 and freight of 2,251,910 (in BRL).

4.2 First build one row per order with `items` and `gmv` in a CTE. Then show: orders, items per order, AOV (average GMV per order) and median GMV per order.
Check: 98,666 orders, 1.14 items per order, AOV of 137.75, median of 86.90.
The mean is far above the median: a few big orders pull the average up.

4.3 What share of orders has more than 1 item, in %?
Check: 9.9%.

4.4 Top 5 `seller_id` by GMV, with their number of distinct orders.
Check: the top seller has a GMV of 229,473 from 1,132 orders.

## pandas (20 min)

4.5 Answer 4.2 with `groupby("order_id").agg(items=(...), gmv=(...))`, then `.agg(["mean", "median"])`.

4.6 `orders` has 99,441 orders, but `order_items` has only 98,666. How many orders have no items, and what is their status? Use `~isin()`.
Check: 775 orders, most of them `unavailable` (603).

## Commit (5 min)

Log what you looked up, commit and push.

## BigQuery version

- `MEDIAN(x)` does not exist in BigQuery. Use `APPROX_QUANTILES(x, 2)[OFFSET(1)]`.
- CTEs (`WITH ... AS`) work the same.
