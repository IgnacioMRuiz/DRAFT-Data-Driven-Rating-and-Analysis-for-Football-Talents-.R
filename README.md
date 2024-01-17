# Introducción
Este proyecto está diseñado para analizar datos de jugadores de fútbol, utilizando un conjunto de scripts en R para automatizar la extracción, procesamiento, normalización, clusterización y unificación de datos. El flujo de trabajo se organiza en varios pasos, cada uno con un script dedicado, y genera archivos específicos que se utilizan en etapas subsiguientes.

# 1. Extracción de Datos (01_data_extraction_2023.R y 01_data_extraction_2018_2022.R)
Función: Estos scripts extraen datos de jugadores de fútbol de una API utilizando un token de acceso. La extracción se realiza para varias temporadas y ligas.
Archivos Generados: Los datos extraídos se guardan en archivos Excel en la carpeta /Data/Raw, como player_stats_2018_2022_raw.xlsx y player_stats_2023_raw.xlsx.

# 2. Limpieza de Datos (02_data_cleaning.R)
Función: Este script procesa los datos extraídos para limpiarlos y estructurarlos adecuadamente. Incluye la eliminación de duplicados y la selección de columnas relevantes.
Archivos Generados: Los datos limpios se guardan en player_stats_all_seasons.xlsx dentro de la carpeta /Data/Processed.

# 3. Segmentación de Datos por Posición (03_data_segmentation_by_position.R)
Función: Segmenta los datos limpios basándose en la posición general de los jugadores, creando subconjuntos de datos para cada posición.
Archivos Generados: Se crean archivos Excel individuales para cada posición en la carpeta /Data/Segmented.
# 4. Normalización de Datos por Posición (04_data_normalization_by_position.R)
Función: Normaliza estadísticas de jugadores dentro de cada subconjunto de posición utilizando el z-score.
Archivos Generados: Los datos normalizados se guardan en archivos Excel separados por posición en la carpeta /Data/Normalized.

# 5. Clusterización Específica por Posición (05_position_specific_clustering.R)
Función: Aplica técnicas de reducción de dimensionalidad (UMAP) y modelado de mezcla gaussiana (GMM) para clusterizar jugadores en cada posición.
Archivos Generados: Los resultados de la clusterización se guardan en archivos Excel dentro de la carpeta /Data/Clusterized.

# 6. Combinación de Datos Clusterizados y Procesados (06_combine_clusterized_processed.R)
Función: Combina los datos clusterizados con los datos procesados originales, uniendo información clave como "Cluster", "UMAP1" y "UMAP2".
Archivos Generados: El archivo combinado final se guarda como player_stats_final.xlsx en la carpeta /Data/Final.

# Script Maestro de Ejecución (Master.R)
Función: Ejecuta automáticamente todos los scripts anteriores en secuencia, asegurando un flujo de trabajo fluido y automatizado.
Características Adicionales: Gestiona un token de acceso y captura errores para garantizar la ejecución correcta de cada paso.

# ¡¡Nota Importante sobre el Token de Wyscout y los Scripts de Extracción de Datos!!
  # Gestión del Token en el Script Maestro:
  - El elemento más crítico que **requiere actualización regular** es el **token** de acceso para Wyscout, necesario para la ejecución del script 01_data_extraction_2023.R y los subsiguientes.
  - Este token se obtiene a través de la funcionalidad de herramientas de desarrollador de Wyscout y **cambia aproximadamente cada 20 minutos**.
  - Si el token no está actualizado al momento de la ejecución, el script producirá un error.
  - El token debe actualizarse en el script maestro (Master.R), y este cambio se propagará a los scripts de extracción de datos cuando se ejecuten desde el maestro.

  # Impacto en la Integridad de los Datos:
  - Si el script 01_data_extraction_2023.R no se ejecuta correctamente debido a un token inválido, la integridad de los datos extraídos estará comprometida. Esto puede afectar a todas las fases subsiguientes del proyecto, ya que dependen de los datos iniciales extraídos.
  # Manejo de Scripts de Extracción de Datos:
  - Existen dos scripts de extracción de datos: 01_data_extraction_2023.R para la temporada actual y 01_data_extraction_2018_2022.R para temporadas anteriores.
  - El script para las temporadas anteriores **no necesita ser incluido** en el bucle de ejecución del script maestro, ya que maneja datos históricos que son de naturaleza estática y no cambian.
  - Estos scripts solo deberían modificarse para mantenimiento o alteraciones puntuales, aparte de la actualización regular del token.

La correcta gestión del token es esencial para garantizar el flujo ininterrumpido y la precisión del proyecto.
