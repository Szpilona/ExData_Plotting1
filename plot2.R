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

plot(t, s$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# ========================================================================================================== #
#                                            SAVING PLOT AS PNG FILE                                         #
# ========================================================================================================== #

dev.copy(png, width = 480, height = 480, file = "plot2.png")
dev.off()
