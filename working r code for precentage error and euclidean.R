library(readxl)
library(tidyverse)


given_raw <- read_excel("C:/Users/selin/Downloads/given_data.xlsx")
collected_raw <- read_excel("C:/Users/selin/Downloads/collected_data.xlsx")


comparison_df <- inner_join(
  given_raw, 
  collected_raw, 
  by = c("Value", "Chroma"), 
  suffix = c("_given", "_collected")
)

analysis_results <- comparison_df %>%
  mutate(across(starts_with("R_") | starts_with("G_") | starts_with("B_"), as.numeric)) %>%
  mutate(
    dist_R = (R_collected - R_given),
    dist_G = (G_collected - G_given),
    dist_B = (B_collected - B_given),
  ) %>%

view(analysis_results)

analysis_results <- comparison_df %>%
  mutate(across(starts_with("R_") | starts_with("G_") | starts_with("B_"), as.numeric)) %>%
  mutate(
    euclidean_dist = sqrt((R_collected - R_given)^2 + (G_collected - G_given)^2 + (B_collected - B_given)^2),
    
    pct_error_R = (abs(R_collected - R_given) / R_given) * 100,
    pct_error_G = (abs(G_collected - G_given) / G_given) * 100,
    pct_error_B = (abs(B_collected - B_given) / B_given) * 100
  )

