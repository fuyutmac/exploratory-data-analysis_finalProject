## Q3
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
g <- ggplot(aes(x = as.factor(year), y = Emissions, fill = type), data = NEI_Baltimore) + 
        geom_bar(stat = "identity") + 
        facet_grid(.~type)+
        labs(x = "Year", y = "PM2.5 Emission(Tons)" ,
             title = "PM2.5 Emission in Baltimore 1999-2008")+
        guides(fill = F)
g