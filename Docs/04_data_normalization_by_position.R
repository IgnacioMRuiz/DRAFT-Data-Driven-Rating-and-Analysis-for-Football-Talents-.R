library(readxl)
library(dplyr)
library(writexl)

# Rutas de los directorios
directorio_entrada <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Segmented"
directorio_salida <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Normalized"

# Lista todos los archivos .xlsx en el directorio de entrada
archivos <- list.files(directorio_entrada, pattern = "\\.xlsx$", full.names = TRUE)

# Función para normalizar las columnas con z-score
normalizar <- function(x) {
  (x - mean(x, na.rm = TRUE)) / sd(x, na.rm = TRUE)
}

# Iterar sobre cada archivo y aplicar la normalización
for (ruta_archivo in archivos) {
  # Leer el archivo
  datos <- read_excel(ruta_archivo)
  
  # Extraer el nombre de la posición del nombre del archivo
  posicion <- tools::file_path_sans_ext(basename(ruta_archivo))
  
  # Selecciona columnas para normalizar (ejemplo: 'Goles', 'Asistencias', etc.)
  # Asegúrate de incluir aquí las columnas que deseas normalizar
  columnas_metricas <- c("Faltas x90", "Tarjetas Amarillas", "Tarjetas Amarillas x90",
                         "Tarjetas Rojas", "Tarjetas Rojas x90", "Faltas Sufridas x90",
                         "Aceleraciones x90", "Carreras Progresivas x90", "Goles Concedidos",
                         "Goles Concedidos x90", "Xg Parado", "Xg Parado x90", "Porterías A Cero",
                         "Tiros En Contra", "Tiros En Contra x90", "Paradas x90", "Paradas, %",
                         "Goles Prevenidos", "Salidas Del Portero x90", "Duelos Aéreos Del Portero x90",
                         "Goles Prevenidos x90", "Acciones Defensivas Exitosas x90", "Intercepciones x90",
                         "Intercepciones AjPos x90", "Entradas x90", "Entradas AjPos x90", "Duelos x90",
                         "Duelos Ganados", "Duelos Defensivos Ganados", "Duelos Defensivos x90",
                         "Duelos Aéreos x90", "Duelos Aéreos Ganados", "Duelos Ofensivos Ganados",
                         "Duelos Ofensivos x90", "Pases x90", "Pases Completados, %",
                         "Pases Cortos Y Medios x90", "Pases Cortos Y Medios Completados, %",
                         "Longitud Promedio De Pase", "Pases Hacia Adelante x90",
                         "Pases Hacia Adelante Completados, %", "Pases Verticales x90",
                         "Pases Verticales Completados, %", "Pases Clave x90", "Pases Inteligentes x90",
                         "Pases Inteligentes Completados, %", "Pases a Último Tercio x90",
                         "Pases Completados a Último Tercio, %", "Pases al espacio Exitosos, %",
                         "Pases al espacio x90", "Pase Profundo Completado x90",
                         "Centros Completados, %", "Pase Progresivo x90",
                         "Pase Progresivo Completados, %", "Pase A Área De Penalti x90",
                         "Pase Preciso A Área De Penalti, %", "Centros x90",
                         "Centros Desde La Derecha x90", "Centros Completados Desde La Derecha, %",
                         "Centros Desdes La Izquierda x90", "Centros Completados Desde La Izquierda, %",
                         "Centros al Área x90", "Centros Profundos Completados x90", "Pases Largos x90",
                         "Longitud Promedio De Pase Largo", "Pases Largos Completados, %", "Pases Recibidos x90",
                         "Pases Largos Recibido x90", "Asistencias", "Asistencias x90", "xA", "xA x90",
                         "Preasistencia x90", "Pre Preasistencia x90", "Asistencias De Tiro x90",
                         "Pases Hacia Atrás x90", "Pases Hacia Atrás Completados, %",
                         "Pase Hacia Atrás Al Portero x90", "Acciones Ofensivas Completados x90",
                         "Regates x90", "Regates Completados, %", "Tiros", "Tiros x90",
                         "Tiros A Puerta, %", "Xg", "Xg x90", "Goles", "Goles x90", "Goles De Cabeza",
                         "Goles De Cabeza x90", "Toques En El Área x90", "Goles sin Penalti",
                         "Goles sin Penalti x90", "Penaltis Tirados", "Penaltis Marcados, %",
                         "Tasa de Conversión de Gol, %", "Tiros Libres Tirados x90",
                         "Tiros Libres Directos Tirados x90", "Tiros Libres Directos A Puerta, %",
                         "Córners Tirados x90", "Diferencia_xG_Goles") # Modifica según sea necesario
  
  # Aplicar normalización sólo a las columnas de métricas
  datos[, columnas_metricas] <- lapply(datos[, columnas_metricas], normalizar)
  
  # Asegúrate de que no hay NAs resultantes de la normalización
  datos[, columnas_metricas][is.na(datos[, columnas_metricas])] <- 0
  
  # Construir la ruta de salida para el archivo normalizado
  ruta_salida_archivo <- file.path(directorio_salida, paste0(posicion, "_normalizado.xlsx"))
  
  # Escribir los datos normalizados en un nuevo archivo .xlsx
  write_xlsx(datos, ruta_salida_archivo)
}

rm(list = ls())