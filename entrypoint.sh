#!/bin/bash

doscan() {
	echo "Port scan started"
	outfile="/srv/www/$(date +%m-%d-%Y_%H:%M:%S).html"
  nmap -oX /tmp/scan.xml --stylesheet /usr/share/nmap/nmap.xsl -p${SCAN_PORTS} $HOST_LIST
	xsltproc /tmp/scan.xml -o $outfile
	echo "Report generated at $outfile"
}

[ $# -lt 1 ] && {
  echo "usage: $0 <host1> <host2>"
	exit 1
}

HOST_LIST=$@
echo "docker-port-scan started with hosts: ${HOST_LIST}"

[ ! -d /srv/www ] && mkdir -p /srv/www 

echo "starting nginx..."
nginx & 

while :; do
  doscan
	sleep $((${SCAN_INTERVAL} * 60))
done
