#!/bin/bash

### Cool SVG tweaks

# Increase viewbox height/widht
for input in `ls -tr D-PlotClad-SVG*`; do
sed \
's/height="432pt" version="1.1" viewBox="0 0 576 432" width="576pt/height="832pt" version="1.1" viewBox="0 0 576 832" width="576pt/g' \
$input > edit-${input};
done

# Switch colors
#change green to blue
sed -i 's/#008000/#0000FF/g' *.svg

#colors:
#green=#008000;#red=#ff0000;#blue=#0000FF;#purple=#800080;#white=#ffffff;#yellow=#bfbf00

# Convert SVG to PDF
for input in `ls -tr edit-D*`; do
rsvg-convert -f pdf -o ${input}.pdf $input;
done
