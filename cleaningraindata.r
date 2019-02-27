rm(list=ls())

## Packages ----
library("tidyr")
library("dplyr")

## Ben Lawers rain gauge-----
## Import data ----

## Goatfell 01
rg1 <- read.csv("Z:/PA_hydrology/Ben Lawers/Rain Gauge/BENLAWERS_RG.csv",header = F) #import data
rg <- rg1 # takes a long time to read in orgininal, so saving a copy
head(rg)
str(rg)

rg <- rg[-c(1:2),1:3] ## remove unnecessary rows and columns
head(rg) 

names(rg) <- c("Row","DateTime","Rainfall") # change column names

rg <- separate(rg,DateTime,into=c("Date","Time"),sep = " ") # split data and timeinto separate columns

rg$Date <- as.Date(rg$Date,format="%d/%m/%y") # convert to date using correct format
rg$Rainfall <- as.numeric(as.character(rg$Rainfall)) #convert rain to numeric

maxdayrain <- group_by(rg,Date) %>%
  summarise(max(Rainfall,na.rm=TRUE)) %>% rename("Max rainfall daily" = "max(Rainfall, na.rm = TRUE)") 

write.csv(maxdayrain,"Z:/PA_PowerAnalysis/Processed_data/BenLawers_raingauge_max.csv")

