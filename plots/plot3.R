### Load and Prepare data ##
data<- read.table("household_power_consumption.txt",
                  header = T,
                  sep = ";",
                  na.strings = c("?"),
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                  comment.char = "")


data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')

dt <- paste(data$Date, data$Time)
data$Time <- strptime(dt, format = "%Y-%m-%d %H:%M:%S")

### Plot ###
# Open device
png(filename="./figure/plot3.png",
    width=480, height=480, bg= "transparent")

plot(data$Time,
     data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1), y.intersp = 0.8)

# Close device
dev.off()