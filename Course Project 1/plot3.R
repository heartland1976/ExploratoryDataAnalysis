## This file performs all the loading, which is the same for all the plot scripts
source("common_init.R")

## Notes:
## 1. The image may be visible when opening in a browser, having
##    a "blocky" background, which is actually transparent.
## 2. It seems that the legend in one of the images does not come out well with
##    dev.copy. Therefore I am outputting the image to png directly.
png("plot3.png", width=480, height=480, units="px")

## Output the image
plot(
  elParsed$ParsedDateTime,
  elParsed$Sub_metering_1_num,
  ylab = "Energy sub metering", 
  xlab = "",
  type = "l",
  col = "black"
)

## Add the second line to the image
lines(
  elParsed$ParsedDateTime,
  elParsed$Sub_metering_2_num, 
  col = "red"
)

## Add the third line to the image
lines(
  elParsed$ParsedDateTime,
  elParsed$Sub_metering_3, 
  col = "blue"
)

## Add the legend to the image
legend("topright", 
  lwd=c(2.5,2.5,2.5),
  col = c("black", "red", "blue"), 
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

## Don't forget to shut down the device
dev.off()