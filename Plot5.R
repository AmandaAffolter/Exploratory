NEI <- readRDS("~/Exploratory/summarySCC_PM25.rds") 
SCC <- readRDS("~/Exploratory/Source_Classification_Code.rds") 

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008')) 

MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD') 

MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')


png(filename='~/Exploratory/plot5.png') 

ggplot(data=MD.df,aes(factor(year),Emissions)) + 
  geom_bar(stat="identity",fill="grey",width=0.75) + 
  theme_bw() +  guides(fill=FALSE) + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +  
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008")) 


dev.off()