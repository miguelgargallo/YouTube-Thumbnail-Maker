#!/bin/bash

# Check if the imageio library is installed
if ! python -c "import imageio" &>/dev/null; then
    echo "imageio is not installed"
    exit 1
fi

# Check if pillow is installed
if ! python -c "import PIL" &>/dev/null; then
    echo "Pillow is not installed"
    exit 1
fi

# Check if the directory exists and create it if not with the name of "Youtbe Thumbnails"
if [ ! -d "Thumbnails" ]; then
    mkdir "Thumbnails"
fi

# Ask for the 2 first keywords
read -p "Enter your YouTube 2 keywords: " sentence2words

# Ask for the 3 second keywords
read -p "Enter your YouTube 3 keywords: " sentence3words

# Ask for the 2 last keywords
read -p "Enter your YouTube 2 keywords: " sentence2lastwords

# Ask for the episode number and category
read -p "Enter the episode number: " episode
read -p "Enter the category: " category

# Execute the thumbnails.sh script
./core/thumbnails.sh

# An Image
python -c "from PIL import Image, ImageDraw, ImageFont; import random; img = Image.new('RGB', (1280, 720), color = '#000000'); d = ImageDraw.Draw(img); fnt = ImageFont.truetype('arial.ttf', 136); d.text((640, 180), '$sentence2words', font=fnt, fill='##000000', anchor='mm', align='center', stroke_width=2, stroke_fill='##000000', shadow='##000000', shadow_offset=2); d.text((640, 360), '$sentence3words', font=fnt, fill='##000000', anchor='mm', align='center', stroke_width=2, stroke_fill='##000000', shadow='##000000', shadow_offset=2); d.text((640, 540), '$sentence2lastwords', font=fnt, fill='##000000', anchor='mm', align='center', stroke_width=2, stroke_fill='##000000', shadow='##000000', shadow_offset=2); 

# Add the EP $episode sentence to the bottom left corner of the image
d.text((10, 660), 'EP $episode', font=fnt, fill='##000000', anchor='mm', align='left', stroke_width=2, stroke_fill='##000000', shadow='##000000', shadow_offset=2); 

# Add the category to the top right corner of the image
d.text((1270, 10), '$category', font=fnt, fill='##000000', anchor='mm', align='right', stroke_width=2, stroke_fill='##000000', shadow='##000000', shadow_offset=2); 

# Save the image to the Thumbnails folder with a timestamp and the keywords and category in the filename
img.save('Thumbnails/$(date +%s)_$sentence2words_$sentence3words_$sentence2lastwords_$category.png')"

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

# If there are images on the Thumbnails directory, add the filename to the records.md filename line by line with the date and time, hour, minute and second of the creation of the file, If there is no file in Thumbnails directory, remove all content from the records.md file
if [ "$(ls -A Thumbnails)" ]; then
    for file in Thumbnails/*; do
        echo "$(date +%Y-%m-%d) $(date +%H:%M:%S) - $file" >>Records/records.md
    done
else
    >Records/records.md
fi
