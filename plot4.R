## Read in the dataset:
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Convert the date column to Date class:
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data frame to desired dates:
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

## Convert date and time columns to POSIXlt class:
df$Date <- as.POSIXlt(paste(as.Date(df$Date, format="%d/%m/%Y"), df$Time, sep=" "))


## create PNG
png("plot4.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7), mfrow=c(2,2))


#Plot 1
plot(df$Date, df$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

#plot 2
plot(df$Date, df$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

#plot 3
plot(df$Date, df$Sub_metering_1, type="n", lwd=1, 
     ylim=c(0, max(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")

lines(df$Date, df$Sub_metering_1, col="black")
lines(df$Date, df$Sub_metering_2, col="red")
lines(df$Date, df$Sub_metering_3, col="blue")

legend("topright", lwd=1, 
       col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       box.lwd=0)

#plot 4
plot(df$Date, df$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

dev.off()