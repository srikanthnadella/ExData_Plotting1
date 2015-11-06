# Set dates and times
firstDateTime <- strptime("2006-12-16 17:24:00", "%Y-%m-%d %H:%M:%S")
beginDateTime <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")

# Calculate which lines to read in
begin <- beginDateTime - firstDateTime
beginLine <- as.numeric(begin) * 24 * 60 + 1 # first line to read in
numLines <- 48 * 60 # total number of minutes in 48 hours, total number of rows to read in

data1 <- read.csv('household_power_consumption.txt', sep = ';', skip = beginLine, nrows = numLines, na.strings = '?', header = FALSE)
names(data1) <- names(data) # Restore the column headers

## Plot 4

png(filename = 'plot4.png', width = 480, height = 480)

par(mfrow = c(2 ,2))
plot(dates, data1[[3]], xlab = "", ylab = "Global Active Power", type = 'l')

plot(dates, data1[[5]], xlab = 'datetime', ylab = 'Voltage', type = 'l')

plot(dates, data1[[7]], type = "l", xlab = "", ylab = 'Energy sub metering')
lines(dates, data1[[8]], type = "l", col = 'red')
lines(dates, data1[[9]], type = "l", col = 'blue')
legend('topright', lwd = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n')

plot(dates, data1[[4]], xlab = 'datetime', ylab = names(data)[4], type = 'l')

## Copy my plot to a PNG file
#dev.copy(png, file = "plot4.png")
## Don't forget to close the PNG device!
dev.off()


