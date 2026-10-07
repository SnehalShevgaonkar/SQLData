# SQLData

A SQL-focused data project designed for data cleaning, exploratory analysis, and business reporting using a sample database challenge. The repository contains raw CSV datasets, SQL scripts for database setup, and query solutions for a series of analysis tasks.

## Project Overview

This project demonstrates how to:

- import structured datasets into a relational database
- clean and validate messy raw data
- normalize inconsistencies in names, dates, and cities
- perform SQL-based business analysis and reporting
- solve task-based data challenges using MySQL/SQL queries

## Repository Structure

- `Data Set/Row datasets/` — raw CSV datasets used in the project
- `Queries/` — SQL scripts for database creation and challenge tasks
- `Screenshots collection/` — examples of validation and cleaning checks
- `.vscode/` — editor settings

## Included Datasets

The project includes datasets such as:

- `customers.csv`
- `departments.csv`
- `employees.csv`
- `orders.csv`
- `order_details.csv`
- `payments.csv`
- `products.csv`
- `performance.csv`
- `salaries.csv`
- `attendance.csv`

These datasets cover employee, sales, payment, and operational records and include real-world data issues like missing values, inconsistent city names, duplicate records, and invalid entries.

## Database Setup

The database used in the project is:

```sql
CREATE DATABASE SqlChallenge;
USE SqlChallenge;
```

After creating the database, import the CSV files into MySQL or a compatible SQL client and build the required tables for analysis.

## SQL Query Tasks

The `Queries/` folder contains multiple SQL files such as:

- `Database creation.sql`
- `Task_2.sql`
- `Task_10.sql`
- `Task_15.sql`
- `Task_50.sql`

These task files represent a sequence of SQL exercises focused on:

- data quality checks
- missing value detection
- duplicate identification
- business insights from employee and customer data
- sales and performance analytics

## Data Quality Focus

The dataset includes common data quality problems such as:

- null or empty values
- duplicate rows
- inconsistent capitalization (`mumbai`, `Mumbai`, `DELHI`)
- invalid dates
- missing employee/customer names or IDs
- outlier and invalid salary/age values

This makes the project useful for practicing SQL-based cleaning, validation, and transformation logic.

## Typical Use Cases

- Data cleaning and preprocessing in SQL
- Business intelligence queries
- Reporting on employee and sales performance
- Practice for SQL interview and challenge tasks
- Data validation workflows in analytics projects

## Notes

This repository is designed as a learning and SQL challenge project. It is useful for anyone looking to improve their SQL skills through realistic data issues and business-style analytical questions.

## License

No explicit license is currently defined for this repository.

## Author

Repository owner: SnehalShevgaonkar
