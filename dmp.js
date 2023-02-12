"use strict";
exports.__esModule = true;
var mpu6050_motion_data_1 = require("@ros2jsguy/mpu6050-motion-data");
var imu = new mpu6050_motion_data_1.MPU6050();
imu.initialize();
// use testConnection() to ensure the mpu6050 is working properly
console.log('Device connected:', imu.testConnection());
imu.calibrateAccel();
imu.calibrateGyro();
var motionData = imu.getMotionData();
console.log(motionData);
