## Getting dataset
data <- read.csv("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(subdata$Global_active_power)


## Plotting and saving the plot
png("plot3.png", height=480, width=480)
with(subdata, {
    plot(Sub_metering_1~Datetime, type = "l", ylab="Energy sub meeting", xlab="")
    lines(Sub_metering_2~Datetime, col="Red")
    lines(Sub_metering_3~Datetime, col="Blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

