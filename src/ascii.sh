#!/bin/bash

load_ascii_art() {
    ascii_lines=()

    # Use user-specified ASCII art name if set; otherwise default to SYSTEM_INFO[ID]
    local art_name="${ASCII_ART:-${SYSTEM_INFO[ID]}}"
    local art_file="../art/distros/ascii/${art_name}.txt"

    if [[ ! -f "$art_file" ]]; then
        echo "ASCII art file not found: $art_file" >&2
        return 1
    fi

    while IFS= read -r line; do
        ascii_lines+=("$line")
    done < "$art_file"
}
