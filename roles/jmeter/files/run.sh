#!/bin/bash

# default: scenario1
# ./run.sh 또는 ./run.sh scenario2
SCENARIO=${1:-scenario1}
REGION="ap-northeast-2"

export HEAP="-Xms128m -Xmx256m"

# 기존 결과 제거
[ -f /opt/jmeter/result.jtl ] && rm -f /opt/jmeter/result.jtl
[ -d /opt/jmeter/report ] && rm -rf /opt/jmeter/report

# LoadTest 시작 메트릭 전송
aws cloudwatch put-metric-data \
  --namespace "NoHands/LoadTest" \
  --metric-name "LoadTestActive" \
  --value 1 \
  --dimensions Scenario=$SCENARIO \
  --region $REGION

/opt/jmeter/bin/jmeter -n \
  -t /opt/jmeter/noHands.jmx \
  -l /opt/jmeter/result.jtl \
  -e -o /opt/jmeter/report

# LoadTest 종료 메트릭 전송
aws cloudwatch put-metric-data \
  --namespace "NoHands/LoadTest" \
  --metric-name "LoadTestActive" \
  --value 0 \
  --dimensions Scenario=$SCENARIO \
  --region $REGION
