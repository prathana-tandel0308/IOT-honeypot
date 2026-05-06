# 🏥 Healthcare IoT Deception Honeypot Network  
## Week 1 — Environment Setup and Device Simulation  

---

## 📋 Project Overview  
The Healthcare IoT Deception Honeypot Network is a proactive cybersecurity project designed to simulate vulnerable healthcare IoT devices such as patient monitors, infusion systems, and smart medical infrastructure to attract, deceive, and analyze malicious attackers in a controlled environment.

This Week 1 phase focuses on building the foundational honeypot environment by deploying a Dockerized Cowrie honeypot configured to mimic a CareFusion Patient Monitor.

---

## 🎯 Week 1 Objectives  
The primary objective of Week 1 is to establish a safe, isolated deception environment.

### Completed Goals:
- [x] Set up isolated Docker honeypot infrastructure  
- [x] Deploy Cowrie SSH/Telnet honeypot  
- [x] Simulate CareFusion Patient Monitor v2.3.1  
- [x] Configure fake credentials for brute-force bait  
- [x] Build deceptive healthcare filesystem  
- [x] Configure fake patient records and vitals logs  
- [x] Prepare documentation and architecture  

---

## 🏗️ Week 1 Architecture  

```text
                   Attacker / Tester
                          |
               SSH (2222) or Telnet (2223)
                          |
                          v
         +-----------------------------------+
         | Fake CareFusion Patient Monitor   |
         | Hostname: patient-monitor-03      |
         | Fake usernames and passwords      |
         +-----------------------------------+
                          |
                          v
         +-----------------------------------+
         | Cowrie Honeypot (Docker Container)|
         |-----------------------------------|
         | - Fake SSH/Telnet service         |
         | - Captures login attempts         |
         | - Records commands                |
         | - Logs attacker activity          |
         +-----------------------------------+
                          |
                          v
         +-----------------------------------+
         | Fake Medical Device Filesystem    |
         |-----------------------------------|
         | - Patient records                 |
         | - Device hostname                 |
         | - Vitals logs                     |
         +-----------------------------------+
                          |
                          v
         +-----------------------------------+
         | Log Files                         |
         |-----------------------------------|
         | - Connection attempts             |
         | - Failed logins                   |
         | - Session details                 |
         +-----------------------------------+
```

## 🛠️ Technology Stack (Week 1 Only)

**Core Infrastructure:**
- Docker
- Docker Compose
- Cowrie Honeypot
- Linux (Ubuntu)

**Simulation:**
- Fake SSH/Telnet services
- Custom medical device banner
- Simulated healthcare filesystem

## 📁 Week 1 Project Structure

```text
healthcare-iot-honeypot/
│
├── honeypot/
│   └── cowrie/
│       ├── Dockerfile
│       ├── cowrie.cfg
│       ├── userdb.txt
│       └── filesystem/
│           ├── etc/hostname
│           ├── home/nurse/patient_records.txt
│           └── var/log/vitals.log
│
├── docker-compose.yml
├── start-honeypot.sh
├── README.md
├── Docs/
└── Diagrams/
```

## ⚙️ Simulated Device Profile

- **Device Name:** CareFusion Patient Monitor v2.3.1
- **Hostname:** `patient-monitor-03`
- **Open Ports:** 
  - SSH → 2222
  - Telnet → 2223

**Fake Credentials:**
- `root` / `root`
- `root` / `123456`
- `admin` / `admin`
- `admin` / `password`
- `nurse` / `nurse`
- `doctor` / `doctor`

## 🚀 Deployment Instructions

### 1. Clone Repository
```bash
git clone https://github.com/your-username/healthcare-iot-honeypot.git
cd healthcare-iot-honeypot
```

### 2. Start Honeypot
```bash
chmod +x start-honeypot.sh
./start-honeypot.sh
```

### 3. Verify Running Container
```bash
docker-compose ps
```

## 🧪 Testing

**SSH Access:**
```bash
ssh root@localhost -p 2222
```

**Telnet Access:**
```bash
telnet localhost 2223
```

**Expected Results:**
- Fake CareFusion banner
- Fake authentication prompt
- Honeypot session logging

## 🔒 Security Controls

> [!WARNING]
> This honeypot is strictly for educational and cybersecurity research purposes.

**Safety Measures:**
- Docker container isolation
- No real hospital systems connected
- Fake credentials only
- Simulated patient records only

## 📄 Sample Fake Records

**`/home/nurse/patient_records.txt`**
```text
PATIENT RECORDS - STRICTLY CONFIDENTIAL

Room 302: John Smith     | HR: 72 | BP: 120/80 | O2: 98%
Room 304: Maria Garcia   | HR: 68 | BP: 118/76 | O2: 99%
```

## 📸 Week 1 Screenshot Checklist

**Required:**
- [ ] `01-system-environment.png`
- [ ] `02-cowrie-config.png`
- [ ] `03-userdb-credentials.png`
- [ ] `04-honeypot-build.png`
- [ ] `05-docker-running.png`
- [ ] `06-ssh-login-success.png`
- [ ] `07-cowrie-logs.png`
- [ ] `08-fake-patient-records.png`


## 📊 Week 1 Deliverables

**Successfully Completed:**
- ✔️ Honeypot deployment
- ✔️ Docker configuration
- ✔️ Healthcare IoT simulation
- ✔️ Fake filesystem
- ✔️ Device deception profile
- ✔️ Basic attacker trap
