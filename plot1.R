# Set dates and times
firstDateTime <- strptime("2006-12-16 17:24:00", "%Y-%m-%d %H:%M:%S")
beginDateTime <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")

# Calculate which lines to read in
begin <- beginDateTime - firstDateTime
beginLine <- as.numeric(begin) * 24 * 60 + 1 # first line to read in
numLines <- 48 * 60 # total number of minutes in 48 hours, total number of rows to read in

# Read data from file
data1 <- read.csv('household_power_consumption.txt', sep = ';', skip = beginLine, nrows = numLines, na.strings = '?', header = FALSE)
names(data1) <- names(data) # Restore the column headers

## Plot 1

png(filename = 'plot1.png', width = 480, height = 480)

hist(data1[[3]], col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

## Copy my plot to a PNG file
#dev.copy(png, file = "plot1.png")
## Don't forget to close the PNG device!
dev.off()
