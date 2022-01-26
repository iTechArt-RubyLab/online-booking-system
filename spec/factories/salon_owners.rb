FactoryBot.define do
  factory :salon_owner, parent: :user do
    role { :salon_owner }
  end

  after(:create) do |salon_owner|
    salon = FactoryBot.build(:salon, salon_owner_id: salon_owner.id)
    salon.save
  end
end
