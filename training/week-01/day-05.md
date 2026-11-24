# Week 1, Day 5: Buyers, and review

Topics: `COUNT(DISTINCT)`, the difference between an id per order and an id per person. pandas: `nunique`, `clip`.

## Recall (5 min)

From memory, rewrite query 3.2 (installment groups with %). This is the hardest query of the week.

## SQL (15 min)

Table: `customers` (one row per order: a new `customer_id` is created for every order).

5.1 Count distinct `customer_id` and distinct `customer_unique_id`.
Check: 99,441 vs 96,096. `customer_unique_id` is the real buyer. Counting `customer_id` as buyers is the same error as counting order rows as buyers.

5.2 Top 5 `customer_state` by number of buyers.
Check: SP, with 40,302 buyers.

5.3 How many buyers placed 1, 2, or 3+ orders? Show buyers and the share in %.
Check: 96.9% of buyers ordered only once.

## pandas (20 min)

5.4 Answer 5.1 with `nunique()`.

5.5 Answer 5.3: `groupby("customer_unique_id").size()`, then `.clip(upper=3)` and `value_counts(normalize=True)`.

## Commit (5 min)

Log what you looked up, commit and push. Then read your `log.md` for the week: what came up more than once?

## BigQuery version

- `orders::VARCHAR` is `CAST(orders AS STRING)` in BigQuery.
- `COUNT(DISTINCT x)` is the same. For very big tables, BigQuery also has `APPROX_COUNT_DISTINCT(x)`.
