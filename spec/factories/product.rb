FactoryBot.define do
    factory :product do
        name { Faker::Commerce.product_name }
        sold_out { Faker::Boolean.boolean }
        category { Faker::Commerce.department }
        under_sale { Faker::Boolean.boolean }
        price { Faker::Commerce.price }
        sale_price { Faker::Commerce.price }
        sale_text { Faker::Lorem.word }
    end
end