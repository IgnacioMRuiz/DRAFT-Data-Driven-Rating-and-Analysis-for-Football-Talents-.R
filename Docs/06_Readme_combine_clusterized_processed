# Overview
This script is designed to unify clustered player data with processed player statistics, culminating in a comprehensive dataset that combines both sets of information. The script merges cluster information from the 'Clusterized' directory with the detailed player statistics from the 'Processed' directory. The final output is a single Excel file containing the amalgamated data, which is then stored in the 'Final' directory.

# Requirements
- R Programming Environment
- R Libraries: readxl, dplyr, writexl

# File Paths
- Input Clustered Data Directory: /Users/nacho/Desktop/DV7/PowerBI_App/Data/Clusterized
- Input Processed Data File: /Users/nacho/Desktop/DV7/PowerBI_App/Data/Processed/player_stats_all_seasons.xlsx
- Output Final Data Directory: /Users/nacho/Desktop/DV7/PowerBI_App/Data/Final

# Usage
1. Ensure that the clusterized player data files are present in the specified 'Clusterized' directory.
2. Confirm that the processed player statistics file is available in the 'Processed' directory.
3. Run the script in your R environment. The script will perform the following steps:
  - Load and bind all clusterized data files into a single dataframe.
  - Read the processed player statistics data.
  - Merge the clusterized data with the processed data based on a unique identifier (ID_unico).
  - Export the combined data to an Excel file named player_stats_final.xlsx in the 'Final' directory.

# Output
- Excel File: player_stats_final.xlsx
  - This file contains the combined data from both clusterized and processed datasets, providing a holistic view of each player's statistics and their corresponding cluster information.

# Notes
- The script assumes a consistent naming convention and data structure in the input files.
- It is essential to ensure that the ID_unico column is correctly formatted and consistent across all datasets for accurate merging.
- In case of any discrepancies or data integrity issues, it is recommended to review the input files and adjust the script accordingly.
