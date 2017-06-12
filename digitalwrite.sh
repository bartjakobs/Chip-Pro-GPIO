#!/bin/bash
source pins.sh
function display_usage {
    echo "Usage: $1 pin value"
    echo "value can be HIGH or LOW, or 1 or 0"
    echo "For example: "
    echo "$1 D0 HIGH\n"
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

# Value
value=$2
if [ "${value^^}" = "HIGH" ]; then
    value=1
fi
if [ "${value^^}" = "LOW" ]; then
    value=0
fi
if [ -z "$value" ]; then
    display_usage $0
fi

# Filename in sysfs
filename="/sys/class/gpio/gpio$pin/value"
if [ ! -f "$filename" ]; then
    echo "Error. pin not exported. Use pinmode.sh or export manually."
    exit 1
fi

# Set value
echo $value > $filename
echo "Pin $1 set to $2"
