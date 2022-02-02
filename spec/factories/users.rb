# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  middle_name :string
#  email       :string           not null
#  work_email  :string
#  phone       :string           not null
#  work_phone  :string
#  birthday    :datetime         not null
#  role        :integer          default("professional"), not null
#  status      :integer          default("working")
#  notes       :text
#  image_url   :string           not null
#  rating      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :user, class: 'User' do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
    work_email { Faker::Internet.email }
    phone { '+375 25 609-99-99' }
    work_phone { '+375 25 609-99-99' }
    birthday { Faker::Date.between(from: 50.years.ago, to: Time.zone.today - 18.years) }
    role { User.roles[:professional] }
    status { User.statuses.keys.sample }
    notes { Faker::Lorem.paragraph }
    image_url { 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&f=y' }

    factory :salon_owner, class: 'User' do
      role { :salon_owner }

      after(:create) do |salon_owner|
        salon_owner.salons << create(:salon)
      end
    end

    factory :professional, class: 'User' do
      role { :professional }
    end
  end

  trait(:no_first_name) { first_name { nil } }
  trait(:no_last_name) { last_name { nil } }
  trait(:no_middle_name) { middle_name { nil } }
  trait(:no_email) { email { nil } }
  trait(:no_work_email) { work_email { nil } }
  trait(:no_phone) { phone { nil } }
  trait(:no_work_phone) { work_phone { nil } }
  trait(:no_birthday) { birthday { nil } }
  trait(:no_role) { role { nil } }
  trait(:no_notes) { notes { nil } }
  trait(:no_image_url) { image_url { nil } }
  trait(:professional) { role { 0 } }
  trait(:salon_owner) { role { 1 } }
end
