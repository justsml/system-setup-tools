#!/bin/bash
set -e
# Tested on OSX

# DESCRIPTION: Converts a video capture from QuickTime or anything ffmpeg supports into a GIF

# Credits: 
# https://gist.github.com/dergachev/4627207#gistcomment-1407037
# And to improve quality & more in-depth info, see: http://chrismessina.me/b/13913393/mov-to-gif

# movtogif
ffmpeg -i "$1" -vf scale=800:-1 -r 10 -f image2pipe -vcodec ppm - |\
convert -delay 5 -layers Optimize -loop 0 - "$2"

# GUI alternative: 
# https://github.com/justinfrankel/licecap -- site: http://www.cockos.com/licecap/
