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
class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  SORT_FIELDS = %i[first_name last_name middle_name email phone birthday].freeze

  enum role: { professional: 0, salon_owner: 1 }
  enum status: { working: 0, on_vacation: 1, banned: 2, fired: 3 }

  has_many :visits, dependent: :destroy

  has_many :users_salons, dependent: :destroy
  has_many :salons, through: :users_salons

  before_save :capitalize_data

  validates :first_name, :last_name,
            :email, :phone, :birthday,
            :role, :image_url,
            presence: true

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

  validates :image_url, url: true

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
end
