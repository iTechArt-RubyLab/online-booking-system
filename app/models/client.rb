class Client < ApplicationRecord
  EMAIL_REGEXP = URI::MailTo::EMAIL_REGEXP
  PHONE_REGEXP = /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/

  has_many :visits, dependent: :destroy

  before_save :validate_notes, :capitalize_data

  validates :first_name, :last_name,
            :email, :phone, :birthday,
            :image_url, presence: true

  validates :first_name, :last_name,
            length: { minimum: 2, maximum: 255 }

  validates :middle_name,
            length: { maximum: 255 },
            allow_blank: true

  validates :email,
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEXP, message: 'Email invalid' },
            length: { minimum: 4, maximum: 254 }

  validates :phone, format: { with: PHONE_REGEXP, message: 'Phone invalid' }

  validates :birthday, date: :date_valid?

  validates :image_url, url: true

  private

  def date_valid?
    birthday.present? && birthday <= Time.zone.today
  end

  def capitalize_data
    first_name.capitalize!
    last_name.capitalize!
    middle_name.capitalize!
  end

  def validate_notes
    self.notes = notes.chars.shuffle if notes.include?('</script>') || notes.include?('<script>')
  end
end
