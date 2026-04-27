library(tidyverse)
library(sf)
library(tigris)
options(tigris_class = "sf")

library(readxl)
geodist_1_ <- read_excel("C:/Users/selin/Downloads/geodist (1).xlsx")

geodist_1_ <- na.omit(geodist_1_) #omit NA values

data_sf <- st_as_sf(geodist_1_, #st_as_sf, converts dataframe to simplefeature. forms geometry column the stores points
                    coords = c("Longitude", "Latitude"),
                    crs = 4326) #shorthand code for WGS 84. Coordinate Reference System (CRS)=standard used by GPS and Google Maps.

my_states <- states(cb = TRUE) %>% #filters only the states I need
  filter(NAME %in% c("Florida", "Georgia", "Alabama", "South Carolina", "North Carolina", "Mississippi", "Tennessee", "Virginia", "West Virginia", "Kentucky", "Pennsylvania", "Ohio", "Indiana", "Illinois","Missouri", "Arkansas","Louisiana","Maryland","Delaware","New Jersey","New York","Kansas","Oklahoma", "Texas"))

ggplot() +
  geom_sf(data = my_states, fill = "whitesmoke", color = "black") +
  geom_sf(data = data_sf, color = "magenta", size = 1) +
  labs(title = "iNat persimmon fruit long/lat points")
