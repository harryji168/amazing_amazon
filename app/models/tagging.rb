class Tagging < ApplicationRecord
  belongs_to :product
  belongs_to :tag
  validates :tag_id, uniqueness: { scope: :product_id, message: "already has that tag"}
end
