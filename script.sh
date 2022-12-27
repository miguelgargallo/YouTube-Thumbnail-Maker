#!/bin/bash

# Check if pillow is installed
if ! python -c "import PIL" &> /dev/null; then
    echo "Pillow is not installed"
    exit 1
fi

# Check if the imageio library is installed
if ! python -c "import imageio" &> /dev/null; then
    echo "imageio is not installed"
    exit 1
fi

# Draw a 1280 x 720 pixels white background, with a 16:9 aspect ratio in JPG
python -c "from PIL import Image; Image.new('RGB', (1280, 720), (255, 255, 255)).save('image.jpg')"

# Add a sentence to the image in bold, 36px in the middle of the image (centered) by the user from a prompt
python -c "from PIL import Image, ImageDraw, ImageFont; image = Image.open('image.jpg'); draw = ImageDraw.Draw(image); font = ImageFont.truetype('arial.ttf', 36); draw.text((640, 360), input('Enter a sentence: '), (0, 0, 0), font=font, anchor='mm'); image.save('image.jpg')"

# Save the image as "image.jpg" in the current directory
python -c "import imageio; imageio.imwrite('image.jpg', imageio.imread('image.jpg'))"
