# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Product.destroy_all
Review.destroy_all
Like.destroy_all
Tag.destroy_all

NUM_PRODUCTS = 50
NUM_USERS = 5
NUM_TAGS = 20
PASSWORD = "123" 

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    is_admin: true
)

NUM_TAGS.times do
    Tag.create(
      name: Faker::ProgrammingLanguage.name
    )
end

tags = Tag.all

NUM_USERS.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name:first_name,
        last_name: last_name,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD
    )
end

users = User.all


NUM_PRODUCTS.times do 
    created_at = Faker::Date.backward(days: 365 * 2)
    p = Product.create(
        title: Faker::Company.name,
        description: Faker::Company.industry,
        price: rand(1000),
        created_at: created_at, 
        updated_at: created_at,
        user: users.sample
        
    )
    if p.valid?
        rand(0..10).times.map do
          r = Review.create(
            body: Faker::GreekPhilosophers.quote,
            rate: rand(1..5),
            user: users.sample,
            product: p
          )
          if r.valid?
            r.likers = users.shuffle.slice(0, rand(users.count))
          end
        end
        p.tags = tags.shuffle.slice(0, rand(tags.count / 2))
    end

     
end

reviews = Review.all
products = Product.all
likes = Like.all

puts reviews.count 
puts products.count

puts Cowsay.say("Generated #{products.count} products", :frogs)
puts Cowsay.say("Generated #{reviews.count} reviews", :cow)

puts Cowsay.say("Generated #{users.count} users", :koala) 