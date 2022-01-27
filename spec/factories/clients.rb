FactoryBot.define do
  factory :client, parent: :user do
    role { :client }
  end
end
