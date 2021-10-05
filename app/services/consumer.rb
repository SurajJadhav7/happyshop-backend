# frozen_string_literal: true

# require 'bunny'

# Rabbitmq Consumer
class Consumer
  def self.update_products
    connection = Bunny.new
    connection.start
    channel = connection.create_channel
    @queue = channel.queue('happyshop-admin.products', durable: true)
    consume
  end

  def self.consume
    Rails.logger.debug ' [*] Waiting for Rabbitmq Updates...'
    @queue.subscribe do |_delivery_info, _properties, body|
      Rails.logger.debug " [x] Received #{body}"
      save_product(body)
    end
  rescue Interrupt => _e
    connection.close
    raise 'Error in Rabbitmq Consumption'
  end

  def self.save_product(body)
    @product = Product.new(JSON.parse(body))
    if @product.save
      Rails.logger.debug 'Rabbitmq Consumer: Product saved'
    else
      Rails.logger.debug 'Rabbitmq Consumer: Product not saved'
    end
  end
end
