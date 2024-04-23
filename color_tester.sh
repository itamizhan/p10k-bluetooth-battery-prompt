#!/bin/bash

# Calculate the number of columns based on terminal width
columns=$(tput cols)
block_width=13  # Width of each color block, including spaces
num_columns=$((columns / block_width))  # Calculate number of columns

# Increase the number of columns by one
((num_columns++))

print_color() {
    local color_code="$1"
    local color_name="$2"

    # Print color code and color name
    printf "\033[38;5;${color_code}m%-9s\033[0m %3s %s \t" "█████████" "$color_code" "$color_name"
}

# Print header
echo "Color Code   Color Name"
echo "-----------  ---------------------"

# Loop through all 256 colors, printing each color
for ((row = 0; row < 256 / num_columns; row++)); do
    for ((col = 0; col < num_columns; col++)); do
        index=$((row + col * (256 / num_columns)))
        if [ $index -lt 256 ]; then
            print_color $index " "
        fi
    done
    echo ""
done
