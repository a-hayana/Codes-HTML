library(tidyverse)
library(gtExtras)
library(gt)


team_df <- readRDS(url("https://github.com/nflverse/nflfastR-data/raw/master/teams_colors_logos.rds"))

team_df %>%
  dplyr::select(team_nick, team_abbr, team_conf, team_division, team_wordmark) %>%
  head(8) %>%
  gt(groupname_col = "team_conf") %>%
  gt_merge_stack(col1 = team_nick, col2 = team_division) %>%
  gt_img_rows(team_wordmark)


gt_sparkline_tab <- mtcars %>%
  dplyr::group_by(cyl) %>%
  # must end up with list of data for each row in the input dataframe
  dplyr::summarize(mpg_data = list(mpg), .groups = "drop") %>%
  gt() %>%
  gt_sparkline(mpg_data)

gt_sparkline_tab
