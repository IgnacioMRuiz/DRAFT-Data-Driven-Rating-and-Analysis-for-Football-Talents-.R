# Cargar librerías necesarias
library(readxl)
library(dplyr)
library(writexl)

# Token (actualizar según sea necesario)
token <- "7239671bb3a677e3dd1fb31481f64dd88e838623"

# Establecer el directorio de trabajo donde se encuentran los scripts
setwd("/Users/nacho/Desktop/DV7/PowerBI_App/Docs")

# Lista de scripts a ejecutar
scripts <- c("01_data_extraction_2023.R",
             "02_data_cleaning.R",
             "03_data_segmentation_by_position.R",
             "04_data_normalization_by_position.R",
             "05_position_specific_clustering.R",
             "06_combine_clusterized_processed.R")

# Iniciar temporizador
start_time <- Sys.time()

# Entorno para usar en source()
source_env <- new.env()
source_env$token <- token

# Flag para seguir ejecutando los scripts
continue <- TRUE

# Ejecutar los scripts y capturar errores
for (script in scripts) {
  if (continue) {
    tryCatch({
      source(script, local = source_env)
      cat("Ejecutando:", script, "\n")
    }, error = function(e) {
      cat("Error en el script:", script, "\nError: ", e$message, "\n")
      continue <- FALSE
    })
  }
}

# Calcular el tiempo total de ejecución
end_time <- Sys.time()
execution_time <- end_time - start_time
cat("TIEMPO TOTAL DE EJECUCIÓN:", execution_time, "\n")

rm()