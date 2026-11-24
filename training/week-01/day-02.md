# Week 1, Day 2: Dates

Topics: `DATE_TRUNC`, `EXTRACT`, `HAVING`. pandas: `.dt`, `to_period`, `pct_change`.

## Recall (5 min)

From memory, rewrite query 1.2 (orders per status) from yesterday.

## SQL (15 min)

2.1 How many orders were placed per month? Use `DATE_TRUNC`.
Check: November 2017 is the biggest month, with 7,544 orders (Black Friday).

2.2 Which months have fewer than 100 orders? Use `HAVING`.
Check: 4 months: 2016-09, 2016-12, 2018-09 and 2018-10. Also note that 2016-11 is missing.
These months have incomplete data, so never compare them with full months.

2.3 Orders per weekday, busiest first. Use `DAYNAME`.
Check: Monday, with 16,196 orders.

2.4 The 3 hours of the day with the most orders. Use `EXTRACT(HOUR FROM ...)`.
Check: 16h, 11h and 14h.

## pandas (20 min)

2.5 Answer 2.1 in pandas: create a `month` column with `.dt.to_period("M")`, then `groupby("month").size()`.

2.6 For January to August 2018, show the month over month change in orders, in %. Use `pct_change()`.
Check: June 2018 is -10.3% vs May.

## Commit (5 min)

Log what you looked up, commit and push.

## BigQuery version

- `DATE_TRUNC('month', ts)` in DuckDB is `DATE_TRUNC(ts, MONTH)` in BigQuery: the order of the arguments changes.
- `DAYNAME(ts)` is `FORMAT_TIMESTAMP('%A', ts)` in BigQuery.
- `EXTRACT(HOUR FROM ts)` is the same in both.
