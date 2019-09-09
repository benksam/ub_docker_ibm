library(tidyverse)
library(shiny)
library(janitor)
library(ggplot2)
library(DT)
library(ggthemes)
library(stringr)
library(shinythemes)


# library(purrr)
# library(DT)

# Sorted data
# AgriIncome <- read_csv("https://sanktpetriskole.maps.arcgis.com/sharing/rest/content/items/c731d19518bc4435ae58f6ec381968f8/data")
# AgriRegion <- read_csv("https://sanktpetriskole.maps.arcgis.com/sharing/rest/content/items/b9b90ec8b1a64cb4949aabe512fd78c8/data")
# AgriCountry <- read_csv("https://sanktpetriskole.maps.arcgis.com/sharing/rest/content/items/558254b750e24419b9ec321bde87eaae/data")

AgriIncome <- read_csv("AgriIncome.csv")
AgriRegion <- read_csv("AgriRegion.csv")
AgriCountry <- read_csv("AgriCountry.csv")


# Income groups
AgriIncome = AgriIncome[,-2]
# View(AgriIncome)

AgriIncome[,2] = round(AgriIncome[,2],0)
AgriIncome[,3:19] = round(AgriIncome[,3:19],1)

glimpse(AgriIncome)
names(AgriIncome)[1] = "Income Group"
# names(AgriIncome)[2] = "Year"

colabels1 = names(AgriIncome)

AgriIncome[,1] = lapply(AgriIncome[,1], as.factor)
AgriIncome[,3:19] = lapply(AgriIncome[,3:19], as.numeric)

summary(AgriIncome)

# Reformat to snake case
AgriIncome <- AgriIncome %>%  
  clean_names("lower_camel")  #  vs. snake

names(AgriIncome)

AgriIncome = AgriIncome %>%
  mutate(incomeGroup = fct_relevel(incomeGroup, "Low income", 
                                   "Lower middle income", 
                                   "Upper middle income",
                                   "High income"))

# Regions

# Income groups
AgriRegion = AgriRegion[,-2]

AgriRegion[,2] = round(AgriRegion[,2],0)
AgriRegion[,3:19] = round(AgriRegion[,3:19],1)

head(AgriRegion)

glimpse(AgriRegion)
names(AgriRegion)[1] = "World Region"
# names(AgriRegion)[2] = "Year"

colabels2 = names(AgriRegion)

AgriRegion[,1] = lapply(AgriRegion[,1], as.factor)
AgriRegion[,3:19] = lapply(AgriRegion[,3:19], as.numeric)

summary(AgriRegion)

# Reformat to snake case
AgriRegion <- AgriRegion %>%  
  clean_names("lower_camel")  #  vs. snake

names(AgriRegion)

#######
# Country data - 1:5 - 6: 17 - 18:23

# View(AgriCountry)
names(AgriCountry)

# Income groups
AgriCountry = AgriCountry[,-2]
# View(AgriCountry)

AgriCountry[,4] = round(AgriCountry[,4],0)

AgriCountry = AgriCountry %>%  select(-24:-25)


AgriCountry[,5:34] = round(AgriCountry[,5:34],1)

dim(AgriCountry)

summary(AgriCountry)
names(AgriCountry)

glimpse(AgriCountry)
names(AgriCountry)[3] = "World Region"
# names(AgriCountry)[2] = "Year"

colabels3 = names(AgriCountry)

AgriCountry[,1:3] = lapply(AgriCountry[,1:3], as.factor)
AgriCountry[,5:34] = lapply(AgriCountry[,5:34], as.numeric)

summary(AgriCountry)

# Reformat to snake case
AgriCountry <- AgriCountry %>%  
  clean_names("lower_camel")  #  vs. snake

names(AgriCountry)

AgriCountry = AgriCountry %>%
  mutate(incomeGroup = fct_relevel(incomeGroup, "Low income", 
                                   "Lower middle income", 
                                   "Upper middle income",
                                   "High income"))
AgriCountry = AgriCountry %>%
  filter(!(is.na(incomeGroup)))

# AgriRegion = AgriRegion %>%
#   mutate(RegionGroup = fct_relevel(RegionGroup, "Low Region", 
#                                    "Lower middle Region", 
#                                    "Upper middle Region",
#                                    "High Region"))
# 



# Define more GLOBAL VARIABLES for use in EXPLANATORY TEXTS on the sidebar of TAB X!

# min_date <- min(movies$thtr_rel_date)
# max_date <- max(movies$thtr_rel_date)

# Start of SIDE PANEL of TAB X

# Explanatory text

# HTML(paste0("Movies released between the following dates will be plotted. 
#             Pick dates between ", min_date, " and ", max_date, ".")),




