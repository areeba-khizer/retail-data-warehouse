import pandas as pd
from sqlalchemy import create_engine

DATABASE_URL = (
    "postgresql://admin:admin123@localhost:5432/retail_dw"
)

engine = create_engine(DATABASE_URL)

customers = pd.read_csv(
    "data/raw/olist_customers_dataset.csv"
)

customers.to_sql(
    "stg_customers",
    engine,
    if_exists="replace",
    index=False
)

print("Customers loaded!")