data <- read.table("household_power_consumption.txt", na.strings="?",sep=";", header=TRUE, colClasses = "character")
data2 <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
nv<-strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")
data2$datetime<- nv

png(file = "plot2.png", width = 480, height = 480)
plot(nv,data2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
#dev.copy(png, file="plot2.png")
dev.off()
