# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all


100.times do 
    created_at = Faker::Date.backward(days: 365 * 2)
    p = Product.create(
        title: Faker::Company.name,
        description: Faker::Company.industry,
        price: rand(1000),
        created_at: created_at,
        updated_at: created_at
    )
    if p.valid?
        rand(1..5).times do
            Review.create(body:Faker::Hacker.say_something_smart,
                          rate: rand(5),  
                          product:p)

        end
    end     
end

reviews = Review.all
products = Product.all

put reviews.count 
pur products.count
