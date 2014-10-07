plot(
  elParsed$ParsedDateTime,
  elParsed$Global_active_power_num,
  ylab = "Global Active Power (kilowatts)", 
  xlab = "", 
  type = "l",
  col = "black"
)

## Default size of the png is 480 x 480 pixels
## The image may be visible when opening in a browser, having 
## a "blocky" background, which is actually transparent.
dev.copy(png, "plot2.png")

## Don't forget to shut down the device
dev.off()