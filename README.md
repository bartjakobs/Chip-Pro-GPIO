# Chip-Pro-GPIO

This is a collection of shell scripts for controlling the C.H.I.P. Pro GPIO pins.

* pins.sh converts pin numbers to sysfs numbers (from https://docs.getchip.com/chip_pro_devkit.html#gpio-sysfs-numbers)
* pinmode.sh sets the pin mode (for example `./pinmode.sh D0 OUTPUT`)
* digitalwrite.sh sets a pin to HIGH or LOW (for example `./digitalwrite.sh D0 HIGH` or `./digitalwrite.sh D1 0`)
* digitalread.sh reads the value from a pin (for example (`./digitalread.sh D0`)
