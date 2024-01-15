library(rjson)
library(readxl)
library(dplyr)
library(stringr)
library(writexl)

#Importar archivos xlsx
player_stats_2018_2022_raw <- '/Users/nacho/Desktop/DV7/PowerBI_App/Data/Raw/player_stats_2018_2022_raw.xlsx'
player_stats_2018_2022_raw <- read_excel(player_stats_2018_2022_raw)

player_stats_2013_raw <- '/Users/nacho/Desktop/DV7/PowerBI_App/Data/Raw/player_stats_2013_raw.xlsx'
player_stats_2013_raw <- read_excel(player_stats_2013_raw)

# Unir los dfs de temporadas pasadas y actual
player_stats_all_seasons <- bind_rows(player_stats_2018_2022_raw, player_stats_2013_raw)
player_stats_all_seasons <- player_stats_all_seasons %>% mutate_all(~replace(., is.na(.), 0))

#Conservar columnas que interesan
# Eliminar almuadilla (#) para mantener columna 
columnas_a_conservar <- c("id",
                          "full_name",
                          "image",
                          "primary_position", 
                          "secondary_position",
                          "passport_country_names1", 
                          "passport_country_names2",
                          "birth_date",
                          "age",
                          "last_club_name",
                          "current_team_logo",
                          "total_matches",
                          "minutes_on_field",
                          "height",
                          "foot",
                          "market_value",
                          "Competition", 
                          "Season",
                          "fouls_avg",
                          "yellow_cards",
                          "yellow_cards_avg",
                          "red_cards",
                          "red_cards_avg",
                          "foul_suffered_avg",
                          "accelerations_avg",
                          "progressive_run_avg",
                          "conceded_goals",
                          "conceded_goals_avg",
                          "xg_save", 
                          "xg_save_avg",
                          "clean_sheets",
                          "shots_against",
                          "shots_against_avg",
                          "shot_block_avg",
                          "save_percent",
                          "prevented_goals",
                          "goalkeeper_exits_avg",
                          "gk_aerial_duels_avg", 
                          "prevented_goals_avg",
                          "successful_defensive_actions_avg",
                          "interceptions_avg",
                          "possession_adjusted_interceptions",
                          "tackle_avg",
                          "possession_adjusted_tackle",
                          "duels_avg",
                          "duels_won",
                          "defensive_duels_won",
                          "defensive_duels_avg",
                          "aerial_duels_avg",
                          "aerial_duels_won",
                          "offensive_duels_won",
                          "offensive_duels_avg",
                          "passes_avg",
                          "accurate_passes_percent",
                          "short_medium_pass_avg",
                          "accurate_short_medium_pass_percent",
                          "average_pass_length",
                          "forward_passes_avg",
                          "successful_forward_passes_percent",
                          "vertical_passes_avg",
                          "successful_vertical_passes_percent",
                          "key_passes_avg",
                          "smart_passes_avg",
                          "accurate_smart_passes_percent",
                          "passes_to_final_third_avg",
                          "accurate_passes_to_final_third_percent",
                          "successful_through_passes_percent",
                          "through_passes_avg",
                          "deep_completed_pass_avg",
                          "accurate_crosses_percent",
                          "progressive_pass_avg",
                          "successful_progressive_pass_percent",
                          "pass_to_penalty_area_avg",
                          "accurate_pass_to_penalty_area_percent",
                          "crosses_avg",
                          "cross_from_right_avg",
                          "successful_cross_from_right_percent",
                          "cross_from_left_avg",
                          "successful_cross_from_left_percent",
                          "cross_to_goalie_box_avg",
                          "deep_completed_cross_avg",
                          "long_passes_avg",
                          "average_long_pass_length",
                          "successful_long_passes_percent",
                          "received_pass_avg",
                          "received_long_pass_avg",
                          "assists",
                          "assists_avg",
                          "xg_assist",
                          "xg_assist_avg",
                          "pre_assist_avg",
                          "pre_pre_assist_avg",
                          "shot_assists_avg",
                          "back_passes_avg",
                          "successful_back_passes_percent",
                          "back_pass_to_gk_avg",
                          "successful_attacking_actions_avg",
                          "dribbles_avg", 
                          "successful_dribbles_percent",
                          "shots",
                          "shots_avg",
                          "shots_on_target_percent",
                          "xg_shot",
                          "xg_shot_avg",
                          "goals",
                          "goals_avg",
                          "head_goals",
                          "head_goals_avg",
                          "touch_in_box_avg",
                          "non_penalty_goal",
                          "non_penalty_goal_avg",
                          "penalties_taken",
                          "penalties_conversion_percent",
                          "goal_conversion_percent",
                          "free_kicks_taken_avg",
                          "direct_free_kicks_taken_avg",
                          "direct_free_kicks_on_target_percent",
                          "corners_taken_avg"
                          #"R_Code",
                          #"name",
                          #"birth_day",
                          #"weight",
                          #"positions",
                          #"positions1", 
                          #"primary_position_percent",
                          #"positions2",
                          #"secondary_position_percent",
                          #"positions3",
                          #"third_position",
                          #"third_position_percent",
                          #"domestic_competition_name",
                          #"birth_country_name",
                          #"passport_country_names",
                          #"passport_country_codes",
                          #"passport_country_codes1", 
                          #"passport_country_codes2",
                          #"birth_country_code",
                          #"current_team_name",
                          #"current_team_color",
                          #"on_loan",
                          #"contract_expires",
)

