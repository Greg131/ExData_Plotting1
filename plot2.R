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
# Plot 2
#--------------------------------------------------------------
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l" )
dev.copy(png, file = "plot2.png")
dev.off()
