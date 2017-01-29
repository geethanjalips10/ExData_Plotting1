fileurl<-"~/Desktop/Courseera R Programming/household_power_consumption.txt"
finaldata<-read.table(fileurl,sep=";",header=TRUE,nrows=2880,na.strings = "?",
                      skip=66636,
                      colClasses=c("character","character", "numeric","numeric","numeric",
                                   "numeric","numeric","numeric","numeric"))
colnames(finaldata)=c("Date","Time","Global_active_power","Global_reactive_power",
                      "Voltage","Global_intensity","Sub_metering_1",
                      "Sub_metering_2","Sub_metering_3")
finaldata$Date<-as.Date(finaldata$Date,"%d/%m/%Y")
finaldata$Time<-paste(finaldata$Date,finaldata$Time,sep=" ")
finaldata$Time<-strptime(finaldata$Time,"%Y-%m-%d %H:%M:%S")
png(filename="plot2.png",width=480,height=480,units="px")
par(mfcol=c(1,1))
plot(finaldata$Time,finaldata$Global_active_power,type="l",xlab=" ",ylab="Global Active Power(kilowatts)")
dev.off()
