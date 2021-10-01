# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    it 'returns products' do
      create_list(:product, 3)
      get '/products'
      expect(response.body).not_to be_empty
    end
  end

  describe 'GET /products/:id' do
    context 'when the product exists' do
      it 'returns the product' do
        create_list(:product, 3)
        get "/products/#{Product.first.id}"
        expect(JSON.parse(response.body)['id']).to eq(Product.first.id)
      end
    end

    context 'when the product does not exist' do
      it 'returns a not found message' do
        get '/products/000'
        expect(JSON.parse(response.body)['error']).to eq('Product not found')
      end
    end
  end

  describe 'POST /products' do
    context 'when the request is valid' do
      it 'creates a product' do
        post '/products', params: { product: get_product_data(true) }
        expect(JSON.parse(response.body)['name']).to eq('Air Jordan 1')
      end
    end

    context 'when the request is invalid' do
      it 'returns a validation failure message' do
        post '/products', params: { product: get_product_data(false) }
        expect(JSON.parse(response.body)['error']).to eq('Product not created')
      end
    end
  end
end

def get_product_data(valid)
  price = valid ? 4602 : 'AAAA'
  {
    name: 'Air Jordan 1',
    sold_out: false,
    category: 'Shoes',
    under_sale: true,
    price: price,
    sale_price: 6793,
    sale_text: '14% OFF'
  }
end
