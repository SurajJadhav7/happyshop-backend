class Product < ApplicationRecord
    searchkick
    validates_presence_of :name, :category, :price, :sale_price, :sale_text
    validates_inclusion_of :sold_out, :under_sale, :in => [true, false]
end
