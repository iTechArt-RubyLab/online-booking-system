class ProfessionalsSalon < ApplicationRecord
  belongs_to :professional, class_name: 'Professional'
  belongs_to :salon
end
