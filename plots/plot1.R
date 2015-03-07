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
png(filename="./figure/plot1.png",
         width=480, height=480, bg= "transparent")

hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = paste("Global Active Power"))

dev.off()

