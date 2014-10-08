## This file performs all the loading, which is the same for all the plot scripts
source("common_init.R")

## Output the image
hist(
  elParsed$Global_active_power_num, 
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)", 
  ylab = "Frequency", 
  col = "red"
)

## Notes:
## 1. The image may be visible when opening in a browser, having
##    a "blocky" background, which is actually transparent.
## 2. Default size of the png is 480 x 480 pixels
dev.copy(png, "plot1.png")

## Don't forget to shut down the device
dev.off()