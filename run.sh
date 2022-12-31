#!/bin/bash

# Assign permissions to the scripts, check if dependencies are installed and install them if not
chmod +x ./core/dependencies.sh && chmod +x ./core/records.sh && ./core/dependencies.sh

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
python -c "from PIL import Image, ImageDraw, ImageFont; import random; img = Image.new('RGB', (1280, 720), color = '#000000'); d = ImageDraw.Draw(img); fnt = ImageFont.truetype('arial.ttf', 136); d.text((640, 180), '$sentence2words', font=fnt, fill='#HEX_COLOR_PICKER_ZONE', anchor='mm', align='center', stroke_width=2, stroke_fill='#HEX_COLOR_PICKER_ZONE', shadow='#HEX_COLOR_PICKER_ZONE', shadow_offset=2); d.text((640, 360), '$sentence3words', font=fnt, fill='#HEX_COLOR_PICKER_ZONE', anchor='mm', align='center', stroke_width=2, stroke_fill='#HEX_COLOR_PICKER_ZONE', shadow='#HEX_COLOR_PICKER_ZONE', shadow_offset=2); d.text((640, 540), '$sentence2lastwords', font=fnt, fill='#HEX_COLOR_PICKER_ZONE', anchor='mm', align='center', stroke_width=2, stroke_fill='#HEX_COLOR_PICKER_ZONE', shadow='#HEX_COLOR_PICKER_ZONE', shadow_offset=2); 

# Add the EP $episode sentence to the bottom left corner of the image
d.text((10, 660), 'EP $episode', font=fnt, fill='#HEX_COLOR_PICKER_ZONE', anchor='mm', align='left', stroke_width=2, stroke_fill='#HEX_COLOR_PICKER_ZONE', shadow='#HEX_COLOR_PICKER_ZONE', shadow_offset=2); 

# Add the category to the top right corner of the image
d.text((1270, 10), '$category', font=fnt, fill='#HEX_COLOR_PICKER_ZONE', anchor='mm', align='right', stroke_width=2, stroke_fill='#HEX_COLOR_PICKER_ZONE', shadow='#HEX_COLOR_PICKER_ZONE', shadow_offset=2); 

# Save the image to the Thumbnails folder with a timestamp and the keywords and category in the filename
img.save('Thumbnails/$(date +%s)_$sentence2words_$sentence3words_$sentence2lastwords_$category.png')"

# Execute the records.sh script
./core/records.sh
