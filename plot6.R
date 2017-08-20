library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEI_Baltimore_vehicle <-  subset(NEI, fips == "24510" & type == "ON-ROAD")
NEI_LA_vehicle <-  subset(NEI, fips == "06037" & type == "ON-ROAD")
emission_bal_vehicle <- aggregate(Emissions~year, NEI_Baltimore_vehicle,sum)
emission_LA_vehicle <- aggregate(Emissions~year, NEI_LA_vehicle,sum)
emission_bal_vehicle$county <- "Baltimore"
emission_LA_vehicle$county <- "Los Angeles"
emission_vechile_both <- rbind(emission_bal_vehicle,emission_LA_vehicle)

g <- ggplot(aes(year, Emissions, fill = county),data = emission_vechile_both)
g + geom_bar(aes(fill = year),stat = "identity")+
        facet_grid(. ~county)+
        guides(fill = F)+
        labs(x = "year", y = "Total PM2.5 Emission by Motor Vehicles",
             title = "PM2.5 Emission by Motor Vehicles in LA and Baltimore, 1999-2008")

