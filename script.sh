#!/usr/bin/env bash

# Get the current date in the format YYYY-MM-DD
date=$(date +"%Y-%m-%d")

# Generate a pastel random color
color=$(convert -list color | sort -R | head -n 1)

# Create the image with the specified dimensions and the pastel random color as the background
convert -size 1280x720 xc:"$color" image.jpg

# Add the text to the center of the image in the opposite complementary color
convert image.jpg -gravity center -font arial -pointsize 72 -fill black -annotate +0+0 'This is a test' -channel RGBA -negate image.jpg

# Save the image with the current date as the filename
mv image.jpg "${date}.jpg"

echo "Image created successfully and saved as ${date}.jpg"
