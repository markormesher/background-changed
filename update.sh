#!/bin/bash

cd /path/to/this/script

# pick a random image and quote
IMG=`ls images | shuf | head -n 1`
QUOTE=`cat quotes.txt | shuf | head -n 1 | sed -e 's@\/\/@\n@g'`

# create overlay image
convert -background "rgba(0, 0, 0, 0)" -fill "rgba(255, 255, 255, 1.0)" -gravity Center -font "Lato-Light" -pointsize 42 -size 1000x -border 20 -bordercolor "rgba(0, 0, 0, 0.45)" caption:"$QUOTE" .quote.png

# create background image
convert -gravity center -composite "images/$IMG" .quote.png .bg.png

# set background
gsettings set org.gnome.desktop.background picture-uri "file:///path/to/this/script/.bg.png"
