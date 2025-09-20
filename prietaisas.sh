#!/bin/bash

source ./init.sh

# echo $FRONT_LEFT_BACKWARD > /sys/class/gpio/export
# echo $FRONT_LEFT_FORWARD > /sys/class/gpio/export
# echo $FRONT_RIGHT_BACKWARD > /sys/class/gpio/export
# echo $REAR_LEFT_FORWARD > /sys/class/gpio/export
# echo $REAR_LEFT_BACKWARD > /sys/class/gpio/export
# echo $FRONT_RIGHT_FORWARD > /sys/class/gpio/export
# echo $REAR_RIGHT_BACKWARD > /sys/class/gpio/export
# echo $REAR_RIGHT_FORWARD > /sys/class/gpio/export

# echo out > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/direction
# echo out > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/direction
# echo out > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/direction
# echo out > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/direction
# echo out > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/direction
# echo out > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/direction
# echo out > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/direction
# echo out > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/direction

# echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/active_low
# echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/active_low
# echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/active_low
# echo 1 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/active_low
# echo 1 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/active_low
# echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/active_low
# echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/active_low
# echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/active_low

forward() {
    # echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    pinctrl set $FRONT_LEFT_FORWARD op dh
    pinctrl set $FRONT_LEFT_BACKWARD op dl
    pinctrl set $FRONT_RIGHT_FORWARD op dh
    pinctrl set $FRONT_RIGHT_BACKWARD op dl
    pinctrl set $REAR_RIGHT_FORWARD op dh
    pinctrl set $REAR_RIGHT_BACKWARD op dl
    pinctrl set $REAR_LEFT_FORWARD op dh
    pinctrl set $REAR_LEFT_BACKWARD op dl
}

backward() {
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    pinctrl set $FRONT_LEFT_FORWARD op dl
    pinctrl set $FRONT_LEFT_BACKWARD op dh
    pinctrl set $FRONT_RIGHT_FORWARD op dl
    pinctrl set $FRONT_RIGHT_BACKWARD op dh
    pinctrl set $REAR_RIGHT_FORWARD op dl
    pinctrl set $REAR_RIGHT_BACKWARD op dh
    pinctrl set $REAR_LEFT_FORWARD op dl
    pinctrl set $REAR_LEFT_BACKWARD op dh

}

left() {
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    pinctrl set $FRONT_LEFT_FORWARD op dl
    pinctrl set $FRONT_LEFT_BACKWARD op dh
    pinctrl set $FRONT_RIGHT_FORWARD op dh
    pinctrl set $FRONT_RIGHT_BACKWARD op dl
    pinctrl set $REAR_RIGHT_FORWARD op dh
    pinctrl set $REAR_RIGHT_BACKWARD op dl
    pinctrl set $REAR_LEFT_FORWARD op dl
    pinctrl set $REAR_LEFT_BACKWARD op dh
}

right() {
    # echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    pinctrl set $FRONT_LEFT_FORWARD op dh
    pinctrl set $FRONT_LEFT_BACKWARD op dl
    pinctrl set $FRONT_RIGHT_FORWARD op dl
    pinctrl set $FRONT_RIGHT_BACKWARD op dh
    pinctrl set $REAR_RIGHT_FORWARD op dl
    pinctrl set $REAR_RIGHT_BACKWARD op dh
    pinctrl set $REAR_LEFT_FORWARD op dh
    pinctrl set $REAR_LEFT_BACKWARD op dl
}

strafe_right() {
    # echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    pinctrl set $FRONT_LEFT_FORWARD op dh
    pinctrl set $FRONT_LEFT_BACKWARD op dl
    pinctrl set $FRONT_RIGHT_FORWARD op dl
    pinctrl set $FRONT_RIGHT_BACKWARD op dh
    pinctrl set $REAR_RIGHT_FORWARD op dh
    pinctrl set $REAR_RIGHT_BACKWARD op dl
    pinctrl set $REAR_LEFT_FORWARD op dl
    pinctrl set $REAR_LEFT_BACKWARD op dh
}

strafe_left() {
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    # echo 1 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    pinctrl set $FRONT_LEFT_FORWARD op dl
    pinctrl set $FRONT_LEFT_BACKWARD op dh
    pinctrl set $FRONT_RIGHT_FORWARD op dh
    pinctrl set $FRONT_RIGHT_BACKWARD op dl
    pinctrl set $REAR_RIGHT_FORWARD op dl
    pinctrl set $REAR_RIGHT_BACKWARD op dh
    pinctrl set $REAR_LEFT_FORWARD op dh
    pinctrl set $REAR_LEFT_BACKWARD op dl
}


export -f forward
export -f backward
export -f left
export -f right
export -f stop
export -f strafe_left
export -f strafe_right
