# == Schema Information
#
# Table name: salons_social_networks
#
#  id                :bigint           not null, primary key
#  salon_id          :bigint           not null
#  social_network_id :bigint           not null
#  link              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class SalonsSocialNetwork < ApplicationRecord
  belongs_to :salon
  belongs_to :social_network
end
