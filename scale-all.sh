#!/bin/bash

for IMG in images/*; do
	w=`identify -ping -format %w "$IMG"`
	if (( $w > 1920 )); then
		echo "$w Resizing $IMG"
		mogrify -resize 1920x "$IMG"
	fi
done
