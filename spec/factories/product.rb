FactoryBot.define do
    factory :product do
        name { Faker::Commerce.product_name }
        sold_out { [true, false].sample }
        category { Faker::Commerce.department }
        under_sale { [true, false].sample }
        price { Faker::Commerce.price }
        sale_price { Faker::Commerce.price }
        sale_text { Faker::Lorem.word }
    end
end