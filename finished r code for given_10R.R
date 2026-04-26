library(readxl)
given_data10R_2_ <- read_excel("C:/Users/selin/Downloads/given_data10R (2).xlsx")
View(given_data10R_2_)

library(readxl)
library(tidyverse)

final_data_given <- given_data10R_2_ %>%
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

view(final_data_given)
