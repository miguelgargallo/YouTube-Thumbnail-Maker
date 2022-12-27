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
