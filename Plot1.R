data_file <- "household_power_consumption.txt"
data <- read.table(data_file, header = TRUE, sep = ";", 
                   dec = ".", na.strings = "?")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

gaPower <- as.numeric(sub_data$Global_active_power)
png("plot1.png", width=480, height=480)

hist(gaPower, col ="red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts")
dev.off()