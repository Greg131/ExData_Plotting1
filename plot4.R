getwd()
setwd("/Users/GA/dropbox/Datascience/Universite\314\201_Johns-Hopkins/Exploration_analytique_de_donne\314\201es/ExData_Plotting1")
filepath <- "../Rexplordata/data/household_power_consumption.txt"
originaldata <- read.table(filepath, sep=";", header = TRUE, na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#--------------------------------------------------------------
# Conversion of Date & Time
#--------------------------------------------------------------
data <- originaldata
# data$Time <- strptime(paste(data$Date," ",data$Time), format = "%d/%m/%Y %H:%M:%S")
# data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- transform(originaldata, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(paste(Date, " ", Time), format  = "%d/%m/%Y %H:%M:%S", tz = ""))
head(data)

#--------------------------------------------------------------
# Subsetting from 01/02/2007 to 02/02/2007
#--------------------------------------------------------------
data <- data[data$Date >= as.Date("01/02/2007", format = "%d/%m/%Y") ,]
data <- data[data$Date <= as.Date("02/02/2007", format = "%d/%m/%Y") ,]
head(data)
summary(data)

#--------------------------------------------------------------
# Plots
#--------------------------------------------------------------
par(mfrow = c(2,2))
par(mar = c(5.1,4.1,4.1,2.1)) # default [1] 5.1 4.1 4.1 2.1

# Plots 1
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" )

# Plots 2
plot(data$Time, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l" )

# Plots 3
plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l" )
lines(data$Time, data$Sub_metering_2, xlab = "", col = "red")
lines(data$Time, data$Sub_metering_3, xlab = "", col = "blue")
legend("topright", lty = 1, col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Plots 4
plot(data$Time, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l" )

dev.copy(png, file = "plot4.png")
dev.off()
# 480 pixels and a height of 480 pixels are default values

#png(file = "plot4.pdf")

