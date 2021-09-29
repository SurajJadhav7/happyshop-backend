class Product < ApplicationRecord
    validates_presence_of :name, :sold_out, :category, :under_sale, :price, :sale_price, :sale_text
end
