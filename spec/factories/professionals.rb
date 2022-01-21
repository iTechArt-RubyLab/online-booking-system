FactoryBot.define do
  factory :professional, parent: :user do 
    role { :professional }
    rating { rand(0...5) }
  end
end
