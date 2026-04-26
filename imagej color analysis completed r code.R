library(readxl)
imagej_colors <- read_excel("C:/Users/selin/Downloads/imagej colors.xlsx")
View(imagej_colors)

library(tidyverse)

View(imagej_colors)

A_RGB <- separate(imagej_colors,
                         col = A_RGB_Value,
                         into = c("R1", "G1", "B1"))
  B_RGB<-separate(A_RGB,
           col = B_RGB_Value,
           into = c("R2", "G2", "B2"))

  C_RGB<-separate(B_RGB,
            col = C_RGB_Value,
            into = c("R3", "G3", "B3"))
  
  D_RGB<-separate(C_RGB,
                  col = D_RGB_Value,
                  into = c("R4", "G4", "B4"))
  
  Seg_RGB<-separate(D_RGB,
                  col = E_RGB_Value,
                  into = c("R5", "G5", "B5"))

Seg_RGB

separate_RGB <- separate(imagej_colors,
                         col = c(A_RGB_Value,
                                B_RGB_Value,
                                C_RGB_Value,
                                D_RGB_Value,
                                E_RGB_Value),
                         into = c("R", "G", "B"))

clean_RGB <- Seg_RGB %>%
  mutate(across(2:16, as.numeric))
view(clean_RGB)


new_RGB <- clean_RGB %>%
  rowwise() %>% 
  mutate(R_Average = mean (c_across(starts_with("R")), na.rm = TRUE)) %>% 
rowwise() %>%
  mutate(B_Average = mean (c_across(starts_with("B")), na.rm = TRUE)) %>%
  rowwise() %>%
  mutate(G_Average = mean (c_across(starts_with("G")), na.rm = TRUE)) %>%
  ungroup()



clear_RGB <- new_RGB %>%
  summarize(
    Overall_R_Avg = mean(R_Average, na.rm = TRUE),
    Overall_B_Avg = mean(B_Average, na.rm = TRUE),
    Overall_G_Avg = mean(G_Average, na.rm = TRUE)
  )  

