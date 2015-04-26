
library(plyr) 
library(reshape2)
# install.packages('ggplot2', dep = TRUE)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

# Divide by 1000 in order to present a more user friendly graph
# NEI$Emissions <- NEI$Emissions/1000

# Subset
SCC_coal <- grep("coal", SCC$Short.Name, ignore.case = TRUE)
SCC_coal <- SCC[SCC_coal, ]
SCC_ids <- as.character(SCC_coal$SCC)

NEI$SCC <- as.character(NEI$SCC)
NEI_coal <- NEI[NEI$SCC %in% SCC_ids, ]

# prepare data for graph
aggr_data <- with(NEI.coal, aggregate(Emissions, by = list(year), sum))
colnames(aggr_data) <- c("year", "Emissions")

png("plot4.png")
plot(aggr_data, type = "o", col= "Red", ylab = expression("Emissions, PM"[2.5]), 
     xlab = "Year", main = "Emissions in USA from Total Coal Combustion", 
     xlim = c(1999, 2008))
dev.off()