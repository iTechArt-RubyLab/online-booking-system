FactoryBot.define do
  factory :professional, parent: :user do 
    role { :professional }
  end
end
