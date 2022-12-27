#!/bin/bash

# Check if the convert command is available
if ! [ -x "$(command -v convert)" ]; then
  echo "Error: convert command not found. Please install ImageMagick and try again." >&2
  exit 1
fi

# Check if the logo file is available
if [ ! -f logo.png ]; then
  echo "Error: logo.png file not found. Please place the Twitch logo file in the current directory and try again." >&2
  exit 1
fi

# Generate a random seed for the background color
seed=$RANDOM

# Set the title and subtitle text
title=$1
subtitle="twitch.tv/miguelgargallo | twitter.com/miguelgargallo"

# Set the font and font sizes for the text
font="arial"
title_size=36
subtitle_size=24

# Set the dimensions of the thumbnail
width=1280
height=720

# Set the padding for the text
padding=20

# Generate a solid color background using the random seed
convert -size "${width}x${height}" -seed "$seed" xc: +noise Random \
  -virtual-pixel tile -blur 0x8 -auto-level \
  -separate -background black -compose Multiply -flatten \
  thumbnail_bg.png

# Determine the complementary color of the background
complementary_color=$(convert thumbnail_bg.png -colorspace HSL -channel G -separate +channel -negate -colorspace sRGB -format '%[hex:p{0,0}]' info:)

# Add the title text to the center of the thumbnail
convert thumbnail_bg.png -font "$font" -pointsize "$title_size" -fill "$complementary_color" -gravity center -annotate +0+0 "$title" thumbnail_with_title.png

# Add the subtitle text to the bottom center of the thumbnail
convert thumbnail_with_title.png -font "$font" -pointsize "$subtitle_size" -fill pink -gravity South -annotate +0+"$padding" "twitch.tv/miguelgargallo" -fill blue -gravity South -annotate +0+"$padding" "twitter.com/miguelgargallo" thumbnail_with_text.png

# Add the Twitch logo to the bottom right corner of the thumbnail
convert thumbnail_with_text.png logo.png -gravity SouthEast -geometry +"$padding"+"$padding" -composite thumbnail.png
