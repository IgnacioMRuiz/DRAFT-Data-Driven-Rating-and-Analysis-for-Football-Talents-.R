#Libraries
library(rjson)
library(readxl)
library(dplyr)
library(stringr)
library(writexl)


# Wyscout Token (updates every ~20min)
token <- "46778229d97d8a31662dc6b3a9b7cea68656f591"

#Players Stats
ruta_archivo <- "/Users/nacho/Desktop/DV7/Power BI/Código/Extracción/Leagues List.xlsx"
leagues_list <- read_excel(ruta_archivo) %>%
  filter(R_Code %in% c("England_ 1_2018", "England_ 1_2019", "England_ 1_2020", "England_ 1_2021", "England_ 1_2022",
                       "England_ 2_2018", "England_ 2_2019", "England_ 2_2020", "England_ 2_2021", "England_ 2_2022",
                       "England_ 3_2018", "England_ 3_2019", "England_ 3_2020", "England_ 3_2021", "England_ 3_2022",
                       "France_ 1_2018", "France_ 1_2019", "France_ 1_2020", "France_ 1_2021", "France_ 1_2022",
                       "France_ 2_2018", "France_ 2_2019", "France_ 2_2020", "France_ 2_2021", "France_ 2_2022",
                       "France_ 3_2018", "France_ 3_2019", "France_ 3_2020", "France_ 3_2021", "France_ 3_2022",
                       "Germany_ 1_2018", "Germany_ 1_2019", "Germany_ 1_2020", "Germany_ 1_2021", "Germany_ 1_2022",
                       "Germany_ 2_2018", "Germany_ 2_2019", "Germany_ 2_2020", "Germany_ 2_2021", "Germany_ 2_2022",
                       "Germany_ 3_2018", "Germany_ 3_2019", "Germany_ 3_2020", "Germany_ 3_2021", "Germany_ 3_2022",
                       "Italy_ 1_2018", "Italy_ 1_2019", "Italy_ 1_2020", "Italy_ 1_2021", "Italy_ 1_2022",
                       "Italy_ 2_2018", "Italy_ 2_2019", "Italy_ 2_2020", "Italy_ 2_2021", "Italy_ 2_2022",
                       "Italy_ 3_2018", "Italy_ 3_2019", "Italy_ 3_2020", "Italy_ 3_2021", "Italy_ 3_2022",
                       "Spain_ 1_2018", "Spain_ 1_2019", "Spain_ 1_2020", "Spain_ 1_2021", "Spain_ 1_2022",
                       "Spain_ 2_2018", "Spain_ 2_2019", "Spain_ 2_2020", "Spain_ 2_2021", "Spain_ 2_2022",
                       "Spain_ 3_2018", "Spain_ 3_2019", "Spain_ 3_2020", "Spain_ 3_2021", "Spain_ 3_2022"))


