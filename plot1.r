NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
OK<- tapply(NEI$Emissions,NEI$year,sum)
png("E:/PLOT1.png",width = 480,height = 480)
barplot(OK,xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")
dev.off()
