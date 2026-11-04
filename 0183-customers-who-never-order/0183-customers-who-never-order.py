import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    ordering_customer_ids = orders.loc[:, "customerId"] 
    res = customers.loc[
        ~customers["id"].isin(ordering_customer_ids), 
        ["name"]
    ].rename(
        columns={
            "name": "Customers"
        }
    )

    return res