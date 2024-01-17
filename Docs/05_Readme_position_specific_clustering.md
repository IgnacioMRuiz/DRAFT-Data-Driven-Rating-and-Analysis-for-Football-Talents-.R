# Overview
This R script, 05_position_specific_clustering.R, is designed for clustering football players based on their position-specific 
metrics using UMAP (Uniform Manifold Approximation and Projection) for dimensionality reduction and GMM (Gaussian Mixture Models) 
for clustering. It takes segmented player data, applies UMAP and GMM based on selected metrics for each position, and outputs clustered data,
including UMAP dimensions and cluster assignments. This process is crucial for detailed player analysis and is particularly useful 
for applications such as Power BI visualizations and advanced statistical analyses.

# Requirements
- R and RStudio: Development and execution platforms.
- R Libraries:
  - readxl: For reading Excel files.
  - umap: For applying UMAP algorithm.
  - mclust: For Gaussian Mixture Models (GMM) clustering.
  - dplyr: For data manipulation.
  - writexl: For writing Excel files.

# Usage
1. Ensure the segmented data files are located in the specified path (e.g., /Users/nacho/Desktop/DV7/PowerBI_App/Data/Segmented).
2. Place the metrics profile file (e.g., Metrics_Profiles.xlsx) in the known path.
3. Define the output path for the clustered files (e.g., /Users/nacho/Desktop/DV7/PowerBI_App/Data/Clusterized).
4. Run the script in RStudio. The script will execute the following actions:
  - Load the player dataset from each segmented Excel file.
  - Read position-specific metrics from the metrics profile file.
  - Apply UMAP and GMM for each position using relevant metrics.
  - Append ID_unico for identification and future data merging.
  - Save the clustered data for each position into Excel files in the specified output path.

# Code Structure
- Load Libraries: Imports necessary libraries for data handling, UMAP, GMM, and file operations.
- Metric Reader Function: Reads specific metrics for each position from the Excel file.
- Clustering Function: Applies UMAP and GMM to the data of each position using its specific metrics.
- Hyperparameter Definitions: Sets adjustable parameters for UMAP and GMM algorithms.
- Data Paths: Defines the paths for input segmented data and output clustered data.
- Main Loop: Iterates over each position, loads data, applies clustering, and saves results.

# Additional Notes
- Ensure all file paths are correctly set and accessible on your system.
- The script is adaptable to various positions and metric sets, making it versatile for different datasets.
- If input data structure or requirements change, adjustments to the script might be necessary.
