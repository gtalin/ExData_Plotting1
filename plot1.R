data <- read.table("household_power_consumption.txt", na.strings="?",sep=";", header=TRUE, colClasses = "character")
data2 <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
nv<-strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")
data2$datetime<- nv

#or<-par(mar=c(0,0,0,0))
png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(data2$Global_active_power), col = "red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
#dev.copy(png, file="plot1.png")
dev.off()