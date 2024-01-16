# Overview
This R script is designed to segment and export football player data based on their position on the field. It uses a previously processed dataset, divided according to the "General Position" of each player, and generates separate Excel files for each position. This process facilitates position-specific analysis and improves data organisation for applications such as Power BI visualisations.

# Requirements
- R and RStudio: Development and execution platforms.
- R libraries:
  - readxl: For reading Excel files.
  - dplyr: For data manipulation.
  - writexl: For writing Excel files.

# Installation
- Install R and RStudio on your computer.
- Install the necessary libraries with the following commands in R:
  - install.packages("readxl")
  - install.packages("dplyr")
  - install.packages("writexl")

# Usage
1. Make sure that the processed data file (player_stats_all_seasons.xlsx) is located in the specified path (/Users/nacho/Desktop/DV7/PowerBI_App/Data/Processed).
2. Define the output path for the segmented files in the output_path variable.
3. Run the script in RStudio. The script will perform the following actions:
  - It will load the player dataset from the Excel file.
  - Verify the existence of the 'General_position' column in the dataframe.
  - Create subsets of data for each unique position found in 'General_Position'.
  - Generate and save an Excel file for each position subset to the specified output path.

# Code Structure
The code is structured as follows:
- Load Libraries: Imports the readxl, dplyr and writexl libraries.
- File Path Definition: Sets the input and output paths for the files.
- Load Data: Reads the player dataset from an Excel file.
- Essential Column Verification: Ensures that the 'General_position' column is present.
- Data Segmentation: Splits the dataset into subsets based on player position.
- Export Segmented Data: Writes Excel files for each subset to the specified location.

# Additional Notes
- Verify that the input and output file paths are correct and accessible on your system.
- This script is specifically for segmenting data based on player positions. If the input data or requirements change, the script may need to be adjusted.
