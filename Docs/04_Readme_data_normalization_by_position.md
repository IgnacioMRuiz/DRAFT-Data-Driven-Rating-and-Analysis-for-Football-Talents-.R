# Overview
This R script, designed for normalizing football player data, applies a z-score normalization to selected metrics based on their position on the field. The script processes segmented data from individual Excel files, normalizes relevant statistical columns using the z-score method, and outputs the normalized data into separate Excel files. This is crucial for standardizing data for comparable analysis across different player positions, making it particularly useful for advanced statistical analyses and visualizations in platforms like Power BI.

# Requirements
- R and RStudio: Development and execution platforms.
- R Libraries:
  - readxl: For reading Excel files.
  - dplyr: For data manipulation.
  - writexl: For writing Excel files.

# Usage
1. Ensure the segmented data files (post-clustering) are located in the specified path (e.g., /Users/nacho/Desktop/DV7/PowerBI_App/Data/Segmented).
2. Define the output path for the normalized files (e.g., /Users/nacho/Desktop/DV7/PowerBI_App/Data/Normalized).
3. Run the script in RStudio. The script will execute the following actions:
  - Load player datasets from segmented Excel files.
  - Apply z-score normalization to specific metrics for each dataset.
  - Save the normalized data into separate Excel files in the specified output path.

# Code Structure
- Load Libraries: Imports necessary libraries for data handling and file operations.
- Directory Path Definitions: Sets the paths for input and output directories.
- Normalization Function: Defines the function for applying z-score normalization.
- Main Loop: Iterates over each file in the segmented data directory, applies normalization, and saves the results.

# Additional Notes
- Ensure all file paths are correctly set and accessible on your system.
- The list of metrics to normalize is predefined in the script but can be modified according to specific requirements.
- If input data structure or requirements change, adjustments to the script might be necessary.
