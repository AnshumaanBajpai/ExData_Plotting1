plot2 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                           colClasses = c("character","character","numeric","numeric",
                                          "numeric","numeric","numeric","numeric","numeric"),
                           na.strings = c("?",""))
        rel_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
        rel_data$date_time <-strptime(paste(rel_data$Date, rel_data$Time),
                                     '%d/%m/%Y %H:%M:%S')
        x <- rel_data$date_time
        y <- rel_data$Global_active_power
        png(filename = "plot2.png", width = 480, height = 480)
        plot(x, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
        
}