## Q4 

library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEI_SCC_coal <- merge(NEI, SCC_coal, by = "SCC")
sum_coal <- aggregate(Emissions ~ year, NEI_SCC_coal, sum)
barplot(sum_coal$Emissions/10^5,
        names.arg = sum_coal$year,
        xlab = "Year",
        ylab = "PM2.5 Emission(10^5 Tons)",
        main = "Coal Combustion Source Emissions In US from 1999-2008")
