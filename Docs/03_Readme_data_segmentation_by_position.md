# Descripción
Este script en R está diseñado para segmentar y exportar datos de jugadores de fútbol basados en su posición en el campo. Utiliza un conjunto de datos previamente procesado, dividido según la "Posición General" de cada jugador, y genera archivos Excel separados para cada posición. Este proceso facilita análisis específicos por posición y mejora la organización de los datos para aplicaciones como visualizaciones en Power BI.

# Dependencias
- R y RStudio: Plataformas de desarrollo y ejecución.
- Librerías de R:
  - readxl: Para la lectura de archivos Excel.
  - dplyr: Para la manipulación de datos.
  - writexl: Para escribir archivos Excel.
    
# Instalación
- Instale R y RStudio en su equipo.
- Instale las librerías necesarias con los siguientes comandos en R:
    - install.packages("readxl")
    - install.packages("dplyr")
    - install.packages("writexl")
      
# Uso
1. Asegúrese de que el archivo de datos procesados (player_stats_all_seasons.xlsx) esté ubicado en la ruta especificada (/Users/nacho/Desktop/DV7/PowerBI_App/Data/Processed).
2. Defina la ruta de salida para los archivos segmentados en la variable output_path.
3. Ejecute el script en RStudio. El script realizará las siguientes acciones:
- Cargará el conjunto de datos de jugadores desde el archivo Excel.
- Verificará la existencia de la columna 'Posición_General' en el dataframe.
- Creará subconjuntos de datos para cada posición única encontrada en 'Posición_General'.
- Generará y guardará un archivo Excel para cada subconjunto de posición en la ruta de salida especificada.

# Estructura del Código
El código se estructura de la siguiente manera:
- Carga de Librerías: Importa las librerías readxl, dplyr y writexl.
- Definición de Rutas de Archivos: Establece las rutas de entrada y salida para los archivos.
- Carga de Datos: Lee el conjunto de datos de jugadores desde un archivo Excel.
- Verificación de Columna Esencial: Asegura que la columna 'Posición_General' esté presente.
- Segmentación de Datos: Divide el conjunto de datos en subconjuntos basados en la posición de los jugadores.
- Exportación de Datos Segmentados: Escribe archivos Excel para cada subconjunto en la ubicación especificada.
  
# Notas Adicionales
- Verifique que la ruta de entrada y salida de los archivos sea correcta y accesible en su sistema.
- Este script es específicamente para segmentar datos basados en posiciones de jugadores. Si los datos de entrada o los requisitos cambian, el script puede necesitar ajustes.
