#!/bin/bash
source pins.sh
function display_usage {
    echo "Usage: $1 pin "
    echo "Returns 1 or 0 as pin value"
    echo "$1 D0"
    exit;
}

# -h for help
if [ "$1" = "-h" ]; then
    display_usage $0
fi

# Get the pin number from pins.sh
pin=`get_pin $1`
if [ -z "$pin" ]; then
    display_usage $0
fi


# Filename in sysfs
filename="/sys/class/gpio/gpio$pin/value"
if [ ! -f "$filename" ]; then
    echo "Error. pin not exported. Use pinmode.sh or export manually."
    exit 1
fi

# Set value
cat $filename
