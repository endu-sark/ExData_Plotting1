#plot 3
#load the dataset
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
#convert the Date and Time variables to Date/Time classes
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S")
dataset$datetime <- as.POSIXct(dataset$datetime)
#subset the dataset
dataset <- subset(dataset, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#plot 3
attach(dataset)

plot(Sub_metering_1 ~ datetime, type = "l",ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))