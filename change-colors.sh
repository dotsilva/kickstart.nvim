#!/usr/bin/env bash

theme=(
	alacritty.toml
	keyboard.rgb
	kitty.conf
	btop.theme
	chromium.theme
	mako.ini
	colors.toml
	README.md
	ghostty.conf
	swayosd.css
	hyprland.conf
	walker.css
	hyprlock.conf
	waybar.css
)

# if in need to do more than one string override, just copy the following block and paste it after with the needed string
# this is probably not the clever approach,  but its a simple enough one and IT WILL WORK
for file in "${theme[@]}"; do
	sed 's/2a2a2a/303030/g' $file >2-$file
	mv 2-$file $file
done
