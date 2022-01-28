FactoryBot.define do
  factory :salon_owner, parent: :user do
    role { 'salon_owner' }

    after(:create) do |salon_owner|
      FactoryBot.create(:salon, salon_owner_id: salon_owner.id)
    end
  end
end