# Seleccionar columnas usando la lista
player_stats_all_seasons <- select(player_stats_all_seasons, all_of(columnas_a_conservar))

# Renombrar columnas
nombres_columnas_espanol <- c(
  "Id",                                       # para "id"
  "Nombre",                                   # para "full_name"
  "Imagen",                                   # para "image"
  "Posición Principal",                       # para "primary_position"
  "Posición Secundaria",                      # para "secondary_position"
  "Nacionalidad 1",                           # para "passport_country_names1"
  "Nacionalidad 2",                           # para "passport_country_names2"
  "Fecha De Nacimiento",                      # para "birth_date"
  "Edad",                                     # para "age"
  "Último Club",                              # para "last_club_name"
  "Logo del Club",                            # para "current_team_logo"
  "Partidos",                                 # para "total_matches"
  "Minutos",                                  # para "minutes_on_field"
  "Altura",                                   # para "height"
  "Lateralidad",                              # para "foot"
  "Valor De Mercado",                         # para "market_value"
  "Competición",                              # para "Competition"
  "Temporada",                                # para "Season"
  "Faltas x90",                               # para "fouls_avg"
  "Tarjetas Amarillas",                       # para "yellow_cards"
  "Tarjetas Amarillas x90",                   # para "yellow_cards_avg"
  "Tarjetas Rojas",                           # para "red_cards"
  "Tarjetas Rojas x90",                       # para "red_cards_avg"
  "Faltas Sufridas x90",                      # para "foul_suffered_avg"
  "Aceleraciones x90",                        # para "accelerations_avg"
  "Carreras Progresivas x90",                 # para "progressive_run_avg"
  "Goles Concedidos",                         # para "conceded_goals"
  "Goles Concedidos x90",                     # para "conceded_goals_avg"
  "Xg Parado",                                # para "xg_save"
  "Xg Parado x90",                            # para "xg_save_avg"
  "Porterías A Cero",                        # para "clean_sheets"
  "Tiros En Contra",                         # para "shots_against"
  "Tiros En Contra x90",                     # para "shots_against_avg"
  "Paradas x90",                             # para "shot_block_avg"
  "Paradas, %",                              # para "save_percent"
  "Goles Prevenidos",                        # para "prevented_goals"
  "Salidas Del Portero x90",                 # para "goalkeeper_exits_avg"
  "Duelos Aéreos Del Portero x90",           # para "gk_aerial_duels_avg"
  "Goles Prevenidos x90",                    # para "prevented_goals_avg"
  "Acciones Defensivas Exitosas x90",        # para "successful_defensive_actions_avg"
  "Intercepciones x90",                      # para "interceptions_avg"
  "Intercepciones AjPos x90",                # para "possession_adjusted_interceptions"
  "Entradas x90",                            # para "tackle_avg"
  "Entradas AjPos x90",                      # para "possession_adjusted_tackle"
  "Duelos x90",                              # para "duels_avg"
  "Duelos Ganados",                          # para "duels_won"
  "Duelos Defensivos Ganados",               # para "defensive_duels_won"
  "Duelos Defensivos x90",                   # para "defensive_duels_avg"
  "Duelos Aéreos x90",                       # para "aerial_duels_avg"
  "Duelos Aéreos Ganados",                   # para "aerial_duels_won"
  "Duelos Ofensivos Ganados",               # para "offensive_duels_won"
  "Duelos Ofensivos x90",                   # para "offensive_duels_avg"
  "Pases x90",                              # para "passes_avg"
  "Pases Completados, %",                   # para "accurate_passes_percent"
  "Pases Cortos Y Medios x90",              # para "short_medium_pass_avg"
  "Pases Cortos Y Medios Completados, %",   # para "accurate_short_medium_pass_percent"
  "Longitud Promedio De Pase",              # para "average_pass_length"
  "Pases Hacia Adelante x90",               # para "forward_passes_avg"
  "Pases Hacia Adelante Completados, %",    # para "successful_forward_passes_percent"
  "Pases Verticales x90",                   # para "vertical_passes_avg"
  "Pases Verticales Completados, %",        # para "successful_vertical_passes_percent"
  "Pases Clave x90",                        # para "key_passes_avg"
  "Pases Inteligentes x90",                 # para "smart_passes_avg"
  "Pases Inteligentes Completados, %",      # para "accurate_smart_passes_percent"
  "Pases a Último Tercio x90",              # para "passes_to_final_third_avg"
  "Pases Completados a Último Tercio, %",   # para "accurate_passes_to_final_third_percent"
  "Pases al espacio Exitosos, %",           # para "successful_through_passes_percent"
  "Pases al espacio x90",                   # para "through_passes_avg"
  "Pase Profundo Completado x90",           # para "deep_completed_pass_avg"
  "Centros Completados, %",                 # para "accurate_crosses_percent"
  "Pase Progresivo x90",                    # para "progressive_pass_avg"
  "Pase Progresivo Completados, %",         # para "successful_progressive_pass_percent"
  "Pase A Área De Penalti x90",             # para "pass_to_penalty_area_avg"
  "Pase Preciso A Área De Penalti, %",      # para "accurate_pass_to_penalty_area_percent"
  "Centros x90",                            # para "crosses_avg"
  "Centros Desde La Derecha x90",           # para "cross_from_right_avg"
  "Centros Completados Desde La Derecha, %", # para "successful_cross_from_right_percent"
  "Centros Desdes La Izquierda x90",        # para "cross_from_left_avg"
  "Centros Completados Desde La Izquierda, %", # para "successful_cross_from_left_percent"
  "Centros al Área x90",                    # para "cross_to_goalie_box_avg"
  "Centros Profundos Completados x90",      # para "deep_completed_cross_avg"
  "Pases Largos x90",                       # para "long_passes_avg"
  "Longitud Promedio De Pase Largo",        # para "average_long_pass_length"
  "Pases Largos Completados, %",            # para "successful_long_passes_percent"
  "Pases Recibidos x90",                    # para "received_pass_avg"
  "Pases Largos Recibido x90",              # para "received_long_pass_avg"
  "Asistencias",                            # para "assists"
  "Asistencias x90",                        # para "assists_avg"
  "xA",                                     # para "xg_assist"
  "xA x90",                                 # para "xg_assist_avg"
  "Preasistencia x90",                      # para "pre_assist_avg"
  "Pre Preasistencia x90",                  # para "pre_pre_assist_avg"
  "Asistencias De Tiro x90",                # para "shot_assists_avg"
  "Pases Hacia Atrás x90",                  # para "back_passes_avg"
  "Pases Hacia Atrás Completados, %",       # para "successful_back_passes_percent"
  "Pase Hacia Atrás Al Portero x90",        # para "back_pass_to_gk_avg"
  "Acciones Ofensivas Completados x90",     # para "successful_attacking_actions_avg"
  "Regates x90",                            # para "dribbles_avg"
  "Regates Completados, %",                 # para "successful_dribbles_percent"
  "Tiros",                                  # para "shots"
  "Tiros x90",                              # para "shots_avg"
  "Tiros A Puerta, %",                      # para "shots_on_target_percent"
  "Xg",                                     # para "xg_shot"
  "Xg x90",                                 # para "xg_shot_avg"
  "Goles",                                  # para "goals"
  "Goles x90",                              # para "goals_avg"
  "Goles De Cabeza",                        # para "head_goals"
  "Goles De Cabeza x90",                    # para "head_goals_avg"
  "Toques En El Área x90",                  # para "touch_in_box_avg"
  "Goles sin Penalti",                      # para "non_penalty_goal"
  "Goles sin Penalti x90",                  # para "non_penalty_goal_avg"
  "Penaltis Tirados",                       # para "penalties_taken"
  "Penaltis Marcados, %",                   # para "penalties_conversion_percent"
  "Tasa de Conversión de Gol, %",           # para "goal_conversion_percent"
  "Tiros Libres Tirados x90",               # para "free_kicks_taken_avg"
  "Tiros Libres Directos Tirados x90",      # para "direct_free_kicks_taken_avg"
  "Tiros Libres Directos A Puerta, %",      # para "direct_free_kicks_on_target_percent"
  "Córners Tirados x90"                     # para "corners_taken_avg"
)

