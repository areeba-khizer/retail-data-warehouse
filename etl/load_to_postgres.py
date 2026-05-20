import os
import pandas as pd
from sqlalchemy import create_engine
from config import DB_CONFIG

# Create DB connection string
DB_URL = f"postgresql://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}"

engine = create_engine(DB_URL)

# Map CSV files → table names
FILES = {
    "olist_customers_dataset.csv": "stg_customers",
    "olist_orders_dataset.csv": "stg_orders",
    "olist_order_items_dataset.csv": "stg_order_items",
    "olist_products_dataset.csv": "stg_products",
    "olist_sellers_dataset.csv": "stg_sellers",
    "olist_order_payments_dataset.csv": "stg_payments",
    "olist_order_reviews_dataset.csv": "stg_reviews",
    "olist_geolocation_dataset.csv": "stg_geolocation"
}

DATA_PATH = "data/raw"

def load_csv_to_postgres(file_name, table_name):
    file_path = os.path.join(DATA_PATH, file_name)

    print(f"Loading {file_name} → {table_name}")

    df = pd.read_csv(file_path)

    # Basic standardization (IMPORTANT for real projects)
    df.columns = [col.lower().strip() for col in df.columns]

    df.to_sql(
        table_name,
        engine,
        if_exists="replace",
        index=False,
        chunksize=5000
    )

    print(f"Loaded {table_name} | Rows: {len(df)}")


def main():
    for file_name, table_name in FILES.items():
        try:
            load_csv_to_postgres(file_name, table_name)
        except Exception as e:
            print(f"ERROR loading {file_name}: {str(e)}")


if __name__ == "__main__":
    main()