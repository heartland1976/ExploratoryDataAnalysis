## Read the file into memory
el <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

## Subsetting the data
el$ParsedDate <- as.Date(el$Date,"%d/%m/%Y")
elParsed <- subset(el, el$ParsedDate == as.Date("2007-02-01") | el$ParsedDate == as.Date("2007-02-02"))

elParsed$ParsedDateTime <- as.POSIXct(paste(elParsed$ParsedDate, elParsed$Time), format="%Y-%m-%d %H:%M:%S")

## Plot3.png
elParsed$Sub_metering_1_num <- as.numeric.factor(elParsed$Sub_metering_1)
elParsed$Sub_metering_2_num <- as.numeric.factor(elParsed$Sub_metering_2)
elParsed$Sub_metering_3_num <- as.numeric.factor(elParsed$Sub_metering_3)

plot(
  elParsed$ParsedDateTime,
  elParsed$Sub_metering_1_num,
  ylab = "Energy sub metering", 
  xlab = "",
  type = "l",
  col = "black"
)

lines(
  elParsed$ParsedDateTime,
  elParsed$Sub_metering_2_num, 
  col = "red"
)
lines(
  elParsed$ParsedDateTime,
  elParsed$Sub_metering_3_num, 
  col = "blue"
)

legend("topright", 
  lwd=c(2.5,2.5,2.5),
  col = c("black", "red", "blue"), 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

## Default size of the png is 480 x 480 pixels
## The image may be visible when opening in a browser, having
## a "blocky" background, which is actually transparent.
dev.copy(png, "plot3.png")

## Don't forget to shut down the device
dev.off()