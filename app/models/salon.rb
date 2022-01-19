class Salon < ApplicationRecord
  validates :name, uniqueness: true
  validates :address, :notes, :email, presence: true
  validates_format_of :phone, with:  /(\+375|80) (29|44|33|25) \d{3}-\d{2}-\d{2}/

  before_validation :format_name, on: :create
  before_save :validacion_notes

  private

  def validacion_notes
    if notes.include?('</script>')
      self.notes = notes.split('').shuffle
    end
  end

  def format_name
    self.name = name.capitalize
  end
end