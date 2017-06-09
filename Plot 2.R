# Read and create power consumption data
pow <- read.table("C:/Exploratory Data Analysis/Exploratory Analysis Week 1/household_power_consumption.txt",skip=1,sep=";")
names(pow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powersmall <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")

# Transform date and Time
powersmall$Date <- as.Date(powersmall$Date, format="%d/%m/%Y")
powersmall$Time <- strptime(powersmall$Time, format="%H:%M:%S")
powersmall[1:1440,"Time"] <- format(powersmall[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powersmall[1441:2880,"Time"] <- format(powersmall[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# plot
plot(powersmall$Time,as.numeric(as.character(powersmall$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# add title
title(main="Global Active Power Vs Time")
