#!/bin/bash

print_color() {
    local color_code="$1"
    local color_name="$2"

    # Print color code and color name
    echo -ne "\033[38;5;${color_code}m███\033[0m $color_code $color_name \t"
}

# Print header
echo "Color Code   Color Name"
echo "-----------  ---------------------"

# Loop through all 256 colors
for ((color_code = 0; color_code < 256; color_code++)); do
    print_color $color_code " "
    if [ $((($color_code + 1) % 2)) -eq 0 ]; then
        echo ""
    fi
done
