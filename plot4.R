power_con<-read.table("household_power_consumption.txt",
                      header=T, 
                      sep=";",
                      colClasses=c("character", "character", rep("numeric", 7)),
                      na="?")
power_con<-subset(power_con, Date=="1/2/2007" | Date=="2/2/2007")
power_con$DateTime<-strptime(paste(power_con$Date, power_con$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfrow=c(2,2))
plot(x=power_con$DateTime, y=power_con$Global_active_power,
     type="l", 
     ylab="Global Active Power",
     xlab="")
plot(x=power_con$DateTime, y=power_con$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")
plot(x=power_con$DateTime, y=power_con$Sub_metering_1,
     type="l", ylab="Energy sub metering", xlab="")
lines(x=power_con$DateTime, y=power_con$Sub_metering_3, col="blue")
lines(x=power_con$DateTime, y=power_con$Sub_metering_2, col="red")
legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1)
plot(x=power_con$DateTime, y=power_con$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")
dev.off()
