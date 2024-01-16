# Overview
This R script is designed to clean and process the raw football player statistics extracted from the Wyscout API. It primarily involves importing raw data, merging datasets from different seasons, selecting relevant columns, renaming columns for clarity, converting data types, calculating new metrics, and finally exporting the cleaned data for further analysis or visualization purposes.

# Requirements
- R Programming Environment
- R Libraries: rjson, readxl, dplyr, stringr, writexl
- Raw data files: player_stats_2018_2022_raw.xlsx and player_stats_2013_raw.xlsx

# Configuration
Input File Paths: Modify the paths to the raw data Excel files (player_stats_2018_2022_raw and player_stats_2013_raw).
Output File Path: Set the path for the cleaned data Excel file (ruta_archivo_excel).

# Usage
1. Setting File Paths:**
  - Update the file paths for raw data Excel files and the output Excel file as per your local directory structure.

2. Running the Script:
  - Load the script in your R environment and execute it.
  - The script will import raw data, perform various cleaning and processing steps, and then export the cleaned data.

# Key Operations
- Data Importation: The script imports data from Excel files using read_excel.
- Data Merging: It combines data from different seasons into a single dataframe.
- Handling Missing Values: Missing values are replaced with zeros using mutate_all.
- Column Selection: Only relevant columns are kept based on a predefined list (columnas_a_conservar).
- Renaming Columns: Columns are renamed to Spanish for clarity and consistency (nombres_columnas_espanol).
- Data Type Conversion: Numeric conversions are performed for specific columns (columnas_para_convertir).
- New Metrics Calculation: Calculates new metrics like 'Diferencia xG/Goles'.
- New Column: Creation of new column Id_unica, to identify each row..
- General Position Mapping: Categorizes primary positions into general position groups.
- Exporting Data: The final cleaned and processed dataframe is exported as an Excel file using write_xlsx.

# Output
- Excel File:
  - player_stats_all_seasons.xlsx
  - This file contains the cleaned and processed player statistics, ready for analysis.
# Notes
- Customization:
  - The list of columns to retain or remove can be modified as per specific analytical needs.
  - The renaming of columns to Spanish is for ease of understanding in a specific context and can be changed as required.
- Data Integrity:
  - Ensure the correctness of the mappings and conversions to maintain data integrity.
