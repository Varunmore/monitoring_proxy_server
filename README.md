# System Resource Monitoring Script

## Overview
This Bash script monitors various system resources, providing real-time insights in a dashboard format. It can monitor CPU usage, memory, disk usage, network connections, and essential services, and it supports command-line switches to view specific parts of the dashboard.

## Features
- **Top 10 Most Used Applications:** Shows top 10 applications by CPU and memory usage.
- **Network Monitoring:** Tracks concurrent connections, packet drops, and data transfer.
- **Disk Usage:** Displays disk space usage and highlights partitions with over 80% usage.
- **System Load:** Shows the current load average and CPU usage breakdown.
- **Memory Usage:** Displays total, used, and free memory, including swap usage.
- **Process Monitoring:** Displays active processes and the top 5 by CPU and memory usage.
- **Service Monitoring:** Monitors essential services like `sshd`, `nginx/apache`, `iptables`.
- **Custom Dashboard:** Supports command-line switches for specific monitoring tasks.

## Usage

Run the script without any switches to see all monitoring sections:
```bash
./monitor.sh
```

You can use the following switches to view specific sections:

- `-cpu`: View system load and CPU usage breakdown.
- `-memory`: View memory usage.
- `-network`: View network monitoring details.
- `-disk`: View disk usage.
- `-apps`: View top 10 most used applications.
- `-process`: View process monitoring details.
- `-services`: View essential service status.

Example:
```bash
./monitor.sh -cpu
```

## Installation
1.Make the script executable:
```bash
  chmod +x monitor.sh
```

2. Run the script:
```bash
./monitor.sh
```

