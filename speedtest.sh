#!/usr/bin/env bash

speed_test() {
    local nodeName="$2"
    [ -z "$1" ] && ./speedtest-cli/speedtest --progress=no --accept-license --accept-gdpr > ./speedtest-cli/speedtest.log 2>&1 || \
    ./speedtest-cli/speedtest --progress=no --server-id=$1 --accept-license --accept-gdpr > ./speedtest-cli/speedtest.log 2>&1
    if [ $? -eq 0 ]; then
        local dl_speed=$(awk '/Download/{print $3" "$4}' ./speedtest-cli/speedtest.log)
        local up_speed=$(awk '/Upload/{print $3" "$4}' ./speedtest-cli/speedtest.log)
        local latency=$(awk '/Latency/{print $3" "$4}' ./speedtest-cli/speedtest.log)
        if [[ -n "${dl_speed}" && -n "${up_speed}" && -n "${latency}" ]]; then
            printf "\033[1;36m%-18s\033[1;32m%-18s\033[1;31m%-20s\033[1;33m%-12s\033[0m\n" " ${nodeName}" "${up_speed}" "${dl_speed}" "${latency}"
        fi
    fi
}

speed() {
    speed_test '21569'  'Tokyo'
    speed_test '22126'  'Hong Kong'
    speed_test '40508'  'Singapore'
    speed_test '21541'  'Los Angeles, CA'
    speed_test '43263'  'Newark, NJ'
}

mkdir -p /root/speedtest-cli && curl -sLo /root/speedtest-cli/speedtest https://github.com/chika0801/tool/raw/main/speedtest && chmod +x /root/speedtest-cli/speedtest
clear && printf "%-18s%-18s%-20s%-12s\n" " Node Name" "Upload Speed" "Download Speed" "Latency"
speed && rm -r speedtest-cli && rm -r /root/.config/ookla
