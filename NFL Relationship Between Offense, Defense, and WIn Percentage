#install.packages("tidyverse")
#install.packages("gclus")

#Load Packages
library(ggpubr)
library(gclus)
library(tidyverse)
library(readxl)
theme_set(theme_pubr())


#Import data
nfl_df <- read_excel(file.choose())
head(nfl_df)

#Summarize Data
summary(nfl_df)

#Scatter Plot
pairs(~OffPassYds + Win + DefYds, data=nfl_df)

#Regression Model
#Equation: Win = b0 + b1*OffPassYds/G + b2*DefPassYds/G
model <- lm(Win ~ OffPassYds + DefYds, data = nfl_df)
summary(model)

#Win = 60.54 + 0.31() + -0.24()  

#Prediction Data
new_data <- data.frame(OffPassYds = 225, DefYds = 300 )
prediction <- predict(model, newdata = new_data)
prediction

#95% Confidence Interval
confidence_interval <- predict(model, newdata = new_data, interval = "confidence")
confidence_interval 


