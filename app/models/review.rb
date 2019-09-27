class Review < ApplicationRecord
  before_create :capitalize
  # before_create :set_datum

  def blank_stars
    5 - self.rating
  end

  # def set_datum
  #   self.datum = self.created_at.to_date
  # end

  def capitalize
    self.name.capitalize!
    self.city.capitalize!
    self.country.capitalize!
  end
end
