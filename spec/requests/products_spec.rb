require 'rails_helper'

RSpec.describe "Products", type: :request do

  describe "GET /products" do
    it "returns products" do
      products = create_list(:product, 10)
      get "/products"
      expect(JSON.parse(response.body)).not_to be_empty
    end
  end

  describe "GET /products/:id" do
    context "when the product exists" do
      it "returns the product" do
        products = create_list(:product, 10)
        get "/products/#{Product.first.id}"
        expect(JSON.parse(response.body)['id']).to eq(Product.first.id)
      end
    end

    context "when the product does not exist" do
      it "returns a not found message" do
        products = create_list(:product, 10)
        get "/products/000"
        expect(JSON.parse(response.body)["error"]).to eq("Product not found")
        expect(response.status).to eq(404)
      end
    end
  end

end

