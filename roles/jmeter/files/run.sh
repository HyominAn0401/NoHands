#!/bin/bash
export HEAP="-Xms128m -Xmx256m"

# report 디렉터리 있으면 삭제
[ -d /opt/jmeter/report ] && rm -rf /opt/jmeter/report

/opt/jmeter/bin/jmeter -n \
  -t /opt/jmeter/noHands.jmx \
  -l /opt/jmeter/result.jtl \
  -e -o /opt/jmeter/report
