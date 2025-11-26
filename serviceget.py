import yaml

FILE_NAME = "docker.yaml"
output = []

try:
    with open(FILE_NAME, 'r') as f:
        config = yaml.safe_load(f)
        
    services = config.get('services', {})
    
    # Iterate through services and extract IP
    for name, data in services.items():
        # Safely drill down to the IPv4 address
        ip = data.get('networks', {}).get('public_net', {}).get('ipv4_address', 'N/A')
        output.append((name, ip))

    print("Service | IPv4 Address")
    print("-" * 30)
    for name, ip in output:
        # Format the output neatly
        print(f"{name:<10} | {ip}")

except FileNotFoundError:
    print(f"Error: '{FILE_NAME}' not found.")
except Exception as e:
    print(f"An error occurred: {e}")