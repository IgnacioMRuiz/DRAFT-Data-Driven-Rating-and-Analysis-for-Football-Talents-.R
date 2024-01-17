# Cargar librerías necesarias
library(readxl)
library(umap)
library(mclust)
library(dplyr)
library(writexl)

# Función para leer métricas específicas de cada posición desde un archivo Excel
leer_metricas_por_posicion <- function(archivo_metricas) {
  posiciones_metricas <- list()
  nombres_hojas <- excel_sheets(archivo_metricas)
  
  for (nombre_hoja in nombres_hojas) {
    # Leer la hoja actual
    datos_hoja <- read_excel(archivo_metricas, sheet = nombre_hoja)
    # Seleccionar solo las métricas marcadas con "X"
    metricas <- datos_hoja %>%
      filter(X == "X") %>%
      select(1) %>%
      unlist()
    
    posiciones_metricas[[nombre_hoja]] <- metricas
  }
  
  return(posiciones_metricas)
}

# Función para realizar UMAP y GMM en los datos de una posición
clusterizar_posicion <- function(datos, metricas, umap_params, gmm_params) {
  # Aplicar UMAP
  umap_resultados <- umap(datos[, metricas], n_neighbors = umap_params$n_neighbors,
                          min_dist = umap_params$min_dist, n_components = umap_params$n_components)
  
  # Aplicar GMM
  gmm_resultado <- Mclust(umap_resultados$layout, G = gmm_params$G, modelNames = gmm_params$modelNames)
  
  # Crear dataframe con los resultados
  resultados_clusterizacion <- data.frame(UMAP1 = umap_resultados$layout[,1],
                                          UMAP2 = umap_resultados$layout[,2],
                                          Cluster = gmm_resultado$classification)
  
  return(resultados_clusterizacion)
}

# Hiperparámetros para UMAP y GMM
umap_params <- list(n_neighbors = 50, min_dist = 0.15, n_components = 2)
gmm_params <- list(G = 2:3, modelNames = c("EII", "VII", "EEE", "VEE"))

# Ruta del archivo de métricas por posición
archivo_metricas <- "/Users/nacho/Desktop/DV7/PowerBI_App/Docs/Other/Metrics_Profiles.xlsx"

# Leer métricas por posición
metricas_posiciones <- leer_metricas_por_posicion(archivo_metricas)

# Ruta de la carpeta con datos segmentados
ruta_datos_segmentados <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Segmented"

# Ruta de la carpeta de salida
ruta_carpeta_clusterized <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Clusterized"

# Iterar sobre cada posición y aplicar la clusterización
for (posicion in names(metricas_posiciones)) {
  # Cargar los datos de la posición
  ruta_archivo_datos <- paste0(ruta_datos_segmentados, "/", posicion, "_stats.xlsx")
  datos_posicion <- read_excel(ruta_archivo_datos)
  
  # Obtener métricas para la posición actual
  metricas <- metricas_posiciones[[posicion]]
  
  # Aplicar la clusterización
  resultados_clusterizacion <- clusterizar_posicion(datos_posicion, metricas, umap_params, gmm_params)
  
  # Añadir columna ID_unico
  resultados_clusterizacion$ID_unico <- datos_posicion$ID_unico
  
  # Guardar los resultados en formato Excel
  write_xlsx(resultados_clusterizacion, paste0(ruta_carpeta_clusterized, "/", posicion, "_clusterized.xlsx"))
}

rm(list = ls())
