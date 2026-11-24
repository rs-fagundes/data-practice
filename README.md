# Data Practice

Daily SQL and Python practice for data analysis, 45 minutes a day, without AI.

The data is the [Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce): about 100,000 orders from a Brazilian marketplace, 2016 to 2018. SQL runs on [DuckDB](https://duckdb.org/), on Parquet files saved in this repo. Nothing to download and no cloud account.

Finished projects go to [my-portfolio](https://github.com/rs-fagundes/my-portfolio).

## How to run

See [SETUP.md](SETUP.md). Short version:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Then open a notebook in `training/` and run the first cell.

## A day of practice (45 min)

| Time | What |
| --- | --- |
| 5 min | Recall: write from memory something from the day before |
| 15 min | SQL exercises |
| 20 min | pandas exercises |
| 5 min | Write in `training/log.md` what you looked up, then commit and push |

Rules: no AI and no copy-paste. Look up docs only after 15 minutes stuck. Check your answer with the `Check:` line, and open `solutions/` only after you try.

## Plan

| Week | SQL | pandas |
| --- | --- | --- |
| 1 | `GROUP BY`, `CASE WHEN`, dates | `groupby`, `agg`, filters |
| 2 | `JOIN`, row counts before and after a join | `merge`, `validate=` |
| 3 | CTEs, safe division | `assign`, method chains |
| 4 | Window functions: `ROW_NUMBER`, `LAG`, running totals | `shift`, `cumsum`, `rank` |
| 5 | New vs repeat buyers | the same in pandas |
| 6 | Retention cohorts | `pivot_table` |
| 7 | `QUALIFY`, `UNNEST`, `STRUCT` | `melt`, `pivot`, Plotly charts |
| 8 | One project from start to end | |

## Structure

```
db.py                 opens DuckDB with one view per table (FROM orders, FROM customers, ...)
data/                 Olist tables as Parquet
training/week-NN/     exercises (day-NN.md) and the notebook to answer them (day-NN.ipynb)
training/log.md       what I had to look up
solutions/week-NN/    SQL and pandas solutions
```

## Tables

| Table | One row per | Rows |
| --- | --- | --- |
| `orders` | order | 99,441 |
| `customers` | order (`customer_unique_id` is the person) | 99,441 |
| `order_items` | item in an order | 112,650 |
| `order_payments` | payment | 103,886 |
| `order_reviews` | review | 100,000 |
| `products` | product | 32,951 |
| `sellers` | seller | 3,095 |
| `category_translation` | category (Portuguese to English) | 71 |

## Data license

Olist data, by Olist, under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). The Parquet files in `data/` are a format change of the original CSV files, with no other change, and keep the same license.
