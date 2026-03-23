# Required libraries
require 'aws-sdk-sqs'  # AWS SDK for S3 operations

client = Aws::SQS::Client.new

queue_url = "https://sqs.us-east-1.amazonaws.com/378950443697/sqs-standard-MyQueue-jE8nngfLcqRC"
resp = client.send_message(
  queue_url: queue_url, # required
  message_body: "Hello Jupiter!", # required
  delay_seconds: 0,
  message_attributes: {
    "Fruit" => {
      string_value: "Apple",
      data_type: "String" # required
    },
  },
)