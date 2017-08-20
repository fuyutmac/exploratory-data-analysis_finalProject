## Q2

library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_Baltimore <-  subset(NEI, fips == "24510")
emission_total_Bal <- aggregate(Emissions ~ year, NEI_Baltimore, sum)
barplot(emission_total$Emissions/10^6,
        names.arg = emission_total$year,
        xlab = "Year",
        ylab = "PM2.5 Emission(10^6 Tons)",
        main = "Total PM2.5 Emission From Baltimore")