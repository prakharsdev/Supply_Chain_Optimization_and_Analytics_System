from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago
import requests
import json
import boto3

default_args = {
    'owner': 'airflow',
    'start_date': days_ago(1),
    'retries': 1,
}

def fetch_fedex_data():
    url = "https://api.fedex.com/track/v1/shipments"
    headers = {
        "Authorization": "Bearer YOUR_ACCESS_TOKEN",
        "Content-Type": "application/json"
    }
    params = {"tracking_number": "YOUR_TRACKING_NUMBER"}
    response = requests.get(url, headers=headers, params=params)
    
    data = response.json()
    
    s3 = boto3.client('s3')
    s3.put_object(
        Bucket='your-s3-bucket-name',
        Key='fedex/shipment_data.json',
        Body=json.dumps(data)
    )

dag = DAG(
    'supply_chain_optimization',
    default_args=default_args,
    description='A simple supply chain optimization DAG',
    schedule_interval='@daily',
)

start = DummyOperator(task_id='start', dag=dag)

fetch_data = PythonOperator(
    task_id='fetch_fedex_data',
    python_callable=fetch_fedex_data,
    dag=dag,
)

run_dbt = BashOperator(
    task_id='run_dbt',
    bash_command='cd /usr/app && dbt run',
    dag=dag,
)

end = DummyOperator(task_id='end', dag=dag)

start >> fetch_data >> run_dbt >> end
