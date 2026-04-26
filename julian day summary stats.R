library(readxl)
julian_practice <- read_excel("C:/Users/selin/Downloads/julian practice.xlsx")
View(julian_practice)


julian_days <- na.omit(julian_practice$Julian)

mean_value <- mean(julian_days)
print(paste("Mean:", mean_value))

median_value <- median(julian_days)
print(paste("Median:", median_value))


summary(julian_days)
