```md
# DBT DAG Project

This project integrates **dbt** (Data Build Tool) with **Apache Airflow** to orchestrate and manage data pipelines. It uses **Astronomer Cosmos** to create Airflow DAGs for dbt projects and includes an example DAG for querying astronauts in space.

---

## Project Overview

### Purpose
The purpose of this project is to demonstrate how to use **dbt** for data transformation and **Apache Airflow** for orchestration. The project includes:
- A dbt project (`data_pipeline`) with models, macros, tests, and configurations.
- Airflow DAGs to orchestrate dbt runs and other tasks.
- Example tests to validate DAG integrity and functionality.

### Key Features
1. **Airflow Integration**:
   - Uses **Astronomer Cosmos** to generate Airflow DAGs for dbt projects.
   - Includes an example DAG (`example_astronauts`) showcasing dynamic task mapping and TaskFlow API.

2. **dbt Project**:
   - **Staging Models**: Transform raw data into a structured format.
   - **Marts Models**: Aggregate and summarize data for analytics.
   - **Custom Macros**: Includes a macro for calculating discounted amounts.
   - **Tests**: SQL-based tests for data integrity and relationships.

3. **Dynamic Task Mapping**:
   - The `example_astronauts` DAG dynamically creates tasks based on the number of astronauts in space.

---

## Project Structure

### Root Directory
- **`dags/`**: Contains Airflow DAGs and the dbt project.
  - `dbt_dag.py`: Defines the dbt DAG using Cosmos.
  - `exampledag.py`: Example DAG for querying astronauts in space.
- **`dags/dbt/`**: Contains the dbt project (`data_pipeline`).
- **`.astro/`**: Astronomer-specific configurations and tests.
- **`tests/`**: Contains pytest-based tests for DAGs.
- **`requirements.txt`**: Python dependencies for the project.
- **`Dockerfile`**: Custom Dockerfile for the Airflow environment.

### dbt Project (`data_pipeline`)
- **`models/`**: Contains dbt models for staging and marts.
- **`macros/`**: Custom dbt macros.
- **`tests/`**: SQL-based tests for dbt models.
- **`snapshots/`**: Snapshot definitions for dbt.
- **`seeds/`**: Seed files for dbt.
- **`dbt_project.yml`**: Configuration for the dbt project.

---

## Setup Instructions

### Prerequisites
- Docker
- Astronomer CLI
- Python 3.9+

### Steps
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```
2. Start the Airflow environment:
   ```bash
   astro dev start
   ```
3. Access the Airflow UI at [http://localhost:8080](http://localhost:8080).

4. Install dbt dependencies:
   ```bash
   dbt deps
   ```

5. Run dbt commands:
   ```bash
   dbt run
   dbt test
   ```

---

## Key Components

### Airflow DAGs
- **`dbt_dag.py`**: Orchestrates the dbt project using Cosmos.
- **`exampledag.py`**: Demonstrates dynamic task mapping and TaskFlow API.

### dbt Models
- **Staging Models**:
  - `stg_tpch_orders.sql`: Transforms raw orders data.
  - `stg_tpch_line_items.sql`: Transforms raw line items data.
- **Marts Models**:
  - `int_order_items.sql`: Joins orders and line items.
  - `fct_orders.sql`: Fact table summarizing orders.

### Custom Macros
- **`discounted_amount`**: Calculates discounted amounts for items.

---

## Testing

### Airflow DAG Tests
- Located in `tests/dags/`.
- Validates DAG integrity, tags, and retries.

### dbt Tests
- SQL-based tests in `tests/` and `models/marts/generic_tests.yml`.
- Includes tests for:
  - Not null constraints.
  - Unique constraints.
  - Relationships between models.

---

## Deployment

### Local Deployment
1. Start the Airflow environment:
   ```bash
   astro dev start
   ```
2. Access the Airflow UI at [http://localhost:8080](http://localhost:8080).

### Production Deployment
- Follow Astronomer’s [deployment guide](https://www.astronomer.io/docs/astro/deploy-code/).

---

## Resources

- [dbt Documentation](https://docs.getdbt.com/)
- [Airflow Documentation](https://airflow.apache.org/)
- [Astronomer Documentation](https://www.astronomer.io/docs/)
- [Cosmos Documentation](https://cosmos.astronomer.io/)

---

## Contact

For issues or questions, reach out to the project maintainers or consult the [Astronomer community](https://community.astronomer.io/).
```