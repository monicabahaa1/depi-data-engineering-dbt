# Data Warehouse Project Using dbt

A Data Engineering project developed as part of the **Digital Egypt Pioneers Initiative (DEPI)**. The project uses dbt Core and Microsoft SQL Server to transform raw employee data into structured staging and data warehouse models.

## Project Overview

This project demonstrates a data transformation workflow using dbt, including data cleaning, staging models, dimension tables, a fact model, data quality testing, reusable macros, and project documentation.

The main objective is to organize employee data into a maintainable structure that supports data analysis and reporting.

## Architecture

The project follows this workflow:

**Source Data → Staging Layer → DWH Layer**

- **Source Layer:** Raw employee data stored in SQL Server.
- **Staging Layer:** Cleans, standardizes, and transforms the source data.
- **DWH Layer:** Organizes data into dimension models and a fact model.

### Data Lineage

The `STG_OBT` model provides consolidated employee data to `FACTEmployee`.

The fact model joins the staging data with the following dimension models to retrieve their corresponding keys