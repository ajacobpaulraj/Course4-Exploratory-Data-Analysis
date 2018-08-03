
#read data file then subset next
hpcdata <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")

# Subset the data , convert dates and times
hpcdata <- subset(hpcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

hpcdata$datetime <- strptime(paste(hpcdata$Date, hpcdata$Time), "%Y-%m-%d %H:%M:%S")

hpcdata$datetime <- as.POSIXct(hpcdata$datetime)

attach(hpcdata)


par(mfrow = c(2, 2))

plot(Global_active_power ~ hpcdata$datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(Voltage ~ hpcdata$datetime, type = "l")
plot(Sub_metering_1 ~ hpcdata$datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(Sub_metering_2 ~ hpcdata$datetime, col = "Red")
lines(Sub_metering_3 ~ hpcdata$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(Global_reactive_power ~ hpcdata$datetime, type = "l")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()

detach(hpcdata)



	 
 
	 




