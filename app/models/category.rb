# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_url  :string
#
class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 255 }

  validates :image_url, presence: true

  before_validation :format_name, on: :create

  has_many_attached :images

  private

  def format_name
    self.name = name.capitalize if name.present?
  end
end
