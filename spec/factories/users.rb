FactoryBot.define do
  factory :random_user, class: 'User' do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      patronymic { Faker::Name.middle_name }
      salon_id { rand(1...101) }
      email { Faker::Internet.email }
      work_email { Faker::Internet.email }
      phone { '+375 25 609-99-99' }
      work_phone { '+375 25 609-99-99' }
      birthday { Faker::Date.between(from: 50.years.ago, to: Time.zone.today - 18.years) }
      role { rand(0...3) }
      status { rand(0...4) }
      notes { Faker::Lorem.paragraph }
      image_url { 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' }
  end

  trait(:nil_first_name) { first_name { nil } }
  trait(:nil_last_name) { last_name { nil } }
  trait(:nil_patronymic) { patronymic { nil } }
  trait(:nil_salon_id) { salon_id { nil } }
  trait(:nil_email) { email { nil } }
  trait(:nil_work_email) { work_email { nil } }
  trait(:nil_phone) { phone { nil } }
  trait(:nil_work_phone) { work_phone { nil } }
  trait(:nil_birthday) { birthday { nil } }
  trait(:nil_role) { role { nil } }
  trait(:nil_notes) { notes { nil } }
  trait(:nil_image_url) { image_url { nil } }
  # role: 0 - professional, 1 - salon_owner, 2 - client
  trait(:professional) { role { 0 } }
  trait(:salon_owner) { role { 1 } }
  trait(:client) { role { 2 } }
end
