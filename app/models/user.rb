class User < ApplicationRecord
    has_secure_password

    has_many :products, dependent: :destroy
    has_many :reviews,  dependent: :destroy

    validates :first_name,:last_name,:email,:password,  presence: true

    has_many :likes
    has_many :liked_reviews, through: :likes, source: :review

    has_many :favourites
    has_many :favourited_products, through: :favourites, source: :product
end
