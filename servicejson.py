import json

FILE_NAME = "service.json"

try:
    # 1. Open and load the entire JSON file
    with open(FILE_NAME, 'r') as f:
        data = json.load(f)

    # 2. Extract the services block, which contains the service names and configurations
    # We are assuming the JSON structure is similar to the full YAML conversion (Service -> IP list)
    
    # If the JSON contains ONLY the service:ip map (like the desired output):
    if all(isinstance(v, str) and v.count('.') == 3 for v in data.values()):
        service_map = data
    # If the JSON contains the entire Docker Compose structure (where services is a nested key):
    elif 'services' in data and isinstance(data['services'], dict):
        service_map = {}
        for name, config in data['services'].items():
            # Attempt to extract the IP from the nested structure
            ip = config.get('networks', {}).get('public_net', {}).get('ipv4_address', 'N/A')
            service_map[name] = ip
    else:
        # Fallback if structure is unexpected
        print("Error: Could not find the expected 'services' block or service:ip map in the JSON file.")
        service_map = {}
        
    
    # 3. Print the output neatly
    if service_map:
        print("✅ Extracted Services and IPs from 'service.json':")
        print("-" * 50)
        
        # Determine max width for clean table formatting
        max_name_len = max(len(name) for name in service_map.keys()) if service_map else 10
        
        # Print header
        print(f"{'Service Name':<{max_name_len}} | {'IPv4 Address'}")
        print("-" * 50)
        
        # Print data rows
        for name, ip in service_map.items():
            print(f"{name:<{max_name_len}} | {ip}")
    else:
        print("The 'service.json' file was loaded but contained no services with defined IP addresses.")


except FileNotFoundError:
    print(f"Error: The file '{FILE_NAME}' was not found. Please ensure it exists in the current directory.")
except json.JSONDecodeError:
    print(f"Error: The file '{FILE_NAME}' is not valid JSON. Please check its contents for syntax errors.")
except Exception as e:
    print(f"An unexpected error occurred: {e}")