# Cambiar los nombres de las columnas en el dataframe
names(player_stats_all_seasons) <- nombres_columnas_espanol

# Lista de columnas para convertir a numeric
columnas_para_convertir <- c(
  "Edad", "Minutos", "Altura", "Valor De Mercado", "Faltas x90",
  "Tarjetas Amarillas", "Tarjetas Amarillas x90", "Tarjetas Rojas", "Tarjetas Rojas x90",
  "Faltas Sufridas x90", "Aceleraciones x90", "Carreras Progresivas x90",
  "Goles Concedidos", "Goles Concedidos x90", "Xg Parado", "Xg Parado x90",
  "Porterías A Cero", "Tiros En Contra", "Tiros En Contra x90", "Paradas x90",
  "Paradas, %", "Goles Prevenidos", "Salidas Del Portero x90",
  "Duelos Aéreos Del Portero x90", "Goles Prevenidos x90", "Acciones Defensivas Exitosas x90",
  "Intercepciones x90", "Intercepciones AjPos x90", "Entradas x90",
  "Entradas AjPos x90", "Duelos x90", "Duelos Ganados", "Duelos Defensivos Ganados",
  "Duelos Defensivos x90", "Duelos Aéreos x90", "Duelos Aéreos Ganados",
  "Duelos Ofensivos Ganados", "Duelos Ofensivos x90", "Pases x90",
  "Pases Completados, %", "Pases Cortos Y Medios x90", "Pases Cortos Y Medios Completados, %",
  "Longitud Promedio De Pase", "Pases Hacia Adelante x90", "Pases Hacia Adelante Completados, %",
  "Pases Verticales x90", "Pases Verticales Completados, %", "Pases Clave x90",
  "Pases Inteligentes x90", "Pases Inteligentes Completados, %", "Pases a Último Tercio x90",
  "Pases Completados a Último Tercio, %", "Pases al espacio Exitosos, %", "Pases al espacio x90",
  "Pase Profundo Completado x90", "Centros Completados, %", "Pase Progresivo x90",
  "Pase Progresivo Completados, %", "Pase A Área De Penalti x90", "Pase Preciso A Área De Penalti, %",
  "Centros x90", "Centros Desde La Derecha x90", "Centros Completados Desde La Derecha, %",
  "Centros Desdes La Izquierda x90", "Centros Completados Desde La Izquierda, %",
  "Centros al Área x90", "Centros Profundos Completados x90", "Pases Largos x90",
  "Longitud Promedio De Pase Largo", "Pases Largos Completados, %", "Pases Recibidos x90",
  "Pases Largos Recibido x90", "Asistencias", "Asistencias x90", "xA", "xA x90", "Preasistencia x90", "Pre Preasistencia x90",
  "Asistencias De Tiro x90", "Pases Hacia Atrás x90", "Pases Hacia Atrás Completados, %",
  "Pase Hacia Atrás Al Portero x90", "Acciones Ofensivas Completados x90", "Regates x90",
  "Regates Completados, %", "Tiros", "Tiros x90", "Tiros A Puerta, %", "Xg",
  "Xg x90", "Goles", "Goles x90", "Goles De Cabeza", "Goles De Cabeza x90",
  "Toques En El Área x90", "Goles sin Penalti", "Goles sin Penalti x90", "Penaltis Tirados",
  "Penaltis Marcados, %", "Tasa de Conversión de Gol, %", "Tiros Libres Tirados x90",
  "Tiros Libres Directos Tirados x90", "Tiros Libres Directos A Puerta, %", "Córners Tirados x90"
)

