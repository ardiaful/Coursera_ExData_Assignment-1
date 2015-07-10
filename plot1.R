# Read the big data file 
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

# Subset data from big data file from two days
subdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

#Create and save the plot file
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "red")
dev.off()


