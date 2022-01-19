class Service < ApplicationRecord
  validates :name, :description, :duration, :price, :hidden_price, :availability, presence: true
  validates :name, uniqueness: true
  validates :price, :hidden_price, numericality: { greater_than: 0 }
  validates :duration, numericality: { greater_than: 0, less_than_or_equal_to: 180 }

  enum availability: {
    availabile: 0,
    not_availabile: 1
  }
end
