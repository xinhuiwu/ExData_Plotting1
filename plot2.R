datatemp<-read.table("household_power_consumption.txt", nrow = 10, header = TRUE, sep=";")
classes<-sapply(datatemp, class)
data<-read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = classes,na.strings="?")
useddata1<-subset(data, Date == "1/2/2007")
useddata2<-subset(data, Date == "2/2/2007")
useddata<-merge(useddata1, useddata2, all=TRUE)

DateTime<-paste(useddata$Date, useddata$Time)
condate <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
par(mfrow=c(1,1))
plot(condate, useddata$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type="l")
dev.copy(png,file="plot2.png", width = 480, height=480)
dev.off()

