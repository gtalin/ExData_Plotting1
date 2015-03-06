data <- read.table("household_power_consumption.txt", na.strings="?",sep=";", header=TRUE, colClasses = "character")
data2 <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
nv<-strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")
data2$datetime<- nv

png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(data2, {plot(datetime,data2$Global_active_power, type="l", ylab="Global Active Power", xlab="")
             plot(datetime,data2$Voltage, type="l", ylab="Voltage")
             plot(range(data2$datetime), range(data2$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
             lines(data2$datetime,data2$Sub_metering_1, type="l", col="black")
             lines(data2$datetime,data2$Sub_metering_2, type="l", col="red")
             lines(data2$datetime,data2$Sub_metering_3, type="l", col="blue")
             legend("topright", lty=1, col=c("black", "red", "blue"), bty="n",
                    legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
             plot(datetime,data2$Global_reactive_power, type="l", ylab="Global_reactive_power")
})

#dev.copy(png, file="plot4.png")##This by default puts in 480x480
dev.off()