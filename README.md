# p10k-bluetooth-battery-prompt

Adds Bluetooth Battery prompt to Zsh. The battery percentage is also color coded and can be customisable.

## Introduction

This project adds bluetooth battery prompt to power10k theme.

![App Screenshot](https://github.com/itamizhan/p10k-bluetooth-battery-prompt/blob/main/screenshots/screenshot_01.png)

## Dependencies

This project depends on the following things. You need to install them first.

- [Oh my Zsh](https://github.com/ohmyzsh/ohmyzsh/)
- [Power10K Theme](https://github.com/romkatv/powerlevel10k)

## Getting Started

Make sure Oh My Zsh and Power10K theme are installed.

Run this command to check if Power10K config file exists in ~/.p10k.zsh

```shell
[ -f ~/.p10k.zsh ] && echo "~/.p10k.zsh exists." || echo "~/.p10k.zsh does not exist."
```

# Installation

## 1. Clone the project

```bash
  https://github.com/itamizhan/p10k-bluetooth-battery-prompt.git
```

### 2. Go to the project directory

```bash
  cd p10k-bluetooth-battery-prompt
```

### 3. Run

```bash
 upower --dump | grep -Po 'model:\s+\K.*' | awk '{$1=$1};1'
```

You should see something like this

```bash
  itamizhan's Buds2
```

### 4. Open sample.zsh and replace `device name` from line no.3

```bash
  local device_model="itamizhan's Buds2"
```

### 5.1. Now open ~/.p10k.zsh and search for these lines

```bash
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    .
    .
    .
    # wifi                  # wifi speed
    # example               # example user-defined segment
```

### 5.2. Add the following below `example section`

```bash
    bluetooth_battery       # shows the battery percentage of bluetooth device
```

Now, It should look like this

```bash
    # battery               # internal battery
    # wifi                  # wifi speed
    # example               # example user-defined segment (see prompt_example function below)
    bluetooth_battery       # shows the battery percentage of bluetooth device
  )
```

### 6. Now search `function prompt_example()` and copy paste all the content from sample.zsh below that function

```bash
# Type `p10k help segment` for documentation and a more sophisticated example.
  function prompt_example() {
    p10k segment -f 208 -i '⭐' -t 'hello, %n'
  }

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
            color="%F{33}"  # Color 33
        elif (( percentage_int >= 61 )); then
            color="%F{45}"  # Color 45
        elif (( percentage_int >= 51 )); then
            color="%F{11}"    # Color 11
        elif (( percentage_int >= 41 )); then
            color="%F{93}"  # Color 93
        elif (( percentage_int >= 31 )); then
            color="%F{99}"   # Color 99
        elif (( percentage_int >= 21 )); then
            color="%F{127}"    # Color 127
        elif (( percentage_int >= 11 )); then
            color="%F{202}"     # Color 202
        else
            color="%F{196}"     # Color 196
        fi
  
        # Set the prompt with the battery percentage and color
        p10k segment -f 208 -i '🔋' -t "${color}${percentage_int}%% "
    fi
}

```

### 7. Now, save the file and restart the terminal and that's it.

## 8. Todo.

```[tasklist]
### Todo
- [ ] Change to Hex colors
- [ ] Add Colors Table
- [ ] Custom Colors function

```
