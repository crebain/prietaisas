import process from 'process';
import Gpio from 'rpio';
import i2c from 'i2c-bus';
import MPU6050 from 'i2c-mpu6050';

Gpio.init({
  close_on_exit: false,
  mapping: 'gpio'
});

process.on('exit', function () {
  Gpio.exit();
});

const address = 0x68;
const i2c1 = i2c.openSync(1);
const sensor = new MPU6050(i2c1, address);
let accel = sensor.readAccelSync();
let gyro = sensor.readGyroSync();
sensor.calibrateAccel(accel);
sensor.calibrateGyro(gyro);

const format = new Intl.NumberFormat(undefined, {
  minimumIntegerDigits: 3,
  minimumFractionDigits: 3,
  maximumFractionDigits: 3,
  signDisplay: 'always',
});

const accelDiff = {
  x: 0.0,
  y: 0.0,
  z: 0.0,
};

const gyroDiff = {
  x: 0.0,
  y: 0.0,
  z: 0.0,
};

const createRingBuffer = function (length) {

  let pointer = 0, buffer = [];

  return {
    get: function (key) {
      return buffer[key];
    },
    push: function (item) {
      buffer[pointer] = item;
      pointer = (length + pointer + 1) % length;
    },
    sum: function () {
      return buffer.reduce(function (a, b) {
        return {
          x: a.x + b.x,
          y: a.y + b.y,
          z: a.z + b.z,
        };
      }, { x: 0.0, y: 0.0, z: 0.0 });
    },
    average: function () {
      const sum = this.sum();
      return {
        x: sum.x / buffer.length,
        y: sum.y / buffer.length,
        z: sum.z / buffer.length,
      }
    }
  };
};

const count = 10;
const accelSum = createRingBuffer(count);
const gyroSum = createRingBuffer(count);

let start = performance.now();
let samples = 0;

while (true) {
  const newAccel = sensor.readAccelSync();
  const newGyro = sensor.readGyroSync();

  const data = `DATA: accel { x: ${format.format(newAccel.x)}, y: ${format.format(newAccel.y)}, z: ${format.format(newAccel.z)} }; gyro: { x: ${format.format(newGyro.x)}, y: ${format.format(newGyro.y)}, z: ${format.format(newGyro.z)} }\r\n`
  process.stdout.write(data);

  accelSum.push(newAccel);
  gyroSum.push(newGyro);

  const accelAverage = accelSum.average();
  const gyroAverage = gyroSum.average();

  const average = `AVER: accel { x: ${format.format(accelAverage.x)}, y: ${format.format(accelAverage.y)}, z: ${format.format(accelAverage.z)} }; gyro: { x: ${format.format(gyroAverage.x)}, y: ${format.format(gyroAverage.y)}, z: ${format.format(gyroAverage.z)} }\r\n`
  process.stdout.write(average);

  accelDiff.x = newAccel.x - accel.x;
  accelDiff.y = newAccel.y - accel.y;
  accelDiff.z = newAccel.z - accel.z;

  gyroDiff.x = newGyro.x - gyro.x;
  gyroDiff.y = newGyro.y - gyro.y;
  gyroDiff.z = newGyro.z - gyro.z;

  const diff = `DIFF: accel { x: ${format.format(accelDiff.x)}, y: ${format.format(accelDiff.y)}, z: ${format.format(accelDiff.z)} }; gyro: { x: ${format.format(gyroDiff.x)}, y: ${format.format(gyroDiff.y)}, z: ${format.format(gyroDiff.z)} }\r\n`
  process.stdout.write(diff);

  accel = newAccel;
  gyro = newGyro;

  samples++;
  const now = performance.now();

  const rate = samples * 1000.0 / (now - start);
  process.stdout.write(`RATE: ${format.format(rate)} samples/sec\r\n`);

  process.stdout.write('\x1b[1A');
  process.stdout.write('\x1b[1A');
  process.stdout.write('\x1b[1A');
  process.stdout.write('\x1b[1A');
}

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

function stop() {
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
