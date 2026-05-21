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

## Phase 5: dbt Models (Core + Marts Layer)

Built a modular dbt transformation layer on top of the PostgreSQL data warehouse to implement a modern analytics engineering workflow.

This phase introduced structured SQL modeling using dbt, separating business logic into reusable and scalable components.

---

### Core Models (Warehouse Layer in dbt)
Created core transformation models using `ref()` dependencies to ensure modular and maintainable SQL logic.

- Built `fact_orders` model for transactional data processing
- Standardized calculations such as total order value
- Established dependency-based transformations using dbt sources

---

### Marts Layer (Business Analytics Models)
Developed business-ready datasets for analytical reporting and dashboarding:

- Monthly revenue trends mart
- Customer lifetime value (LTV) mart
- Product performance mart

These models convert raw transactional data into meaningful business KPIs.

---

### Key dbt Features Used
- `ref()` for model dependencies
- `source()` for warehouse table references
- Modular SQL structure (core → marts)
- Schema-based organization (analytics layer)

---

### Outcome
- Successfully implemented dbt transformation pipeline
- Created reusable and scalable analytics models
- Separated business logic into structured layers
- Enabled automated SQL dependency management
- Prepared project for testing, documentation, and lineage tracking

---

## Phase 6: Data Testing & Documentation (dbt)

Implemented a data quality and documentation layer using dbt to improve reliability, transparency, and maintainability of the analytics pipeline.

This phase focused on ensuring that all transformed data models are validated, documented, and traceable through automated tooling.

---

### Data Testing (Quality Assurance)

Added dbt tests to validate critical business logic and ensure data integrity across core models.

- Implemented `not_null` tests on key business columns in fact tables
- Added data validation checks for customer, order, and revenue fields
- Removed default example models and tests to maintain a clean production structure
- Ensured only business-relevant models are included in testing suite

---

### Documentation (dbt Docs)

Generated automated documentation for all dbt models using built-in dbt documentation features.

- Documented core and mart layer models
- Included column-level descriptions and metadata
- Enabled visibility into model relationships and dependencies

---

### Lineage & Data Transparency

Enabled dbt documentation server to visualize full data lineage across the pipeline.

- Tracked flow from staging → core → marts
- Provided interactive lineage graph for all transformations
- Improved debugging and pipeline transparency

---

### Outcome

- Established data quality assurance layer using automated tests
- Created self-documenting analytics pipeline
- Enabled full visibility into data transformations via lineage graph
- Improved trust and reliability of analytics outputs
- Refactored project into production-ready dbt structure

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