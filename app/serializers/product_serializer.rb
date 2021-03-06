class ProductSerializer < ActiveModel::Serializer   
  attributes :id, :title, :description, :price, :created_at, :updated_at
  belongs_to :user, key: :seller
  class UserSerializer < ActiveModel::Serializer
    attributes(
      :id,
      :first_name,
      :last_name,
      :full_name,
      :email
    )
  end 
  has_many :reviews
  class ReviewSerializer < ActiveModel::Serializer
    attributes :id, :body, :rate
  end 
end
