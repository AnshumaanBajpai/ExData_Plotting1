plot3 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                           colClasses = c("character","character","numeric","numeric",
                                          "numeric","numeric","numeric","numeric","numeric"),
                           na.strings = c("?",""))
        rel_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
        rel_data$date_time <-strptime(paste(rel_data$Date, rel_data$Time),
                                      '%d/%m/%Y %H:%M:%S')
        x <- rel_data$date_time
        y1 <- rel_data$Sub_metering_1
        y2 <- rel_data$Sub_metering_2
        y3 <- rel_data$Sub_metering_3
        png(filename = "plot3.png", width = 480, height = 480)
        plot(x, y1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(x, y2, col = "red")
        lines(x, y3, col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                                      "Sub_metering_3"), col = c("black", "red","blue"),
               lty = c(1, 1, 1))
        dev.off()       
}