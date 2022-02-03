class ServiceSerializer
  include JSONAPI::Serializer

  attributes :salon_id, :name, :description,
             :duration, :price, :availability,
             :category_id

  attribute :category do |service|
    service.category.name
  end
end
