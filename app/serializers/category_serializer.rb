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
class CategorySerializer
  include JSONAPI::Serializer
  attributes :name, :image_url
end
