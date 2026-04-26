library(aqp)
library(tidyr)
library(dplyr)

target_hue <- "5YR"
vals <- c(2.5, 3, 4, 5, 6, 7, 8)
chroms <- c(1, 2)

grid <- expand.grid(value = vals, chroma = chroms)


grid$hex <- munsell2rgb(
  the_hue = rep(target_hue, nrow(grid)), 
  the_value = grid$value, 
  the_chroma = grid$chroma,
  return_triplet = FALSE  
)

grid$rgb_string <- sapply(grid$hex, function(x) {
  paste(as.vector(col2rgb(x)), collapse = " ")
})

munsell_table3 <- grid %>%
  dplyr::select(value, chroma, rgb_string) %>%
  tidyr::pivot_wider(
    names_from = chroma, 
    values_from = rgb_string,
    names_prefix = "Chr_"
  ) %>%
  dplyr::arrange(desc(value))

print(munsell_table3)


combined <- full_join(munsell_table, munsell_table2, by = "value")
combined2 <- full_join(munsell_table3, munsell_table4, by = "value")
combined_final <- full_join(combined, combined2, by = "value")