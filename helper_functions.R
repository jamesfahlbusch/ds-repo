is_developed <- function(cntry, threshold=12000){ # cntry <- "Peru"
  gapminder %>% 
    filter(country == cntry) %>% 
    summarize(mean_gdp = mean(gdpPercap)) %>% 
    .$mean_gdp >= threshold #the '.' tells it to pipe the last value 
}

country_plot <- function(cntry, folder = "."){
  #browser()
  png <- paste0("gdp_",cntry, ".png")
  cat("coutry_plot(",cntry, ") -> ", png, "\n")
  g <- gapminder %>%
    filter(country == cntry) %>%
    ggplot(aes(x = year, y = gdpPercap)) +
    geom_point() +
    geom_smooth() +
    labs(title = cntry)
  
  # save the file
  ggsave(file.path(folder,png), g)
}