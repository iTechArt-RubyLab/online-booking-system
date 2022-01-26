class Salon < ApplicationRecord
  has_many :salon_social_networks, dependent: :destroy
  has_many :social_networks, through: :salon_social_networks

  validates :name, uniqueness: true
  validates :address, :notes, :email, presence: true
  validates :phone, format: { with: /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/ }

  before_validation :format_name, on: :create
  before_save :validacion_notes

  private

  def validacion_notes
    self.notes = notes.chars.shuffle if notes.include?('</script>')
  end

  def format_name
    self.name = name.capitalize
  end
end
