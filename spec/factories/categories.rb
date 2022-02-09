# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_url  :string
#
FactoryBot.define do
  factory :category do
    name { Faker::Ancient.god }
    image_url { 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' }
    after(:build) do |category|
      category.images.attach(
        io: File.open(Rails.root.join('spec', 'photos', 'test_2.png')),
        filename: 'test_2.png',
        content_type: 'image/png'
      )
    end
  end
end
