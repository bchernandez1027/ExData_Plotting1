## Read in the dataset:
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Convert the date column to Date class:
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data frame to desired dates:
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

## Convert date and time columns to POSIXlt class:
df$Date <- as.POSIXlt(paste(as.Date(df$Date, format="%d/%m/%Y"), df$Time, sep=" "))


## Create plot 2
plot(df$Date, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Copy to PNG file
dev.copy(png,file="plot2.png", width=480, height=480)


dev.off()