import yaml

# 1. Load the file
with open("docker.yaml") as f:
    data = yaml.safe_load(f)

# 2. Extract the 'environment' list (which causes the error)
# It currently looks like: ['MCC=208', 'MNC=93', ...]
list = data["services"]["oai-amf"]["environment"]

# 3. CONVERT the list to a dictionary
# This splits "MCC=208" into Key: "MCC" and Value: "208"
dict = {}
for item in list:
    # Use split to separate Key and Value
    if "=" in item:
        key, value = item.split("=", 1)
        dict[key] = value

# 4. NOW your original requested syntax works using the new 'dict' variable
print("MCC:", dict["MCC"])
print("MNC:", dict["MNC"])