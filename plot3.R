setwd('D:/RStudio')
df <- read.table("./household_power_consumption.txt", sep=';', header=TRUE)
df2 = df[df$Date == '1/2/2007'| df$Date == '2/2/2007',]
df2$DateTime = paste(df2$Date, df2$Time)
df2$DateTime = as.POSIXct(df2$DateTime,format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())
#dev.copy(png, file='plot3.png', width = 480, height = 480)
png(file='plot3.png')
plot(df2$DateTime, as.numeric(df2$Sub_metering_1), xlab='', ylab='Energy sub metering', type='n')
lines(df2$DateTime, as.numeric(df2$Sub_metering_1), type='l', col='black')
lines(df2$DateTime, as.numeric(df2$Sub_metering_2), type='l', col='red')
lines(df2$DateTime, as.numeric(df2$Sub_metering_3), type='l', col='blue')
legend(x='topright',lty=1,col=c('black','red','blue'), legend=colnames(df2)[7:9])
dev.off()


