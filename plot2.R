# Read the big data file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   stringsAsFactors=FALSE, na.strings=c("?"))

# Subset data from big data file from two dates
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Create a new column with the combined date and time
subdata$datetime <- mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")}, subdata$Date,subdata$Time)

#Create and save the plot file
png("plot2.png", width = 480, length= 480)
plot(subdata$datetime, subdata$Global_active_power, type="l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", xlab = "")
axis.POSIXct(1, as.POSIXct(subdata$datetime, origin="1970-01-01"))
dev.off()
