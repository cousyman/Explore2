#This is code for plot4 in the second course project
#For Hopkin's Exploratory Data Analysis Course.

#The question to be answered is.
#"Across the United States, how have emissions from 
#coal combustion-related sources changed from 1999-2008?"

library(ggplot2)

#Load in data
setwd("S:/Mitchell/Coursera/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create a data frame for the code
data <- c()
data$year <- c(1999,2002,2005,2008)

#Subset the coal/combustion articles
NEISCC <- join(NEI, SCC, by='SCC')
coalcomb <- subset(NEISCC, grepl('Coal',Short.Name) & grepl('Comb', Short.Name))

#Create the variable necessary
data$coalcombemissions <- tapply(coalcomb$Emissions, coalcomb$year, sum,na.rm=T)
data <- data.frame(data)

#Create the plot
plot4 <- ggplot(data, aes(year, coalcombemissions)) + 
  geom_point() +
  geom_line()

#Show the plot
plot4