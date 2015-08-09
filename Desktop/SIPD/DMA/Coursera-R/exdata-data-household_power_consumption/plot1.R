

a <- read.table("household_power_consumption.txt", header = TRUE ,sep =";", na.strings= "?", fill= TRUE )

start_date <- c("1/2/2007")
end_date <- c("2/2/2007")


a1 <- subset(a, Date == start_date)
a2 <- subset(a, Date == end_date)
b  <- rbind(a1, a2)

#Plot 1

hist(b$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")

dev.copy(png, 'plot1.png', width = 480)
dev.off()