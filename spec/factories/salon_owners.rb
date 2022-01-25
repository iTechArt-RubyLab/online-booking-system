FactoryBot.define do
  factory :salon_owner, parent: :user do
    role { :salon_owner }
  end
end
