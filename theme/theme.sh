#!/bin/bash

# Theme switcher script
# Usage: ./theme [theme_name]

THEMES=(
    "dark"
    "light" 
    "ocean"
    "forest"
    "sunset"
    "midnight"
    "dawn"
    "twilight"
    "monokai"
    "dracula"
    "nord"
    "gruvbox"
)

show_themes() {
    echo "Available themes:"
    for i in "${!THEMES[@]}"; do
        echo "  ${THEMES[$i]}"
    done
}

switch_theme() {
    local theme="$1"
    
    # Check if theme exists
    if [[ ! " ${THEMES[@]} " =~ " ${theme} " ]]; then
        echo "Error: Theme '$theme' not found"
        echo "Available themes: ${THEMES[*]}"
        exit 1
    fi
    
    # Create theme directory if it doesn't exist
    mkdir -p ~/.config/themes
    
    # Save current theme
    echo "$theme" > ~/.config/themes/current_theme
    
    # Apply theme based on terminal type
    case "$TERM" in
        *xterm*|*rxvt*|*screen*)
            # Basic ANSI color changes
            case "$theme" in
                "dark")
                    echo -e "\033]10;#ffffff\007\033]11;#000000\007"
                    ;;
                "light")
                    echo -e "\033]10;#000000\007\033]11;#ffffff\007"
                    ;;
                "ocean")
                    echo -e "\033]10;#e0f2fe\007\033]11;#0c4a6e\007"
                    ;;
                "forest")
                    echo -e "\033]10;#dcfce7\007\033]11;#14532d\007"
                    ;;
                "sunset")
                    echo -e "\033]10;#fef3c7\007\033]11;#7c2d12\007"
                    ;;
                "midnight")
                    echo -e "\033]10;#e2e8f0\007\033]11;#0f172a\007"
                    ;;
                "dawn")
                    echo -e "\033]10;#1e293b\007\033]11;#fef3c7\007"
                    ;;
                "twilight")
                    echo -e "\033]10;#f1f5f9\007\033]11;#1e293b\007"
                    ;;
                "monokai")
                    echo -e "\033]10;#f8f8f2\007\033]11;#272822\007"
                    ;;
                "dracula")
                    echo -e "\033]10;#f8f8f2\007\033]11;#282a36\007"
                    ;;
                "nord")
                    echo -e "\033]10;#d8dee9\007\033]11;#2e3440\007"
                    ;;
                "gruvbox")
                    echo -e "\033]10;#ebdbb2\007\033]11;#282828\007"
                    ;;
            esac
            ;;
        *)
            echo "Theme switched to: $theme"
            echo "Note: Full theme application may require terminal restart"
            ;;
    esac
    
    echo "Theme changed to: $theme"
}

# Main logic
if [ $# -eq 0 ]; then
    show_themes
elif [ $# -eq 1 ]; then
    switch_theme "$1"
else
    echo "Usage: $0 [theme_name]"
    echo "Use no arguments to list available themes"
    exit 1
fi