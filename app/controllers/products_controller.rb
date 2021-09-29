class ProductsController < ApplicationController
    # GET /products
    def index
        @products = Product.all
        render json: @products
    end

    # GET /products/:id
    def show
        @product = Product.find(params[:id])
        render json: @product
    end
end
