# ========================================================================================================== #
#                                           LOADING & PREPARING DATA                                         #
# ========================================================================================================== #

setwd("D:/LEARNING/COURSES/COURSERA_SPECIALIZATIONS/Data Science/Datasets")
d <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?",
                colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric", "numeric"))

d[, 1] <- as.Date(d[, 1], format="%d/%m/%Y")
s <- subset(d, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
t <- strptime(paste(s[, 1], s[, 2]), format = "%Y-%m-%d %H:%M:%S")

# ========================================================================================================== #
#                                                 CREATING PLOT                                              #
# ========================================================================================================== #

# setting parameters
par(mfrow = c(2, 2))

# plot 1 
plot(t, s$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

# plot 2
plot(t, s$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# plot 3
plot(t, s$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "", lwd = 1)
points(t, s$Sub_metering_2, col = "red", type = "l", lwd = 1)
points(t, s$Sub_metering_3, col = "blue", type = "l", lwd = 1)
title(ylab = "Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, bty = "n")

# plot 4
with(s, plot(t, Global_reactive_power, xlab = "datetime", type = "l"))

# ========================================================================================================== #
#                                            SAVING PLOT AS PNG FILE                                         #
# ========================================================================================================== #

# when using dev.copy(png, ...) legend gets cut; 
# this code works though & I prefer it over manual legend resizing;
# probably it's time to upgrade R to the newest version :);
png(width = 480, height = 480, file = "plot4.png")
# setting parameters
par(mfrow = c(2, 2))
# plot 1 
plot(t, s$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
# plot 2
plot(t, s$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
# plot 3
plot(t, s$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "", lwd = 1)
points(t, s$Sub_metering_2, col = "red", type = "l", lwd = 1)
points(t, s$Sub_metering_3, col = "blue", type = "l", lwd = 1)
title(ylab = "Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, bty = "n")
# plot 4
with(s, plot(t, Global_reactive_power, xlab = "datetime", type = "l"))
dev.off()

# as explained above it cuts the legend...
dev.copy(png, width = 480, height = 480, file = "plot4.png")
dev.off()
