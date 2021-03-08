##  Empirical Relationships: Group differences
##  Required data: "DCPS testing.RData"

# SETUP ---------------------

# load packages
  library(tidyverse)

# set directory
  setwd("mypath") #adjust to your own directory
  
# load data
  load("DCPS testing.RData")
  
# ANALYSIS ------------------
  
# basic summary stats table
  dcps %>%
    summarize(
      N = n(),
      Average = mean(ProfMath),
      Median = median(ProfMath)
    )
  
# boxplot with mean line 
  boxplot(dcps$ProfMath,
          main = "Math Proficiency, DCPS 2017",
          ylab = "% testing at grade level", 
          ylim = c(0,100), col="#69b3a2")
  abline(h = mean(dcps$ProfMath), col = 'red') # execute together with the above
  

# Group comparison
  dcps %>%
    group_by(SchType) %>% # grouping (X) variable
    summarize(
      N = n(),
      Average = mean(ProfMath),
      Median = median(ProfMath)
    )
  
# Grouped boxplot
  boxplot(ProfMath ~ SchType, data = dcps,
          main = "Math Proficiency, DCPS 2017",
          xlab = NULL,
          ylab = "% testing at grade level", 
          ylim = c(0,100), col="#69b3a2",
          names=c("Elem.","Middle","High"))