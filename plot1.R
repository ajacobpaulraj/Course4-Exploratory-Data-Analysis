
#read data file then subset next
hpcdata <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")

# Subset the data , convert dates and times
hpcdata <- subset(hpcdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

hpcdata$datetime <- strptime(paste(hpcdata$Date, hpcdata$Time), "%Y-%m-%d %H:%M:%S")

attach(hpcdata)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

#create png file output
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(hpcdata)

	 
	 
	 




