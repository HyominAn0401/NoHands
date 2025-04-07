#!/bin/bash
export HEAP="-Xms128m -Xmx256m"

[ -f /opt/jmeter/result.jtl ] && rm -f /opt/jmeter/result.jtl
[ -d /opt/jmeter/report ] && rm -rf /opt/jmeter/report

/opt/jmeter/bin/jmeter -n \
  -t /opt/jmeter/noHands.jmx \
  -l /opt/jmeter/result.jtl \
  -e -o /opt/jmeter/report
