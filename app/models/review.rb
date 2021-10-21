class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  
  #validates :body, length: { minimum: 2, maximum: 200 }
  validates :rate, presence:true, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to:1 , only_integer: true }
  # greater_than 0 less_than 6

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

 # lab for more many to many
 has_many :votes, dependent: :destroy
 has_many :voters, through: :votes, source: :user  

end
