## Getting dataset
data <- read.csv("./household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(subdata$Global_active_power)

## Plotting and saving the plot
png("plot2.png", height=480, width=480)
plot(subdata$Global_active_power~subdata$Datetime,type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

