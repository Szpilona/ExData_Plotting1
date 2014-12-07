# ========================================================================================================== #
#                                           LOADING & PREPARING DATA                                         #
# ========================================================================================================== #

setwd("D:/LEARNING/COURSES/COURSERA_SPECIALIZATIONS/Data Science/Datasets")
d <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?",
                colClasses = c("character", "character", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric", "numeric"))

d[, 1] <- as.Date(d[, 1], format="%d/%m/%Y")
s <- subset(d, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# ========================================================================================================== #
#                                                 CREATING PLOT                                              #
# ========================================================================================================== #

hist(s$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# ========================================================================================================== #
#                                            SAVING PLOT AS PNG FILE                                         #
# ========================================================================================================== #

dev.copy(png, width = 480, height = 480, file = "plot1.png")
dev.off()
