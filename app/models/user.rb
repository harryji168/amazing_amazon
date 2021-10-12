class User < ApplicationRecord
    has_secure_password

    has_many :products, dependent: :destroy
    has_many :reviews,  dependent: :destroy

    validates :first_name,:last_name,:email,:password,  presence: true
end
