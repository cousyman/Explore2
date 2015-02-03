#This is code for plot1 in the second course project
#For Hopkin's Exploratory Data Analysis Course.

#The question to be answered is.
#"Have total emissions from PM2.5 decreased in the 
#United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources 
#for each of the years 1999, 2002, 2005, and 2008."

library(ggplot2)

#Load in data
setwd("S:/Mitchell/Coursera/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create a data frame for the code
data <- c()
data$year <- c(1999,2002,2005,2008)
data$sumemissions <- tapply(NEI$Emissions, NEI$year, sum, na.rm=T)

plot1 <- plot(data$year, data$sumemissions, type='b', pch=19, lwd=3, 
              xlab='Year', ylab='Sum of Emissions', main='Total Emissions')
