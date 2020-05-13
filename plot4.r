NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
names(SCC)
levels(SCC$EI.Sector)
SE1<- SCC%>%select(SCC,EI.Sector)
mydata<- merge(NEI,SE1,by="SCC")
png("E:/PLOT4.png",width = 480,height = 480)
mydata%>%filter(grepl("Comb",EI.Sector)&grepl("Coal",EI.Sector))%>%ggplot(aes(factor(year),Emissions/10^5))+
  geom_bar(stat="identity",fill ="#FF9999", width=0.75)+
  xlab("Year")+ylab("Total PM'[2.5]*' Emission (10^5 Tons)")+
  ggtitle("PM'[2.5]*'Coal Combustion Source Emissions Across US from 1999-2008")
dev.off()
