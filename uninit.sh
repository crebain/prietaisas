FRONT_LEFT_BACKWARD=4
FRONT_LEFT_FORWARD=17
FRONT_RIGHT_BACKWARD=5
REAR_LEFT_FORWARD=27
REAR_LEFT_BACKWARD=22
FRONT_RIGHT_FORWARD=23
REAR_RIGHT_BACKWARD=24
REAR_RIGHT_FORWARD=25

echo $FRONT_LEFT_BACKWARD > /sys/class/gpio/unexport
echo $FRONT_LEFT_FORWARD > /sys/class/gpio/unexport
echo $FRONT_RIGHT_BACKWARD > /sys/class/gpio/unexport
echo $REAR_LEFT_FORWARD > /sys/class/gpio/unexport
echo $REAR_LEFT_BACKWARD > /sys/class/gpio/unexport
echo $FRONT_RIGHT_FORWARD > /sys/class/gpio/unexport
echo $REAR_RIGHT_BACKWARD > /sys/class/gpio/unexport
echo $REAR_RIGHT_FORWARD > /sys/class/gpio/unexport
