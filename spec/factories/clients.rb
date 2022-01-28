FactoryBot.define do
  factory :client do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    email { Faker::Internet.email }
    phone { '+375 25 609-99-99' }
    birthday { Faker::Date.between(from: 50.years.ago, to: Time.zone.today - 18.years) }
    notes { Faker::Lorem.paragraph }
    image_url { 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' }
    rating { rand(0..5) }
  end
end
