import {
    MPU6050
} from '@ros2jsguy/mpu6050-motion-data';

const imu = new MPU6050();
imu.initialize();

// use testConnection() to ensure the mpu6050 is working properly
console.log('Device connected:', imu.testConnection());

imu.calibrateAccel();
imu.calibrateGyro();

const motionData = imu.getMotionData();
console.log(motionData);
