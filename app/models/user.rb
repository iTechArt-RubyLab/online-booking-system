class User < ApplicationRecord
  enum role: { professional: 0, salon_owner: 1, client: 2 }
  enum status: { working: 0, on_vacation: 1, banned: 2, fired: 3 }

  before_validation :normalize_params, on: :create
  before_save :validate_notes

  validates :first_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :middle_name, length: { maximum: 255 }, allow_blank: true
  validates :salon_id, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Email invalid' },
                    length: { minimum: 4, maximum: 254 }
  validates :work_email, presence: true, uniqueness: { case_sensitive: false },
                         format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Work email invalid' },
                         length: { minimum: 4, maximum: 254 }
  validates :phone, presence: true,
                    format: { with: /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/, message: 'Phone invalid' }
  validates :work_phone, presence: true,
                         format: { with: /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/, message: 'Work phone invalid' }
  validates :birthday, presence: true, date: { before: proc { Time.zone.today }, message: 'Birthday invalid' }
  validates :role, :status, presence: true
  validates :image_url, presence: true, url: true

  private

  def validate_notes
    self.notes = notes.chars.shuffle if notes.include?('</script>')
  end

  def normalize_params
    titleize_name
    titleize_last_name
    titleize_patronymic
  end

  def titleize_name
    self.first_name = first_name.downcase.titleize if attribute_present?('first_name')
  end

  def titleize_last_name
    self.last_name = last_name.downcase.titleize if attribute_present?('last_name')
  end

  def titleize_patronymic
    self.middle_name = middle_name.downcase.titleize if attribute_present?('middle_name')
  end
end
