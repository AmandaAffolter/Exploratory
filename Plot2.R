NEI <- readRDS("~/Exploratory/summarySCC_PM25.rds") 
SCC <- readRDS("~/Exploratory/Source_Classification_Code.rds") 



NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ] 

MD <- subset(NEI,fips == '24510')



png(filename='~/Exploratory/plot2.png') 


barplot( tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum),  
          main='Total Emission in Baltimore City, MD',  
          xlab='Year', ylab=expression('PM'[2.5])) 



dev.off() 
