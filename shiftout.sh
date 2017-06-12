#!/bin/bash
source digitalwrite.sh

function display_usage {
    echo "Usage: $1 datapin clockpin value"
    echo "Can be used to send data to a 595 shift register"
    echo "For example: "
    echo "$1 D0 D1 255"
    exit;
}

function shiftout
{
    pin=`get_pin $1`
    if [ -z "$pin" ]; then
        display_usage $3
    fi
    pin=`get_pin $2`
    if [ -z "$pin" ]; then
        display_usage $3
    fi
    datapin=$1
    clockpin=$2
    bitOrder="MSBFIRST"
    val=$3
    for (( i = 0; i < 8; i++ )); do
        if [ "$bitOrder" = "LSBFIRST" ]; then
            digitalwrite $datapin $((!!($val & (1 << $i))))
        else
            digitalwrite $datapin $((!!($val & (1 << (7 - $i)))))
        fi
        digitalwrite $clockpin HIGH
        digitalwrite $clockpin LOW
    done
}

# If script is sourced, don't run.
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # -h for help
    if [ "$1" = "-h" ]; then
        display_usage $0
    fi
    shiftout $1 $2 $0
fi
