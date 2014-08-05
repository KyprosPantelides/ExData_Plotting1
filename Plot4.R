#       Read data into R (the data is in the working directory)
fData<- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", 
                   strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

#       Subset the full data 
sData<- subset(fData, (fData$Date == "1/2/2007" | fData$Date== "2/2/2007")) 

#       Create a new column "DateTime" with the Date and Time data
sData$DateTime <- strptime(paste(sData$Date, sData$Time), format='%d/%m/%Y %H:%M:%S')

#       Arrange the plots
par(mfrow=c(2,2), mar=c(4,4,2,1))

#       First top left
plot(sData$DateTime, sData$Global_active_power, type="l",
     ylab="Global Active Power", xlab="", col="black")


#       second top right
plot(sData$DateTime, sData$Voltage, type="l", ylab="Voltage", xlab="datetime", col="black")

#       third bottom left
plot(sData$DateTime, sData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(sData$DateTime, sData$Sub_metering_2,col="red")
lines(sData$DateTime, sData$Sub_metering_3,col="blue")
legend("topright", lty=1, cex=0.7, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n",
       col=c("black", "red", "blue"))

#       fourth bottom right
plot(sData$DateTime, sData$Global_reactive_power, type="l", ylab="Global Rective Power",
     xlab="datetime", col="black")

#       Write the image file
dev.copy(png, filename="plot4.png" ,width=480, height=480 )

#       Close the graphics device
dev.off()
