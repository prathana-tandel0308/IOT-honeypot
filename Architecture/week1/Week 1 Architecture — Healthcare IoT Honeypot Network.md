# Healthcare IoT Deception Honeypot Network

## 🏗️ Architecture Diagram

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

## 🔍 Easy Step-by-Step Explanation

### 1️⃣ Attacker Connects
A person (or tester) tries to connect to the fake device using:
- **SSH** on port `2222`
- **Telnet** on port `2223`

### 2️⃣ Fake Device Responds
Instead of a real hospital machine, they see:
> **“CareFusion Patient Monitor”**

This makes the attacker believe it is a real medical device.

### 3️⃣ Cowrie Honeypot Captures Everything
Cowrie is the main trap system. It records:
- Username attempts
- Password attempts
- Successful/failed logins
- Commands typed

### 4️⃣ Fake Medical Files Make It Look Real
The system contains fake files like:
- `patient_records.txt`
- `vitals.log`
- `hostname`

This increases realism.

### 5️⃣ Logs Are Saved
All attacker activity is stored for future analysis. Examples:
- IP address
- Brute-force attempts
- Session time

## 🔒 Security Safety
This setup is safe because:
- **Docker isolates the honeypot**: Ensuring the host system remains secure.
- **No real patient data is used**: All data is simulated.
- **No real hospital devices are connected**: The environment is completely sandboxed.
