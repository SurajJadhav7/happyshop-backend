# require 'bunny'

class Consumer
  def self.update_products
    connection = Bunny.new
    connection.start
    channel = connection.create_channel
    queue = channel.queue('happyshop-admin.products', durable: true)
    begin
        puts ' [*] Waiting for Rabbitmq Updates...'
        queue.subscribe() do |_delivery_info, _properties, body|
            puts " [x] Received #{body}"
            @product = Product.new(JSON.parse(body))
            if @product.save
                puts 'Rabbitmq Consumer: Product saved'
            else
                puts 'Rabbitmq Consumer: Product not saved'
            end
        end
    rescue Interrupt => _
        connection.close
        exit(0)
    end
  end
end
