#This is code for plot5 in the second course project
#For Hopkin's Exploratory Data Analysis Course.

#The question to be answered is.
#"How have emissions from motor vehicle sources changed from 
#1999-2008 in Baltimore City?"

library(ggplot2)

#Load in data
setwd("S:/Mitchell/Coursera/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Create a data frame for the code
data <- c()
data$year <- c(1999,2002,2005,2008)

baldata <- NEI[which(NEI$fips=='24510'),]
baldata$type <- factor(baldata$type)

#Subset the Baltimore Data for MV
MVBal <- subset(baldata, baldata$type=='ON-ROAD')
data$mvbalemissions <- tapply(MVBal$Emissions, MVBal$year, sum,na.rm=T)
data <- data.frame(data)

#Create the plot
plot5 <- ggplot(data, aes(year, mvbalemissions))+
  geom_point()+
  geom_line()+
  labs(title='Motor Vehicle Emissions in Baltimore',x='Year',y='Emissions')

#Show the plot
plot5