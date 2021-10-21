class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :review_id, uniqueness: { scope: :user_id, message: "has already been voted "}
end
