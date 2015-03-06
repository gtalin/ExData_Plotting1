data <- read.table("household_power_consumption.txt", na.strings="?",sep=";", header=TRUE, colClasses = "character")
data2 <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
nv<-strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")
data2$datetime<- nv


png(file = "plot3.png", width = 480, height = 480)
plot(range(data2$datetime), range(data2$Sub_metering_1), type="n", ylab="Energy sub metering", xlab="")
lines(data2$datetime,data2$Sub_metering_1, type="l", col="black")
lines(data2$datetime,data2$Sub_metering_2, type="l", col="red")
lines(data2$datetime,data2$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), border=black)
#dev.copy(png, file="plot3.png")##With png instead of dev.copy, we get a better plot
dev.off()
