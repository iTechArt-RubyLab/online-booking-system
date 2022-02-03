class SalonSerializer
  include JSONAPI::Serializer

  attributes :name, :address, :phone, :email
end
