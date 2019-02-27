rm(list=ls())

## Packages ----
library("tidyr")
library("dplyr")

## Ben Lawers rain gauge-----
## Import data ----

## Goatfell 01
rg <- read.csv("Z:/PA_hydrology/Ben Lawers/Rain Gauge/BENLAWERS_RG.csv",header = F) #import data

head(rg)
str(rg)

rg <- rg[-1:2,1:3] ## remove unnecessary rows and columns
head(rg) 

names(rg) <- c("Row","DateTime","Rainfall")

rg <- separate(rg,DateTime,into=c("Date","Time"),sep = " ")


