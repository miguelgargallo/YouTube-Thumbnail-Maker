#!/bin/bash

# check if required libraries are installed
pip freeze | grep pillow > /dev/null
if [ $? -ne 0 ]; then
  echo "Pillow library not found. Installing..."
  pip install pillow
else
  echo "Pillow library found."
fi

# create an empty image with the specified dimensions
python -c "from PIL import Image; img = Image.new('RGB', (1280, 720), color='white'); img.save('image.jpg', 'JPEG')"

# draw the title on the image using the specified font and size
python -c "from PIL import ImageFont, ImageDraw; img = Image.open('image.jpg'); draw = ImageDraw.Draw(img); font = ImageFont.truetype('arial.ttf', size=48); text = 'XL Title'; text_width, text_height = draw.textsize(text, font=font); draw.text(((1280 - text_width) / 2, (720 - text_height) / 2), text, font=font, fill=(0, 0, 0)); img.save('image.jpg', 'JPEG')"
