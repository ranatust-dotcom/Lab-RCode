setwd("~Downloads")
#install.packages("C:/Users/selin/Downloads/colorspace_2.0-0 (1).tar.gz", repos = NULL, type = "source")
# try install.packages("colorspace")


library(colorspace)
library(tidyverse)
#Example Data from Package
#q4 <- qualitative_hcl(
#  n = 7,
#  palette = "Dark 3"
#)
#q4
#demoplot(q4, "bar")
#hclplot(q4)


#coppied from Excel
hex <- c(
  "#C18C94","#C35F2E","#A45B4C","#944B3C","#B85832","#073A2A","#91402B",
  "#944E35","#7E362A","#AC5F4F","#874B4B","#8A4B42","#9C492B","#8F442F",
  "#783932","#80413A","#9A4123","#E6AB2B","#F2B908","#DB8901","#F19D00",
  "#CE6901","#CA6E1B","#F6AC7D","#DF7D02","#D35D00","#B54513","#BD5B38",
  "#A04027","#AB4C2E","#DF7247","#AE4F17","#D9774A","#C86B4C","#AA5842",
  "#B05D3B","#995240","#AC5B4A","#F59503","#EB7221","#F6AE26","#F4A200",
  "#F59C4C","#F7B523","#E27204","#CB6E4D","#B65D3B","#B45539","#FDC818",
  "#FBB610","#F4B506","#A5695F","#CC7B60","#DF6131","#FEBE05","#B06C59",
  "#DF8100","#D18049","#C35700","#9E562E","#D07800","#AF620A","#AF6035",
  "#B06154","#9F5C4B","#A66255","#A85438","#B8644C","#8C3F2F","#AE6145",
  "#AA6150","#AE5128","#A44F32","#BB593C","#844033","#98635B","#DE790D",
  "#A54709","#DF7700","#C2692D","#B75B00","#8A2908","#A34915","#A8564B",
  "#8F5748","#984D38","#893F34","#A85205","#9B584F","#B87A6D","#956557",
  "#8A4F4B","#9F4A23","#9C5445","#A85543","#5D342E","#D27D3C","#B86C3A",
  "#9B5E31","#C07242","#D27D3D","#C7763F","#D38030","#DC791E","#AE6844",
  "#9D5944","#A9533A","#9B4F1D","#954C1F","#7D3D24","#985545","#8A4D3B",
  "#803A2E","#8E4C40","#954C39","#AF562C","#B76316","#D67400","#A05E44",
  "#793300","#BB6827","#924F1F","#A85D2D","#834605","#9E591A","#A75900",
  "#AB693A","#914900","#9D4F28","#813800","#7B341A","#743D38","#9A4125"
)

#for hex to RGB values for HCL
hcl <- as(hex2RGB(hex), "polarLUV")@coords

view(hcl)
#ordering values 
ord <- order(hcl[, "H"], hcl[, "C"])


hex_ordered <- hex[ord]

####How is this interpreted?
#hclplot(hex_ordered)

#this seems most interpret able. range of values
specplot(hex_ordered, type = "o")

#demoplot(hex_ordered, "bar")

#grouped hex
##dist may not be appropriate 
d <- dist(hcl)

hc <- hclust(d, method = "ward.D2")
head(hc)
hex_grouped <- hex[hc$order]

specplot(hex_grouped, type = "o")

plot(hc, labels = FALSE, hang = -1)

