FRONT_LEFT_BACKWARD=4
FRONT_LEFT_FORWARD=17
FRONT_RIGHT_BACKWARD=5
REAR_LEFT_FORWARD=27
REAR_LEFT_BACKWARD=22
FRONT_RIGHT_FORWARD=23
REAR_RIGHT_BACKWARD=24
REAR_RIGHT_FORWARD=25

stop() {
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
    # echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
    pinctrl set $FRONT_LEFT_FORWARD op dl
    pinctrl set $FRONT_LEFT_BACKWARD op dl
    pinctrl set $FRONT_RIGHT_FORWARD op dl
    pinctrl set $FRONT_RIGHT_BACKWARD op dl
    pinctrl set $REAR_RIGHT_FORWARD op dl
    pinctrl set $REAR_RIGHT_BACKWARD op dl
    pinctrl set $REAR_LEFT_FORWARD op dl
    pinctrl set $REAR_LEFT_BACKWARD op dl
}

stop

export -f stop
