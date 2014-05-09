data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
days_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

days <- strptime(paste(days_subset$Date, days_subset$Time), format='%d/%m/%Y %H:%M:%S')

# Opens the Graphics Device
png(file = "plot3.png")

par(mfcol=c(2,2))
#Upper Left Plot
plot(days, as.numeric(as.character(days_subset$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Lower Left Plot
ylims <- range(as.numeric(as.character(days_subset$Sub_metering_1)))
plot(days, as.numeric(as.character(days_subset$Sub_metering_1)), type="l", xlab="", ylim = ylims, ylab="Energy sub metering")
par(new = T)

plot(days, as.numeric(as.character(days_subset$Sub_metering_2)), type="l", col = "red", xlab = "", ylab = "", ylim = ylims)
par(new = T)
plot(days, as.numeric(as.character(days_subset$Sub_metering_3)), type="l", col = "blue",xlab="", ylim = ylims, ylab="")

legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),box.lwd = 0, col = c("black", "red", "blue"), lwd = 1)

#Upper Right Plot

plot(days, as.numeric(as.character(days_subset$Voltage)), type = "l",xlab = "datetime", ylab = "Voltage")

#Lower Right Plot
plot(days, as.numeric(as.character(days_subset$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()