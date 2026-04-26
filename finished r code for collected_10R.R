library(readxl)
collected_data10R_1_ <- read_excel("C:/Users/selin/Downloads/collected_data10R (1).xlsx")
View(collected_data10R_1_)

library(readxl)
library(tidyverse)


collected_data <- read_excel("C:/Users/selin/Downloads/collected_data10R (1).xlsx")

final_data_collected <- collected_data %>%
  rename(Value = 1) %>%
  
  pivot_longer(
    cols = -Value, 
    names_to = "Chroma", 
    values_to = "rgb_text"
  ) %>%
  
  
  separate(
    rgb_text, 
    into = c("R", "G", "B"), 
    sep = "[ ,/]+", 
    convert = TRUE 
  )

view(final_data_collected)













