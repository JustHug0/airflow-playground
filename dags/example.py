import os
from datetime import datetime, timedelta

from airflow import DAG
from airflow.providers.postgres.operators.postgres import PostgresOperator
from airflow.operators.dummy import DummyOperator

PACKAGE_ROOT = os.getenv('AIRFLOW_HOME', '/opt/airflow/queries')
DAG_NAME = 'example'

with DAG(DAG_NAME,
         schedule_interval=None,
         start_date=datetime(2023, 11, 15),
         dagrun_timeout=timedelta(minutes=60),
         template_searchpath=os.path.join(PACKAGE_ROOT, 'queries/'),
         catchup=False,
         max_active_runs=1) as dag:


    datamarts_done = DummyOperator(
        task_id='test_done',
        trigger_rule='all_done'
    )

    PostgresOperator(
        postgres_conn_id='postgres_data_source',
        sql='source/postgres/user.sql',
        task_id='extract_user'
    ) >> datamarts_done