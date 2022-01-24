class User < ApplicationRecord
  enum role: { professional: 0, salon_owner: 1, client: 2 }
  enum status: { working: 0, on_vacation: 1, banned: 2, fired: 3 }

  before_save :validate_notes, :capitalize_data

  validates :first_name, :last_name,
            :email, :phone, :birthday,
            :role, :image_url,
            presence: true

  validates :first_name, :last_name,
            length: { minimum: 2, maximum: 255 }

  validates :patronymic,
            length: { maximum: 255 },
            allow_blank: true

  validates :email,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email invalid' },
            length: { minimum: 4, maximum: 254 }

  validates :phone, format: { with: /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/, message: 'Phone invalid' }

  validates :birthday, date: { before: proc { Time.zone.today }, message: 'Birthday invalid' }

  validates :image_url, url: true

  with_options if: :professional? do |_professional|
    validates :salon_id, :status,
              :work_email, :work_phone,
              :rating, presence: true

    validates :work_email,
              uniqueness: { case_sensitive: false },
              format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                        message: 'Work email invalid' },
              length: { minimum: 4, maximum: 254 }

    validates :work_phone,
              format: { with: /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/,
                        message: 'Work phone invalid' }
  end

  private

  def validate_notes
    self.notes = notes.chars.shuffle if notes.include?('</script>')
  end

  def capitalize_data
    self.first_name = first_name.downcase.titleize
    self.last_name = last_name.downcase.titleize
    self.patronymic = patronymic.downcase.titleize if patronymic
  end
end
