## read data

datatemp<-read.table("household_power_consumption.txt", nrow = 10, header = TRUE, sep=";")
classes<-sapply(datatemp, class)
data<-read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes,na.strings="?")

## select 2 day's data
useddata1<-subset(data, Date == "1/2/2007")
useddata2<-subset(data, Date == "2/2/2007")
useddata<-merge(useddata1, useddata2, all=TRUE)

##convert to the right Date and Time

DateTime<-paste(useddata$Date, useddata$Time)
condate <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

##prepare to plot figure

png(file="plot3.png", width = 480, height=480)
par(mfrow=c(1,1))

##plot figures
plot(condate, useddata$Sub_metering_1,ylab="Energy sub metering",xlab="", type="l",col="black")
points(condate, useddata$Sub_metering_2,type="l",col="red")
points(condate, useddata$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "), lty=c(1,1))

#turn off the device

dev.off()

