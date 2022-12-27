#!/bin/bash

# execute ./dependencies/pillow.sh
./dependencies/pillow.sh

# execute ./dependencies/imageio.sh
./dependencies/imageio.sh

# Draw a 1280 x 720 pixels white background, with a 16:9 aspect ratio in JPG
python -c "from PIL import Image; Image.new('RGB', (1280, 720), (255, 255, 255)).save('image.jpg')"

# Add a sentence to the image in bold, 36px in the middle of the image (centered) by the user from a prompt
python -c "from PIL import Image, ImageDraw, ImageFont; image = Image.open('image.jpg'); draw = ImageDraw.Draw(image); font = ImageFont.truetype('arial.ttf', 36); draw.text((640, 360), input('Enter a sentence: '), (0, 0, 0), font=font, anchor='mm'); image.save('image.jpg')"

# Save the image with the same input before in a PNG format 75% quality with a 1280 x 720 pixels resolution with a 16:9 aspect ratio
python -c "from PIL import Image; image = Image.open('image.jpg'); image.save('image.png', quality=75, optimize=True, progressive=True, dpi=(72, 72), resample=Image.LANCZOS, icc_profile=image.info.get('icc_profile'))"