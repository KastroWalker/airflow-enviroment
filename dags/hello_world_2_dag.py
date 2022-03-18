from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime


def second_hello_world():
    print("Hello World 2")


def hello_world():
    print("Hello World")


with DAG(
    dag_id="hello_world_2_dag",
    start_date=datetime(2022, 3, 18),
    schedule_interval='*/1 * * * *',
    catchup=False
) as dag:
    task1 = PythonOperator(
        task_id="hello_world",
        python_callable=hello_world)

    task2 = PythonOperator(
        task_id="hello_world_2",
        python_callable=second_hello_world)

task1 >> task2
