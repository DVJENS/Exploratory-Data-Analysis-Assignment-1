# Reading data and create subset
pow <- read.table("C:/Exploratory Data Analysis/Exploratory Analysis Week 1/household_power_consumption.txt",skip=1,sep=";")
names(pow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
smallpow <- subset(pow,pow$Date=="1/2/2007" | pow$Date =="2/2/2007")

# Transforming the Date and Time
smallpow$Date <- as.Date(smallpow$Date, format="%d/%m/%Y")
smallpow$Time <- strptime(smallpow$Time, format="%H:%M:%S")
smallpow[1:1440,"Time"] <- format(smallpow[1:1440,"Time"],"2007-02-01 %H:%M:%S")
smallpow[1441:2880,"Time"] <- format(smallpow[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


par(mfrow=c(2,2))
# create plot
with(smallpow,{
  plot(smallpow$Time,as.numeric(as.character(smallpow$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(smallpow$Time,as.numeric(as.character(smallpow$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(smallpow$Time,smallpow$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(smallpow,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(smallpow,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(smallpow,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(smallpow$Time,as.numeric(as.character(smallpow$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})