# docker-port-scan

Docker image build providing regular port scan reports via a web interface

## Quickstart

To start a port-scan container, simply run:

```bash
docker run -d -p 80:80 vektorlab/port-scan <host> <host>
```

Providing the hostname(s) or IP(s) of the hosts you'd like to scan. Navigate to http://localhost/ and you'll see a timestamped html report of the initial scan show up upon completion.


## Configuration

### Frequency
By default, scans will be run once every 1440 minutes(24h). To change the frequency of scans, set `SCAN_INTERVAL` environment variable to a number of minutes to wait between scan.

### Ports
Ports 1-1024 are scanned by default. This can be changed via the `SCAN_PORTS` environment variable. (e.g 22,80 or 1-1024)
