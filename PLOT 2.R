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



# Produce 2nd Plot as a .png file
png('plot2.png',width=480,height=480)
plot(EPCtime,EPCdata$Global_active_power, type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()