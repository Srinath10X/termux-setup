#!/data/data/com.termux/files/usr/bin/bash

# Function to display a message
function echo_message() {
    echo -e "\n$1\n"
}

# Setup storage and update/install packages
termux-setup-storage
apt update && apt install -y git zsh wget 

# Clone the git repo and setup .termux configuration
git clone https://github.com/Srinath10X/termux-setup.git "$HOME/termux-setup" --depth 1

# Backup existing .termux if it exists
[ -d "$HOME/.termux" ] && mv "$HOME/.termux" "$HOME/.termux.backup"

# Copy new .termux configuration
cp -R "$HOME/termux-setup/.termux" "$HOME/.termux"

# Setup oh-my-zsh
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

termux-reload-settings
echo_message "Oh-my-zsh and some additional color schemes are installed."

# Remove the login screen message from the Termux app
echo -n > "$PREFIX/etc/motd"
echo_message "Removed the login screen message from the Termux app..."

# Download and install pfetch
wget -O "$PREFIX/bin/pfetch" https://github.com/dylanaraps/pfetch/raw/master/pfetch
chmod +x "$PREFIX/bin/pfetch"

# Add pfetch to .zshrc
echo "pfetch" >> "$HOME/.zshrc"

echo_message "Installed pfetch"

echo_message "Restart the Termux app..."
exit
