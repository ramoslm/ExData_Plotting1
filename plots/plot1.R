### Load and Prepare data ##
data<- read.table("/home/lautaro/Documentos/data_analysis/cursos/analisis_exploratorio_de_datos/household_power_consumption.txt",
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
png(filename="/home/lautaro/Documentos/data_analysis/cursos/analisis_exploratorio_de_datos/ExData_Plotting1/figure/plot1.png",
         width=480, height=480)

hist(data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = paste("Global Active Power"))

dev.off()

