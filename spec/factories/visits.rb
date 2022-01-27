FactoryBot.define do
  factory :random_visit, class: 'Visit' do
    adress { Faker::Address.full_address }
    price { 20 }
    start_at { '2022-01-18' }
    end_at { '2022-01-19' }
    status { 0 }
  end

  trait(:nil_start_at) { start_at { nil } }
  trait(:nil_end_at) { end_at { nil } }
  trait(:nil_price) { price { nil } }
  trait(:nil_adress) { adress { nil } }
  trait(:nil_status) { status { nil } }
end
