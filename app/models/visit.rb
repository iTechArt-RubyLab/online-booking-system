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
  include Elasticsearch::Model
  include AASM

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
  end

  belongs_to :client
  belongs_to :user
  belongs_to :service

  delegate :salon, to: :service

  validates :start_at, :end_at, :price, :address, :status, presence: true
  validates :price, length: { minimum: 2 }
  validate :user_working?

  after_create :visit_reminder

  def remind_at
    start_at - salon.remind_up_min.minutes
  end

  def visit_status
    { message: "Visit #{status}" }
  end

  def change_user_or_reject_visit_by_user
    salon_professionals_ids = salon.professionals.map(&:id) - [user.id]
    reject_by_user! if salon_professionals_ids.empty?
    update(user_id: salon_professionals_ids.sample) unless salon_professionals_ids.empty?
  end

  private

  def visit_reminder
    VisitReminderJob.perform_later(self)
  end

  def user_working?
    user = User.find(user_id) if user_id.present?

    errors.add(:user, 'must be in working status') if user.present? && !(user.professional? & user.working?)
  end
end

Visit.__elasticsearch__.create_index!
Visit.import
