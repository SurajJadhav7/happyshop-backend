# frozen_string_literal: true

class Product < ApplicationRecord
  searchkick
  validates :name, :category, :price, :sale_price, presence: true
  validates :sold_out, :is_new, inclusion: { in: [true, false] }
  validates :price, numericality: { in: 1..1_000_000 }
end
