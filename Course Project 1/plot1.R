hist(
  elParsed$Global_active_power_num, 
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)", 
  ylab = "Frequency", 
  col = "red"
)

## Default size of the png is 480 x 480 pixels
dev.copy(png, "plot1.png")

## Don't forget to shut down the device
dev.off()