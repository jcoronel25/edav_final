#!/usr/bin/env Rscript

install.packages("ggplot2", repos="http://cran.r-project.org")
library(ggplot2)

# Rows by year from fulldata
yearcount <- as.data.frame(table(format(as.Date(datafull$Created.Date,"%m/%d/%Y"), "%Y")))
class(yearcount)
g1 = ggplot(yearcount, aes(x=Var1,y=Freq/1000))
g1 + geom_bar(stat = "identity", width= .5) + labs(title="Rows by Year",y="Rows in Thousands", x="Years")

#datafull analysis
tbl_df(select(datafull,Complaint.Type,Borough))
select(datafull,Complaint.Type)
qplot(Complaint.Type, Borough, data=select(datafull,Complaint.Type,Borough))
colnames(datafull)

#somedata analysis

top_n()
as.matrix(table(somedata$Agency.Name))
unique(somedata$Agency.Name)
summary(datafull)
head(datafull)
colnames(datafull)

somedata <- sample_n(datafull,20)
as.matrix(somedata$Created.Date)
somedata[!(format(as.Date(somedata$Closed.Date,"%m/%d/%Y"), "%Y")!="2016"),]

class(format(as.Date(somedata$Closed.Date,"%m/%d/%Y"),"%Y")[4])

head(somedata,n=2)
head(datafull$Created.Date)

rm(somedata)

datafull <- load("311_Full_v2.Rdata")
ls()
