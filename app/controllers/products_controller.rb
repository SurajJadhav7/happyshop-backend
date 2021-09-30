class ProductsController < ApplicationController
    # GET /products
    def index
        @products = Product.page(params[:page])
        render json: @products
    end

    # GET /products/:id
    def show
        @product = Product.find(params[:id]) rescue nil
        if @product
            render json: @product
        else 
            render json: {error: "Product not found"}, status: 404
        end
    end
end
