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

class Visit < ApplicationRecord
  SORT_FIELDS = %i[start_at end_at price status].freeze

  enum status: {
    created: 0,
    approved: 1,
    rejected_by_user: 2,
    rejected_by_client: 3,
    deleted: 4,
    finished: 5
  }

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