# DEPI Data Engineering Project — dbt

A Data Engineering project built as part of the Digital Egypt Pioneers Initiative (DEPI), implementing **Staging and Data Warehouse (DWH) layers** using dbt and SQL Server.

## Project Overview

This project transforms raw employee data into structured, reusable data models. It demonstrates data cleaning, transformation, testing, documentation, and modular SQL development with dbt.

## Architecture

The project follows a layered approach:

- **Source / ODS:** Raw employee data stored in SQL Server.
- **Staging Layer:** Cleans and prepares source data for downstream transformations.
- **DWH Layer:** Builds dimensional models and an One Big Table (OBT) model for analytics.

## Project Structure

```text
models/
├── staging/
│   ├── STGEmployee.sql
│   ├── schema.yml
│   └── sources.yml
└── dwh/
    ├── DIMCountry.sql
    ├── DIMDate.sql
    ├── DIMDepartement.sql
    ├── DIMEmployee.sql
    ├── DIMGender.sql
    ├── OBT.sql
    └── schema.yml

macros/
└── capitalize_name.sql

tests/
├── assert_email_not_null.sql
└── assert_non_negative_salary.sql
```

## Key Features

- Separate schema YAML files for Staging and DWH.
- Source definitions using dbt sources.
- Reusable SQL transformations.
- Generic tests, including uniqueness and not-null checks.
- Singular SQL tests for data quality validation.
- A custom macro for formatting employee full names.
- Model and column descriptions for dbt documentation.
- Incremental materialization configured for the OBT model.

## Tech Stack

- dbt
- SQL Server
- T-SQL
- YAML
- Git and GitHub

## Running the Project

1. Configure your SQL Server connection in your local dbt profile.
2. Install any required dbt dependencies.
3. Run the models:

   ```bash
   dbt run
   ```

4. Run data quality tests:

   ```bash
   dbt test
   ```

5. Generate and serve the documentation locally:

   ```bash
   dbt docs generate
   dbt docs serve
   ```

## Author

**Monica Bahaa**

Software Engineering Student | Data Engineering Trainee at DEPI

- GitHub: https://github.com/monicabahaa1
- LinkedIn: https://www.linkedin.com/in/monica-bahaa

---

*Developed as part of the Digital Egypt Pioneers Initiative (DEPI).* 