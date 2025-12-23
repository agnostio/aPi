#!/bin/bash
cpu=$(</sys/class/thermal/thermal_zone0/temp)
gpu_temp="$(sudo vcgencmd measure_temp | grep  -o -E '[[:digit:]].*')"
printf "CPU: %s\n" "$((cpu/1000))°C"
printf "GPU: %s\n" "$gpu_temp"