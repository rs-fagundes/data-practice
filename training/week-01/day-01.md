# Week 1, Day 1: First look at the data

Topics: `SELECT`, `WHERE`, `COUNT`, `GROUP BY`, `ORDER BY`. pandas: `value_counts`, filters.

Work in `day-01.ipynb`. No AI and no copy-paste. Look up docs only after 15 minutes stuck.

## Recall (5 min)

Without looking anything up, write the order of the clauses in a SQL query, from `SELECT` to `LIMIT`.

## SQL (15 min)

Table: `orders` (one row per order).

1.1 How many orders are there? What are the first and the last purchase dates?
Check: 99,441 orders, from 2016-09-04 to 2018-10-17.

1.2 How many orders are there per `order_status`? Largest first.
Check: `delivered` has 96,478.

1.3 What share of all orders was delivered, in %? Round to 1 decimal.
Check: 97.0%.

1.4 Data check: how many orders are `delivered` but have no `order_delivered_customer_date`?
Check: 8. Small, but this kind of gap breaks delivery time numbers later.

## pandas (20 min)

1.5 Load `orders` into a DataFrame and answer 1.2 with `value_counts()`.

1.6 How many `canceled` orders were placed in 2018? Use a filter with two conditions and `.dt.year`.
Check: 334.

## Commit (5 min)

Add one line to `training/log.md` for anything you had to look up. Then commit and push.

## BigQuery version

- `COUNT(*) FILTER (WHERE ...)` does not exist in BigQuery. Use `COUNTIF(order_status = 'delivered')`.
- `x::DATE` is DuckDB. In BigQuery write `DATE(x)` or `CAST(x AS DATE)`.
