# DEPI Data Engineering Project — dbt

A Data Engineering project built as part of the Digital Egypt Pioneers Initiative (DEPI), implementing **Staging and Data Warehouse (DWH) layers** using dbt and SQL Server.

## Project Overview

This project transforms raw employee data into structured, reusable data models. It demonstrates data cleaning, transformation, testing, documentation, and modular SQL development with dbt.

## Architecture

The project follows a layered approach:

- **Source / ODS:** Raw employee data stored in SQL Server.
- **Staging Layer:** Cleans and prepares source data for downstream transformations, including individual staging models and `STG_OBT`.
- **DWH Layer:** Builds dimension models and a fact model for analytics. `FACTEmployee` uses `STG_OBT` and joins the dimension models to retrieve their corresponding keys.

## Project Structure

```text
models/
├── staging/
│   ├── STG_DIMCountry.sql
│   ├── STG_DIMDate.sql
│   ├── STG_DIMDepartement.sql
│   ├── STG_DIMEmployee.sql
│   ├── STG_DIMGender.sql
│   ├── STG_OBT.sql
│   ├── schema.yml
│   └── sources.yml
└── dwh/
    ├── DIMCountry.sql
    ├── DIMDate.sql
    ├── DIMDepartement.sql
    ├── DIMEmployee.sql
    ├── DIMGender.sql
    ├── FACTEmployee.sql
    └── schema.yml

macros/
└── capitalize_name.sql

tests/
├── assert_email_not_null.sql
└── assert_non_negative_salary.sql
```

## Key Features

- Separate schema YAML files for the Staging and DWH layers.
- Source definitions using dbt sources.
- Reusable SQL transformations for data cleaning and standardization.
- Dimension models for employee, country, gender, department, and date data.
- A `STG_OBT` model that consolidates employee data for downstream transformations.
- A `FACTEmployee` model that joins `STG_OBT` with dimension models using `LEFT JOIN`.
- Singular SQL tests for email validation and non-negative salary checks.
- Generic tests configured in schema YAML files, where defined.
- A custom macro for formatting employee full names.
- Model and column documentation for dbt Docs.

## Tech Stack

- dbt Core
- Microsoft SQL Server
- T-SQL
- YAML
- Python
- Git and GitHub

## Running the Project

1. Configure your SQL Server connection in your local dbt profile.
2. Install any required dbt dependencies.
3. Parse the project:

   ```bash
   dbt parse
   ```

4. Run the models:

   ```bash
   dbt run
   ```

5. Run data quality tests:

   ```bash
   dbt test
   ```

6. Generate and serve the documentation locally:

   ```bash
   dbt docs generate
   dbt docs serve
   ```

## Author

**Monica Bahaa**

Software Engineering Student | Data Engineering Trainee at DEPI

- GitHub: [https://github.com/monicabahaa1](https://github.com/monicabahaa1)
- LinkedIn: [https://www.linkedin.com/in/monica-bahaa](https://www.linkedin.com/in/monica-bahaa)

---

*Developed as part of the Digital Egypt Pioneers Initiative (DEPI).*
