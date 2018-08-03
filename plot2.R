
#read data file then subset next
hpcdata <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")

# Subset the data , convert dates and times
hpcdata <- subset(hpcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

hpcdata$datetime <- strptime(paste(hpcdata$Date, hpcdata$Time), "%Y-%m-%d %H:%M:%S")

hpcdata$datetime <- as.POSIXct(hpcdata$datetime)

attach(hpcdata)
plot(Global_active_power ~ hpcdata$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(hpcdata)



	 
 
	 




