library(tidyverse)
library(viridis)
library(readxl)
julian_practice_6_ <- read_excel("C:/Users/selin/Downloads/julian practice (6).xlsx")
View(julian_practice_6_)



  ggplot(data=julian_practice_6_, aes(x=ID, y=Julian)) +
    geom_boxplot()
  
  geom_jitter(color="black", size=0.4, alpha=0.9) +

  ggtitle("Julian date distribution") +
  xlab("")


