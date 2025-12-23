#!/bin/bash
sudo echo ""
echo ""
echo "_________________________________________________"
cat /proc/cpuinfo | grep Model
echo "_________________________________________________"
echo ""
echo ""
cpuFreq=$(sudo vcgencmd measure_clock arm | cut -d= -f2 | bc | awk '{printf "%.2f GHz\n", $1/1000000000}')
cpuClockSetTo=$(sudo vcgencmd get_config arm_freq)
cpuClockedAt=$(sudo vcgencmd measure_clock arm)
volts=$(sudo vcgencmd get_config over_voltage)
echo "__________________________"
echo "CPU:"
echo "__________________________"
echo ""
coreCount=$(grep -c ^processor /proc/cpuinfo)
echo "     $coreCount core(s)"
echo "     $cpuClockSetTo"
echo "     $volts"
echo "        current:"
echo "            $cpuFreq"
echo "            $cpuClockedAt"
VOLTAGE_OUTPUT=$(sudo vcgencmd measure_volts core)
echo "            $VOLTAGE_OUTPUT"
gpuFreq=$(sudo vcgencmd measure_clock core | awk -F= '{printf "%.0f MHz\n", $2/1000000}')
echo ""
echo "__________________________"
echo "GPU:"
echo "__________________________"
gpuMem=$(sudo vcgencmd get_mem gpu)
echo ""
echo "    $gpuMem"
echo "    $gpuFreq"
echo ""
echo "__________________________"
echo "RAM:"
echo "__________________________"
free -h
echo ""
echo "_________________________________________________"
echo ""