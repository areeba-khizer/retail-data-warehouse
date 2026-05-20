# Retail Data Warehouse Project

End-to-end retail analytics data warehouse project using:

- Python
- PostgreSQL
- Docker
- SQL
- Airflow
- dbt
- Metabase

## Architecture

## Phase 1: Staging Layer

- Built automated ETL pipeline using Python
- Loaded Olist dataset into PostgreSQL staging tables
- Standardized column names and structured ingestion process
- Created reusable loader for multiple datasets


## Phase 2: Data Warehouse Layer

- Designed and implemented star schema architecture
- Built fact_orders table for transactional analysis
- Created dimension tables for customers, products, sellers, and dates
- Implemented SQL-based transformation pipeline in PostgreSQL
## Tech Stack

- Python
- PostgreSQL
- Docker Compose
- SQLAlchemy
- Pandas

## Project Structure

```text
retail-data-warehouse/