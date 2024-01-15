# Overview
These R scripts are designed for extracting football player statistics from the Wyscout API, focusing on various leagues over different seasons. They utilize libraries like rjson, readxl, dplyr, stringr, and writexl to handle data retrieval, manipulation, and exportation. The primary functionality includes reading league information, querying the Wyscout API, processing the received data, and exporting the results to Excel files.

# Requirements
  - R Programming Environment
  - R Libraries: rjson, readxl, dplyr, stringr, writexl (install them using install.packages("<library_name>"))

# Files Structure
  1. player_stats_extraction_2018_2022.R - Extracts player statistics from 2018 to 2022 seasons.
  2. player_stats_extraction_2023.R` - Extracts player statistics for the 2023 season.

# Configuration
  - Wyscout Token: A valid Wyscout token is required for API access. This token updates approximately every 20 minutes.
  - Leagues List File Path: Set the file path to the Excel file containing the list of leagues (ruta_archivo variable).

# Usage
1. Setting up the Token and File Path:
  - Update the token variable with your current Wyscout token.
  - Modify ruta_archivo to the path of your leagues list Excel file.
2. Running the Script:
  - Load the script in your R environment and execute.
  - The script reads the leagues list, iterates through each league and season, and fetches player statistics using the Wyscout API.
  - It processes and aggregates the data into a single dataframe.

# Key Operations
  - Data Retrieval: Uses readxl for reading the Excel file containing leagues and rjson for parsing JSON data from the Wyscout API.
  - Data Processing: Employs dplyr for data manipulation (filtering, binding rows) and stringr for string operations.
  - Exporting Data: The final dataframe is exported as an Excel file using writexl.

# Output
- Excel Files:
  - player_stats_2018_2022_raw.xlsx for the first script.
  - player_stats_2023_raw.xlsx for the second script.
    These files contain processed player statistics for the specified seasons and leagues.

# Notes
- API Limitations: Be aware of any rate limits or data constraints imposed by the Wyscout API.
- Token Security: Ensure the security of your Wyscout token, as it provides access to the API.
- Data Accuracy: Regularly validate the accuracy and completeness of the extracted data.
- Error Handling: Implement error handling for API requests and data processing to manage unexpected issues.

# Customization
- The scripts can be modified to target different leagues or seasons by adjusting the leagues list in the Excel file and the timeframe in the API request.
- Additional data processing or analysis steps can be incorporated as per specific requirements.

# Support
For any issues or questions regarding the script, please refer to the Wyscout API documentation or contact their support team for API-related queries. For script-specific issues, consider reaching out to a professional with expertise in R programming and data analysis in football.
