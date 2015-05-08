power_con<-read.table("household_power_consumption.txt",
                      header=T, 
                      sep=";",
                      colClasses=c("character", "character", rep("numeric", 7)),
                      na="?")
power_con<-subset(power_con, Date=="1/2/2007" | Date=="2/2/2007")
power_con$DateTime<-strptime(paste(power_con$Date, power_con$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot1.png")
hist(power_con$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowats)")
dev.off()

