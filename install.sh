#!/data/data/com.termux/files/usr/bin/bash

# Function to display a message
echo_message() {
    echo -e "\n$1\n"
}

# Function to setup storage and install packages
setup_storage_and_install_packages() {
    termux-setup-storage
    apt update && apt install -y git zsh wget 
}

# Function to clone the git repository and setup .termux configuration
setup_termux_configuration() {
    git clone https://github.com/Srinath10X/termux-setup.git "$HOME/termux-setup" --depth 1

    # Backup existing .termux if it exists
    [ -d "$HOME/.termux" ] && mv "$HOME/.termux" "$HOME/.termux.backup"

    # Copy new .termux configuration
    cp -R "$HOME/termux-setup/.termux" "$HOME/.termux"
}

# Function to setup oh-my-zsh
setup_oh_my_zsh() {
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1

    # Backup existing .zshrc if it exists
    [ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.backup"

    # Copy oh-my-zsh template and set theme
    cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
    sed -i '1iZSH_THEME="robbyrussell"' "$HOME/.zshrc"

    # Install zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
    echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

    # Change the default shell to zsh
    chsh -s zsh
}

# Function to remove the login screen message
remove_login_message() {
    echo -n > "$PREFIX/etc/motd"
    echo_message "Removed the login screen message from the Termux app..."
}

# Function to install pfetch
install_pfetch() {
    wget -O "$PREFIX/bin/pfetch" https://github.com/dylanaraps/pfetch/raw/master/pfetch
    chmod +x "$PREFIX/bin/pfetch"

    # Add pfetch to.zshrc with custom env vars
    echo 'export USER="user"' >> "$HOME/.zshrc"
    echo 'export HOSTNAME="termux"' >> "$HOME/.zshrc"
    echo 'export PF_INFO="ascii title os host pkgs shell memory"' >> "$HOME/.zshrc"
    echo 'pfetch' >> "$HOME/.zshrc"
    echo_message "Installed pfetch"
}

main() {
    setup_storage_and_install_packages
    setup_termux_configuration
    setup_oh_my_zsh
    termux-reload-settings
    echo_message "Oh-my-zsh and some additional color schemes are installed."
    remove_login_message
    install_pfetch
    echo_message "Restart the Termux app..."
    exit
}

main

