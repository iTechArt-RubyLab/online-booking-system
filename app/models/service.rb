class Service < ApplicationRecord
  
  enum availability: {
    yes: 0,
    no: 1
  }

  validates :name, :description, :duration, :price, :hidden_price, :availability, presence: true
  validates :name, uniqueness: true
  validates :price, :hidden_price, numericality: { greater_than: 0 }
  validates :duration, numericality: { greater_than: 0, less_than_or_equal_to: 180 }
  validates :availability, inclusion: { in: Service.availabilities }
end
