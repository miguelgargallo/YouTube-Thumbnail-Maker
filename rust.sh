# Check if Rust is installed
if ! [ -x "$(command -v cargo)" ]; then
    # Install Rust
    curl https://sh.rustup.rs -sSf | sh
else
    # Check if Rust is already up to date
    update_available=$(rustup show | grep 'update available' | wc -l)
    if [ $update_available -eq 0 ]; then
        # Rust is already up to date
        echo "Rust is already up to date"
    else
        # Update Rust
        rustup update
    fi
fi
