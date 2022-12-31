# Make a bash script to choose between run.sh a random color YouTube Thumbnail Maker, or run christmas red black sh, a Christmas themed YouTube Thumbnail Maker with red and black colors or a third option, run.sh a random color YouTube Thumbnail Maker with a white background and red text.

# chmod +x play.sh
# chmod +x run.sh
# chmod +x run_christmas_red_black.sh
# chmod +x run_christmas_red_white.sh
# chmod +x core/dependencies.sh
# chmod +x core/records.sh
# chmod +x core/thumbnails.sh

#!/bin/bash
echo "Choose between run.sh a random color YouTube Thumbnail Maker, or run christmas red black sh, a Christmas themed YouTube Thumbnail Maker with red and black colors or a third option, run.sh a random color YouTube Thumbnail Maker with a white background and red text."
echo "Type 1 for run random color YouTube Thumbnail Maker"
echo "Type 2 for run christmas red black themed"
echo "Type 3 for run christmas red white themed"

read -p "Choose 1, 2, or 3: " choice
case "$choice" in
1) ./run.sh ;;
2) ./run_christmas_red_black.sh ;;
3) ./run_christmas_red_white.sh ;;
*) echo "Invalid option $REPLY" ;;
esac
