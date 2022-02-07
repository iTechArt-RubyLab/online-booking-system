# == Schema Information
#
# Table name: services
#
#  id           :bigint           not null, primary key
#  salon_id     :integer          not null
#  name         :string           not null
#  description  :text             not null
#  duration     :integer          default(1), not null
#  price        :integer          default(1), not null
#  availability :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint           not null
#
class ServiceSerializer
  include JSONAPI::Serializer

  attributes :salon_id, :name, :description,
             :duration, :price, :availability,
             :category_id

  attribute :category do |service|
    service.category.name
  end
end
