# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  first_name  :string           not null
#  last_name   :string           not null
#  middle_name :string
#  email       :string           not null
#  work_email  :string
#  phone       :string           not null
#  work_phone  :string
#  birthday    :datetime         not null
#  role        :integer          default("professional"), not null
#  status      :integer          default("working")
#  notes       :text
#  image_url   :string           not null
#  rating      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :professional, parent: :user do
    role { :professional }
    rating { rand(0...5) }
  end
end
