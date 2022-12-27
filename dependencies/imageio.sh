# Check if the imageio library is installed
if ! python -c "import imageio" &> /dev/null; then
    echo "imageio is not installed"
    exit 1
fi
