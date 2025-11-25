import requests
import logging
logging.basicConfig(filename='log.txt',level=logging.INFO)
#logging.info("Program started")
def fetch_data_mini(url):
    try:
        # Request with a 5-second timeout and raise for bad status codes
        res = requests.get(url, timeout=5)
        res.raise_for_status()
        return res.json()
    except requests.exceptions.RequestException as e:
        # Catch all requests-related errors (Timeout, Connection, HTTP, etc.)
        print(f"Error: {type(e).__name__} occurred.")
    except Exception:
        # Catch JSON/other errors
        print("Error: Invalid JSON or unexpected issue.")
    return None
logging.info("Program started")
logging.debug("Debugging information")
logging.warning("This is a warning")
logging.error("An error has occurred")
logging.critical("Critical issue encountered")
if __name__ == "__main__":
    good_url = "https://jsonplaceholder.typicode.com/todos/1"
    bad_url = "https://invalid-example-123.com"

    print("--- GOOD URL ---")
    print(fetch_data_mini(good_url))

    print("\n--- BAD URL ---")
    fetch_data_mini(bad_url)