#!/bin/bash
chmod +x ./run.sh

# Assign permissions to the scripts, check if dependencies are installed and install them if not
chmod +x ./core/dependencies.sh && chmod +x ./core/records.sh && ./core/dependencies.sh

# Ask for the 2 first keywords
read -p "Enter your YouTube 2 keywords: " sentence2words

# Ask for the 3 second keywords
read -p "Enter your YouTube 3 keywords: " sentence3words

# Ask for the 2 last keywords
read -p "Enter your YouTube 2 keywords: " sentence2lastwords

# Execute the thumbnails.sh script
./core/thumbnails.sh

# Create an image with the text $sentence2words, $sentence3words and $sentence2lastwords with the same font and color: #000000 and the same background color: #FFFFFF and save it in the folder ./core/images
python -c "from PIL import Image, ImageDraw, ImageFont; import random; img = Image.new('RGB', (1280, 720), color = (random.randint(0, 0), random.randint(0, 0), random.randint(0, 0))); d = ImageDraw.Draw(img); fnt = ImageFont.truetype('arial.ttf', 136); d.text((640, 180), '$sentence2words', font=fnt, fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), anchor='mm', align='center', stroke_width=2, stroke_fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow_offset=2); d.text((640, 360), '$sentence3words', font=fnt, fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), anchor='mm', align='center', stroke_width=2, stroke_fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow_offset=2); d.text((640, 540), '$sentence2lastwords', font=fnt, fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), anchor='mm', align='center', stroke_width=2, stroke_fill=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)), shadow_offset=2); img.save('Thumbnails/$(date +%Y-%m-%d-%H-%M-%S)-$sentence2words-$sentence3words-$sentence2lastwords.png', dpi=(144, 144), quality=100, optimize=True, progressive=True, colors=256)"

# Run the records.sh script
./core/records.sh
