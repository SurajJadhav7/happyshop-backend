# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
    Product.create(
        name: Faker::Commerce.product_name,
        sold_out: [true, false].sample,
        category: Faker::Commerce.department,
        under_sale: [true, false].sample,
        price: Faker::Commerce.price(range: 50..10000),
        sale_price: Faker::Commerce.price(range: 50..10000),
        sale_text: "#{Faker::Number.between(from: 1, to: 100)}% OFF"
    )
end