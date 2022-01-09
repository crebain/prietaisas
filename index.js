import process from 'process';
import Gpio from 'rpio';

Gpio.init({
  close_on_exit: false,
  mapping: 'gpio'
});

process.on('exit', function() {
        /* Insert any custom cleanup code here. */
        Gpio.exit();
});

class Channel {
  constructor(pin) {
    this.pin = pin;
    Gpio.open(this.pin, Gpio.OUTPUT, Gpio.LOW);
  }

  start() {
    Gpio.write(this.pin, Gpio.HIGH);
  }

  stop() {
    Gpio.write(this.pin, Gpio.LOW);
  }
}

const FRONT_LEFT_BACKWARD = new Channel(4);
const FRONT_LEFT_FORWARD = new Channel(17);
const FRONT_RIGHT_BACKWARD = new Channel(5);
const REAR_LEFT_FORWARD = new Channel(27);
const REAR_LEFT_BACKWARD = new Channel(22);
const FRONT_RIGHT_FORWARD = new Channel(23);
const REAR_RIGHT_BACKWARD = new Channel(24);
const REAR_RIGHT_FORWARD = new Channel(25);

function forward(speed = 255) {
    FRONT_LEFT_BACKWARD.stop();
    FRONT_RIGHT_BACKWARD.stop();
    REAR_LEFT_BACKWARD.stop();
    REAR_RIGHT_BACKWARD.stop();

    FRONT_LEFT_FORWARD.start();
    FRONT_RIGHT_FORWARD.start();
    REAR_LEFT_FORWARD.start();
    REAR_RIGHT_FORWARD.start();
};

function backward(speed = 255) {
    FRONT_LEFT_FORWARD.stop();
    FRONT_RIGHT_FORWARD.stop();
    REAR_LEFT_FORWARD.stop();
    REAR_RIGHT_FORWARD.stop();

    FRONT_LEFT_BACKWARD.start();
    FRONT_RIGHT_BACKWARD.start();
    REAR_LEFT_BACKWARD.start();
    REAR_RIGHT_BACKWARD.start();
};

function left(speed = 255) {
    FRONT_LEFT_FORWARD.stop();
//    FRONT_RIGHT_FORWARD.pwmWrite(Math.floor(speed/2));
    REAR_LEFT_FORWARD.stop();
    REAR_RIGHT_FORWARD.start();
    FRONT_LEFT_BACKWARD.start();
    FRONT_RIGHT_BACKWARD.stop();
    REAR_LEFT_BACKWARD.stop();
    REAR_RIGHT_BACKWARD.stop();
};

function right(speed = 255) {
//    FRONT_LEFT_FORWARD.pwmWrite(Math.floor(speed/2));
    FRONT_RIGHT_FORWARD.stop();
    REAR_LEFT_FORWARD.start();
    REAR_RIGHT_FORWARD.stop();
    FRONT_LEFT_BACKWARD.stop();
    FRONT_RIGHT_BACKWARD.start();
    REAR_LEFT_BACKWARD.stop();
    REAR_RIGHT_BACKWARD.stop();
};

function fwright(speed = 255) {
//    FRONT_LEFT_FORWARD.pwmWrite(Math.floor(speed*.75));
//    FRONT_RIGHT_FORWARD.pwmWrite(Math.floor(0));
//    REAR_LEFT_FORWARD.pwmWrite(Math.floor(speed));
//    REAR_RIGHT_FORWARD.pwmWrite(Math.floor(speed/2*.75));
    FRONT_LEFT_BACKWARD.stop();
    FRONT_RIGHT_BACKWARD.stop();
    REAR_LEFT_BACKWARD.stop();
    REAR_RIGHT_BACKWARD.stop();
};

function stop () {
    FRONT_LEFT_FORWARD.stop();
    FRONT_RIGHT_FORWARD.stop();
    REAR_LEFT_FORWARD.stop();
    REAR_RIGHT_FORWARD.stop();

    FRONT_LEFT_BACKWARD.stop();
    FRONT_RIGHT_BACKWARD.stop();
    REAR_LEFT_BACKWARD.stop();
    REAR_RIGHT_BACKWARD.stop();
};


forward();

setTimeout(() => {
    stop();
}, 6000);
