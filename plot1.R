plot1 <- function() {
        data <- read.table("household_power_consumption.txt", sep=";", header=TRUE,
                           colClasses = c("character","character","numeric","numeric",
                                          "numeric","numeric","numeric","numeric","numeric"),
                           na.strings = c("?",""))
        rel_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
        x <- rel_data$Global_active_power
        png(filename = "plot1.png", width = 480, height = 480)
        hist(x, xlab = "Global Active Power (kilowatts)",
             main = "Global Active Power", col = "red")
        dev.off()
}