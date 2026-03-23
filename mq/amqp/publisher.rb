require "bunny"

connection_string = "amqps://admin:Testing12345!@b-5188614f-a1b7-4de8-b676-164c0800f337.mq.us-east-1.on.aws:5671"
connection = Bunny.new(connection_string)
connection.start

channel = connection.create_channel
queue = channel.queue('hello')
exchange = channel.default_exchange 

begin
    exchange.publish("Hello World!" , routing_key: queue.name)
    puts "Message sent"
    channel.close
    connection.close

rescue => e
    puts e.inspect
    channel.close
    connection.close
    exit(0)
end