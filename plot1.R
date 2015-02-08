## Read in the dataset:
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

## Convert the date column to Date class:
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset the data frame to desired dates:
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

## Create histogram of active power
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")


## Copy to PNG file
dev.copy(png,file="plot1.png", width=480, height=480)


dev.off()