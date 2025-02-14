#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/system_info.sh"
source "$SCRIPT_DIR/ascii.sh"
source "$SCRIPT_DIR/display.sh"
source "$SCRIPT_DIR/../config/config.conf"


user="$USER@$HOSTNAME"
length="${#user}"

main() {
    get_system_info
    load_ascii_art
    
    print_info
}

main