# Convertir las columnas a numeric
for (columna in columnas_para_convertir) {
  player_stats_all_seasons[[columna]] <- as.numeric(as.character(player_stats_all_seasons[[columna]]))
}

# Crear la nueva columna "Diferencia xG/Goles"
player_stats_all_seasons$Diferencia_xG_Goles <- player_stats_all_seasons$Goles - player_stats_all_seasons$Xg

#Crear columna de posiciones generales
# Hacer únicos los nombres de las columnas
names(player_stats_all_seasons) <- make.unique(names(player_stats_all_seasons))

# Definir el mapeo de posiciones con los nombres descriptivos
nombres_posiciones <- list(
  porteros = c('GK'),
  laterales_derechos = c('RB', 'RCB3', 'RWB', 'RB5'),
  laterales_izquierdos = c('LB', 'LCB3', 'LWB', 'LB5'),
  centrales = c('CB', 'LCB', 'RCB'),
  mediocentro_6 = c('DMF', 'LDMF', 'RDMF'),
  mediocentro_8 = c('LCMF', 'LCMF3', 'RCMF', 'RCMF3'),
  mediocentro_10 = c('AMF'),
  extremos_izquierdos = c('LW', 'LWF', 'LAMF'),
  extremos_derechos = c('RW', 'RWF', 'RAMF'),
  delanteros = c('CF')
)

