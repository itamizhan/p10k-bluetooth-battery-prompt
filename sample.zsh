# Created by Tamizhan
  function prompt_bluetooth_battery() {
    # Define the device model
    local device_model="Vimal's Buds2"
    
    # Check if the device is connected
    if upower --dump | grep -q "$device_model"; then
        # Run upower --dump command and grep for the device model
        local output=$(upower --dump | grep -A 8 "$device_model")
        
        # Extract the battery percentage value
        local percentage=$(echo "$output" | grep "percentage:" | awk '{print $2}')
        
        # Convert percentage to integer
        local percentage_int=${percentage%\%}
     
        # Set the color based on battery percentage range
        local color=""
        if (( percentage_int >= 91 )); then
            color="%F{46}"   # Color 46
        elif (( percentage_int >= 81 )); then
            color="%F{10}"    # Color 10
        elif (( percentage_int >= 71 )); then
            color="%F{11}"  # Color 33
        elif (( percentage_int >= 61 )); then
            color="%F{45}"  # Color 45
        elif (( percentage_int >= 51 )); then
            color="%F{33}"    # Color 11
        elif (( percentage_int >= 41 )); then
            color="%F{99}"  # Color 93
        elif (( percentage_int >= 31 )); then
            color="%F{93}"   # Color 99
        elif (( percentage_int >= 21 )); then
            color="%F{127}"    # Color 127
        elif (( percentage_int >= 11 )); then
            color="%F{202}"     # Color 202
        else
            color="%F{196}"     # Color 196
        fi
        
        # Set the prompt with the battery percentage and color
        p10k segment -f 208 -i '🔋' -t "${color}${percentage}%"
    fi
}