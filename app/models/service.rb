# == Schema Information
#
# Table name: services
#
#  id           :bigint           not null, primary key
#  category     :integer          default("body_care"), not null
#  salon_id     :integer          not null
#  name         :string           not null
#  description  :text             not null
#  duration     :integer          default(1), not null
#  price        :integer          default(1), not null
#  hidden_price :integer
#  availability :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Service < ApplicationRecord
  SORT_FIELDS = %i[category salon_id name duration price availability].freeze

  belongs_to :salon

  enum availability: {
    yes: 0,
    no: 1
  }

  enum category: {
    body_care: 0,
    face_care: 1,
    hairdressing_services: 2,
    nail_services: 3,
    makeup: 4,
    spa: 5
  }

  validates :name, :description, :duration, :price, :hidden_price, :availability, presence: true
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 255 }
  validates :price, :hidden_price, numericality: { greater_than: 0 }
  validates :duration, numericality: { greater_than: 0, less_than_or_equal_to: 180, only_integer: true }
  validates :availability, inclusion: { in: Service.availabilities }
  validates :description, length: { minimum: 10, maximum: 255 }
end
