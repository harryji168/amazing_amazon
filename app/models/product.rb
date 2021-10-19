class Product < ApplicationRecord
    after_initialize :set_default_price
    before_save :capitalize_title

    has_many :reviews, dependent: :destroy

    belongs_to :user

    # belongs_to :user, optional: true

    
    has_many :favourites, dependent: :destroy
    has_many :favouriters, through: :favourites, source: :user


    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :price, numericality:{greater_than: 0}
    validates :description, presence: true, length: { minimum: 10 }



    private
    def set_default_price
        self.price ||= 1
    end

    def capitalize_title
        self.title.capitalize!
    end

   

end
