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

connection_string = 'stomp://admin:Testing12345!@b-bd568225-8414-4e7f-8bed-31dc6e5dd124-1.mq.us-east-1.amazonaws.com:61614'
client = Stomp::Client.new(config)
dest = '/queue/test'
client.subscribe('/queue/test', ack: 'auto') do |msg|
  puts "Received: #{msg.body}"
end

sleep

