class Service < ApplicationRecord
  validates :name, :description, :duration, :price, :hidden_price, :availability, presence: true
  validates :name, uniqueness: true
  validates :price, :hidden_price, :duration, numericality: { greater_than: 0 }
  validates :duration, numericality: { less_than: 180 }
end
