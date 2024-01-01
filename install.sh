#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage
apt update
apt install -y git zsh
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
echo "Restart Termux app..."
cd ~/../usr/etc/
echo -n > motd
wget -O - https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch ~/../usr/bin/
cd ~
echo "pfetch" >> "$HOME/.zshrc"
echo "Removed the login screen message from the Termux app..."
exit
