class Salon < ApplicationRecord
  validates :name, uniqueness: true
end