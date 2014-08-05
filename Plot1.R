#       Read data into R (the data is in the working directory)
fData<- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", 
                      strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

#       Subset the full data 
sData<- subset(fData, (fData$Date == "1/2/2007" | fData$Date== "2/2/2007")) 

#       Plot the histogram
hist(sData$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

#       Write the image file
dev.copy(png, filename="plot1.png" ,width=480, height=480 )

#       Close the graphics device
dev.off()
