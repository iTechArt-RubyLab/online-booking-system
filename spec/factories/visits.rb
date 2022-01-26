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
