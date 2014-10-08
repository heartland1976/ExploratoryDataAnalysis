## This file performs all the loading, which is the same for all the plot scripts
source("common_init.R")

## Output the image
plot(
  elParsed$ParsedDateTime,
  elParsed$Global_active_power_num,
  ylab = "Global Active Power (kilowatts)", 
  xlab = "", 
  type = "l",
  col = "black"
)

## Notes:
## 1. The image may be visible when opening in a browser, having
##    a "blocky" background, which is actually transparent.
## 2. Default size of the png is 480 x 480 pixels
dev.copy(png, "plot2.png")

## Don't forget to shut down the device
dev.off()