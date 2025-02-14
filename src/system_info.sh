#!/bin/bash

declare -A SYSTEM_INFO

get_system_info() {
    SYSTEM_INFO['OS']="$(uname -o)"
    SYSTEM_INFO['DISTRO']="$(cat /etc/os-release | grep "PRETTY_NAME" | awk -F '"' '{print $2}')"
    SYSTEM_INFO['ID']="$(cat /etc/os-release | grep -w "ID" | awk -F '=' '{print $2}')"
    SYSTEM_INFO['KERNEL']="$(uname -r)"
    SYSTEM_INFO['CPU']="$(grep 'model name' /proc/cpuinfo | head -1 | awk -F ': ' '{print $2}')"
    SYSTEM_INFO['UPTIME']="$(uptime -p)"
    SYSTEM_INFO['RAM_USAGE']="$(free -b | awk '/Mem:/ {printf "%.1fGiB / %.1fGiB (%.1f%%)\n", $3/1024/1024/1024, $2/1024/1024/1024, $3/$2*100}')"
    SYSTEM_INFO['IP']="$(ip addr | awk '/inet / && !/127.0.0.1/ {print $2}')"
}

