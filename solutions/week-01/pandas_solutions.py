import sys
from pathlib import Path

import numpy as np
import pandas as pd

sys.path.append(str(Path(__file__).resolve().parents[2]))
from db import connect

con = connect()
orders = con.sql("SELECT * FROM orders").df()
payments = con.sql("SELECT * FROM order_payments").df()
items = con.sql("SELECT * FROM order_items").df()
customers = con.sql("SELECT * FROM customers").df()

# Day 1
# 1.5 Orders per status
print(orders["order_status"].value_counts())

# 1.6 Canceled orders placed in 2018
canceled_2018 = orders[
    (orders["order_status"] == "canceled")
    & (orders["order_purchase_timestamp"].dt.year == 2018)
]
print(len(canceled_2018))

# Day 2
# 2.5 Orders per month
orders["month"] = orders["order_purchase_timestamp"].dt.to_period("M")
orders_per_month = orders.groupby("month").size()
print(orders_per_month)

# 2.6 Month over month change in orders, January to August 2018
orders_2018 = orders_per_month["2018-01":"2018-08"]
print((orders_2018.pct_change() * 100).round(1))

# Day 3
# 3.4 Installment groups with pd.cut
payments["installments_group"] = pd.cut(
    payments["payment_installments"],
    bins=[-1, 1, 3, 6, np.inf],
    labels=["1x", "2-3x", "4-6x", "7x+"],
)
print((payments["installments_group"].value_counts(normalize=True).sort_index() * 100).round(1))

# 3.5 Share of late orders per month in 2018
delivered = orders[
    (orders["order_status"] == "delivered")
    & orders["order_delivered_customer_date"].notna()
].copy()
delivered["is_late"] = np.where(
    delivered["order_delivered_customer_date"] > delivered["order_estimated_delivery_date"], 1, 0
)
late_by_month = delivered[delivered["month"] >= "2018-01"].groupby("month")["is_late"].mean()
print((late_by_month * 100).round(1))

# Day 4
# 4.5 Order totals, then mean and median GMV per order
order_totals = items.groupby("order_id").agg(items=("order_item_id", "count"), gmv=("price", "sum"))
print(order_totals["gmv"].agg(["mean", "median"]).round(2))

# 4.6 Orders with no items
orders_without_items = orders[~orders["order_id"].isin(items["order_id"])]
print(len(orders_without_items))
print(orders_without_items["order_status"].value_counts())

# Day 5
# 5.4 customer_id rows vs real buyers
print(customers["customer_id"].nunique(), customers["customer_unique_id"].nunique())

# 5.5 Share of buyers by number of orders
orders_per_buyer = customers.groupby("customer_unique_id").size()
print((orders_per_buyer.clip(upper=3).value_counts(normalize=True).sort_index() * 100).round(1))
