
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import requests


def ping_server():
    response = requests.get('http://192.168.1.13:3000/ping')
    print(response.text)


with DAG(
    dag_id="consumer_api_dag",
    start_date=datetime(2022, 3, 18),
    schedule_interval='*/1 * * * *',
    catchup=False
) as dag:
    task1 = PythonOperator(
        task_id="consumer_api",
        python_callable=ping_server)

task1
