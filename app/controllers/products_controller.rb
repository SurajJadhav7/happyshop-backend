class ProductsController < ApplicationController
    # GET /products
    def index
        query = (params[:q] and params[:q].strip != "") ? params[:q].strip : "*"
        filters = (params[:category] and params[:category] != "") ? {category: params[:category]} : {}
        maxprice = (params[:maxprice] and params[:maxprice] != "") ? params[:maxprice] : 1000000
        minprice = (params[:minprice] and params[:minprice] != "") ? params[:minprice] : 0
        filters[:price] = {gte: minprice, lte: maxprice}
        @products = Product.search query, fields: [:name, :category], where: filters, page: params[:page], per_page: 25
        render json: @products.to_json
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
