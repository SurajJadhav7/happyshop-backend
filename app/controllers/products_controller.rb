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

    # POST /products
    def create
        @product = Product.new(product_params)
        if @product.save
            render json: @product, status: 201
        else
            render json: {error: "Product not created"}, status: 422
        end
    end

    private
    def product_params
        params.require(:product).permit(:name, :sold_out, :category, :under_sale, :price, :sale_price, :sale_text)
    end
end
