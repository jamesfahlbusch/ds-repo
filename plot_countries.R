
# libraries ----
library(tidyverse)

# data ----
url <- 'https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder.csv'
gapminder <- read_csv(url) # View(gapminder)
cntry = "Afghanistan"


# ggplot: after filter by country ----
source("helper_functions.R")
is_developed("Mexico", 1000)
country_plot("Mexico")

x <- unique(gapminder$country)
dir.create("developed")
dir.create("developing")


for(i in 1:length(x)){
  cat(sprintf("%d: %s\n",i, x[i]))
  if(is_developed(x[i])){
    country_plot(x[i],"developed")
  }
  else{
    country_plot(x[i],"developing")
  }
}
  

## create a package
dir.create("dstools")
setwd("dstools")

