import json

with open("1st.json") as f:
    data = json.load(f)

# 1. Access the 'inventory' list
inventory_list = data["inventory"]

# 2. Select the FIRST book (index 0) from the list
first_book = inventory_list[0] # This is the dictionary for "The Great Gatsby"

# 3. Access the 'year' key in the book's dictionary
print(first_book["year"])