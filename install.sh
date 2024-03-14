#!/data/data/com.termux/files/usr/bin/bash

# Setting up storage and updating installing the git and zsh packages
termux-setup-storage
apt update
apt install -y git zsh

# Cloning the git repo and moving .termux to $HOME/.termux
git clone https://github.com/Srinath10X/termux-setup.git "$HOME/termux-setup" --depth 1
mv "$HOME/.termux" "$HOME/.termux.backup"
cp -R "$HOME/termux-setup/.termux" "$HOME/.termux"

git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="robbyrussell"' "$HOME/.zshrc"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
chsh -s zsh
echo "Oh-my-zsh and some additional colorschemes are installed. Please restart Termux app..."
termux-reload-settings

cd ~/../usr/etc/
echo -n > motd
echo "Removed the login screen message from the Termux app..."

curl -o pfetch https://github.com/dylanaraps/pfetch/raw/master/pfetch
chmod +x pfetch 
mv pfetch /data/data/com.termux/files/usr/bin/
echo "pfetch" >> "$HOME/.zshrc"
echo "Installed pfetch"

echo "Restart Termux app..."
exit
