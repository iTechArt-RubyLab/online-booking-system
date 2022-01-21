FactoryBot.define do
  factory :user, class: 'User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    patronymic { Faker::Name.middle_name }
    salon_id { rand(1...101) }
    email { Faker::Internet.email }
    work_email { Faker::Internet.email }
    phone { '+375 25 609-99-99' }
    work_phone { '+375 25 609-99-99' }
    birthday { Faker::Date.between(from: 50.years.ago, to: Date.today - 18.years) }
    role { rand(0...2) }
    status { rand(0...4) }
    notes { Faker::Lorem.paragraph }
    image_url { 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' }
  end
end
