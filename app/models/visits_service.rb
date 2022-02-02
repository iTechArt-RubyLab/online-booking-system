# == Schema Information
#
# Table name: visits_services
#
#  id         :bigint           not null, primary key
#  visit_id   :integer          not null
#  service_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VisitsService < ApplicationRecord
  belongs_to :visit
  belongs_to :service
end
