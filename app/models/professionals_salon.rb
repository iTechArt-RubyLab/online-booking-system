# == Schema Information
#
# Table name: professionals_salons
#
#  id              :bigint           not null, primary key
#  professional_id :integer          not null
#  salon_id        :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class ProfessionalsSalon < ApplicationRecord
  belongs_to :professional, class_name: 'Professional'
  belongs_to :salon
end
