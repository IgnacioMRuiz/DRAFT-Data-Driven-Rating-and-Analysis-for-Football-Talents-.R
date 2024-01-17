# Cargar librerías necesarias
library(readxl)
library(dplyr)
library(writexl)

# Rutas de los directorios
directorio_clusterized <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Clusterized"
directorio_processed <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Processed"
directorio_final <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Final"

# Unir todos los archivos Clusterized
archivos_clusterized <- list.files(directorio_clusterized, pattern = "\\.xlsx$", full.names = TRUE)
df_clusterized <- lapply(archivos_clusterized, read_excel) %>%
  bind_rows()

# Leer el archivo de estadísticas procesadas
df_procesado <- read_excel(file.path(directorio_processed, "player_stats_all_seasons.xlsx"))

# Combinar los dataframes
df_final <- left_join(df_procesado, df_clusterized, by = "ID_unico")

# Exportar el dataframe final
write_xlsx(df_final, file.path(directorio_final, "player_stats_final.xlsx"))

rm(list = ls())