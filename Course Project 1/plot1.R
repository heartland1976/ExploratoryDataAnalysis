## Read the file into memory
el <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

## Subsetting the data
el$ParsedDate <- as.Date(el$Date,"%d/%m/%Y")
elParsed <- subset(el, el$ParsedDate == as.Date("2007-02-01") | el$ParsedDate == as.Date("2007-02-02"))

as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
elParsed$Global_active_power_num <- as.numeric.factor(elParsed$Global_active_power)

hist(
  elParsed$Global_active_power_num, 
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)", 
  ylab = "Frequency", 
  col = "red"
)

## Default size of the png is 480 x 480 pixels
## The image may be visible when opening in a browser, having 
## a "blocky" background, which is actually transparent.
dev.copy(png, "plot1.png")

## Don't forget to shut down the device
dev.off()