# Overview
The /Normalized folder contains football player data that has undergone a normalization process. This folder is a crucial component in the data processing pipeline, serving as a repository for data that has been standardized across various metrics. The normalization process involves applying a z-score normalization to selected statistical columns of player data, making the data comparable across different player positions and suitable for advanced statistical analyses and visualizations.

# Expected Files
Each file in this folder corresponds to a specific player position, reflecting the segmentation of data done in earlier steps of the pipeline. The names of the files are indicative of the player positions they represent. For example, a file named Midfielder_normalized.xlsx would contain normalized data for players in the Midfielder position.

# File Naming Convention
Files in this folder follow the naming convention: [Position]_normalized.xlsx, where [Position] is replaced with the specific player position. This convention helps in easily identifying and accessing data relevant to particular player positions.

# File Contents
Each file contains the following columns:
1. Player Metrics: Various statistical metrics relevant to the player position, such as goals, assists, passes completed, etc., that have been normalized.
2. ID_unico: A unique identifier for each player, preserved from the pre-normalization stage to maintain data integrity and facilitate future data merging and analysis.

# Usage
These normalized data files are ready for use in subsequent stages of data analysis, such as clustering, pattern recognition, or direct use in data visualization tools. The standardized format of the metrics ensures a fair and accurate comparison of player performances across different positions.
