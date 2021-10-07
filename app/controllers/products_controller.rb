# frozen_string_literal: true

# includes all the methods for the products controller
class ProductsController < ApplicationController
  # GET /products
  def index
    query = params[:query] && (params[:query].strip != '') ? params[:query].strip : '*'
    set_order
    set_filters
    @products = Product.search query, fields: %i[name category], where: @filters, order: @order,
                                      page: params[:page], per_page: 24
    result = { total: @products.total_count, products: @products }
    render json: result
  end

  # GET /products/:id
  def show
    @product = begin
      Product.find(params[:id])
    rescue StandardError
      nil
    end
    if @product
      render json: @product
    else
      render json: { error: 'Product not found' }, status: :not_found
    end
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: { error: 'Product not created' }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :sold_out, :category, :under_sale, :price, :sale_price, :sale_text)
  end

  def set_filters
    @filters = params[:category] && (params[:category] != '') ? { category: params[:category] } : {}
    set_max_min_price
    @filters[:sale_price] = { gte: @minprice, lte: @maxprice }
  end

  def set_max_min_price
    @maxprice = params[:maxprice] && (params[:maxprice] != '') ? params[:maxprice] : 1_000_000
    @minprice = params[:minprice] && (params[:minprice] != '') ? params[:minprice] : 0
  end

  def set_order
    @order = if params[:sort] && (params[:sort] == 'lowtohigh')
               { sale_price: :asc }
             else
               (params[:sort] == 'hightolow' ? { sale_price: :desc } : {})
             end
  end
end
