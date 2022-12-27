# Check if pillow is installed
if ! python -c "import PIL" &> /dev/null; then
    echo "Pillow is not installed"
    exit 1
fi