#This is code for plot3 in the second course project
#For Hopkin's Exploratory Data Analysis Course.

#The question to be answered is.
#"Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of 
#these four sources have seen decreases in emissions from 
#1999-2008 for Baltimore City? Which have seen increases 
#in emissions from 1999-2008? Use the ggplot2 plotting system 
#to make a plot answer this question."

library(ggplot2)

#Load in data
setwd("S:/Mitchell/Coursera/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baldata <- NEI[which(NEI$fips=='24510'),]
baldata$type <- factor(baldata$type)

#Create a data.frame for the code
test <- ddply(baldata, c('year', 'type'), function(x) sum(x$Emissions))
colnames(test)[3] <- 'Emissions'

#Create the plot
plot3 <- ggplot(test, aes(year, Emissions)) +
  geom_point(aes(color=type)) + 
  geom_line(aes(color=type),lwd=1)

#Show the plot
plot3