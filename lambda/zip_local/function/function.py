import json

def handler(event, context):
    first = event.get("first_name", "Guest")
    last = event.get("last_name", "")

    # Build only the greeting string
    message = f"Hello {first} {last}!"

    # define your object
    info = {
        "Type": "Zip Inline",
        "Version": 1,
    }

    # convert into JSON
    info_json = json.dumps(info)

    print(info_json)

    # Return it directly as the body
    return {
        "statusCode": 200,
        "body": message
    }