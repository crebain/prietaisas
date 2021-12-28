#!/bin/bash

ffmpeg -f v4l2 -input_format h264 -i /dev/video0 -c:v copy -c:a none rtmp://0.0.0.0:1935
