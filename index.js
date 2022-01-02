import * as Gpio from 'rpi-gpio';

const FRONT_LEFT_BACKWARD = new Gpio(4, {mode: Gpio.OUTPUT});
const FRONT_LEFT_FORWARD = new Gpio(17, {mode: Gpio.OUTPUT});
const FRONT_RIGHT_BACKWARD = new Gpio(18, {mode: Gpio.OUTPUT});
const REAR_LEFT_FORWARD = new Gpio(27, {mode: Gpio.OUTPUT});
const REAR_LEFT_BACKWARD = new Gpio(22, {mode: Gpio.OUTPUT});
const FRONT_RIGHT_FORWARD = new Gpio(23, {mode: Gpio.OUTPUT});
const REAR_RIGHT_BACKWARD = new Gpio(24, {mode: Gpio.OUTPUT});
const REAR_RIGHT_FORWARD = new Gpio(25, {mode: Gpio.OUTPUT});

const dutyCycle = 128;

function forward(speed = 255) {
    FRONT_LEFT_BACKWARD.pwmWrite(0);
    FRONT_RIGHT_BACKWARD.pwmWrite(0);
    REAR_LEFT_BACKWARD.pwmWrite(0);
    REAR_RIGHT_BACKWARD.pwmWrite(0);

    FRONT_LEFT_FORWARD.pwmWrite(speed);
    FRONT_RIGHT_FORWARD.pwmWrite(speed);
    REAR_LEFT_FORWARD.pwmWrite(speed);
    REAR_RIGHT_FORWARD.pwmWrite(speed);
};

function backward(speed = 255) {
    FRONT_LEFT_FORWARD.pwmWrite(0);
    FRONT_RIGHT_FORWARD.pwmWrite(0);
    REAR_LEFT_FORWARD.pwmWrite(0);
    REAR_RIGHT_FORWARD.pwmWrite(0);

    FRONT_LEFT_BACKWARD.pwmWrite(speed);
    FRONT_RIGHT_BACKWARD.pwmWrite(speed);
    REAR_LEFT_BACKWARD.pwmWrite(speed);
    REAR_RIGHT_BACKWARD.pwmWrite(speed);
};

function left(speed = 255) {
    FRONT_LEFT_FORWARD.pwmWrite(0);
    FRONT_RIGHT_FORWARD.pwmWrite(Math.floor(speed/2));
    REAR_LEFT_FORWARD.pwmWrite(0);
    REAR_RIGHT_FORWARD.pwmWrite(speed);
    FRONT_LEFT_BACKWARD.pwmWrite(speed);
    FRONT_RIGHT_BACKWARD.pwmWrite(0);
    REAR_LEFT_BACKWARD.pwmWrite(0);
    REAR_RIGHT_BACKWARD.pwmWrite(0);
};

function right(speed = 255) {
    FRONT_LEFT_FORWARD.pwmWrite(Math.floor(speed/2));
    FRONT_RIGHT_FORWARD.pwmWrite(0);
    REAR_LEFT_FORWARD.pwmWrite(speed);
    REAR_RIGHT_FORWARD.pwmWrite(0);
    FRONT_LEFT_BACKWARD.pwmWrite(0);
    FRONT_RIGHT_BACKWARD.pwmWrite(speed);
    REAR_LEFT_BACKWARD.pwmWrite(0);
    REAR_RIGHT_BACKWARD.pwmWrite(0);
};

function fwright(speed = 255) {
    FRONT_LEFT_FORWARD.pwmWrite(Math.floor(speed*.75));
    FRONT_RIGHT_FORWARD.pwmWrite(Math.floor(0));
    REAR_LEFT_FORWARD.pwmWrite(Math.floor(speed));
    REAR_RIGHT_FORWARD.pwmWrite(Math.floor(speed/2*.75));
    FRONT_LEFT_BACKWARD.pwmWrite(0);
    FRONT_RIGHT_BACKWARD.pwmWrite(0);
    REAR_LEFT_BACKWARD.pwmWrite(0);
    REAR_RIGHT_BACKWARD.pwmWrite(0);
};

// left() {
//     echo 1 > /sys/class/gpio/gpio$FRONT_LEFT_BACKWARD/value
//     echo 0 > /sys/class/gpio/gpio$FRONT_LEFT_FORWARD/value
//     echo 0 > /sys/class/gpio/gpio$FRONT_RIGHT_BACKWARD/value
//     echo 0 > /sys/class/gpio/gpio$REAR_LEFT_FORWARD/value
//     echo 0 > /sys/class/gpio/gpio$REAR_LEFT_BACKWARD/value
//     echo 1 > /sys/class/gpio/gpio$FRONT_RIGHT_FORWARD/value
//     echo 0 > /sys/class/gpio/gpio$REAR_RIGHT_BACKWARD/value
//     echo 1 > /sys/class/gpio/gpio$REAR_RIGHT_FORWARD/value
// }


function stop () {
    FRONT_LEFT_FORWARD.pwmWrite(0);
    FRONT_RIGHT_FORWARD.pwmWrite(0);
    REAR_LEFT_FORWARD.pwmWrite(0);
    REAR_RIGHT_FORWARD.pwmWrite(0);

    FRONT_LEFT_BACKWARD.pwmWrite(0);
    FRONT_RIGHT_BACKWARD.pwmWrite(0);
    REAR_LEFT_BACKWARD.pwmWrite(0);
    REAR_RIGHT_BACKWARD.pwmWrite(0);
};


backward();

setTimeout(() => {
    stop();
}, 6000);
