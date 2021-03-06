# == Schema Information
#
# Table name: services
#
#  id           :bigint           not null, primary key
#  salon_id     :integer          not null
#  name         :string           not null
#  description  :text             not null
#  duration     :integer          default(1), not null
#  price        :integer          default(1), not null
#  availability :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint           not null
#

require 'elasticsearch/model'

class Service < ApplicationRecord
  include Elasticsearch::Model

  SORT_FIELDS = %i[category_id salon_id name duration price availability].freeze

  belongs_to :salon
  belongs_to :category

  has_many :visits, dependent: :destroy

  enum availability: {
    yes: 0,
    no: 1
  }

  validates :name, :description, :duration, :price, :availability, presence: true
  validates :name, uniqueness: true, length: { minimum: 2, maximum: 255 }
  validates :price, numericality: { greater_than: 0 }
  validates :duration, numericality: { greater_than: 0, less_than_or_equal_to: 180, only_integer: true }
  validates :availability, inclusion: { in: Service.availabilities }
  validates :description, length: { minimum: 10, maximum: 255 }
  validates :salon_id, numericality: { in: Salon.pluck(:id) }
  validates :category_id, numericality: { in: Category.pluck(:id) }
end

Service.__elasticsearch__.create_index!
Service.import
