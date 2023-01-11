data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", 
                   dec = ".", na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

date_time <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S") 

gaPower <- as.numeric(sub_data$Global_active_power)
grPower <- as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)

sub_M1 <- as.numeric(sub_data$Sub_metering_1)
sub_M2 <- as.numeric(sub_data$Sub_metering_2)
sub_M3 <- as.numeric(sub_data$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(date_time, gaPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="date_time", ylab="Voltage")

plot(date_time, sub_M1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_M2, type="l", col="red")
lines(date_time, sub_M3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, grPower, type="l", xlab="date_time", ylab="Global_reactive_power")

dev.off()