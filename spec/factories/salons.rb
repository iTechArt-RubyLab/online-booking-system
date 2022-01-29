# == Schema Information
#
# Table name: salons
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  address        :text             not null
#  phone          :string           not null
#  email          :string           default(""), not null
#  notes          :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  salon_owner_id :integer          not null
#
FactoryBot.define do
  factory :salon, class: 'Salon' do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    phone { '+375 29 123-45-67' }
    email { Faker::Internet.email }
    notes { Faker::Lorem.paragraph }
    salon_owner_id { create(:salon_owner).id }
  end

  trait(:no_owner_id) { salon_owner_id { nil } }
  trait(:no_address) { address { nil } }
end
