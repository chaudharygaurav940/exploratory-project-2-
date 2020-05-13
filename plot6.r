NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("E:/PLOT6.png",width = 480,height = 480)
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions,fill=year))
g <- g + geom_bar(stat="identity")  +facet_grid(. ~ fips)+
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()
