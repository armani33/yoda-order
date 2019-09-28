class Review < ApplicationRecord
  before_create :capitalize

  validates :name, presence: true, length: { maximum: 30 }
  validates :city, presence: true
  validates :country, presence: true
  validates :comment, presence: true
  validates :rating, presence: true
  validates :datum, presence: true

  def blank_stars
    5 - self.rating
  end

  def capitalize
    self.name.capitalize!
    self.city.capitalize!
    self.country.capitalize!
  end
end
