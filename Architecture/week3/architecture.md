# 🛡️ Week 3 Architecture Diagram  

```text
                    Cowrie Honeypot
                         |
                         |
             Raw JSON / Text Attack Logs
                         |
                         v
         +-----------------------------------+
         | data/logs/cowrie/cowrie.json      |
         |-----------------------------------|
         | - session.connect                 |
         | - login.failed                    |
         | - login.success                   |
         | - command.input                   |
         +-----------------------------------+
                         |
                         v
         +-----------------------------------+
         | Python Parsing Engine             |
         |-----------------------------------|
         | cowrie_parser.py                  |
         | - JSON parsing                    |
         | - Event filtering                 |
         | - IoC extraction                  |
         | - Command analysis                |
         +-----------------------------------+
                         |
                         v
         +-----------------------------------+
         | Threat Intelligence Extraction    |
         |-----------------------------------|
         | - Source attacker IPs             |
         | - Brute-force patterns            |
         | - Weak credential usage           |
         | - Malware URLs / payloads         |
         | - Executed terminal commands      |
         +-----------------------------------+
                         |
                         v
         +-----------------------------------+
         | Processed Security Outputs        |
         |-----------------------------------|
         | attack_summary.csv                |
         | ioc_report.json                   |
         | malware_hashes.csv                |
         | executed_commands.csv             |
         +-----------------------------------+
                         |
                         v
         +-----------------------------------+
         | Week 4 Dashboard Ready Data       |
         |-----------------------------------|
         | Flask Dashboard                   |
         | GeoIP Mapping                     |
         | World Attack Visualization        |
         +-----------------------------------+
🔍 Easy Step-by-Step Explanation
1️⃣ Raw Logs Collected

Cowrie stores attacker interactions in:

data/logs/cowrie/cowrie.json
2️⃣ Python Parser Reads Logs

cowrie_parser.py processes each log entry and filters:

Failed logins
Successful logins
Commands
Malware attempts
3️⃣ IoCs Are Extracted

Examples:

Attacker IPs
admin/admin brute force
wget payload.sh
curl malware
4️⃣ Reports Are Generated

Outputs become:

CSV / JSON datasets

Used later for dashboards and compliance reporting.
