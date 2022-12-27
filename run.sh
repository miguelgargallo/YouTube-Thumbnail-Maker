#!/bin/bash

# Assign permissions to the scripts, check if dependencies are installed and install them if not
chmod +x dependencies.sh && ./dependencies.sh

# Ask the user for a sentence
read -p "Enter a sentence: " sentence

# Check if the directory exists and create it if not with the name of "Youtbe Thumbnails"
if [ ! -d "Thumbnails" ]; then
    mkdir "Thumbnails"
fi

# Create a 1280 x 720 pixels with a random #Hex color background, save it with the filename $sentence.jpg in the Thumbnails directory and the sentence in the middle of the image, then optimize the image for the web and set the DPI to 1280 x 720, use a complementary color for the text and set the font to Arial 72 pixels in bold.
python -c "from PIL import Image, ImageDraw, ImageFont; import random; color = '#%06x' % random.randint(0, 0xFFFFFF); img = Image.new('RGB', (1280, 720), color); d = ImageDraw.Draw(img); fnt = ImageFont.truetype('arial.ttf', 72); d.text((640, 360), '$sentence', font=fnt, fill='#%06x' % (0xFFFFFF ^ int(color[1:], 16)), anchor='mm', align='center', stroke_width=2, stroke_fill='#000000'); img.save('Thumbnails/$sentence.jpg'); from PIL import Image; img = Image.open('Thumbnails/$sentence.jpg'); img.save('Thumbnails/$sentence.jpg', optimize=True, dpi=(1280, 720));"

# Check if the directory exists and create it if not with the name of "Records"
if [ ! -d "Records" ]; then
    mkdir "Records"
fi

# Check if there is a file records.md inside the Records directory and create it if not
if [ ! -f "Records/records.md" ]; then
    touch "Records/records.md"
fi

# For every file in the Thumbnails directory, add the filename to the records.md filename line by line with the date and time, hour, minute and second of the creation of the file
for file in Thumbnails/*; do
    echo "$(date +%Y-%m-%d) $(date +%H:%M:%S) - $file" >>Records/records.md
done
