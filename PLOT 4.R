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


# Produce 4th Plot as a .png file
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,4,1),oma=c(0,0,0,0))

# top left
plot(EPCtime,EPCdata$Global_active_power, type='l',xlab='',ylab='Global Active Power (kilowatts)')

# top right
plot(EPCtime,EPCdata$Voltage, type='l',xlab='datetime',ylab='Voltage')

# bot left
plot(EPCtime,EPCdata$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(EPCtime,EPCdata$Sub_metering_2,col='red')
lines(EPCtime,EPCdata$Sub_metering_3,col='blue')
legend('topright',lty=c(1,1),col=c('black','red','blue'),legend=c('sub metering 1','sub metering 2','sub metering 3'))

# bot right
plot(EPCtime,EPCdata$Global_reactive_power, type='l',xlab='datetime',ylab='global_reactive_power')

dev.off()