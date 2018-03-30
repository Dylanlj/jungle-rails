class Review < ActiveRecord::Base
  belongs_to :product

  validates :product, presence: true
  validates :user_id, presence: true
  validate :rating_or_review

  def rating_or_review
    if (rating == nil) && (description == nil)
      errors.add(:no_review, "a review needs to have either a description or a rating")
    end
  end

end
