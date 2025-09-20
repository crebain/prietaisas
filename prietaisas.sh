#!/bin/bash

FRONT_LEFT_BACKWARD=4
FRONT_LEFT_FORWARD=17
FRONT_RIGHT_BACKWARD=5
REAR_LEFT_FORWARD=27
REAR_LEFT_BACKWARD=22
FRONT_RIGHT_FORWARD=23
REAR_RIGHT_BACKWARD=24
REAR_RIGHT_FORWARD=25

init() {
    pinctrl set $FRONT_LEFT_FORWARD op pd dl
    pinctrl set $FRONT_LEFT_BACKWARD op pd dl
    pinctrl set $FRONT_RIGHT_FORWARD op pd dl
    pinctrl set $FRONT_RIGHT_BACKWARD op pd dl
    pinctrl set $REAR_RIGHT_FORWARD op pd dl
    pinctrl set $REAR_RIGHT_BACKWARD op pd dl
    pinctrl set $REAR_LEFT_FORWARD op pd dl
    pinctrl set $REAR_LEFT_BACKWARD op pd dl
}

front_left_stop() {
    pinctrl set $FRONT_LEFT_FORWARD dl
    pinctrl set $FRONT_LEFT_BACKWARD dl
}

front_left_forward() {
    pinctrl set $FRONT_LEFT_FORWARD dh
    pinctrl set $FRONT_LEFT_BACKWARD dl
}

front_left_backward () {
    pinctrl set $FRONT_LEFT_FORWARD dl
    pinctrl set $FRONT_LEFT_BACKWARD dh
}

front_right_stop() {
    pinctrl set $FRONT_RIGHT_FORWARD dl
    pinctrl set $FRONT_RIGHT_BACKWARD dl
}

front_right_forward() {
    pinctrl set $FRONT_RIGHT_FORWARD dh
    pinctrl set $FRONT_RIGHT_BACKWARD dl
}

front_right_backward() {
    pinctrl set $FRONT_RIGHT_FORWARD dl
    pinctrl set $FRONT_RIGHT_BACKWARD dh
}

rear_left_stop() {
    pinctrl set $REAR_LEFT_FORWARD dl
    pinctrl set $REAR_LEFT_BACKWARD dl
}

rear_left_forward() {
    pinctrl set $REAR_LEFT_FORWARD dh
    pinctrl set $REAR_LEFT_BACKWARD dl
}

rear_left_backward() {
    pinctrl set $REAR_LEFT_FORWARD dl
    pinctrl set $REAR_LEFT_BACKWARD dh
}

rear_right_stop() {
    pinctrl set $REAR_RIGHT_FORWARD dl
    pinctrl set $REAR_RIGHT_BACKWARD dl
}

rear_right_forward() {
    pinctrl set $REAR_RIGHT_FORWARD dh
    pinctrl set $REAR_RIGHT_BACKWARD dl
}

rear_right_backward() {
    pinctrl set $REAR_RIGHT_FORWARD dl
    pinctrl set $REAR_RIGHT_BACKWARD dh
}

stop() {
    front_left_stop
    front_right_stop
    rear_right_stop
    rear_left_stop
}

forward() {
    front_left_forward
    front_right_forward
    rear_right_forward
    rear_left_forward
}

backward() {
    front_left_backward
    front_right_backward
    rear_right_backward
    rear_left_backward

}

left() {
    front_left_stop
    rear_left_stop
    front_right_forward
    rear_right_forward
}

right() {
    front_right_stop
    rear_right_stop
    front_left_forward
    rear_left_forward
}

rotate_left() {
    front_left_backward
    front_right_forward
    rear_right_forward
    rear_left_backward
}

rotate_right() {
    front_left_forward
    front_right_backward
    rear_right_backward
    rear_left_forward
}

strafe_right() {
    front_left_forward
    front_right_backward
    rear_right_forward
    rear_left_backward
}

strafe_left() {
    front_left_backward
    front_right_forward
    rear_right_backward
    rear_left_forward
}


export -f init
export -f forward
export -f backward
export -f left
export -f right
export -f rotate_left
export -f rotate_right
export -f stop
export -f strafe_left
export -f strafe_right
