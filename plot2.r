NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
maryland<- tapply(NEI$Emissions[NEI$fips=="24510"],NEI$year[NEI$fips=="24510"],sum)
png("E:/PLOT2.png",width = 480,height = 480)
barplot(maryland,xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years for Baltimore City")
dev.off()
