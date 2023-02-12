Node.js 16 is the latest version that works with rpio

Using the scripts from https://github.com/sdesalas/node-pi-zero to install node

https://www.npmjs.com/package/@ros2jsguy/mpu6050-motion-data/v/0.2.0


@ros2jsguy/mpu6050-motion-data doesn't work with either node.js version, `npx calibrate` or `imu.calibrateGyro()` fails with out of range error
``` sh
rpio: rpio {
  _events: [Object: null prototype] { warn: [Function: default_warn_handler] },
  _eventsCount: 1,
  _maxListeners: undefined,
  [Symbol(kCapture)]: false
} 
 [Function (anonymous)]
Device connected: true
>......
>node:internal/buffer:74
    throw new ERR_OUT_OF_RANGE('value', range, value);
    ^

RangeError [ERR_OUT_OF_RANGE]: The value of "value" is out of range. It must be >= 0 and <= 65535. Received -32
    at new NodeError (node:internal/errors:399:5)
    at checkInt (node:internal/buffer:74:11)
    at writeU_Int16BE (node:internal/buffer:834:3)
    at Buffer.writeUInt16BE (node:internal/buffer:842:10)
    at RpioI2CHelper.writeWord (/home/alarm/src/prietaisas/node_modules/@ros2jsguy/mpu6050-motion-data/dist/rpio-i2c-helper.js:166:25)
    at MPU6050.PID (/home/alarm/src/prietaisas/node_modules/@ros2jsguy/mpu6050-motion-data/dist/mpu6050.js:1246:36)
    at MPU6050.calibrateGyro (/home/alarm/src/prietaisas/node_modules/@ros2jsguy/mpu6050-motion-data/dist/mpu6050.js:1182:14)
    at Object.<anonymous> (/home/alarm/src/prietaisas/dist/dmp.js:9:5)
    at Module._compile (node:internal/modules/cjs/loader:1226:14)
    at Module._extensions..js (node:internal/modules/cjs/loader:1280:10) {
  code: 'ERR_OUT_OF_RANGE'
}
```