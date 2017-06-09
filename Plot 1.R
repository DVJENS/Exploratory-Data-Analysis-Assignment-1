#Reading, naming and subsetting power consumption data
setwd('C:/Exploratory Data Analysis/Exploratory Analysis Week 1/household_power_consumption')
powerdata <- read.table("C:/Exploratory Data Analysis/Exploratory Analysis Week 1/household_power_consumption.txt",skip=1,sep=";")
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
smallpower <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

#call the plot function
hist(as.numeric(as.character(smallpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotate graph
title(main="Global Active Power")