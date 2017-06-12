#!/bin/bash
declare -A pins

if [[ -z "$CHIP" ]]; then
    if [[ $(lsblk | grep G) ]]; then
        CHIP="CHIP"
    else
        CHIP="PRO"
    fi
    export CHIP
fi

if [[ $CHIP = "PRO" ]]; then
    # D0-D7
    # Pin names on C.H.I.P. Pro dev board
    pins[D0]=132
    pins[D1]=133
    pins[D2]=134
    pins[D3]=135
    pins[D4]=136
    pins[D5]=137
    pins[D6]=138
    pins[D7]=139
    # C.H.I.P. Pro Pin
    pins[37]=132
    pins[36]=133
    pins[35]=134
    pins[34]=135
    pins[33]=136
    pins[32]=137
    pins[31]=138
    pins[30]=139

    # TWI1, UART2
    pins[11]=47
    pins[12]=48
    pins[13]=98
    pins[14]=99
    pins[15]=100
    pins[16]=101

    # I2S
    pins[21]=37
    pins[22]=38
    pins[23]=39
    pins[24]=40
    pins[25]=41

    # SPI2
    pins[41]=128
    pins[40]=129
    pins[39]=130
    pins[38]=131

    # PWM
    pins[9]=0
    pins[10]=1
fi

# Function name to sysfs
function get_pin {
    pin=${pins[$1]}
    if [ -z "$pin" ]; then
        pin=$1
    fi
    echo $pin
}
