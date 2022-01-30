# == Schema Information
#
# Table name: salons
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  address        :text             not null
#  phone          :string           not null
#  email          :string           default(""), not null
#  notes          :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  salon_owner_id :integer          not null
#
class Salon < ApplicationRecord
  EMAIL_REGEXP = URI::MailTo::EMAIL_REGEXP
  PHONE_REGEXP = /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/
  SORT_FIELDS = %i[name address phone email].freeze

  belongs_to :salon_owner, class_name: 'SalonOwner'

  has_many :services, dependent: :destroy

  has_many :users_salons, dependent: :destroy
  has_many :users, through: :users_salons

  has_many :visits, dependent: :destroy

  has_many :salons_social_networks, dependent: :destroy
  has_many :social_networks, through: :salons_social_networks

  validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 255 }
  validates :address, presence: true, length: { minimum: 2, maximum: 255 }
  validates :notes, presence: true, length: { maximum: 255 }

  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_REGEXP, message: 'Email invalid' },
                    length: { minimum: 4, maximum: 254 }
  validates :phone, presence: true, format: { with: PHONE_REGEXP, message: 'Phone invalid' }

  before_validation :normalize_params, on: :create
  before_save :validacion_notes

  validates :name, uniqueness: true,
                   presence: true, length: {
                     minimum: 2,
                     maximum: 255
                   }
  validates :address, presence: true,
                      length: {
                        minimum: 2,
                        maximum: 255
                      }
  validates :notes, presence: true,
                    length: { maximum: 255 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: 'Email invalid'
                    },
                    length: {
                      minimum: 4,
                      maximum: 254
                    }
  validates :phone, presence: true,
                    format: { with: PHONE_REGEXP }

  def links
    salons_social_networks.map(&:link)
  end

  private

  def validacion_notes
    self.notes = notes.chars.shuffle if notes.include?('</script>')
  end

  def normalize_params
    format_name
  end

  def format_name
    self.name = name.downcase.titleize if attribute_present?('name')
  end
end
