# Set dates and times
firstDateTime <- strptime("2006-12-16 17:24:00", "%Y-%m-%d %H:%M:%S")
beginDateTime <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")

# Calculate which lines to read in
begin <- beginDateTime - firstDateTime
beginLine <- as.numeric(begin) * 24 * 60 + 1 # first line to read in
numLines <- 48 * 60 # total number of minutes in 48 hours, total number of rows to read in

data <- read.csv('household_power_consumption.txt', sep = ';', skip = beginLine, nrows = numLines, na.strings = '?', header = FALSE)
data$V1 <- as.Date(data$V1,'%d/%m/%Y')
dates <- as.POSIXlt(paste(data$V1, data$V2, " "))

## Plot 2

png(filename = 'plot2.png', width = 480, height = 480)
plot(dates, data[[3]], type = "l", xlab = "", ylab = 'Global Active Power (kilowatts)')

## Copy my plot to a PNG file
#dev.copy(png, file = "plot2.png")
## Don't forget to close the PNG device!
dev.off()

