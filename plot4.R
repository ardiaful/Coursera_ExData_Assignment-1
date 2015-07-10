# Read the big data file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Subset data from big data file from two dates
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create a new column with the combined date and time
subdata$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},subdata$Date,subdata$Time)

#Create and save the plot file
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(subdata$datetime, subdata$Global_active_power, type="l", xlab = "", ylab = "Global Active Power", xaxt = "n")
axis.POSIXct(1, as.POSIXct(subdata$datetime, origin="1970-01-01"))

plot(subdata$datetime, subdata$Voltage, type="l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis.POSIXct(1, as.POSIXct(subdata$datetime, origin="1970-01-01"))

plot(subdata$datetime, subdata$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(subdata$datetime, subdata$Sub_metering_2, col = "red")
lines(subdata$datetime, subdata$Sub_metering_3, col = "blue")
axis.POSIXct(1, as.POSIXct(subdata$datetime, origin="1970-01-01"))

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(subdata$datetime, subdata$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
axis.POSIXct(1, as.POSIXct(subdata$datetime, origin="1970-01-01"))
dev.off()