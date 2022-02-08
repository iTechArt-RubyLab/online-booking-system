# == Schema Information
#
# Table name: salons
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  address    :text             not null
#  phone      :string           not null
#  email      :string           default(""), not null
#  notes      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#
FactoryBot.define do
  factory :salon, class: 'Salon' do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    phone { '+375 29 123-45-67' }
    email { Faker::Internet.email }
    notes { Faker::Lorem.paragraph }

    after(:create) do |salon|
      create(:service, salon_id: salon.id)
      salon.users << create(:professional, status: :working)
    end
  end

  trait(:no_address) { address { nil } }
end
