
library(plyr) 
library(reshape2)

NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

# Divide by 1000 in order to present a more user friendly graph
NEI$Emissions <- NEI$Emissions/1000

aggr_data <- with(NEI, aggregate(Emissions, by = list(year), sum))

# plot 1 file
png("plot2.png")
plot(aggregate.24510, type = "o", ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions for Baltimore County", xlim = c(1999, 
                                                                            2008))
dev.off()