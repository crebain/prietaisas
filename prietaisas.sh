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

stop() {
    pinctrl set $FRONT_LEFT_FORWARD dl
    pinctrl set $FRONT_LEFT_BACKWARD dl
    pinctrl set $FRONT_RIGHT_FORWARD dl
    pinctrl set $FRONT_RIGHT_BACKWARD dl
    pinctrl set $REAR_RIGHT_FORWARD dl
    pinctrl set $REAR_RIGHT_BACKWARD dl
    pinctrl set $REAR_LEFT_FORWARD dl
    pinctrl set $REAR_LEFT_BACKWARD dl
}

forward() {
    pinctrl set $FRONT_LEFT_FORWARD dh
    pinctrl set $FRONT_LEFT_BACKWARD dl
    pinctrl set $FRONT_RIGHT_FORWARD dh
    pinctrl set $FRONT_RIGHT_BACKWARD dl
    pinctrl set $REAR_RIGHT_FORWARD dh
    pinctrl set $REAR_RIGHT_BACKWARD dl
    pinctrl set $REAR_LEFT_FORWARD dh
    pinctrl set $REAR_LEFT_BACKWARD dl
}

backward() {
    pinctrl set $FRONT_LEFT_FORWARD dl
    pinctrl set $FRONT_LEFT_BACKWARD dh
    pinctrl set $FRONT_RIGHT_FORWARD dl
    pinctrl set $FRONT_RIGHT_BACKWARD dh
    pinctrl set $REAR_RIGHT_FORWARD dl
    pinctrl set $REAR_RIGHT_BACKWARD dh
    pinctrl set $REAR_LEFT_FORWARD dl
    pinctrl set $REAR_LEFT_BACKWARD dh

}

left() {
    pinctrl set $FRONT_LEFT_FORWARD dl
    pinctrl set $FRONT_LEFT_BACKWARD dl
    pinctrl set $FRONT_RIGHT_FORWARD dh
    pinctrl set $FRONT_RIGHT_BACKWARD dl
    pinctrl set $REAR_RIGHT_FORWARD dh
    pinctrl set $REAR_RIGHT_BACKWARD dl
    pinctrl set $REAR_LEFT_FORWARD dl
    pinctrl set $REAR_LEFT_BACKWARD dl
}

right() {
    pinctrl set $FRONT_LEFT_FORWARD dh
    pinctrl set $FRONT_LEFT_BACKWARD dl
    pinctrl set $FRONT_RIGHT_FORWARD dl
    pinctrl set $FRONT_RIGHT_BACKWARD dl
    pinctrl set $REAR_RIGHT_FORWARD dl
    pinctrl set $REAR_RIGHT_BACKWARD dl
    pinctrl set $REAR_LEFT_FORWARD dh
    pinctrl set $REAR_LEFT_BACKWARD dl
}

rotate_left() {
    pinctrl set $FRONT_LEFT_FORWARD dl
    pinctrl set $FRONT_LEFT_BACKWARD dh
    pinctrl set $FRONT_RIGHT_FORWARD dh
    pinctrl set $FRONT_RIGHT_BACKWARD dl
    pinctrl set $REAR_RIGHT_FORWARD dh
    pinctrl set $REAR_RIGHT_BACKWARD dl
    pinctrl set $REAR_LEFT_FORWARD dl
    pinctrl set $REAR_LEFT_BACKWARD dh
}

raotate_right() {
    pinctrl set $FRONT_LEFT_FORWARD dh
    pinctrl set $FRONT_LEFT_BACKWARD dl
    pinctrl set $FRONT_RIGHT_FORWARD dl
    pinctrl set $FRONT_RIGHT_BACKWARD dh
    pinctrl set $REAR_RIGHT_FORWARD dl
    pinctrl set $REAR_RIGHT_BACKWARD dh
    pinctrl set $REAR_LEFT_FORWARD dh
    pinctrl set $REAR_LEFT_BACKWARD dl
}

strafe_right() {
    pinctrl set $FRONT_LEFT_FORWARD dh
    pinctrl set $FRONT_LEFT_BACKWARD dl
    pinctrl set $FRONT_RIGHT_FORWARD dl
    pinctrl set $FRONT_RIGHT_BACKWARD dh
    pinctrl set $REAR_RIGHT_FORWARD dh
    pinctrl set $REAR_RIGHT_BACKWARD dl
    pinctrl set $REAR_LEFT_FORWARD dl
    pinctrl set $REAR_LEFT_BACKWARD dh
}

strafe_left() {
    pinctrl set $FRONT_LEFT_FORWARD dl
    pinctrl set $FRONT_LEFT_BACKWARD dh
    pinctrl set $FRONT_RIGHT_FORWARD dh
    pinctrl set $FRONT_RIGHT_BACKWARD dl
    pinctrl set $REAR_RIGHT_FORWARD dl
    pinctrl set $REAR_RIGHT_BACKWARD dh
    pinctrl set $REAR_LEFT_FORWARD dh
    pinctrl set $REAR_LEFT_BACKWARD dl
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
