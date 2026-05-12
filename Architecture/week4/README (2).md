
# Project Title

A brief description of what this project does and who it's for

# 🛡️ Week 4 Architecture Diagram

```text
                    Internet / Controlled Attack Simulation
                                   |
                                   v
                        +----------------------+
                        | Cowrie Honeypot      |
                        |----------------------|
                        | SSH / Telnet Trap    |
                        | Fake Medical Device  |
                        +----------------------+
                                   |
                                   v
                        +----------------------+
                        | Raw Cowrie Logs       |
                        |----------------------|
                        | cowrie.json           |
                        +----------------------+
                                   |
                                   v
                        +----------------------+
                        | Week 3 Parser Engine |
                        |----------------------|
                        | cowrie_parser.py     |
                        | IoC Extraction       |
                        +----------------------+
                                   |
                                   v
                        +----------------------+
                        | Processed Threat Data |
                        |----------------------|
                        | CSV / JSON Reports    |
                        | Attack Summaries      |
                        +----------------------+
                                   |
                                   v
                        +----------------------+
                        | Elasticsearch         |
                        |----------------------|
                        | honeypot-* indices    |
                        | Search + Aggregation  |
                        +----------------------+
                                   |
                                   v
                        +----------------------+
                        | Flask Dashboard API   |
                        |----------------------|
                        | /api/stats            |
                        | /api/recent_attacks   |
                        | /api/health           |
                        +----------------------+
                                   |
                                   v
        +------------------------------------------------------+
        | Dashboard Frontend (dashboard.html)                  |
        |------------------------------------------------------|
        | Total Attacks                                        |
        | Unique Attackers                                     |
        | Global Attack Map                                    |
        | Attack Timeline                                      |
        | Top Attacking IPs                                    |
        | Top Usernames                                        |
        | Real-Time Attack Feed                                |
        +------------------------------------------------------+
                                   |
                                   v
                        +----------------------+
                        | Security Intelligence |
                        |----------------------|
                        | Threat Trends         |
                        | Geolocation Analysis  |
                        | Final Reports         |
                        +----------------------+
🔍 Simple Step-by-Step Flow
1️⃣ Honeypot Captures Attacks

Cowrie captures:

SSH brute-force
Login attempts
Commands
Malware behavior
2️⃣ Logs Are Parsed

Week 3 scripts extract:

IPs
Usernames
Passwords
Commands
IoCs
3️⃣ Elasticsearch Stores Intelligence

Threat events are indexed into:

honeypot-*
4️⃣ Flask Dashboard Queries Data

app.py pulls:

Attack totals
Top IPs
Countries
Attack types
5️⃣ Dashboard Visualizes Threats

dashboard.html shows:

Charts
Maps
Tables
Real-time feed
🌍 Geolocation Layer

Basic:

geoip.country_name

Advanced:

GeoLite2-City.mmdb