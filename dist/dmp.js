"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mpu6050_motion_data_1 = require("@ros2jsguy/mpu6050-motion-data");
const imu = new mpu6050_motion_data_1.MPU6050();
imu.initialize();
// use testConnection() to ensure the mpu6050 is working properly
console.log('Device connected:', imu.testConnection());
imu.calibrateAccel();
imu.calibrateGyro();
const motionData = imu.getMotionData();
console.log(motionData);
