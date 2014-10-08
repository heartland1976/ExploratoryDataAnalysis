## Read the file into memory
el <- read.csv("household_power_consumption.txt", sep=";", header=TRUE)

## Subsetting the data
el$ParsedDate <- as.Date(el$Date,"%d/%m/%Y")
elParsed <- subset(el, el$ParsedDate == as.Date("2007-02-01") | el$ParsedDate == as.Date("2007-02-02"))

elParsed$ParsedDateTime <- as.POSIXct(paste(elParsed$ParsedDate, elParsed$Time), format="%Y-%m-%d %H:%M:%S")

## Introduce a function to convert the factors in the data to values
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}

## Convert the power values
elParsed$Global_active_power_num <- as.numeric.factor(elParsed$Global_active_power)
elParsed$Global_reactive_power_num <- as.numeric.factor(elParsed$Global_reactive_power)
elParsed$Voltage_num <- as.numeric.factor(elParsed$Voltage)

## Convert the metering values
elParsed$Sub_metering_1_num <- as.numeric.factor(elParsed$Sub_metering_1)
elParsed$Sub_metering_2_num <- as.numeric.factor(elParsed$Sub_metering_2)
elParsed$Sub_metering_3_num <- as.numeric(elParsed$Sub_metering_3)
