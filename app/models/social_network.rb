class SocialNetwork < ApplicationRecord
  has_many :salon_social_networks, dependent: :destroy
  has_many :salons, through: :salon_social_networks
end
