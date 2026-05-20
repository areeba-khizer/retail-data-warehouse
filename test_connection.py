from sqlalchemy import create_engine

DATABASE_URL = (
    "postgresql://admin:admin123@localhost:5432/retail_dw"
)

engine = create_engine(DATABASE_URL)

connection = engine.connect()

print("Connected successfully!")

connection.close()