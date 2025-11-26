import subprocess as sp, json, re

# WARNING: This script is fragile and will crash if the 'ip' command fails or is not found.

# 1. Execute Command (Queries the Linux Kernel Routing Table)
res = sp.run(
    ['ip', 'route', 'show'], 
    capture_output=True, 
    text=True, 
    check=True,  # Causes crash on failure
    timeout=5
).stdout.strip()

# 2. Process and Parse Routes
parsed_routes = []

# Split output into lines, strip whitespace, and filter out non-route lines
for line in [l.strip() for l in res.split('\n') if l.strip() and not l.startswith(('Kernel', 'Routing'))]:
    route, parts = {}, line.split()
    
    # --- Destination Parsing ---
    first = parts[0]
    if first == 'default':
        route['destination'] = '0.0.0.0/0'
    elif re.match(r'^(\d{1,3}\.){3}\d{1,3}(\/\d{1,2})?$', first) or first in ['local', 'broadcast']:
        route['destination'] = first
    else:
        route['destination'] = None
    
    # --- Keywords Extraction ---
    for i, part in enumerate(parts):
        if part == 'via': route['gateway'] = parts[i+1]
        elif part == 'dev': route['interface'] = parts[i+1]
        elif part == 'proto': route['protocol'] = parts[i+1]
        elif part == 'metric': route['metric'] = int(parts[i+1])
        elif part == 'scope': route['scope'] = parts[i+1]

    # Final cleanup and append
    cleaned_route = {k: v for k, v in route.items() if v is not None}
    if cleaned_route.get('destination'): 
        parsed_routes.append(cleaned_route)

# 3. Output Final JSON
print(json.dumps({
    "source": "Linux/macOS ip route show",
    "total_routes": len(parsed_routes),
    "routes": parsed_routes
}, indent=4))