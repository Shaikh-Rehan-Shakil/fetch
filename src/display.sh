print_info() {
    local reset='\033[0m'
    local padding="${PADDING}"
    local ascii_color="\033[1;${ASCII_COLOR}m"
    local value_color="\033[1;${VALUE_COLOR}m"
    local separator_color="\033[1;${SEPARATOR_COLOR}m"

    if [[ "$SHOW_TITLE" == true ]]; then
        local title="${USER}@${HOSTNAME}"
        local underline
        underline=$(printf "%*s" "${#title}" "" | tr ' ' '-')

        if [[ "$SHOW_ASCII" == true ]]; then
            printf " %-${padding}s%s\n" "" "$title"
            printf " %-${padding}s%s\n" "" "$underline"
        else
            printf " %s\n" "$title"
            printf " %s\n" "$underline"
        fi
    fi

    local ascii_count="${#ascii_lines[@]}"
    local sysinfo_count="${#KEYS[@]}"
    local max_lines=0
    if [[ "$SHOW_ASCII" == true ]]; then
        max_lines="$ascii_count"
    else
        max_lines="$sysinfo_count"
    fi

    for ((i = 0; i < max_lines; i++)); do
        if [[ "$SHOW_ASCII" == true ]]; then
            printf "${ascii_color}%-${padding}s${reset}" "${ascii_lines[i]}"
        fi

        if (( i < sysinfo_count )); then
            local key="${KEYS[i]}"
            local value="${SYSTEM_INFO[$key]}"
            local key_color="\033[1;${KEY_COLORS[i % ${#KEY_COLORS[@]}]}m"
            printf " %b%-12s%b%b %b" \
                    "$key_color" "$key" "$reset" \
                   "$separator_color$SEPARATOR$reset" \
                   "$value_color$value$reset"
        fi
        printf "\n"
    done
}
