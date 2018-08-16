#plot 2
#load the dataset
dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
#convert the Date and Time variables to Date/Time classes
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
dataset$datetime <- strptime(paste(dataset$Date, dataset$Time), "%Y-%m-%d %H:%M:%S")
dataset$datetime <- as.POSIXct(dataset$datetime)
#subset the dataset
dataset <- subset(dataset, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
#plot 2
attach(dataset)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")