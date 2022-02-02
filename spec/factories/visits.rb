# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  price      :integer          not null
#  address    :text             not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  service_id :bigint           not null
#  client_id  :bigint           not null
#  salon_id   :bigint           not null
#
FactoryBot.define do
  factory :visit, class: 'Visit' do
    address { Faker::Address.full_address }
    price { 20 }
    start_at { '2022-01-18' }
    end_at { '2022-01-19' }
    status { :created }
  end

  trait(:no_start_at) { start_at { nil } }
  trait(:no_end_at) { end_at { nil } }
  trait(:no_status) { status { nil } }
end
