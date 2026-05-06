# 🏗️ Week 2 Architecture Diagram  

```text
                    Attacker / Internal Tester
                              |
                    SSH (2222) / Telnet (2223)
                              |
                              v
         +------------------------------------------+
         | Fake Healthcare IoT Device               |
         |------------------------------------------|
         | CareFusion Patient Monitor               |
         | Hostname: patient-monitor-03             |
         | Fake users: root / admin / nurse         |
         +------------------------------------------+
                              |
                              v
         +------------------------------------------+
         | Cowrie Honeypot                          |
         |------------------------------------------|
         | - Captures SSH/Telnet sessions           |
         | - Records failed logins                  |
         | - Records successful logins              |
         | - Logs commands entered                  |
         | - Detects payload attempts               |
         +------------------------------------------+
                              |
                              v
         +------------------------------------------+
         | Cowrie JSON Logging Engine               |
         |------------------------------------------|
         | cowrie.session.connect                   |
         | cowrie.login.failed                      |
         | cowrie.login.success                     |
         | cowrie.command.input                     |
         +------------------------------------------+
                              |
                              v
         +------------------------------------------+
         | Filebeat                                |
         |------------------------------------------|
         | Reads Cowrie logs                        |
         | Ships logs to Logstash                   |
         +------------------------------------------+
                              |
                              v
         +------------------------------------------+
         | Logstash                                |
         |------------------------------------------|
         | Parses attack logs                       |
         | Categorizes attack types                 |
         | Sends data to Elasticsearch              |
         +------------------------------------------+
                              |
                              v
         +------------------------------------------+
         | Elasticsearch                            |
         |------------------------------------------|
         | Stores structured attack events          |
         | Builds searchable indices                |
         +------------------------------------------+
                              |
                              v
         +------------------------------------------+
         | Kibana / Dashboard                       |
         |------------------------------------------|
         | Visualizes brute-force trends            |
         | Shows attacker IPs                       |
         | Displays command activity                |
         +------------------------------------------+
```

## 🔍 Step-by-Step Easy Explanation

### 1️⃣ Attacker Connects
A tester or attacker connects using:
- **SSH** → Port 2222
- **Telnet** → Port 2223

### 2️⃣ Fake Device Responds
The attacker sees a realistic healthcare device:
- **CareFusion Patient Monitor**

### 3️⃣ Cowrie Captures Activity
Cowrie records:
- Login attempts
- Password guesses
- Session duration
- Commands
- Payload attempts

### 4️⃣ Logs Are Generated
Cowrie saves all events in JSON format.

### 5️⃣ Filebeat Ships Logs
Filebeat collects logs and forwards them automatically.

### 6️⃣ Logstash Processes Data
Logstash organizes attacks into categories:
- Bruteforce
- Credential theft
- Command injection

### 7️⃣ Elasticsearch Stores Data
All attacks are stored for searching and reporting.

### 8️⃣ Kibana Visualizes Results
Dashboards show:
- Failed login spikes
- Top attacker IPs
- Command injection patterns
