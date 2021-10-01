# frozen_string_literal: true

class Product < ApplicationRecord
  searchkick
  validates :name, :category, :price, :sale_price, :sale_text, presence: true
  validates :sold_out, :under_sale, inclusion: { in: [true, false] }
  validates :price, numericality: { in: 1..1_000_000 }
end
