# Overview
The /Clusterized folder is an integral part of the football player data analysis pipeline, containing the results of a sophisticated clustering process. This folder houses the data that has been transformed through UMAP (Uniform Manifold Approximation and Projection) for dimensionality reduction and subsequently clustered using Gaussian Mixture Models (GMM). This advanced clustering technique categorizes players into distinct groups based on their performance metrics, tailored to their specific positions on the field.

# Expected Data Structure
The files within this folder are organized in XLSX format.

# Expected Files
Each file in this folder corresponds to a distinct player position and contains the clustered data specific to that position. The files are named to reflect the player positions they represent, aligning with the segmentation conducted in previous steps.

# File Naming Convention
Files in the /Clusterized folder follow the naming pattern: [Position]_clusterized.xlsx, where [Position] replaces with the specific player position, such as Forward, Midfielder, Defender, etc. This naming convention facilitates easy identification and retrieval of position-specific clustered data.

# File Contents
Each file typically contains the following columns:
1. UMAP Dimensions (UMAP1, UMAP2): Coordinates in the reduced dimensional space, representing the complex statistical relationships among players in a more digestible two-dimensional format.
2. Cluster: The cluster assignment for each player, indicating the group to which they have been categorized based on their performance metrics.
3. ID_unico: A unique identifier for each player, carried over from earlier stages of data processing, to maintain consistency and enable traceability throughout the analysis pipeline.

# Usage
The clustered data files are primed for in-depth analysis, pattern discovery, and insightful visualizations. Analysts and data scientists can use these files to identify underlying patterns, compare player performances within and across clusters, and extract meaningful insights about player roles and capabilities. The UMAP dimensions also offer a unique opportunity for advanced visual explorations of player data in a reduced dimensional space.

