# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  middle_name            :string
#  email                  :string           not null
#  work_email             :string
#  phone                  :string           not null
#  work_phone             :string
#  birthday               :datetime         not null
#  role                   :integer          default("professional"), not null
#  status                 :integer          default("working")
#  notes                  :text
#  rating                 :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  tokens                 :json
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
    status { %i[working on_vacation banned fired].sample }
    notes { Faker::Lorem.paragraph }

    after(:build) do |user|
      user.avatar.attach(
        io: File.open(Rails.root.join('spec', 'photos', 'test.png')),
        filename: 'test.png',
        content_type: 'image/png'
      )
    end

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

  trait(:professional) { role { 0 } }
  trait(:salon_owner) { role { 1 } }
end
