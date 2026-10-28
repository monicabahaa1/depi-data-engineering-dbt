# DEPI Data Engineering Project — dbt

A Data Engineering project developed as part of the **Digital Egypt Pioneers Initiative (DEPI)**. This project uses **dbt and Microsoft SQL Server** to transform raw employee data into a structured Data Warehouse.

## Project Overview

The project demonstrates a layered data transformation workflow, including data cleaning, staging models, dimensional modeling, fact table creation, data quality testing, reusable macros, and automated documentation.

## Architecture

The project follows a layered architecture:

**ODS / Source → Staging → Data Warehouse**

### 1. Source / ODS

Raw employee data is stored in Microsoft SQL Server and accessed through a dbt source definition.

### 2. Staging Layer

The staging layer prepares clean, reusable data for downstream transformations.

- `STGEmployee`: Cleans and standardizes employee data, including names, email addresses, gender, dates of birth, salary, departments, and countries.
- `STG_DIMCountry`: Extracts distinct country values.
- `STG_DIMGender`: Extracts distinct gender values.
- `STG_DIMDepartement`: Extracts distinct department values.
- `STG_DIMDate`: Extracts distinct dates of birth.
- `STG_DIMEmployee`: Prepares employee attributes for the employee dimension.
- `STG_OBT`: Combines cleaned employee attributes and generates a full name using a custom macro.

Staging models are configured as **views**.

### 3. Data Warehouse Layer

The DWH layer builds materialized tables using the staging models and dbt `ref()` dependencies.

**Dimension models**

- `DIMCountry`: Country dimension with `country_id`.
- `DIMGender`: Gender dimension with `gender_id`.
- `DIMDepartement`: Department dimension with `department_id`.
- `DIMDate`: Date dimension with `date_key` and calendar attributes.
- `DIMEmployee`: Employee dimension with descriptive employee attributes.

**Fact model**

- `FACTEmployee`: Builds an employee-level fact model from `STG_OBT`, joining the dimensions to retrieve their keys and retaining salary as a measure.

DWH models are configured as **tables**.

## Project Structure

```text
depi-data-engineering-dbt/
├── models/
│   ├── staging/
│   │   ├── STGEmployee.sql
│   │   ├── STG_DIMCountry.sql
│   │   ├── STG_DIMGender.sql
│   │   ├── STG_DIMDepartement.sql
│   │   ├── STG_DIMDate.sql
│   │   ├── STG_DIMEmployee.sql
│   │   ├── STG_OBT.sql
│   │   ├── schema.yml
│   │   └── sources.yml
│   └── dwh/
│       ├── DIMCountry.sql
│       ├── DIMGender.sql
│       ├── DIMDepartement.sql
│       ├── DIMDate.sql
│       ├── DIMEmployee.sql
│       ├── FACTEmployee.sql
│       └── schema.yml
├── macros/
│   └── capitalize_name.sql
├── tests/
│   ├── assert_email_not_null.sql
│   └── assert_non_negative_salary.sql
├── docs/
├── dbt_project.yml
└── README.md
```

## Key Features

- Separate Staging and DWH layers.
- Source definitions using dbt sources.
- Reusable model dependencies through `ref()`.
- Data cleaning and standardization with SQL.
- Dimension models and an employee-level fact model.
- Generic data tests for uniqueness and non-null values.
- Singular SQL tests for data quality validation.
- A custom macro for generating employee full names.
- Model and column descriptions for dbt documentation.
- GitHub-based project version control and documentation hosting.

## Tech Stack

- dbt Core
- dbt SQL Server adapter
- Microsoft SQL Server
- T-SQL
- Python environment
- YAML
- Git and GitHub

## Getting Started

### Prerequisites

- Python
- dbt Core
- The dbt SQL Server adapter
- Microsoft SQL Server
- A configured dbt profile

### Configure the connection

Configure your SQL Server connection in your local dbt profile. Ensure that the source database and source table match the definitions in `models/staging/sources.yml`.

### Run the project

Run these commands from the dbt project directory:

```bash
dbt debug
dbt parse
dbt run
dbt test
```

Generate and serve the documentation locally:

```bash
dbt docs generate
dbt docs serve
```

## Documentation

- **GitHub Repository:** https://github.com/monicabahaa1/depi-data-engineering-dbt
- **Project Documentation:** https://monicabahaa1.github.io/depi-data-engineering-dbt/

## Author

**Monica Bahaa**

Software Engineering Student | Data Engineering Trainee at DEPI

- **GitHub:** https://github.com/monicabahaa1
- **LinkedIn:** https://www.linkedin.com/in/monica-bahaa

---

Developed as part of the Digital Egypt Pioneers Initiative (DEPI).
