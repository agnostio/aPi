#!/bin/bash
NMAP_RESULTS=$(sudo nmap -sn 192.168.50.0/24)
echo "$NMAP_RESULTS" | grep cm4
echo "$NMAP_RESULTS" | grep cm5
echo "$NMAP_RESULTS" | grep psV1
echo "$NMAP_RESULTS" | grep hole