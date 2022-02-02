# == Schema Information
#
# Table name: social_networks
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :social_network do
    name { Faker::Superhero.name }
  end
end
