class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true

  validate :rating_must_be_integer_between_0_and_5

  private

  def rating_must_be_integer_between_0_and_5
    return if rating.nil?

    unless rating.is_a?(Integer)
      errors.add(:rating, "must be an integer")
      return
    end

    unless rating.between?(0, 5)
      errors.add(:rating, "must be between 0 and 5")
    end
  end
end
