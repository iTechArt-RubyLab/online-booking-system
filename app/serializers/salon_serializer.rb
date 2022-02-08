# == Schema Information
#
# Table name: salons
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  address       :text             not null
#  phone         :string           not null
#  email         :string           default(""), not null
#  notes         :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  remind_up_min :integer          default(60), not null
#  latitude      :float
#  longitude     :float
#
class SalonSerializer
  include JSONAPI::Serializer

  attributes :name, :address, :phone, :email
end
