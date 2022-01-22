class Service < ApplicationRecord
  enum availability: {
    yes: 0,
    no: 1
  }

  validates :name, :description, :duration, :price, :hidden_price, :availability, presence: true
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 255 }
  validates :price, :hidden_price, numericality: { greater_than: 0 }
  validates :duration, numericality: { greater_than: 0, less_than_or_equal_to: 180, only_integer: true }
  validates :availability, inclusion: { in: Service.availabilities }
  validates :description, length: { minimum: 10, maximum: 255 }
end
