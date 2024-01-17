# Overview
The "Master" script is an automated execution script designed to run a series of data processing scripts for football player data analysis. This script ensures that all steps in the data processing pipeline are executed in the correct order and efficiently manages the flow of data through each stage.

# Key Features
- Token Management: Manages a single entry point for the Wyscout API token, ensuring consistency and ease of updates across all scripts.
- Error Handling: Utilizes tryCatch to gracefully handle any errors in individual scripts, preventing the continuation of the pipeline if an error occurs.
- Execution Time Tracking: Records the total execution time, providing insights into the efficiency of the data processing pipeline.
- Modular Execution: Scripts are listed in an array and executed sequentially, allowing for easy modification of the execution order or addition/removal of steps.

# Requirements
- R environment with the following libraries: readxl, dplyr, writexl.
- Access to the individual R scripts listed in the pipeline.
- A valid Wyscout API token.

# Usage
1. Set the Working Directory: Ensure that the working directory is set to the folder containing all relevant scripts.
2. Update the Token: Modify the token variable with the current Wyscout API token.
3. Execute the Script: Run the "Master" script in your R environment. The script will automatically process each step in the order specified in the scripts array.

# Script List
The "Master" script executes the following scripts in order:
  - 01_data_extraction_2023.R
  - 02_data_cleaning.R
  - 03_data_segmentation_by_position.R
  - 04_data_normalization_by_position.R
  - 05_position_specific_clustering.R
  - 06_combine_clusterized_processed.R

# Error Handling
If an error occurs in any script, the execution halts, and an error message is displayed, indicating which script failed and the nature of the error.

# Execution Time
At the end of the execution, the total time taken is displayed, offering a metric for performance evaluation.

# Note
It's important to regularly update the Wyscout API token in the script, as it changes frequently.
