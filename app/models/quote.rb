class Quote < ApplicationRecord
  has_many :reviews, class_name: Quotes::Review.name
  validates :length, presence: true

  def average_rating
    reviews.presence ? reviews.sum(:rating) / reviews.size.to_f : "No Ratings Yet"
  end
end
