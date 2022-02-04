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
#  user_id    :bigint           not null
#  service_id :bigint           not null
#  client_id  :bigint           not null
#

require 'elasticsearch/model'

class Visit < ApplicationRecord
  include AASM
  include Elasticsearch::Model

  SORT_FIELDS = %i[start_at end_at price status].freeze

  aasm column: 'status' do
    state :created, initial: true
    state :approved, :rejected_by_user, :rejected_by_client,
          :finished, :deleted

    event :approve do
      transitions from: :created, to: :approved
    end

    event :reject_by_user do
      transitions from: %i[approved created], to: :rejected_by_user
    end

    event :reject_by_client do
      transitions from: %i[approved created], to: :rejected_by_client
    end

    event :finish do
      transitions from: :approved, to: :finished
    end

    event :delete_visit do
      transitions to: :deleted
    end
  end

  belongs_to :client
  belongs_to :user
  belongs_to :service

  delegate :salon, to: :service

  validates :start_at, :end_at, :price, :address, :status, presence: true
  validates :price, length: { minimum: 2 }

  after_create :visit_reminder

  def remind_at
    start_at - salon.remind_up_min.minutes
  end

  private

  def visit_reminder
    VisitReminderJob.perform_later(self)
  end
end

Visit.__elasticsearch__.create_index!
Visit.import
