
library(plyr) 
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

# Divide by 1000 in order to present a more user friendly graph
NEI$Emissions <- NEI$Emissions/1000

aggr_data <- with(NEI, aggregate(Emissions, by = list(year), sum))

# plot 1 file
png("plot1.png")
plot(aggre_data, type = "o", col="Red", ylab = expression("Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in USA (.000)")
dev.off()