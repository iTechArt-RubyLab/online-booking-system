class Salon < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 255 }
  validates :address, presence: true, length: { minimum: 2, maximum: 255 }
  validates :notes, allow_blank: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Email invalid' },
                    length: { minimum: 4, maximum: 254 }
  validates :phone, format: { with: /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/ }

  before_validation :normalize_params, on: :create
  before_save :validacion_notes

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
