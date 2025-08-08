#!/bin/bash

FRONT_LEFT_BACKWARD=4
FRONT_LEFT_FORWARD=17
FRONT_RIGHT_BACKWARD=5
REAR_LEFT_FORWARD=27
REAR_LEFT_BACKWARD=22
FRONT_RIGHT_FORWARD=23
REAR_RIGHT_BACKWARD=24
REAR_RIGHT_FORWARD=25

echo $FRONT_LEFT_BACKWARD > /sys/class/gpio/export
echo $FRONT_LEFT_FORWARD > /sys/class/gpio/export
echo $FRONT_RIGHT_BACKWARD > /sys/class/gpio/export
echo $REAR_LEFT_FORWARD > /sys/class/gpio/export
echo $REAR_LEFT_BACKWARD > /sys/class/gpio/export
echo $FRONT_RIGHT_FORWARD > /sys/class/gpio/export
echo $REAR_RIGHT_BACKWARD > /sys/class/gpio/export
echo $REAR_RIGHT_FORWARD > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/direction
echo out > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/direction
echo out > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/direction
echo out > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/direction
echo out > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/direction
echo out > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/direction
echo out > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/direction
echo out > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/direction

forward() {
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
}

backward() {
    echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
}

left() {
    echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
}

right() {
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
}

stop() {
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
}

strafe_left() {
    echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
}

strafe_right() {
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
}


export -f forward
export -f backward
export -f left
export -f right
export -f stop
export -f strafe_left
export -f strafe_right
