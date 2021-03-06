# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  middle_name            :string
#  email                  :string           not null
#  work_email             :string
#  phone                  :string           not null
#  work_phone             :string
#  birthday               :datetime         not null
#  role                   :integer          default("professional"), not null
#  status                 :integer          default("working")
#  notes                  :text
#  rating                 :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  tokens                 :json
#

class User < ApplicationRecord
  include AASM
  extend Devise::Models

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  include DeviseTokenAuth::Concerns::User

  before_validation :set_uid

  SORT_FIELDS = %i[first_name last_name middle_name email phone birthday].freeze

  enum role: { professional: 0, salon_owner: 1 }

  aasm column: 'status' do
    state :working, initial: true
    state :on_vacation, :banned, :fired,
          :prepare_for_vacation, :prepare_for_fire

    event :go_to_vacation do
      before { approved_visits.map(&:change_user_or_reject_visit_by_user) }
      transitions from: :working, to: :on_vacation, guard: :no_approved_visits?
    end

    event :ban do
      before { approved_visits.map(&:change_user_or_reject_visit_by_user) }
      transitions to: :banned, guard: :no_approved_visits?
    end

    event :fire do
      before { approved_visits.map(&:change_user_or_reject_visit_by_user) }
      transitions to: :fired, guard: :no_approved_visits?
    end
  end

  has_many :visits, dependent: :destroy

  has_many :users_salons, dependent: :destroy
  has_many :salons, through: :users_salons

  before_save :capitalize_data

  has_one_attached :avatar

  validates :avatar, attached: true, content_type: 'image/png'

  validates :first_name, :last_name,
            :email, :phone, :birthday,
            :role, presence: true

  validates :first_name, :last_name,
            length: { minimum: 2, maximum: 255 }

  validates :middle_name,
            length: { maximum: 255 }

  validates :email,
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEXP, message: 'Email invalid' },
            length: { minimum: 4, maximum: 254 }

  validates :phone, format: { with: PHONE_REGEXP, message: 'Phone invalid' }

  validates :birthday, date: :date_valid?

  with_options if: :salon_owner? do
    validates :status, :work_email,
              :work_phone, presence: true

    validates :rating, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 5
    }

    validates :work_email,
              uniqueness: { case_sensitive: false },
              format: { with: EMAIL_REGEXP, message: 'Email invalid' },
              length: { minimum: 4, maximum: 254 }

    validates :work_phone,
              format: { with: PHONE_REGEXP, message: 'Work phone invalid' }
  end

  def no_approved_visits?
    (professional? && visits.none?(&:approved?)) || salon_owner?
  end

  def approved_visits
    visits.where(status: :approved)
  end

  def ready_for_vacation?
    professional? && prepare_for_vacation? && no_approved_visits?
  end

  def user_status
    { message: "User #{status}", user_id: id }
  end

  private

  def remove_from_approved_visits
    visits.map(&:change_user)
  end

  def date_valid?
    birthday.present? && birthday <= Time.zone.today
  end

  def capitalize_data
    self.first_name = first_name.downcase.titleize
    self.last_name = last_name.downcase.titleize
    self.middle_name = middle_name.downcase.titleize if middle_name
  end

  def skip_default_field?
    salon_owner? || client?
  end

  def set_uid
    self[:uid] = email if self[:uid].blank? && self[:email].present?
  end
end
