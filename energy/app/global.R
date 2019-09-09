library(tidyverse)
library(shiny)
library(janitor)
library(ggplot2)
library(DT)
library(shinythemes)


# library(purrr)
# library(DT)

library(readr)
# EnergyReduced <- read_csv("1_RawData/EnergyReduced.csv")
# View(EnergyReduced)

Energy <- read_csv("EnergyReduced.csv")
# Energy <- read_csv("https://sanktpetriskole.maps.arcgis.com/sharing/rest/content/items/f1483f9642fb4a21b93e993087647ba0/data")
# Energy <- read_csv("https://sanktpetriskole.maps.arcgis.com/sharing/rest/content/items/f1483f9642fb4a21b93e993087647ba0/data")


str(Energy)
colabels = names(Energy)

Energy[,3:4] = lapply(Energy[,3:4], as.factor)

# Reformat to snake case
Energy <- Energy %>%  
  clean_names("lower_camel")  #  vs. snake

# which(Energy$`Country Name`== "Denmark")
# which(Energy$`Country Name`== "Germany")
# which(Energy$`Country Name`== "Sweden")

Energy = Energy %>%
  mutate(incomeGroup = fct_relevel(incomeGroup, "Low income", 
                                   "Lower middle income", 
                                   "Upper middle income",
                                   "High income"))

Energy[,7] = round(Energy[,7],2)
Energy[,c(6,8:11)] = round(Energy[,c(6,8:11)],1)
Energy[,c(5)] = round(Energy[,5],0)
