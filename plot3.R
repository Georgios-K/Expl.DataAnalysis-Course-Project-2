
library(plyr) 
library(reshape2)
# install.packages('ggplot2', dep = TRUE)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

# Divide by 1000 in order to present a more user friendly graph
# NEI$Emissions <- NEI$Emissions/1000

Baltimore <- NEI[which(NEI$fips == "24510"), ]
aggr_data <- with(NEI.24510, aggregate(Emissions, by = list(year), sum))
colnames(aggr_data) <- c("year", "Emissions")

Baltimore.type <- ddply(NEI.24510, .(type, year), summarize, Emissions = sum(Emissions))
Baltimore.type$Pollutant_Type <- NEI.24510.type$type

# plot 3
png("plot3.png")
qplot(year, Emissions, data = Baltimore.type, group = Pollutant_Type, color = Pollutant_Type, 
      geom = c("point", "line"), ylab = expression("Emissions, PM"[2.5]), 
      xlab = "Year", main = "Total Emissions in USA by Type")
dev.off()