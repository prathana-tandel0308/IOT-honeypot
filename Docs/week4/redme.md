📊 Week 4: Dashboarding and Geolocation Analysis
📌 Overview
Week 4 focused on transforming the processed honeypot logs from Week 3 into a live cybersecurity intelligence dashboard.

The goal was to visualize attacker activity in real time, analyze attack origins, and present threat intelligence in an easy-to-understand format for monitoring healthcare IoT deception environments.

🎯 Objectives
Build a live dashboard using Flask
Connect dashboard to Elasticsearch honeypot indices
Display:
Total attacks
Unique attackers
Attack types
Top attacking IP addresses
Top usernames used in brute-force attacks
Real-time attack feed
Add geolocation support for attacker origin mapping
Generate final analytical reports
🏗️ Technologies Used
Python 3
Flask
Flask-SocketIO
Elasticsearch
Kibana
Docker
Cowrie Honeypot
HTML / CSS / JavaScript
Leaflet.js (Map Visualization)
Chart.js (Graphs)
📂 Key Files
dashboard/
 ├── app.py
 └── templates/
      └── dashboard.html

analysis/
 └── reports/
      └── generate_final_report.py

data/
 ├── processed/
 └── GeoLite2-City.mmdb (optional for advanced geolocation)

⚙️ Implementation Steps
Step 1 — Flask Dashboard Backend

dashboard/app.py was configured to:

Connect to Elasticsearch
Query honeypot-* indices
Aggregate attack statistics
Provide JSON API endpoints:
/api/stats
/api/recent_attacks
/api/health

Step 2 — Frontend Dashboard

dashboard.html displays:

Total attacks
Unique attackers
Malware count
Countries
Global map
Attack timeline
Attack type breakdown
Top IPs
Username statistics
Live attack feed

Step 3 — Real-Time Attack Injection

Sample attack events were injected into Elasticsearch to simulate:

Brute-force attempts
Username/password abuse
Multi-IP attack campaigns

📈 Results
Successfully Visualized:

✔ 11 Total Attacks
✔ 11 Unique Attackers
✔ Brute-force events
✔ Top attacking IPs
✔ Top usernames
✔ Real-time feed
✔ Elasticsearch integration

🌍 Geolocation Analysis

Basic country-level mapping was added using geoip.country_name.

Future improvements:

Latitude / Longitude coordinates
World heatmaps
Threat clustering
📸 Evidence Collected
Dashboard overview screenshots
Kibana index screenshots
Elasticsearch attack injection logs
Real-time attack feed
IP intelligence summaries

🔒 Security Value

Week 4 provided:

Threat visibility
Attack trend analysis
Security monitoring
Healthcare IoT deception intelligence
Executive-ready reporting
