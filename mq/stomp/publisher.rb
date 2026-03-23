require "stomp"

login = 'admin'
passcode = 'Testing12345!'
host = 'b-bd568225-8414-4e7f-8bed-31dc6e5dd124-1.mq.us-east-1.amazonaws.com'
port = 61614 # integer, not string

config = {
  hosts: [
    {
      login: login,
      passcode: passcode,
      host: host,
      port: port,
      ssl: true
    }
  ]
}

# Create client
client = Stomp::Client.new(config)

# Publish message
dest = '/queue/test'
client.publish(dest, "Hello World! STOMP")
puts "Message sent to #{dest}"

client.close