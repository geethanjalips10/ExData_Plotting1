fileurl<-"~/Desktop/Courseera R Programming/household_power_consumption.txt"
##Read data using the filepath and read only the 2 dates worth data
finaldata<-read.table(fileurl,sep=";",header=TRUE,nrows=2880,na.strings = "?",
                      skip=66636,
                      colClasses=c("character","character", "numeric","numeric","numeric",
                                   "numeric","numeric","numeric","numeric"))
colnames(finaldata)=c("Date","Time","Global_active_power","Global_reactive_power",
                      "Voltage","Global_intensity","Sub_metering_1",
                      "Sub_metering_2","Sub_metering_3")
#Casting date to Date Datatype
finaldata$Date<-as.Date(finaldata$Date,"%d/%m/%Y")
finaldata$Time<-paste(finaldata$Date,finaldata$Time,sep=" ")
##Casting time to time data type
finaldata$Time<-strptime(finaldata$Time,"%Y-%m-%d %H:%M:%S")
##Sending plot to png graphics device of 480x480 pixels
png(filename="plot1.png",width=480,height=480,units="px")
par(mfcol=c(1,1))
hist(finaldata$Global_active_power,main="Global Active Power",
     xlab="Global Active Power(kilowatts)",
     breaks =20,freq=TRUE,col="red")
##Disconnect the graphics device
dev.off()
