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


## Phase 3: Analytics KPI Layer

Created analytics views for:

- Monthly revenue trends
- Top-performing product categories
- Customer lifetime value (LTV)
- Seller performance analysis
- Repeat customer identification

## Phase 4: dbt Setup (Analytics Engineering Layer)

Configured dbt to transform the PostgreSQL data warehouse into a modern analytics engineering workflow.

Created a structured dbt project connected to the `retail_dw` database to enable modular SQL development and scalable data modeling.

### Key Setup Steps:
- Installed and configured `dbt-postgres` adapter
- Initialized dbt project (`retail_dbt`)
- Created and configured `~/.dbt/profiles.yml` for PostgreSQL connection
- Verified successful connection using `dbt debug`

### Outcome:
- dbt environment successfully set up and connected to the warehouse
- Foundation established for modular SQL transformations
- Project prepared for staging, warehouse, and marts layer modeling
- Enabled future support for testing, documentation, and lineage tracking

Implemented reusable SQL views for dashboard-ready reporting.
## Tech Stack

- Python
- PostgreSQL
- Docker Compose
- SQLAlchemy
- Pandas

## Project Structure

```text
retail-data-warehouse/