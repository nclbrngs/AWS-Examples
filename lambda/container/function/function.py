import json
from faker import Faker

fake = Faker()
fake.name()

def handler(event, context):

    # Build only the greeting string
    message = 'Hello {}!'.format(fake.name())

    # define your object
    info = {
        "Type": "Container Example",
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