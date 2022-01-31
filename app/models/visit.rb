# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  price      :integer          not null
#  address    :text             not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  client_id  :integer          not null
#  salon_id   :integer          not null
#

require 'elasticsearch/model'

class Visit < ApplicationRecord
  include Elasticsearch::Model

  SORT_FIELDS = %i[start_at end_at price status].freeze

  enum status: {
    created: 0,
    approved: 1,
    rejected_by_user: 2,
    rejected_by_client: 3,
    deleted: 4,
    finished: 5
  }

  belongs_to :client, class_name: 'Client'
  belongs_to :salon

  has_many :visits_services, dependent: :destroy
  has_many :services, through: :visits_services

  validates :start_at, :end_at, :price, :address, :status, presence: true
  validates :price, length: { minimum: 2 }
end

Visit.__elasticsearch__.create_index!
Visit.import
