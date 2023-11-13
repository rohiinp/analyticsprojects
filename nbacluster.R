install.packages("remotes")
install.packages("knitr")
install.packages("dplyr")
install.packages("mc")
remotes::install_git("abresler/nbastatR")

library(nbastatR)
library(ggplot2)
library(dplyr)


#k-means clustering: partition 'n' observations into 'k' clusters

Sys.setenv("VROOM_CONNECTION_SIZE"= 131072 * 10)
bref_players_stats(seasons = c(2020:2023), tables = "totals", widen = TRUE, assign_to_environment = TRUE)
bref_players_stats(seasons = c(2020:2023), tables = "advanced", widen = TRUE, assign_to_environment = TRUE)
bref_players_stats

og_stats <- inner_join(dataBREFPlayerTotals, dataBREFPlayerAdvanced, by = c("yearSeason", "namePlayer"))

og_stats <- og_stats %>%
  mutate(season = yearSeason + 1) %>%
  mutate(minpg = round(minutesTotals/countGames.x, 2), fgapg = round(fgaTotals/countGames.x, 2), fg3apg = round(fg3aTotals/countGames.x, 2), ftapg = round(ftaTotals/countGames.x, 2), rpg = round(trbTotals/countGames.x, 2), apg = round(astTotals/countGames.x, 2), spg = round(stlTotals/countGames.x, 2), bpg = round(blkTotals/countGames.x, 2), tpg = round(tovTotals/countGames.x, 2), ppg = round(ptsTotals/countGames.x, 2)) %>%
  select(season, player = namePlayer, pos = slugPosition.x, age = agePlayer.x, team = slugTeamBREF.x, games = countGames.x, start_games = countGamesStarted, pctFG, pctFG3, pctFT, pctFG2, minpg, fgapg, fg3apg, ftapg, rpg, apg, spg, bpg, tpg, ppg, per = ratioPER, ts = pctTrueShooting, pct3PRate, pctFTRate, pctORB, pctDRB, pctTRB, pctAST, pctSTL, pctBLK, pctTOV, pctUSG, ows = ratioOWS, dws = ratioDWS, obpm = ratioOBPM, dbpm = ratioDBPM, vorp = ratioVORP)




