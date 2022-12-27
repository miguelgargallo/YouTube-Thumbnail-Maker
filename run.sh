#!/bin/bash

# Assign permissions to the scripts, check if dependencies are installed and install them if not
chmod +x dependencies.sh && ./dependencies.sh

# Ask the user for a sentence
read -p "Enter a sentence: " sentence

# Create a 1280 x 720 pixels white background with filename $sentence.jpg in the current directory and the sentence in the middle of the image
python -c "from PIL import Image, ImageDraw, ImageFont; Image.new('RGB', (1280, 720), (255, 255, 255)).save('$sentence.jpg'); image = Image.open('$sentence.jpg'); draw = ImageDraw.Draw(image); font = ImageFont.truetype('arial.ttf', 36); draw.text((640, 360), '$sentence', (0, 0, 0), font=font, anchor='mm'); image.save('$sentence.jpg'); image.save('$sentence.jpg', quality=100, optimize=True, progressive=True, subsampling='4:4:4', dpi=(1280, 720))"