# Mapa de nombres de posiciones
nombres = c(
  'porteros' = 'Portero',
  'laterales_derechos' = 'Lateral Derecho',
  'laterales_izquierdos' = 'Lateral Izquierdo',
  'centrales' = 'Central',
  'mediocentro_6' = 'Mediocentro (6)',
  'mediocentro_8' = 'Mediocentro (8)',
  'mediocentro_10' = 'Mediocentro (10)',
  'extremos_izquierdos' = 'Extremo Izquierdo',
  'extremos_derechos' = 'Extremo Derecho',
  'delanteros' = 'Delantero'
)

# Función para encontrar la posición general con nombres descriptivos
get_posicion_general <- function(posicion_principal) {
  for (posicion in names(nombres_posiciones)) {
    if (posicion_principal %in% nombres_posiciones[[posicion]]) {
      return(nombres[posicion])
    }
  }
  return(NA)
}

# Crear la nueva columna 'Posición General'
player_stats_all_seasons <- player_stats_all_seasons %>%
  mutate(Posición_General = sapply(`Posición Principal`, get_posicion_general))

# Exportar df a excel
# Especificar la ruta y el nombre del archivo de Excel
ruta_archivo_excel <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Processed/player_stats_all_seasons.xlsx"

# Exportar el dataframe a Excel
write_xlsx(player_stats_all_seasons, ruta_archivo_excel)