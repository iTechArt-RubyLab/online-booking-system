class ClientSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :middle_name, :email,
             :phone, :birthday, :notes, :rating
end
