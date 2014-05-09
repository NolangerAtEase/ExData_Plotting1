#The first two lines of code read the data file and subset it (Takes awhile)
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
days_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

days <- strptime(paste(days_subset$Date, days_subset$Time), format='%d/%m/%Y %H:%M:%S')

# Opens the Graphics Device
png(file = "plot2.png")

#Plots graph
plot(days, as.numeric(as.character(days_subset$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
