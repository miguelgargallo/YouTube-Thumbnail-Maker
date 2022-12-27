#!/bin/bash
chmod +x ./run.sh

# Assign permissions to the scripts, check if dependencies are installed and install them if not
chmod +x ./core/dependencies.sh && chmod +x ./core/records.sh && ./core/dependencies.sh

# Ask the user for a sentence
read -p "Enter your YouTube 5 keywords: " sentence

# Execute the thumbnails.sh script
./core/thumbnails.sh

# Create an image png format of: 1280x720 pixels, 144 dpi and the $sentence variable in the center of the thumbnail in arial font, size 136, color random light pastel color and background color complementary color in 0.45 opacity, text with shadow, in high quality, save for the web colors
python -c "from PIL import Image, ImageDraw, ImageFont; import random; img = Image.new('RGB', (1280, 720), color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))); d = ImageDraw.Draw(img); fnt = ImageFont.truetype('arial.ttf', 136); d.text((640, 360), '$sentence', font=fnt, fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), anchor='mm', align='center', stroke_width=2, stroke_fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow_offset=2); img.save('Thumbnails/$(date +%Y-%m-%d-%H-%M-%S)-$sentence.png', dpi=(144, 144), quality=95, optimize=True, progressive=True, colors=256)"

# Run the records.sh script
./core/records.sh
