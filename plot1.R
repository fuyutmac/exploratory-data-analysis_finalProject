## Q1

library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emission_total <- aggregate(Emissions ~ year, NEI, sum)
barplot(emission_total$Emissions/10^6,
        names.arg = emission_total$year,
        xlab = "Year",
        ylab = "PM2.5 Emission(10^6 Tons)",
        main = "Total PM2.5 Emission From All US Sources")