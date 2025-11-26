import yaml

FILE_NAME = "docker.yaml"

with open(FILE_NAME, 'r') as f:
    config = yaml.safe_load(f)

services = config.get('services', {})

print(" Service Ports and Configuration:")
print("=" * 35)

for name, data in services.items():
    
    # Skip commented services
    if name in ['oai-speedtest', 'streaming']: continue
        
    ports_info = []
    
    # Extract exposed ports (e.g., '1935:1935')
    if 'ports' in data:
        ports_info.append(f"Exposed: {', '.join(data['ports'])}")

    # Extract internal port environment variables
    environment = data.get('environment', [])
    if environment:
        for env in environment:
            if isinstance(env, str) and '=' in env:
                key, value = env.split('=', 1)
                if 'PORT' in key.upper() or 'SBI' in key.upper():
                    ports_info.append(f"{key}={value}")
    
    if ports_info:
        print(f"\n**{name.upper()}**")
        for info in ports_info:
            print(f"- {info}")