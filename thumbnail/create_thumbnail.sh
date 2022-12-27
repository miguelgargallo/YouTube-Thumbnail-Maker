#!/bin/bash

# Check if Pillow is already installed
if ! python -c "import PIL" &>/dev/null; then
  # Install Pillow if it is not already installed
  pip install Pillow --user
fi

# Create a blank image with the desired resolution
python -c "from PIL import Image; thumbnail = Image.new('RGB', (1280, 720), (255, 255, 255)); thumbnail.save('thumbnail.jpg')"

# Set the font and font size for the title
title_font="arial.ttf"
title_font_size=36

# Measure the size of the title text
title_text_size=$(python -c "from PIL import Image, ImageDraw, ImageFont; import textwrap; title='$1'; font=ImageFont.truetype('$title_font', $title_font_size); bbox=font.getbbox(title); print(bbox[2], bbox[3])")
title_text_width=$(echo $title_text_size | cut -d' ' -f1)
title_text_height=$(echo $title_text_size | cut -d' ' -f2)

# Calculate the x and y coordinates to center the title on the image
title_x=$(((1280 - $title_text_width) / 2))
title_y=$(((720 - $title_text_height) / 2))

# Draw the title on the image
python -c "from PIL import Image, ImageDraw, ImageFont; import textwrap; title='$1'; font=ImageFont.truetype('$title_font', $title_font_size); image=Image.open('thumbnail.jpg'); draw=ImageDraw.Draw(image); draw.text(($title_x,$title_y), title, font=font, fill=(0, 0, 0)); image.save('thumbnail.jpg')"

# Draw the squares on the image
for i in {0..3}; do
  x=$((i * 320))
  y=0
  python -c "from PIL import Image, ImageDraw; image=Image.open('thumbnail.jpg'); draw=ImageDraw.Draw(image); draw.rectangle(($x,$y,$((x + 320)),$((y + 180))), fill=(255, 0, 0)); image.save('thumbnail.jpg')"
done
