#!/bin/bash

# top 10 most used applications
apps(){
    echo "Top 10 most used Applications (by CPU and  memory):"
    ps -eo pid,comm,%mem,%cpu --sort=-%mem | head  -n 11
    echo ""
}

# Network
network(){
    echo "Network Monitoring:"
    echo "Concurrent  Connections:"
    ss -tuna | grep ESTAB | wc -l
    echo "Packet Drops:"
    netstat  -i | grep -v Kernel | awk '{print $1, $3}'
    echo "Data Transfer (MB In/Out):"
    ip a s | grep -E 'RX packets|TX packets' | awk '{print $5}' | paste - - | awk '{print $1/1048576, $2/1048576}'
    echo "" 
}

#Disk Usage
disk(){
    echo "Disk Usage:"
    df -h --output=source,pcent,target | grep -v 'Use%' | awk '{pirnt $1,$2,$3}'
    echo "Partitions using more than 80%:"
    df -h | awk '$5 > 80 {print $0}'
    echo ""
}

# System load
system(){
    echo "System Load:"
    uptime
    echo "CPU Usage Breakdown:"
    mpstat | grep all
    echo ""
}

#Memory usage
memory(){
    echo "Memory Usage:"
    free -h
    ehco "Swap Usage:"
    swapon --show
    ehco ""
}

#Monitor processes
processes(){
    echo "Processes Monitoring:"
    ps aux | wc -l | awk '{print $1 " acrive proccesses."}'
    echo "Top 5 processes by CPU and Memory Usage:"
    ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -n 6
    echo ""
}

#Essential Services
services() {
    echo "Service Monitoring:"
    for Service in sshd nginx apache2 iptables; do 
        systemctl is-active --quiet $services && echo "$service is running" || echo "$sevice is NOT running"
    done
    ehco ""
}

while [ "$1" != ""]; do
    case $1 in
        -cpu) system;;
        -memory) memory;;
        -network) network;;
        -disk) disk;;
        -apps) apps;;
        -process) proccesses;;
        -service) service;;
        *) echo "Invaild option.  USe -cpu, -memory, -network, -disk, -apps, -process, or -service." ;;
    esac
    shift
done

if [ "$#" -eq 0 ]; then
    apps
    network
    disk
    system
    memory
    proccesses
    service
fi