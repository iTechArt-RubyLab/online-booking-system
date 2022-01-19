class User < ApplicationRecord
  enum role: { professional: 0, salon_owner: 1 }
  enum status: { working: 0, on_vacation: 1, banned: 2, fired: 3 }

  before_validation :capitalize_data, on: :create
  before_save :validate_notes

  validates :first_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :patronymic, length: { maximum: 255 }, allow_blank: true
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

  def validate_notes
    self.notes = notes.chars.shuffle if notes.include?('</script>')
  end

  def capitalize_data
    self.first_name = first_name.downcase.titleize
    self.last_name = last_name.downcase.titleize
    self.patronymic = patronymic.downcase.titleize if patronymic
  end
  private :validate_notes
end
