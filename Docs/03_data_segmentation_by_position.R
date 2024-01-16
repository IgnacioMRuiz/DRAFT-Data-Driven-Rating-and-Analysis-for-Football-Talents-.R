library(readxl)
library(dplyr)
library(writexl)

# Rutas de archivos
input_path <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Processed/player_stats_all_seasons.xlsx"
output_path <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Segmented"

# Cargar los datos limpios
player_stats <- read_excel(input_path)

# Asegurarse de que "Posición_General" está en el dataframe
if(!"Posición_General" %in% names(player_stats)) {
  stop("La columna 'Posición_General' no se encuentra en el dataframe.")
}

# Crear subconjuntos de datos basados en "Posición_General"
positions <- unique(player_stats$Posición_General)

# Crear un archivo .xlsx por cada posición y agregar la columna Key
for(position in positions) {
  #Filtrar datos para la posición actual
  players_in_position <- player_stats %>%
    filter(Posición_General == position)
  
  # Definir el nombre del archivo de salida
  file_name <- paste0(position, "_stats.xlsx")
  file_path <- file.path(output_path, file_name)
  
  #Escribir el archivo .xlsx
  write_xlsx(players_in_position, file_path)
}
  
rm(list = ls())