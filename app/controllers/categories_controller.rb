class CategoriesController < ApplicationController
  def index
    @categories = Product.search '*', aggs: [:category]
    @categories = @categories.aggregations["category"]["buckets"].map{|bucket| bucket["key"]}
    render json: @categories
  end
end