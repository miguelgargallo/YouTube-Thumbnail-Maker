# Check if the imageio library is installed
if ! python -c "import imageio" &> /dev/null; then
  # Install the imageio library
  pip install imageio
else
  # Check if the imageio library is already up to date
  update_available=$(pip freeze | grep imageio | grep -v '^\-e' | cut -d = -f 3 | sed -e 's/\.post[0-9]*//g' | xargs -n1 -I {} pip show {} | grep '^Version:' | cut -d ' ' -f 2 | xargs -n1 -I {} pip check --index-url https://pypi.org/simple {} | grep -E '^(ERROR: |No matching distribution found for )' | wc -l)
  if [ $update_available -eq 0 ]; then
    # The imageio library is already up to date
    echo "The imageio library is already up to date"
  else
    # Update the imageio library
    pip install --upgrade imageio
  fi
fi
