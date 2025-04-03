#!/bin/bash
/opt/jmeter/bin/jmeter -n \
  -t /opt/jmeter/noHands.jmx \
  -l /opt/jmeter/result.jtl \
  -e -o /opt/jmeter/report
