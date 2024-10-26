#!/data/data/com.termux/files/usr/bin/bash

echo "Available color schemes:"
ls -1 ~/.termux/colors/ | sed 's/\.properties$//' | nl

echo "Enter the theme no: (default=1)"
read input

if [ -z "$input" ]; then
  input=1
fi

theme_file=$(ls ~/.termux/colors/ | sed 's/\.properties$//' | sed -n "${input}p")

if [ -n "$theme_file" ]; then
  cp ~/.termux/colors/"$theme_file.properties" ~/.termux/colors.properties
  termux-reload-settings
  echo "Color scheme set to $theme_file."
else
  echo "Invalid theme number."
fi
