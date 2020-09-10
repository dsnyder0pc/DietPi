#!/bin/bash
################################################################################
#
#  roon-rt.sh
#
#  Install in /var/lib/dietpi/postboot.d. For example:
#
#    cd /var/lib/dietpi/postboot.d && curl -LO ws-e.com/roon-rt.sh
#    chmod +x roon-rt.sh
#    ./roon-rt.sh
#
################################################################################

tries=5
until [ -n "${PID}" ]; do
  echo "Looking for RAATServer.exe"
  PID=$(pgrep -f RAATServer.exe)
  sleep 1
  tries=$((tries-1))
  [ "${tries}" -le 0 ] && exit 1
done
renice --priority -20 --pid "${PID}"
chrt --rr --pid 99 "${PID}"
chrt --pid "${PID}"
