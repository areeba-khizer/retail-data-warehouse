from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator
from datetime import datetime

default_args = {
    "owner": "areeba",
    "start_date": datetime(2024, 1, 1),
}

with DAG(
    dag_id="retail_dbt_pipeline",
    default_args=default_args,
    schedule="@daily",
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="cd ~/retail-data-warehouse/retail_dbt && dbt run"
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="cd ~/retail-data-warehouse/retail_dbt && dbt test"
    )

    dbt_run >> dbt_test