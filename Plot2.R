data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", 
                   dec = ".", na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

date_time <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gaPower <- as.numeric(sub_data$Global_active_power)
png("plot2.png", width=480, height=480)

plot(date_time, gaPower, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()