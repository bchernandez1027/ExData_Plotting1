## Read in the dataset:
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Convert the date column to Date class:
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data frame to desired dates:
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

## Convert date and time columns to POSIXlt class:
df$Date <- as.POSIXlt(paste(as.Date(df$Date, format="%d/%m/%Y"), df$Time, sep=" "))


## Create plot 3

plot(df$Date, df$Sub_metering_1, type="n", lwd=1, 
     ylim=c(0, max(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

## Copy to PNG file
dev.copy(png,file="plot3.png", width=480, height=480)


dev.off()