class SalonsSocialNetworkSerializer
  include JSONAPI::Serializer
  attributes :salon_id, :social_network_id, :link

  attribute :social_network do |salons_social_network|
    salons_social_network.social_network.name
  end
end
