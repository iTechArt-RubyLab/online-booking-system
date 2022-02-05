# == Schema Information
#
# Table name: clients
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  middle_name :string           not null
#  email       :string           not null
#  phone       :string           not null
#  birthday    :datetime         not null
#  notes       :text
#  image_url   :string           not null
#  rating      :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ClientSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :middle_name, :email,
             :phone, :birthday, :notes, :rating
end
