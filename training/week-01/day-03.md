# Week 1, Day 3: CASE WHEN

Topics: `CASE WHEN`, shares with a window total. pandas: `pd.cut`, `np.where`.

## Recall (5 min)

From memory, rewrite query 2.1 (orders per month).

## SQL (15 min)

Table: `order_payments` (one row per payment, an order can have more than one).

3.1 Per `payment_type`: number of payments and total `payment_value`. Largest value first.
Check: `credit_card` has 76,795 payments.

3.2 Put each payment in a group by `payment_installments`: `1x`, `2-3x`, `4-6x`, `7x+`. Show payments per group and the share of payments in %.
Hint: the total of all groups is `SUM(COUNT(*)) OVER ()`.
Check: `1x` is 50.6%.

3.3 Table `orders`. Of the `delivered` orders that have a delivery date, what share arrived after `order_estimated_delivery_date`, in %?
Check: 7,826 late orders out of 96,470, so 8.1%.

## pandas (20 min)

3.4 Answer 3.2 with `pd.cut` and `value_counts(normalize=True)`.

3.5 Create an `is_late` column with `np.where` (1 = late, 0 = on time). Then show the late share per month in 2018.
Check: March 2018 is the worst month, with 21.4% late.

## Commit (5 min)

Log what you looked up, commit and push.

## BigQuery version

- The window total `SUM(COUNT(*)) OVER ()` works the same in BigQuery.
- In BigQuery, `100 * a / b` fails when `b` is 0. Use `SAFE_DIVIDE(a, b)`. In DuckDB use `a / NULLIF(b, 0)`.
