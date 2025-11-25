import subprocess
import os

ip_list = ["8.8.8.8", "1.1.1.1", "192.168.1.1"]
TIMEOUT = 0.5

for ip in ip_list:
    cmd = ["ping", "-n" if os.name == "nt" else "-c", "1", ip]
    print(f"\nPinging {ip}...", end=" ")
    try:
        res = subprocess.run(cmd, stdout=subprocess.DEVNULL, timeout=TIMEOUT)
        print("REACHABLE" if res.returncode == 0 else "FAILED")
    except subprocess.TimeoutExpired:
        print("SLOW PING")
    except:
        print("ERROR")