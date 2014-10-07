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