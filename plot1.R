
library(plyr) 
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

# Divide by 1000 in order to present a more user friendly graph
NEI$Emissions <- NEI$Emissions/1000

aggregate.data <- with(NEI, aggregate(Emissions, by = list(year), sum))

# plot 1 file
png("plot1.png")
plot(aggregate.data, type = "o", col="Red", ylab = expression("Total Emissions (.000), PM"[2.5]), 
     xlab = "Year", main = "Total Emissions in the United States")
dev.off()