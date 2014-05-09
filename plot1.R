#The first two lines of code read the data file and subset it (Takes awhile)
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
days_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Opens the Graphics Device
png(file = "plot1.png")

#Plots the histogram
hist(as.numeric(as.character(days_subset$Global_active_power)),main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red")

#Turns off the device
dev.off()