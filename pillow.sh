# check if required libraries are installed
pip freeze | grep pillow > /dev/null
if [ $? -ne 0 ]; then
  echo "Pillow library not found. Installing..."
  pip install pillow
else
  echo "Pillow library found."
fi