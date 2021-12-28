#!/bin/bash

ffmpeg -f v4l2 -input_format h264 -i /dev/video0 -c:v copy -c:a none -f rtp rtp://192.168.1.233:1234
