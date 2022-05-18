setwd('D:/RStudio')
df <- read.table("./household_power_consumption.txt", sep=';', header=TRUE)
df2 = df[df$Date == '1/2/2007'| df$Date == '2/2/2007',]
df2$DateTime = paste(df2$Date, df2$Time)
df2$DateTime = as.POSIXct(df2$DateTime,format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())
hist(as.numeric(df2$Global_active_power), main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
dev.copy(png, file='plot1.png', width = 480, height = 480)
dev.off()
