import subprocess
import os

# Step 1: Define IP List
ip_list = [
    "8.8.8.8",
    "1.1.1.1",
    "192.168.1.1",
    "10.0.0.1"
]

# Step 3: Implement Loop
for ip in ip_list:
    print(f"\nPinging {ip}...")

    # Different ping command for Windows and Linux/Mac
    if os.name == "nt":
        command = ["ping", "-n", "1", ip]
    else:
        command = ["ping", "-c", "1", ip]

    response = subprocess.run(command, stdout=subprocess.DEVNULL)

    if response.returncode == 0:
        print(f"{ip} is REACHABLE")
    else:
        print(f"{ip} is NOT REACHABLE")