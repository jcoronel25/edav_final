#!/usr/bin/env Rscript
library(dplyr)

print("pt 1 start")
setwd("~/EDAV/edav_final/data")

print("pt 2 start")
datafull = read.csv("Less_Columns.csv", stringsAsFactors = FALSE)

print("Remove 2016 data")
datafull <- mutate(datafull, created=as.Date(datafull$Created.Date,"%m/%d/%Y"))
datafull <- filter(datafull, created<as.Date("2016-01-01"))
datafull$created = NULL

print("saving Rdata file")
save(datafull, file="311_Full_v4.RData")

