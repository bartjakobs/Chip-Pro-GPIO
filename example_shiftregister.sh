#!/bin/bash
source pinmode.sh
source digitalwrite.sh
source shiftout.sh

clockpin=D0
datapin=D1
latchpin=D2

function writeShiftRegister {
    digitalwrite $latchpin LOW
    shiftOut $datapin $clockpin $1
    digitalwrite $latchpin HIGH
}

pinmode $clockpin OUTPUT
pinmode $datapin OUTPUT
pinmode $latchpin OUTPUT


while true; do
writeShiftRegister 192
sleep 0.2
writeShiftRegister 249
sleep 0.2
writeShiftRegister 164
sleep 0.2
writeShiftRegister 176
sleep 0.2
writeShiftRegister 153
sleep 0.2
writeShiftRegister 146
sleep 0.2
writeShiftRegister 130
sleep 0.2
writeShiftRegister 248
sleep 0.2
writeShiftRegister 128
sleep 0.2
writeShiftRegister 144
sleep 0.2
done;
pinmode $clockpin UNEXPORT
pinmode $datapin UNEXPORT
pinmode $latchpin UNEXPORT
