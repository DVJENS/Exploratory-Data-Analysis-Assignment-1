# Read in household power consumption data and create subset of data
pow <- read.table("C:/Exploratory Data Analysis/Exploratory Analysis Week 1/household_power_consumption.txt",skip=1,sep=";")
names(pow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
smallpower <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")

# Transform the Date and Time
smallpower$Date <- as.Date(smallpower$Date, format="%d/%m/%Y")
smallpower$Time <- strptime(smallpower$Time, format="%H:%M:%S")
smallpower[1:1440,"Time"] <- format(smallpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
smallpower[1441:2880,"Time"] <- format(smallpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# create the plot
plot(smallpower$Time,smallpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(smallpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(smallpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(smallpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")