#!/bin/bash
source pins.sh
function display_usage {
    echo "Usage: $1 pin mode"
    echo "mode can be INPUT, OUTPUT or UNEXPORT"
    echo "Any other value for mode (or empty) will unexport the pin"
    echo "For example: "
    echo "$1 D0 OUTPUT"
    exit;
}
# -h for help
if [ "$1" = "-h" ]; then
    display_usage $0
fi

function pinmode {
    # Get the pin number from pins.sh
    pin=`get_pin $1`
    if [ -z "$pin" ]; then
        display_usage $3
    fi
    mode=$2

    # Unexport if mode is not INPUT or OUTPUT
    if [ -z "$mode" ]; then
        echo $pin > /sys/class/gpio/unexport
        echo "Pin $1 unexported"
        return
    fi
    if [ "$mode" = "UNEXPORT" ]; then
        echo $pin > /sys/class/gpio/unexport
        echo "Pin $0 unexported"
        return
    fi
    
    # Export the pin.
    echo $pin > /sys/class/gpio/export

    #Set mode
    if [ "$2" = "INPUT" ]; then
        echo "in" > /sys/class/gpio/gpio$pin/direction
    fi
    if [ "$2" = "OUTPUT" ]; then
        echo "out" > /sys/class/gpio/gpio$pin/direction
    fi

}

# If script is sourced, don't run.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # -h for help
    if [ "$1" = "-h" ]; then
        display_usage $0
    fi
    pinmode $1 $2 $0
fi
