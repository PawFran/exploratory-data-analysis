setwd('c:/Users/Danuta/Desktop/pawel/exploratory data analysis/course project 1')

unzip("exdata_data_household_power_consumption.zip")

?read.csv
data <- read.csv("household_power_consumption.txt", sep = ";")
head(data)
data_copy <- data

library(dplyr)
library(lubridate)

# change first class' column to 'Date'
?transform
dmy(data$Date[1])
hms(data$Time[1])
class(dmy(data$Date[1]))
data <- transform(data, Date = dmy(Date))
class(data$Date[1])

# take only subset
data <- filter(data, Date == '2007-02-01' | Date == '2007-02-02')
head(data)
unique(data$Date)

# make datetime column
with(data, paste(Date[1], Time[1]))
datetime_col <- paste(data$Date, data$Time)
head(datetime_col)
data <- mutate(data, datetime = datetime_col)
head(data)

# convert datetime to number of seconds starting from 2007-02-01 00:00:00
### data <- transform(data, datetime = ymd_hms(datetime)) # doesn't work with that!!!
head(data)
class(data$datetime)
unclass(as.POSIXct('2007-02-01 00:00:00'))[1]
unclass(as.POSIXct('2007-02-01 00:01:00'))[1]
start <- unclass(as.POSIXct('2007-02-01 00:00:00'))[1] # nr of seconds
head(transform(data, datetime = unclass(as.POSIXct(datetime)))$datetime, n = 10)
data <- transform(data, datetime = unclass(as.POSIXct(datetime)) - start)
head(data)

# transform factor to numeric: Sub_metering_1, Sub_metering_2, Global_reactive_power
data <- transform(data, Sub_metering_1 = as.numeric(paste(Sub_metering_1)),
                        Sub_metering_2 = as.numeric(paste(Sub_metering_2)),
                        Global_reactive_power = as.numeric(paste(Global_reactive_power)))


# plot1
data <- transform(data, Global_active_power = as.numeric(paste(Global_active_power)))
colors()
?axis
?png
png(file = 'plot1.png')

hist(data$Global_active_power, col = 'red', 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)',
     xaxt = 'n',
     xlim = c(0, 8), 
     ylim = c(0, 1200))
axis(1, at = c(0, 2, 4, 6))

dev.off()

# plot 2
head(data)

png(file = 'plot2.png')
with(data, plot(datetime, Global_active_power,
                type = 'l',
                ylab = 'Global Active Power (kilowatts)',
                xlab = '',
                yaxt = 'n',
                xaxt = 'n'))
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))
axis(2, at = c(0, 1000, 2000, 3000), labels = c(0, 2, 4, 6))
dev.off()

# plot 3
png(file = 'plot3.png')

plot(data$datetime, data$Sub_metering_1,
     ylab = 'Energy sub metering',
     xlab = '',
     xaxt = 'n',
     type = 'l')
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))
lines(data$datetime, data$Sub_metering_2, col = 'red')
lines(data$datetime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()

# plot 4

# plot 1.2
plot(data$datetime, data$Voltage,
     ylab = 'Voltage',
     xlab = 'datetime',
     xaxt = 'n',
     yaxt = 'n',
     type = 'l')
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))
axis(2, at = c(800, 1000, 1200, 1400, 1600, 1800, 2000), 
        labels = c('234', '', '238', '', '242', '', '246'))

# plot 2.2
plot(data$datetime, data$Global_reactive_power,
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     xaxt = 'n',
     yaxt = 'n',
     type = 'l')
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))

ticks <- seq(0, max(data$Global_reactive_power), by = 0.1)
axis(2, at = ticks)

# all four plots
png(file = 'plot4.png')
par(mfcol = c(2, 2))

with(data, plot(datetime, Global_active_power,
                type = 'l',
                ylab = 'Global Active Power (kilowatts)',
                xlab = '',
                yaxt = 'n',
                xaxt = 'n'))
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))
axis(2, at = c(0, 1000, 2000, 3000), labels = c(0, 2, 4, 6))

plot(data$datetime, data$Sub_metering_1,
     ylab = 'Energy sub metering',
     xlab = '',
     xaxt = 'n',
     type = 'l')
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))
lines(data$datetime, data$Sub_metering_2, col = 'red')
lines(data$datetime, data$Sub_metering_3, col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

plot(data$datetime, data$Voltage,
     ylab = 'Voltage',
     xlab = 'datetime',
     xaxt = 'n',
     yaxt = 'n',
     type = 'l')
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))
axis(2, at = c(800, 1000, 1200, 1400, 1600, 1800, 2000), 
     labels = c('234', '', '238', '', '242', '', '246'))

plot(data$datetime, data$Global_reactive_power,
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     xaxt = 'n',
     yaxt = 'n',
     type = 'l')
axis(1, at = c(min(data$datetime), mean(data$datetime), max(data$datetime)), 
     labels = c('Thu', 'Fri', 'Sat'))

ticks <- seq(0, max(data$Global_reactive_power), by = 0.1)
axis(2, at = ticks)

dev.off()