require "bunny"

connection_string = "amqps://admin:Testing12345!@b-5188614f-a1b7-4de8-b676-164c0800f337.mq.us-east-1.on.aws:5671"
connection = Bunny.new(connection_string)
connection.start

channel = connection.create_channel
queue = channel.queue('hello')

begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
        puts body
    end

rescue => e
    puts e.inspect
    channel.close
    connection.close
    exit(0)
end