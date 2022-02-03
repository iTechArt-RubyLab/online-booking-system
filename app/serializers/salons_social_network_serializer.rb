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
class SalonsSocialNetworkSerializer
  include JSONAPI::Serializer
  attributes :salon_id, :social_network_id, :link

  attribute :social_network do |salons_social_network|
    salons_social_network.social_network.name
  end
end
