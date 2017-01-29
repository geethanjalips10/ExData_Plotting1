fileurl<-"~/Desktop/Courseera R Programming/household_power_consumption.txt"
##Read data using the filepath and read only the 2 dates worth data
finaldata<-read.table(fileurl,sep=";",header=TRUE,nrows=2880,na.strings = "?",
                      skip=66636,
                      colClasses=c("character","character", "numeric","numeric","numeric",
                                   "numeric","numeric","numeric","numeric"))
colnames(finaldata)=c("Date","Time","Global_active_power","Global_reactive_power",
                      "Voltage","Global_intensity","Sub_metering_1",
                      "Sub_metering_2","Sub_metering_3")
#Cast Date as Date Datatype
finaldata$Date<-as.Date(finaldata$Date,"%d/%m/%Y")
finaldata$Time<-paste(finaldata$Date,finaldata$Time,sep=" ")
##Cast Time as Time datatype
finaldata$Time<-strptime(finaldata$Time,"%Y-%m-%d %H:%M:%S")
##Send plot to the graphic device
png(filename="plot3.png",width=480,height=480,units="px")
par(mfcol=c(1,1))
plot(finaldata$Time,finaldata$Sub_metering_1,type='l',xlab=" ",ylab="Energy sub metering")
lines(finaldata$Time,finaldata$Sub_metering_2,col="red")
lines(finaldata$Time,finaldata$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),cex=0.75,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##Disconnect Graphic device
dev.off()
