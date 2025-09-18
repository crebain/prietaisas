#!/bin/bash

# ffmpeg -f v4l2 -input_format h264 -i /dev/video0 -c:v copy -c:a none -f rtp rtp://192.168.1.233:1234
rpicam-vid -t 0 -n --inline --listen -o tcp://0.0.0.0:1935
