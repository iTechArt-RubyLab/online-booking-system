class UserSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :middle_name, :email,
             :work_email, :phone, :work_phone, :birthday, :role,
             :status, :notes, :rating
end
