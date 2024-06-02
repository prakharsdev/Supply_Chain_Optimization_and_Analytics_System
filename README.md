# End-to-End Supply Chain Optimization and Analytics System

This project demonstrates a supply chain optimization and analytics system using AWS, Snowflake, dbt, Terraform, Airflow, and Docker, with FedEx as a data source.

## Project Structure

- `airflow/`: Contains Airflow DAGs and configuration.
- `dbt/`: Contains dbt models and configurations.
- `terraform/`: Contains Terraform scripts to provision AWS resources.
- `docker-compose.yml`: Docker Compose file to set up the project environment.

## Setup Instructions

1. Clone the repository.

2. Set up the environment variables for AWS, Snowflake, and FedEx API in the respective configuration files.

3. Run Terraform to provision AWS resources:
    ```sh
    cd terraform
    terraform init
    terraform apply
    ```

4. Build and start the Docker containers:
    ```sh
    docker-compose up --build
    ```

5. Access the Airflow web interface at `http://localhost:8080` and trigger the DAG `supply_chain_optimization`.

## Tools Used

- **AWS**: For cloud infrastructure, including S3 and RDS.
- **Snowflake**: For data warehousing and analytics.
- **dbt**: For data transformation and modeling.
- **Terraform**: For infrastructure as code.
- **Airflow**: For workflow orchestration.
- **Docker**: For containerization and consistent deployment.


![S3](https://github.com/prakharsdev/Supply_Chain_Optimization_and_Analytics_System/assets/26145700/c8b1e679-ddc0-49f9-ad8b-b9f70efeda2c)
