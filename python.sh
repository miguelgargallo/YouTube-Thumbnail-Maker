# Check if Python is installed
if ! [ -x "$(command -v python)" ]; then
    # Install Python
    echo 'Error: Python is not installed.' >&2
    exit 1
else
    # Check if Python is already up to date
    update_available=$(pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip check 2>&1 | grep -E '^(ERROR: |No matching distribution found for )' | wc -l)
    if [ $update_available -eq 0 ]; then
        # Python is already up to date
        echo "Python is already up to date"
    else
        # Update Python packages
        pip install --upgrade $(pip freeze --local | grep -v '^\-e' | cut -d = -f 1)
    fi
fi