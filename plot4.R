plot4 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                           colClasses = c("character","character","numeric","numeric",
                                          "numeric","numeric","numeric","numeric","numeric"),
                           na.strings = c("?",""))
        rel_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
        rel_data$date_time <-strptime(paste(rel_data$Date, rel_data$Time),
                                      '%d/%m/%Y %H:%M:%S')
        x <- rel_data$date_time
        
        y11 <- rel_data$Global_active_power
        y211 <- rel_data$Sub_metering_1
        y212 <- rel_data$Sub_metering_2
        y213 <- rel_data$Sub_metering_3
        y12 <- rel_data$Voltage
        y22 <- rel_data$Global_reactive_power
        
        png(filename = "plot4.png", width = 480, height = 480)
        par(mfcol = c(2, 2))
        
        plot(x, y11, xlab = "", ylab = "Global Active Power", type = "l")
        
        plot(x, y211, xlab = "", ylab = "Energy sub metering", type = "l")
        lines(x, y212, col = "red")
        lines(x, y213, col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                      "Sub_metering_3"), col = c("black", "red","blue"),
               lty = c(1, 1, 1), bty = "n")
                
        plot(x, y12, xlab = "datetime", ylab = "Voltage", type = "l")
        
        plot(x, y22, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
        
        dev.off()        
}