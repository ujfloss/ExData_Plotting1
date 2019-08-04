if (!exists('EPCdata')){
  # If Data has not been pulled yet, get the data
  EPCdata <- read.csv('household_power_consumption.txt',sep=';',na.strings='?')
  EPCdata$Date <- as.Date(EPCdata$Date,'%d/%m/%Y')
  
  # Subset for dates 2007-02-01 and 2007-02-02
  EPCdata <- subset(EPCdata, (EPCdata$Date >= '2007-02-01' & EPCdata$Date <= '2007-02-02'))
}

if (!exists('EPCtime')){
  EPCtime <- strptime(paste(EPCdata$Date,EPCdata$Time,sep=' '), '%Y-%m-%d %X')
}


# Produce 3rd Plot as a .png file
png('plot3.png',width=480,height=480)
plot(EPCtime,EPCdata$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(EPCtime,EPCdata$Sub_metering_2,col='red')
lines(EPCtime,EPCdata$Sub_metering_3,col='blue')
legend('topright',lty=c(1,1),col=c('black','red','blue'),legend=c('sub metering 1','sub metering 2','sub metering 3'))
dev.off()