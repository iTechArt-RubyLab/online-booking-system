class Category < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true, length: { minimum: 2, maximum: 255 }

  before_validation :format_name, on: :create

  private

  def format_name
    self.name = name.capitalize
  end
end
