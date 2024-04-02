#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Yuanyi (Leo) Liu
# Date: 31 March 2024
# Contact: leoy.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

desired_age_groups <- c("15-24 years", "25-54 years", "55 years and over")

cleaned_data <-
  raw_data |>
  filter(Geography == "Canada",
         `Type of work` == "Both full- and part-time",
         Wages == "Average hourly wage rate",
         `Education level` != "Total, all education levels",
         `Education level` != "PSE  (5,6,7,8,9))",
         `Education level` != "No PSE  (0,1,2,3,4)",
         YEAR >= 2000) |>
  filter(`Age group` %in% desired_age_groups) |>
  select(YEAR, `Education level`, `Age group`, `Both Sexes`) |>
  rename(Year = YEAR, `Avg hourly wage rate` = `Both Sexes`)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")