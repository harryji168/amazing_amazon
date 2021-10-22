class User < ApplicationRecord
    has_secure_password

    has_many :products, dependent: :destroy
    has_many :reviews,  dependent: :destroy

    validates :first_name,:last_name,:email,:password,  presence: true

    has_many :likes, dependent: :destroy
    has_many :liked_reviews, through: :likes, source: :review

    has_many :favourites
    has_many :favourited_products, through: :favourites, source: :product

      # lab for more many to many
      has_many :votes
      has_many :vote_reviews, through: :votes, source: :review

      validates :first_name, :last_name, :email, :password, presence: true
    
      def full_name
          "#{first_name} #{last_name}".strip.titlecase
      end
end
