# Required libraries
require 'aws-sdk-sqs'  # AWS SDK for S3 operations

client = Aws::SQS::Client.new

queue_url = "https://sqs.us-east-1.amazonaws.com/378950443697/sqs-standard-MyQueue-jE8nngfLcqRC"
resp = client.receive_message({
  queue_url: queue_url, # required
  attribute_names: ["All"], # accepts All, Policy, VisibilityTimeout, MaximumMessageSize, MessageRetentionPeriod, ApproximateNumberOfMessages, ApproximateNumberOfMessagesNotVisible, CreatedTimestamp, LastModifiedTimestamp, QueueArn, ApproximateNumberOfMessagesDelayed, DelaySeconds, ReceiveMessageWaitTimeSeconds, RedrivePolicy, FifoQueue, ContentBasedDeduplication, KmsMasterKeyId, KmsDataKeyReusePeriodSeconds, DeduplicationScope, FifoThroughputLimit, RedriveAllowPolicy, SqsManagedSseEnabled
  message_system_attribute_names: ["All"], # accepts All, SenderId, SentTimestamp, ApproximateReceiveCount, ApproximateFirstReceiveTimestamp, SequenceNumber, MessageDeduplicationId, MessageGroupId, AWSTraceHeader, DeadLetterQueueSourceArn
  message_attribute_names: ["MessageAttributeName"],
  max_number_of_messages: 1,
  visibility_timeout: 1,
  wait_time_seconds: 1
})

resp.messages.each do |msg|
  puts "Message ID: #{msg.message_id}"  # prints the message ID
  puts "Body: #{msg.body}"                # prints message body
  puts "Receipt Handle: #{msg.receipt_handle}"  # prints receipt handle
  puts "Attributes: #{msg.attributes}"           # prints system attributes
  puts "Message Attributes: #{msg.message_attributes}"  # prints custom attributes
end