#This is code for plot2 in the second course project
#For Hopkin's Exploratory Data Analysis Course.

#The question to be answered is.
#"Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
#system to make a plot answering this question."

library(ggplot2)

#Load in data
setwd("S:/Mitchell/Coursera/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create a data frame for the code
data <- c()
data$year <- c(1999,2002,2005,2008)

baldata <- NEI[which(NEI$fips=='24510'),]
data$balemissions <- tapply(baldata$Emissions, baldata$year, sum,na.rm=T)

plot2 <- plot(data$year, data$balemissions, type='b', pch=19, lwd=3,
              xlab='Year', ylab = 'Sum of Emissions', main = 'Baltimore Emissions')