#       Read data into R (the data is in the working directory)
fData<- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", 
                   strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

#       Subset the full data 
sData<- subset(fData, (fData$Date == "1/2/2007" | fData$Date== "2/2/2007")) 

#       Create a new column "DateTime" with the Date and Time data
sData$DateTime <- strptime(paste(sData$Date, sData$Time), format='%d/%m/%Y %H:%M:%S')

#       Make the plot
plot(sData$DateTime, sData$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sData$DateTime, sData$Sub_metering_2, type="l", col="red")
lines(sData$DateTime, sData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))


#       Write the image file
dev.copy(png, filename="plot3.png" ,width=480, height=480 )

#       Close the graphics device
dev.off()
