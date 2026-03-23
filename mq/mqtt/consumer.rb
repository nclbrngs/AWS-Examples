require "mqtt"

host = 'mqtts://admin:Testing12345!@b-bd568225-8414-4e7f-8bed-31dc6e5dd124-1.mq.us-east-1.amazonaws.com:8883'
topic = 'test/topic'
message = "Hello World! MQTT"

begin
    MQTT::Client.connect(host) do |client|
        client.get(topic) do |topic, message |
            puts topic
            puts message
        end
    end
rescue => e
    puts e.inspect
end