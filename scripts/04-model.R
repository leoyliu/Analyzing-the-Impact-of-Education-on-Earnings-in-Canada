#### Preamble ####
# Purpose: Models
# Author: Yuanyi (Leo) Liu
# Date: 31 March 2024
# Contact: leoy.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(arrow)
library(rstanarm)
library(modelsummary)


#### Read data ####
analysis_data <- read.csv(file = "data/analysis_data/analysis_data.csv")

plot1 = analysis_data |>
  ggplot(aes(x = Education_numeric, y = Avg.hourly.wage.rate)) +
  geom_point(alpha = 0.5) +
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

plot1 +
  geom_smooth(
    method = "lm",
    se = TRUE,
    color = "black",
    linetype = "dashed",
    formula = "y ~ x"
  )


### Model data ####
first_model <-
  stan_glm(
    formula = Avg.hourly.wage.rate ~ Education_numeric,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

modelsummary(
  list(
    "Auto-scaling priors" = first_model
  )
)


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)