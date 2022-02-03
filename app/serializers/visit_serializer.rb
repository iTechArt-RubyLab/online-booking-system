class VisitSerializer
  include JSONAPI::Serializer

  attributes :client_id, :user_id, :service_id, :price, :address, :status

  attribute :salon_id do |visit|
    visit.salon.id.to_s
  end
end
