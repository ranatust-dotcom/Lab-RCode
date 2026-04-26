library(dplyr)
library(tidyr)
library(ggplot2)
library(readxl)
practice_4_ <- read_excel("C:/Users/selin/Downloads/practice (4).xlsx")
View(practice_4_)

ggplot(practice_4_)
ggplot(practice_4_, aes(x = factor(Value), y = B_given)) + 
  geom_boxplot(fill = "blue", color = "black") +
  labs(title = "5Y_given", x = "Value", y = "B_given")



library(dplyr)
library(tidyr)
library(ggplot2)
library(readxl)
practice_5_ <- read_excel("C:/Users/selin/Downloads/practice (5).xlsx")
View(practice_5_)

ggplot(practice_5_)
ggplot(practice_5_, aes(x = factor(Value), y = B_observed)) + 
  geom_boxplot(fill = "blue", color = "black") +
  labs(title = "5Y_given", x = "Value", y = "B_observed")

