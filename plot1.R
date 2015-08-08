getwd()
setwd("/Users/GA/dropbox/Datascience/Universite\314\201_Johns-Hopkins/Exploration_analytique_de_donne\314\201es/ExData_Plotting1")
filepath <- "../Rexplordata/data/household_power_consumption.txt"
data <- read.table(filepath, sep=";", header = TRUE)
head(data)

#--------------------------------------------------------------
# Conversion of Dtae & Time
#--------------------------------------------------------------

data <- transform(data, Date = as.Date(Date, format = "%d/%m/%Y"), Time = strptime(Time, format = "%H:%M:%S", tz = ""))
head(data)

class(data$Date)
class(data$Time)
# using data from the dates 2007-02-01 and 2007-02-02
# subsetdata <- data[(data$Date > as.Date("2006-12-16")) && (data$Date < as.Date("2007-12-17")),]

subsetdata <- data[data$Date >= as.Date("01/02/2007", format = "%d/%m/%Y") ,]
subsetdata <- subsetdata[subsetdata$Date <= as.Date("02/02/2007", format = "%d/%m/%Y") ,]
head(subsetdata)


#--------------------------------------------------------------
# Recode missing Values from ? to NA
#--------------------------------------------------------------


subsetdata$Global_active_power[subsetdata$Global_active_power=="?"] <- NA
subsetdata$Global_reactive_power[subsetdata$Global_reactive_power=="?"] <- NA
subsetdata$Voltage[subsetdata$Voltage=="?"] <- NA
subsetdata$Global_intensity[subsetdata$Global_intensity=="?"] <- NA
subsetdata$Sub_metering_1[subsetdata$Sub_metering_1=="?"] <- NA
subsetdata$Sub_metering_2[subsetdata$Sub_metering_2=="?"] <- NA
subsetdata$Sub_metering_3[subsetdata$Sub_metering_3=="?"] <- NA

hist()

