# == Schema Information
#
# Table name: social_networks
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SocialNetwork < ApplicationRecord
  has_many :salon_social_networks, dependent: :destroy
  has_many :salons, through: :salon_social_networks
end