players_stats <- c()
for (i in 1:nrow(leagues_list)) {
  players_database <- fromJSON(file=paste("https://searchapi.wyscout.com/api/v1/search/results.json?search%5Bwomen_mode%5D=false&search%5Btime_frame%5D=",
                                          leagues_list[i,5],
                                          "&search%5Byouth_stats%5D=true&count=",
                                          "500",
                                          "&page=",
                                          "0",
                                          "&sort=market_value+desc&language=",
                                          "en",
                                          "&columns=name%2Cid%2Cimage%2Ccurrent_team_logo%2Ccurrent_team_color%2Cbirth_country_name%2Cpassport_country_names%2Ccurrent_team_name%2Cmarket_value%2Ctotal_matches%2Cminutes_on_field%2Clast_club_name%2Cpositions%2Cage%2Ccontract_expires%2Cgoals%2Cxg_shot%2Cassists%2Cxg_assist%2Cduels_avg%2Cduels_won%2Cfoot%2Cheight%2Cweight%2Con_loan%2Csuccessful_defensive_actions_avg%2Cdefensive_duels_avg%2Cdefensive_duels_won%2Caerial_duels_avg%2Caerial_duels_won%2Ctackle_avg%2Cpossession_adjusted_tackle%2Cshot_block_avg%2Cinterceptions_avg%2Cpossession_adjusted_interceptions%2Cfouls_avg%2Cyellow_cards%2Cyellow_cards_avg%2Cred_cards%2Cred_cards_avg%2Csuccessful_attacking_actions_avg%2Cgoals_avg%2Cnon_penalty_goal%2Cnon_penalty_goal_avg%2Cxg_shot_avg%2Chead_goals%2Chead_goals_avg%2Cshots%2Cshots_avg%2Cshots_on_target_percent%2Cgoal_conversion_percent%2Cassists_avg%2Ccrosses_avg%2Caccurate_crosses_percent%2Ccross_from_left_avg%2Csuccessful_cross_from_left_percent%2Ccross_from_right_avg%2Csuccessful_cross_from_right_percent%2Ccross_to_goalie_box_avg%2Cdribbles_avg%2Csuccessful_dribbles_percent%2Coffensive_duels_avg%2Coffensive_duels_won%2Ctouch_in_box_avg%2Cprogressive_run_avg%2Caccelerations_avg%2Creceived_pass_avg%2Creceived_long_pass_avg%2Cfoul_suffered_avg%2Cpasses_avg%2Caccurate_passes_percent%2Cforward_passes_avg%2Csuccessful_forward_passes_percent%2Cback_passes_avg%2Csuccessful_back_passes_percent%2Cvertical_passes_avg%2Csuccessful_vertical_passes_percent%2Cshort_medium_pass_avg%2Caccurate_short_medium_pass_percent%2Clong_passes_avg%2Csuccessful_long_passes_percent%2Caverage_pass_length%2Caverage_long_pass_length%2Cxg_assist_avg%2Cshot_assists_avg%2Cpre_assist_avg%2Cpre_pre_assist_avg%2Csmart_passes_avg%2Caccurate_smart_passes_percent%2Ckey_passes_avg%2Cpasses_to_final_third_avg%2Caccurate_passes_to_final_third_percent%2Cpass_to_penalty_area_avg%2Caccurate_pass_to_penalty_area_percent%2Cthrough_passes_avg%2Csuccessful_through_passes_percent%2Cdeep_completed_pass_avg%2Cdeep_completed_cross_avg%2Cprogressive_pass_avg%2Csuccessful_progressive_pass_percent%2Cconceded_goals%2Cconceded_goals_avg%2Cshots_against%2Cshots_against_avg%2Cclean_sheets%2Csave_percent%2Cxg_save%2Cxg_save_avg%2Cprevented_goals%2Cprevented_goals_avg%2Cback_pass_to_gk_avg%2Cgoalkeeper_exits_avg%2Cgk_aerial_duels_avg%2Cfree_kicks_taken_avg%2Cdirect_free_kicks_taken_avg%2Cdirect_free_kicks_on_target_percent%2Ccorners_taken_avg%2Cpenalties_taken%2Cpenalties_conversion_percent&token=",
                                          token,
                                          "&groupId=1059060&subgroupId=418755",
                                          sep = ""))
  number_of_pages <- ceiling(unlist(players_database[[1]][3])/500)-1
  print(leagues_list[i,5])
  print(number_of_pages)
  for (j in 0:number_of_pages) {
    players_database <- fromJSON(file=paste("https://searchapi.wyscout.com/api/v1/search/results.json?search%5Bwomen_mode%5D=false&search%5Btime_frame%5D=",
                                            leagues_list[i,5],
                                            "&search%5Byouth_stats%5D=true&count=",
                                            "500",
                                            "&page=",
                                            paste(j),
                                            "&sort=market_value+desc&language=",
                                            "en",
                                            "&columns=name%2Cid%2Cimage%2Ccurrent_team_logo%2Ccurrent_team_color%2Cbirth_country_name%2Cpassport_country_names%2Ccurrent_team_name%2Cmarket_value%2Ctotal_matches%2Cminutes_on_field%2Clast_club_name%2Cpositions%2Cage%2Ccontract_expires%2Cgoals%2Cxg_shot%2Cassists%2Cxg_assist%2Cduels_avg%2Cduels_won%2Cfoot%2Cheight%2Cweight%2Con_loan%2Csuccessful_defensive_actions_avg%2Cdefensive_duels_avg%2Cdefensive_duels_won%2Caerial_duels_avg%2Caerial_duels_won%2Ctackle_avg%2Cpossession_adjusted_tackle%2Cshot_block_avg%2Cinterceptions_avg%2Cpossession_adjusted_interceptions%2Cfouls_avg%2Cyellow_cards%2Cyellow_cards_avg%2Cred_cards%2Cred_cards_avg%2Csuccessful_attacking_actions_avg%2Cgoals_avg%2Cnon_penalty_goal%2Cnon_penalty_goal_avg%2Cxg_shot_avg%2Chead_goals%2Chead_goals_avg%2Cshots%2Cshots_avg%2Cshots_on_target_percent%2Cgoal_conversion_percent%2Cassists_avg%2Ccrosses_avg%2Caccurate_crosses_percent%2Ccross_from_left_avg%2Csuccessful_cross_from_left_percent%2Ccross_from_right_avg%2Csuccessful_cross_from_right_percent%2Ccross_to_goalie_box_avg%2Cdribbles_avg%2Csuccessful_dribbles_percent%2Coffensive_duels_avg%2Coffensive_duels_won%2Ctouch_in_box_avg%2Cprogressive_run_avg%2Caccelerations_avg%2Creceived_pass_avg%2Creceived_long_pass_avg%2Cfoul_suffered_avg%2Cpasses_avg%2Caccurate_passes_percent%2Cforward_passes_avg%2Csuccessful_forward_passes_percent%2Cback_passes_avg%2Csuccessful_back_passes_percent%2Cvertical_passes_avg%2Csuccessful_vertical_passes_percent%2Cshort_medium_pass_avg%2Caccurate_short_medium_pass_percent%2Clong_passes_avg%2Csuccessful_long_passes_percent%2Caverage_pass_length%2Caverage_long_pass_length%2Cxg_assist_avg%2Cshot_assists_avg%2Cpre_assist_avg%2Cpre_pre_assist_avg%2Csmart_passes_avg%2Caccurate_smart_passes_percent%2Ckey_passes_avg%2Cpasses_to_final_third_avg%2Caccurate_passes_to_final_third_percent%2Cpass_to_penalty_area_avg%2Caccurate_pass_to_penalty_area_percent%2Cthrough_passes_avg%2Csuccessful_through_passes_percent%2Cdeep_completed_pass_avg%2Cdeep_completed_cross_avg%2Cprogressive_pass_avg%2Csuccessful_progressive_pass_percent%2Cconceded_goals%2Cconceded_goals_avg%2Cshots_against%2Cshots_against_avg%2Cclean_sheets%2Csave_percent%2Cxg_save%2Cxg_save_avg%2Cprevented_goals%2Cprevented_goals_avg%2Cback_pass_to_gk_avg%2Cgoalkeeper_exits_avg%2Cgk_aerial_duels_avg%2Cfree_kicks_taken_avg%2Cdirect_free_kicks_taken_avg%2Cdirect_free_kicks_on_target_percent%2Ccorners_taken_avg%2Cpenalties_taken%2Cpenalties_conversion_percent&token=",
                                            token,
                                            "&groupId=1059060&subgroupId=418755",
                                            sep = ""))
    number_of_players <- if(unlist(players_database[[1]][3]) < 500){
      unlist(players_database[[1]][3])
    } else{
      if(j == 0){
        500
      }
      else{
        unlist(players_database[[1]][3]) - (500 * number_of_pages)
      }
    }
    print(number_of_players)
    for (k in 1:number_of_players) {
      aux <- as.data.frame(t(unlist(players_database[["players"]][[k]])))
      aux$R_Code <- leagues_list$R_Code[i]  # Añadir el código de la liga correspondiente
      players_stats <- bind_rows(players_stats, aux)
    }
  }
}
players_stats <- unique(players_stats)
rm(i, j, k, leagues_list, number_of_pages, number_of_players, aux, players_database)

player_stats_2018_2022_raw <- players_stats

# Exportar df a excel
# Especificar la ruta y el nombre del archivo de Excel
ruta_archivo_excel <- "/Users/nacho/Desktop/DV7/PowerBI_App/Data/Raw/player_stats_2018_2022_raw.xlsx"

# Exportar el dataframe a Excel
write_xlsx(player_stats_2018_2022_raw, ruta_archivo_excel)
