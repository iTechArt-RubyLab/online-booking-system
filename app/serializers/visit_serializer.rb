# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  price      :integer          not null
#  address    :text             not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  service_id :bigint           not null
#  client_id  :bigint           not null
#
class VisitSerializer
  include JSONAPI::Serializer

  attributes :client_id, :user_id, :service_id, :price, :address, :status, :start_at, :end_at 

  attribute :salon_id do |visit|
    visit.salon.id.to_s
  end
end
