class Salon < ApplicationRecord
  validates :name, length: { minimum: 2 }, uniqueness: true
end